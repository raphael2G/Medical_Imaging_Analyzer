import unet
from unet import utils
from unet.datasets import circles
from training.training_loop import train_model


#loading the datasets
train_ds, validation_ds = circles.load_data(100, nx=200, ny=200, splits=(0.8, 0.2))

#building the model
unet_model = unet.build_model(channels=circles.channels,
                          num_classes=circles.classes,
                          layer_depth=3,
                          filters_root=16)

unet.finalize_model(unet_model)

prediction_shape = unet_model.predict(train_ds.take(count=1).batch(batch_size=1)).shape[1:]

train_dataset = train_ds.map(utils.crop_labels_to_shape(prediction_shape))
validation_dataset = validation_ds.map(utils.crop_labels_to_shape(prediction_shape))

train_model(unet_model, 1, 8, train_dataset, validation_dataset, update_increment=1, validation_update_increment=1)
unet_model.save('models/segmentation')
