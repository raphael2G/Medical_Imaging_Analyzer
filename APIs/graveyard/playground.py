import requests
import os
import urllib

with open('APIs/requirements.txt') as f:
    data = f.readlines()[0]

output = requests.get(os.path.join('http://127.0.0.1:8000/convert-file/', data))

print(output)
