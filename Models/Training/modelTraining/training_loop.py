#@title Training Loop
import tensorflow as tf
from matplotlib import pyplot as plt
from datetime import datetime
import os


loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)

def calc_loss(model, x, y):
        y_ = model(x)
        loss = loss_fn(y, y_)
        return loss

def calc_grad(model, x, y):
    with tf.GradientTape() as tape:
        loss = calc_loss(model, x, y)
    return tape.gradient(loss, model.trainable_variables), loss

def train_model(model, n_epochs, train_ds, batch_size, learning_rate=3e-5, with_plot=True, validation_ds=None, 
                update_increment=10, model_name=None, checkpoint_dir='savedModels', save_figs=False):
    
    ds_train_batch = train_ds.batch(batch_size)

    try: 
        ds_test_batch = validation_ds.batch(len(validation_ds)-1)
        print('Beggining Training with Validation')
        with_validation = True
    except: 
        with_validation = False
        print('Beggining Training without Validation')


    decay_steps = 1000
    lr_decayed_fn = tf.keras.optimizers.schedules.CosineDecay(
        learning_rate, decay_steps)
    optimizer = tf.keras.optimizers.Adam(lr_decayed_fn)

    loss_history, accuracy_history, validation_accuracy_history = [], [], []

    start_time = datetime.now()
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
   

        if with_validation: 
            for x, y in ds_test_batch:
                validation_accuracy.update_state(y, model(x))

            val_acc = validation_accuracy.result()
            validation_accuracy_history.append(val_acc)
            validation_accuracy.reset_state()


        if epoch % update_increment == 0:
            elapsed = datetime.now() - start_time
            print('Epoch: %i' %epoch, 'Validation Accuracy: %.4f' %val_acc, 'Training Accuracy: %.4f' %epoch_accuracy.result(), 'Loss: %.6f' %epoch_loss.result(), 'Time: ' + datetime.now().strftime("%H:%M:%S"))
            
            start_time = datetime.now()


        
    if model_name!=None:
        try:
            model.save(os.path.join(checkpoint_dir, model_name))
            print('Model Weights Saved')
        except:
            if os.path.exists(os.path.join(checkpoint_dir, model_name)):
                print('Error: model not saved')
            else: print('Model not saved. Ensure checkpoint_path is valid.')

    if with_plot:
        if with_validation: plot_data(loss_history, accuracy_history, validation_accuracy_history, save_figs)
        else:               plot_data(loss_history, accuracy_history, save_figs)

def plot_data(loss_history, accuracy_history, validation_accuracy_history, save_figs=False):
    fig, axs = plt.subplots(2)
    fig.suptitle('Training Data')

    axs[0].plot(accuracy_history, label='training accuracy')
    axs[0].plot(validation_accuracy_history, label='validation accuracy')
    axs[0].legend()


    axs[1].plot(loss_history, label='loss')
    axs[1].legend()

    if save_figs:
      axs[0].save_fig('/content/drive/MyDrive/savedModels/CNNCovidClassifier/graphs/training_val_accuracy.png')
      axs[1].save_fig('/content/drive/MyDrive/savedModels/CNNCovidClassifier/graphs/training_loss.png')
