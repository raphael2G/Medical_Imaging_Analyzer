import requests
import urllib
from PIL import Image
import io



with open('python/asilbek_dumbass.txt') as f:
    data = f.readlines()[0]

response = urllib.request.urlopen(data)
image_data = response.file.read()

image = Image.open(io.BytesIO(image_data))
image.show()

