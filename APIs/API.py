from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI, File, UploadFile, Response
import urllib
from PIL import Image
import io
import numpy as np

# from image_proccessing.remove_background import remove_background
# from image_proccessing.process_image import process_image

# from inference.classification_inference import run_classification_inference

from data_processing.extract_slices import extract_slices
from inference.classification_inference import whole_classification_inference

# from inference.segmentation_inference import run_segmentation_inference

from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse
from pydantic import BaseModel

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post('/classify/')
async def FileUpload(file: UploadFile = File(...)):

    # load starlette datastructure with .read() into bytes
    data = await file.read()
    # turn byttes to
    uri = data.decode('ascii')
    response = urllib.request.urlopen(uri)
    image_data = response.file.read()
    image = Image.open(io.BytesIO(image_data))
    arr = remove_background(image)
    img = process_image(arr, True, True)
    output = run_classification_inference(img)
    output = output.tolist()
    json_compatible_item_data = jsonable_encoder(output)

    return JSONResponse(content=json_compatible_item_data)

@app.post('/classify-whole-file/')
async def FileUpload(file: UploadFile = File(...)):

    # load file 

    data = np.load('../Datasets/extracted_np_slices/coronacases_001/image_data.npy') / 255.0

    # reshape the data to [batch_size, img_size, img_size, channels=1]
    shape = np.shape(data)
    slices = np.reshape(data, [shape[0], shape[1], shape[2], 1])

    # run inference on slices
    output = whole_classification_inference(slices) # takes in np array, returns inferences in np array

    # convert output to list
    output = output.tolist()

    # encode list in json
    json_compatible_item_data = jsonable_encoder(output)

    # return inferences encoded in JSON as API response
    return JSONResponse(content=json_compatible_item_data)
