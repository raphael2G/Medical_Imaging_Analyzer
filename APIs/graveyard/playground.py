import requests
import os
import urllib

with open('python/asilbek_dumbass.txt') as f:
    data = f.readlines()[0]

output = requests.get(os.path.join('http://127.0.0.1:8000/append_ct_dataset/', data))

print(output)
