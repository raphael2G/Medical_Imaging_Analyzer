from aifc import Error
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import tensorflowjs as tfjs

'''
This is where the completed ViT will be made.
'''

# # Parameters in Here
# image_size = 224
# n_channels = 3
# patch_size = 32
# n_patches = (image_size // patch_size) ** 2
# assert (image_size % patch_size == 0), 'image_size must be divisible by patch_size'
# projection_dim = 8
# transformer_layers = 2
# num_heads = 8
# transformer_units = [
#     projection_dim * 2,
#     projection_dim,
# ] 
# num_classes = 10
# mlp_head_units = [2048, 1024]

# MLP Definition Function
def mlp(x, hidden_units, dropout_rate):
    for units in hidden_units:
        x = layers.Dense(units, activation=tf.nn.gelu)(x)
        x = layers.Dropout(dropout_rate)(x)
    return x

# Data Augmentation Block
def create_data_augmentation_block(image_size):
    data_augmentation = tf.keras.Sequential(
        [
            layers.Normalization(),
            layers.Resizing(image_size, image_size),
            layers.RandomFlip("horizontal"),
            layers.RandomRotation(factor=0.02),
            layers.RandomZoom(
                height_factor=0.2, width_factor=0.2
            ),
        ],
        name="data_augmentation",
    )

    return data_augmentation

# Patch Creation Block
class Patches(layers.Layer):
    def __init__(self, patch_size):
        super(Patches, self).__init__()
        self.patch_size = patch_size

    def call(self, images):
        batch_size = tf.shape(images)[0]
        patches = tf.image.extract_patches(
            images=images,
            sizes=[1, self.patch_size, self.patch_size, 1],
            strides=[1, self.patch_size, self.patch_size, 1],
            rates=[1, 1, 1, 1],
            padding="VALID",
        )
        patch_dims = patches.shape[-1]
        patches = tf.reshape(patches, [batch_size, -1, patch_dims])
        return patches

# Patch Encoder Block
class PatchEncoder(layers.Layer):
    def __init__(self, num_patches, projection_dim):
        super(PatchEncoder, self).__init__()
        self.num_patches = num_patches
        self.projection = layers.Dense(units=projection_dim)
        self.position_embedding = layers.Embedding(
            input_dim=num_patches, output_dim=projection_dim
        )

    def call(self, patch):
        positions = tf.range(start=0, limit=self.num_patches, delta=1)
        encoded = self.projection(patch) + self.position_embedding(positions)
        return encoded

# MSA Creation 
def create_msa_block(transformer_block_n, n_heads, projection_dim, key_dim, name, dropout=0.1):
    main_input = keras.Input(shape=(49, projection_dim), name='MSA_Main_Input')

    heads_output = []
    for index in range(n_heads):

        head_name = 'MSA_Head_%i' %index

        # create the queries, keys, and values by passing the embedded patches 
        # through distinct linear projections 
        value_dense = layers.Dense(units=key_dim, name=f'Value_Dense_{index}_{transformer_block_n}')(main_input)
        query_dense = layers.Dense(units=key_dim, name=f'Query_Dense_{index}_{transformer_block_n}')(main_input)
        key_dense = layers.Dense(units=key_dim, name=f'Key_Dense_{index}_{transformer_block_n}')(main_input)

        # perform scaled dot-product attention on the queries, keys, and values
        # using tfjs compatible layers

        dot_layer_1 = layers.Dot(axes=1, name=f'Dot_Layer_1_{index}_{transformer_block_n}')([query_dense, key_dense])
        softmax_layer = layers.Softmax(name=f'Softmax_{index}_{transformer_block_n}')(dot_layer_1)
        dot_layer_2 = layers.Dot(axes=2, name=f'Dot_Layer_2_{index}_{transformer_block_n}')([value_dense, softmax_layer])

        heads_output.append(dot_layer_2)
    
    concatenate_layer = layers.Concatenate(axis=2, name=f'Concatenate_{transformer_block_n}')(heads_output)
    output = layers.Dense(units=key_dim, name=f'Final_MSA_Linear_{transformer_block_n}')(concatenate_layer)

    MSA_block = tf.keras.Model(inputs=main_input, outputs=output, name=name)

    return MSA_block

# Transformer Encoder Creation
def create_transformer_block(input_shape, transformer_layers, transformer_dense_units, num_heads, projection_dim):
    # input to this block is patch embeddings
    # input_shape is the shape of the patch embeddings. Must be a tuple
    input = tf.keras.Input(shape=input_shape, name='Transformer_Block_Input')

    for _ in range(transformer_layers):
        # MSA Block
        if _ == 0: 
            layer_norm_1 = layers.LayerNormalization(epsilon=1e-6, name='Layer_Norm_1_%i'%_)(input)
            MSA = create_msa_block(_, num_heads, projection_dim, projection_dim, name='MSA_Block_%i'%_, dropout=0.1)(layer_norm_1)
            residual_connection_1 = layers.Add(name='Residual_Connection_%i'%_)([input, MSA])
        else: 
            layer_norm_1 = layers.LayerNormalization(epsilon=1e-6, name='Layer_Norm_1_%i'%_)(output)
            MSA = create_msa_block(_, num_heads, projection_dim, projection_dim, name='MSA_Block_%i'%_, dropout=0.1)(layer_norm_1)
            residual_connection_1 = layers.Add(name='Residual_Connection_%i'%_)([output, MSA])

        # MLP Block
        dropout_rate = 0.1        
        layer_norm_2 = layers.LayerNormalization(epsilon=1e-6, name='Layer_Norm_2_%i'%_)(residual_connection_1)
        # create as many sections in transformer_units
        for index, units in enumerate(transformer_dense_units):
            try: 
                mlp = layers.Dense(units, activation=tf.nn.gelu, name='Dense_%i'%index + '_%i'%_)(layer_norm_2)
            except: 
                mlp = layers.Dense(units, activation=tf.nn.gelu, name='Dense_%i'%index + '_%i'%_)(mlp)
                
            mlp = layers.Dropout(dropout_rate, name='Dropout_%i'%index + '_%i'%_)(mlp)

        output = layers.Add(name='Transformer_Encoder_Output_%i'%_)([residual_connection_1, mlp])

    transformer_encoder_block = keras.Model(inputs=input, outputs=output, name='transformer_encoder_block')
    return transformer_encoder_block

# MLP Classifier Creation
def mlp_head(mlp_head_units, num_classes):
    model = tf.keras.Sequential([
        tf.keras.Input(shape=(49, 8), name='MLP_Head_Input'),
        layers.LayerNormalization(epsilon=1e-6),
        layers.Flatten(),
        layers.Dropout(0.5),
        layers.Dense(mlp_head_units[0], activation=tf.nn.gelu),
        layers.Dropout(0.5),
        layers.Dense(num_classes)
        ], name='MLP_head')
    
    return model

# ViT Instantiation
def create_vit(
                image_size = 224,
                n_channels = 3,
                patch_size = 32,
                projection_dim = 8,
                transformer_layers = 2,
                num_heads = 8,
                num_classes = 2,
                mlp_head_units = [2048, 1024]
            ):

    n_patches = (image_size // patch_size) ** 2
    assert (image_size % patch_size == 0), 'image_size must be divisible by patch_size'


    
    transformer_dense_units = [
                    projection_dim * 2,
                    projection_dim]


    
    model = tf.keras.Sequential([
        layers.Input(shape=(image_size, image_size, n_channels)),
        create_data_augmentation_block(image_size), 
        Patches(patch_size),
        PatchEncoder(n_patches, projection_dim),
        create_transformer_block((n_patches, projection_dim), transformer_layers, transformer_dense_units, num_heads, projection_dim),
        mlp_head(mlp_head_units, num_classes)
    ], name='Vision_Transformer')

    return model


def plot_models(model, i):
    if i == 0: tf.keras.utils.plot_model(model, 'ViT_architecture.png')

    try: 
        for layer in model.layers:
            try: 
                tf.keras.utils.plot_model(layer, 'model_%i.png'%i)
                i += 1
                plot_models(layer, i)

            except: 
                i += 1
    except: 
        return

def split_keras_model(model, index):

    layer_input_1 = keras.layers.Input(model.layers[0].input_shape[1:])
    layer_input_2 = keras.layers.Input(model.layers[index].input_shape[1:])
    x = layer_input_1
    y = layer_input_2

    for layer in model.layers[0:index]:
        x = layer(x)

    for layer in model.layers[index:]:
        y = layer(y)

    model1 = keras.Model(inputs=layer_input_1, outputs=x)
    model2 = keras.Model(inputs=layer_input_2, outputs=y)
    
    print('-- -- -- -- -- FULL MODEL -- -- -- -- --')
    model.summary()

    print('-- -- -- - FEATURE EXTRACTION - -- -- --')
    model1.summary()

    print('-- -- -- -- - DENSE LAYERS - -- -- -- --')
    model2.summary()

    return model1, model2

def save_models(model, index=3, saveModel=False, saveSplit=False, saveTFJS=False):
    if saveSplit or saveTFJS:
        submodel_1, submodel_2 = split_keras_model(model, index)
        print('Model Successfuly Split')

    if saveModel:
        model.save('savedModels/ViT/tf/fullModel')
        print('Model Successfuly Saved')

    if saveSplit:
        submodel_1.save('savedModels/ViT/tf/split/subModel_1')
        print('Submodel 1 Successfully Saved')
        submodel_2.save('savedModels/ViT/tf/split/subModel_2')
        print('Submodel 2 Successfully Saved')

    if saveTFJS:
        try: 
            tfjs.converters.save_keras_model(submodel_2, 'savedModels/ViT/tfjs/subModel')
            print('Submodel 2 Successfully Converted and Saved')

        except Error as e: 
            print(e)
            print('Submodel Conversion Failed')
            print('Ensure model is split at valid index for TFJS conversion')


# # Proof the code works and data can be passed through
# ViT_custom = create_vit(
#                         image_size = 224,
#                         n_channels = 3,
#                         patch_size = 32,
#                         projection_dim = 8,
#                         transformer_layers = 2,
#                         num_heads = 8,
#                         num_classes = 2,
#                         mlp_head_units = [2048, 1024]
#                     )

# dummy_input = tf.ones([10, 224, 224, 3])
# print(ViT_custom(dummy_input))


# #Save TFJS convertable componenet
# model = create_vit()
# print(model(tf.ones([1, 224, 224, 3])))
# model.summary()
# save_models(model, saveTFJS=True)

# #Save Each Block of the model individually
# model.layers[0].save('savedModels/ViT/tf/data_augmentation')
# tfjs.converters.save_keras_model(model.layers[0], 'savedModels/ViT/tfjs/data_augmentation')
# # model.layers[1] is the patch creator
# # model.layers[2] is the patch encoder 
# model.layers[3].save('savedModels/ViT/tf/transformer_encoder_block')
# tfjs.converters.save_keras_model(model.layers[3], 'savedModels/ViT/tfjs/transformer_encoder_block')
# mlp_head = model.layers[4]
# mlp_head.summary()
# print(mlp_head(tf.ones([10, 49, 8])))
# model.layers[4].save('savedModels/ViT/tf/mlp_head')
# tfjs.converters.save_keras_model(model.layers[4], 'savedModels/ViT/tfjs/mlp_head')
# print(model(tf.ones((10, 224, 224, 3))))
# model.summary()
# save_models(model, saveTFJS=True)

# #Save transformer_block on its own
# transformer_block = create_transformer_block((n_patches, projection_dim), transformer_layers)
# transformer_block.summary()
# dummy_data = tf.ones((10, 49, 8))
# print(transformer_block(dummy_data))
# tfjs.converters.save_keras_model(transformer_block, 'savedModels/transformer_block/tfjs')

# transformer_block = create_transformer_block((n_patches, projection_dim), transformer_layers)
# dummy_data = tf.ones((10, 49, 8))
# print(transformer_block(dummy_data))


# #Plot model and save TFJS portable component
# model = create_vit()
# plot_models(model, 0)
# save_models(model, saveModel=False, saveSplit=False, saveTFJS=True)


    
         
