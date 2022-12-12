from vit import create_vit_classifier_custom
import tensorflow as tf

#data processing
import tensorflow_datasets as tfds
import os

#machine learning
import tensorflow as tf
import keras
from keras.models import Sequential
from keras.layers import Dense, Convolution2D

#tfjs conversion
import tensorflowjs as tfjs

import numpy as np
from datetime import datetime
import matplotlib.pyplot as plt


#1 prepare the data
(ds_train, ds_test), ds_info = tfds.load(
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

#2 build the model
model = create_vit_classifier_custom(image_size=28, n_channels=1, patch_size=4, num_classes=10)

#3 train the model
loss_fn = tf.losses.SparseCategoricalCrossentropy()
optimizer = tf.keras.optimizers.Adam(learning_rate=0.001)

def calc_loss(model, x, y):
    y_ = model(x)
    return loss_fn(y, y_), y_

def calc_grad(model, x, y):
    with tf.GradientTape() as tape:
        loss, y_ = calc_loss(model, x, y)
    return tape.gradient(loss, model.trainable_variables), loss, y_ #return gradient of loss relative to trainable variables

def train(model, ds_train, n_epochs, batch_size, with_plot=True, save_weights=False, load_weights=False):
    
    n_epochs = n_epochs
    ds_train_batch = ds_train.batch(batch_size)

    accuracy_history, loss_history = [], []


    print('Begining training with %i Epochs' %n_epochs)
    for epoch in range(n_epochs):
        print('Epoch: %i' %epoch, 'Time: ' + datetime.now().strftime("%H:%M:%S"))
        epoch_accuracy = keras.metrics.SparseCategoricalAccuracy()
        epoch_loss = keras.metrics.Mean()

        for x, y in ds_train_batch:
            gradient, loss, y_ = calc_grad(model, x, y)
            optimizer.apply_gradients(zip(gradient, model.trainable_variables))

            epoch_accuracy.update_state(y, y_)
            epoch_loss.update_state(loss)
        
        accuracy_history.append(epoch_accuracy.result())
        loss_history.append(epoch_loss.result())

        print('Epoch: %i' %epoch, 'Accuracy: %.2f' %epoch_accuracy.result(), 'Loss: %.6f' %epoch_loss.result())


train(model, ds_train, n_epochs=50, batch_size=32)

     

