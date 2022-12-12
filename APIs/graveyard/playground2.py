import requests
import urllib

with open('python/asilbek_dumbass.txt') as f:
    data = f.readlines()[0]


response = urllib.request.urlopen(data)
with open('image.jpeg', 'wb') as f:
    f.write(response.file.read())