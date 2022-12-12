import tensorflow as tf
import tensorflow_datasets as tfds
import keras
from keras import layers
from matplotlib import pyplot as plt

import os

from utils import plot_data, monitor_runtime


loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)

def calc_loss(model, x, y):
        y_ = model(x)
        loss = loss_fn(y, y_)
        return loss

def calc_grad(model, x, y):
    with tf.GradientTape() as tape:
        loss = calc_loss(model, x, y)
    return tape.gradient(loss, model.trainable_variables), loss

def train_model(model, n_epochs, dataset, batch_size, with_validation=False, with_test=False, with_plot=True, 
                update_increment=10, validation_update_increment=10, checkpoint_path=None):
    

    train_ds, validation_ds, test_ds = dataset

    # determine if going to save model
    if checkpoint_path == None:
        save_model = False
    else: 
        save_model = True


    # handle validation_ds
    if with_validation: 
        ds_test_batch = validation_ds.batch(len(validation_ds)-1)
        print('Beggining Training with Validation')
    else: 
        print('Beggining Training without Validation')



    # batch the training data
    ds_train_batch = train_ds.batch(batch_size)

    optimizer = tf.keras.optimizers.SGD(learning_rate=0.01)

    loss_history, accuracy_history, validation_accuracy_history = [], [], []

    start_time = monitor_runtime()
    for epoch in range(n_epochs):

        epoch_loss = tf.keras.metrics.Mean()
        epoch_accuracy = tf.keras.metrics.SparseCategoricalAccuracy()
        validation_accuracy = tf.keras.metrics.SparseCategoricalAccuracy()

        for x, y in ds_train_batch:
            gradient, loss = calc_grad(model, x, y)
            optimizer.apply_gradients(zip(gradient, model.trainable_variables))

            epoch_loss.update_state(loss)  
            epoch_accuracy.update_state(y, model(x))

        loss_history.append(epoch_loss.result())
        accuracy_history.append(epoch_accuracy.result())

        if epoch % update_increment == 0:
            elapsed, start_time = monitor_runtime(start_time, formatted=True, with_start=True)
            print('Epoch: %i' %epoch, 'Accuracy: %.4f' %epoch_accuracy.result(), 'Loss: %.6f' %epoch_loss.result(), 'Time: ' + elapsed)

        if with_validation: 
            if epoch % validation_update_increment == 0:
                for x, y in ds_test_batch:
                    validation_accuracy.update_state(y, model(x))

                validation_accuracy_history.append(validation_accuracy.result())
                print('Validation Accuracy: %.4f' %validation_accuracy.result())
                validation_accuracy.reset_state()
   
    if save_model:
        try:
            model.save_weights(checkpoint_path)
            print('Model Weights Saved')
        except:
            if os.path.exists(checkpoint_path):
                print('Error: model not saved')
            else: print('Model not saved. Ensure checkpoint_path is valid.')

    if with_plot:
        if with_validation: plot_data(loss_history, accuracy_history)
        else:               plot_data(loss_history, accuracy_history)