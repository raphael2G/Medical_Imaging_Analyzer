from rembg import remove
from PIL import Image
import os

import tensorflow as tf


"""
Deprecated for tandem use of background_remover.py and load_image.py. 

Cropping accuracy and consistency in background_remover is increased. 

Kept for potential future inspiration for further improvements. 
"""

base_path = 'dummy_data/testing_crop/'

input_path = 'background.jpeg'
input = Image.open(os.path.join(base_path, input_path))
output = remove(input)
imageBox = output.getbbox()
cropped = output.crop(imageBox)
removed_transparency = cropped.convert('RGB')
removed_transparency.save(os.path.join(base_path, 'transparent_remover_method.jpg'))



