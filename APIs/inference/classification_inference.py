import tensorflow as tf
import numpy as np
import os
from PIL import Image
from vit import create_vit

img_size = 224
n_channels = 3

# 1. instantiate model architecture
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

# 3. define function for returning model output given image path
def run_classification_inference(img_tensor):
    # load image from file path

    # process image to correect form
    data = tf.reshape(img_tensor, [1, img_size, img_size, n_channels])

    # generate outputs - send image through model
    output = classification_model(data).numpy()
  
    # return outputs
    return output

