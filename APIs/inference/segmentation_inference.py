import tensorflow as tf
import Models.Architectures.unet as unet
from Models.Architectures.unet import custom_objects, utils

import matplotlib.pyplot as plt

reconstructed_model = tf.keras.models.load_model('Models/Pretrained/segmentation/UNET-Circles_01', custom_objects=custom_objects)
unet.finalize_model(reconstructed_model)

def run_segmentation_inference(img_tensor):
    output = reconstructed_model.predict(img_tensor)