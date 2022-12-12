import tensorflow as tf
import tensorflow_datasets as tfds
import keras
from keras import layers
from matplotlib import pyplot as plt

import os

from utils import plot_data, monitor_runtime


from vit import create_vit


# set up dataset
(ds_train, ds_validation), ds_info = tfds.load(
    'mnist',
    split=['train', 'test'],
    shuffle_files=True,
    as_supervised=True,
    with_info=True,
)

def normalize_img(image, label):
  """Normalizes images: `uint8` -> `float32`."""
  return tf.cast(image, tf.float32) / 255., label

ds_train = ds_train.map(normalize_img, num_parallel_calls=tf.data.AUTOTUNE)
ds_train = ds_train.cache()
ds_train = ds_train.shuffle(ds_info.splits['train'].num_examples)
ds_train = ds_train.prefetch(tf.data.AUTOTUNE)

ds_validation = ds_validation.map(normalize_img, num_parallel_calls=tf.data.AUTOTUNE)
ds_validation = ds_validation.cache()
ds_validation = ds_validation.shuffle(ds_info.splits['train'].num_examples)
ds_validation = ds_validation.prefetch(tf.data.AUTOTUNE)

train_ds = ds_train.take(10)
validation_ds = ds_validation.take(10)


loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)

def calc_loss(model, x, y):
        y_ = model(x)
        loss = loss_fn(y, y_)
        return loss

def calc_grad(model, x, y):
    with tf.GradientTape() as tape:
        loss = calc_loss(model, x, y)
    return tape.gradient(loss, model.trainable_variables), loss

def train_model():

    model = create_vit(
                image_size = wandb.config.image_size,
                n_channels = wandb.config.n_channels,
                patch_size = wandb.config.patch_size,
                projection_dim = wandb.config.projection_dim,
                transformer_layers = wandb.config.transformer_layers,
                num_heads = wandb.config.num_heads,
                num_classes = wandb.config.num_classes,
                mlp_head_units = [wandb.config.mlp_head_units_1, wandb.config.mlp_head_units_2]
            )


    batch_size = wandb.config.batch_size
    n_epochs = wandb.config.n_epochs
    learning_rate = wandb.config.learning_rate


    # batch the training data
    ds_train_batch = train_ds.batch(batch_size)
    ds_validation_batch = validation_ds.batch(len(validation_ds)-1)

    optimizer = tf.keras.optimizers.SGD(learning_rate=learning_rate)

    loss_history, accuracy_history, validation_accuracy_history = [], [], []

    start_time = monitor_runtime()
    for epoch in range(n_epochs):

        epoch_loss = tf.keras.metrics.Mean()
        epoch_accuracy = tf.keras.metrics.SparseCategoricalAccuracy()
        validation_accuracy = tf.keras.metrics.SparseCategoricalAccuracy()
        validation_loss = tf.keras.metrics.Mean()

        for x, y in ds_train_batch:
            gradient, loss = calc_grad(model, x, y)
            optimizer.apply_gradients(zip(gradient, model.trainable_variables))

            epoch_loss.update_state(loss)  
            epoch_accuracy.update_state(y, model(x))


        for x, y in ds_validation_batch:
            validation_accuracy.update_state(y, model(x))
            validation_loss.update_state(calc_loss(model, x, y))

        wandb.log({
                'epoch': epoch, 
                'epoch_accuracy': epoch_accuracy.result(),
                'epoch_loss': epoch_loss.result(), 
                'validation_accuracy': validation_accuracy.result(), 
                'validation_loss': validation_loss.result()
            })

        validation_accuracy_history.append(validation_accuracy.result())
        validation_accuracy_history.append(validation_accuracy.result())
        loss_history.append(epoch_loss.result())
        accuracy_history.append(epoch_accuracy.result())

        print('Epoch: %i' %epoch, 'Validation Accuracy: %.4f' %validation_accuracy.result(), 'Validation Loss: %.4f' %validation_loss.result(), 'Accuracy: %.4f' %epoch_accuracy.result(), 'Loss: %.6f' %epoch_loss.result())
      
        validation_accuracy_history.reset_state()
        validation_accuracy.reset_state()
        epoch_loss.reset_state()
        epoch_accuracy.reset_state()

   
    if False: #save_model
        try:
            model.save_weights(checkpoint_path)
            print('Model Weights Saved')
        except:
            if os.path.exists(checkpoint_path):
                print('Error: model not saved')
            else: print('Model not saved. Ensure checkpoint_path is valid.')

    if False: #with_plot
        if with_validation: plot_data(loss_history, accuracy_history)
        else:               plot_data(loss_history, accuracy_history)