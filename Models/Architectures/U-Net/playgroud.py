import unet
from unet import custom_objects, utils
from unet.datasets import circles
import tensorflow as tf

import matplotlib.pyplot as plt

reconstructed_model = tf.keras.models.load_model('models/segmentation', custom_objects=custom_objects)
unet.finalize_model(reconstructed_model)

train_ds, validation_ds = circles.load_data(100, nx=200, ny=200, splits=(0.8, 0.2))

prediction_shape = reconstructed_model.predict(train_ds.take(count=1).batch(batch_size=1)).shape[1:]

train_dataset = train_ds.map(utils.crop_labels_to_shape(prediction_shape))
validation_dataset = validation_ds.map(utils.crop_labels_to_shape(prediction_shape))

rows = 10
fig, axs = plt.subplots(rows, 3, figsize=(8, 30))
for ax, (image, label) in zip(axs, train_dataset.take(rows).batch(1)):
    prediction = reconstructed_model.predict(image)
    ax[0].matshow(image[0][:, :, 0])
    ax[1].matshow(label[0, ..., 0], cmap="gray")
    ax[2].matshow(prediction[0].argmax(axis=-1), cmap="gray")

plt.show()