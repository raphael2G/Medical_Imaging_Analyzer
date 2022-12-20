from temp_vit import create_vit
import tensorflow as tf
import numpy as np


goofy = 'Datasets/extracted_np_slices/coronacases_001/image_data.npy'


# 1. instantiate ViT model 

img_size = 224
n_channels = 1

classification_model = create_vit(
                image_size = img_size,
                n_channels = n_channels,
                patch_size = 32,
                projection_dim = 8,
                transformer_layers = 2,
                num_heads = 8,
                num_classes = 2,
                mlp_head_units = [2048, 1024]
            )

# 2. load model weights
# classification_model.load_weights('../../savedModels/ViT/tf/fullModel/saved_model.pb')

# 3. instantiate image resizing model
reshape_model = tf.keras.Sequential([
    tf.keras.layers.Resizing(224, 224)
])


def whole_inference(extracted_np_slices_file_path):

    # load numpy data from extracted slices
    data = np.load(extracted_np_slices_file_path) / 255.0

    # reshape the data to [batch_size, img_size, img_size, channels=1]
    shape = np.shape(data)
    data = np.reshape(data, [shape[0], shape[1], shape[2], 1])

    # convert np array to tensor
    tensor = tf.convert_to_tensor(data)

    # reshape image sizes
    tensor = reshape_model(tensor)

    output = classification_model(tensor)

    return output


print(whole_inference('Datasets/extracted_np_slices/coronacases_001/image_data.npy'))
