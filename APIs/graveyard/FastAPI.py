from fastapi import FastAPI, File, UploadFile
import os
from inference.classification_inference import run_classification_inference
import urllib
import uuid

app = FastAPI()


base_data_path = '../dummy_data/images'
base_segmentation_path = '../data/segmentation'

@app.post("/images/")
async def create_upload_file(file: UploadFile = File(...)):

    file.filename = f"{uuid.uuid4()}.jpg"
    contents = await file.read()  # <-- Important!

    # example of how you can save the file
    with open(f"{file.filename}", "wb") as f:
        f.write(contents)

    return {"filename": file.filename}

@app.get("/classification/{img_path}")
async def classification(img_path: str):

    negative_confidence, positive_confidence = run_classification_inference(os.path.join(base_data_path, img_path))
    # .item() necessary to for json convserion. numpy is conversion is not enabled. must be native python dtype
    return {'Confidence Negative': negative_confidence.item(), 
            'Confidence Positive': positive_confidence.item()}

@app.get("/segmentation/{img_path}")
async def segmentation(img_path: str):

    # get img from img_path
    # generate segmentation - pass img to the model

    new_path = os.path.join(base_segmentation_path, img_path)
    with open(new_path, 'x') as f:
        # save segmentation to this file
        print()

    #return path to saved segmentation file
    return {new_path}

@app.get("/append_ct_dataset/{file_path:path}")
async def append_ct_dataset(file_path: str):
    # code to add image to dataset
    print(type(file_path))
    print(file_path)
    response = urllib.request.urlopen(file_path)
    with open('image.jpeg', 'wb') as f:
        f.write(response.file.read())

    return {'file_path': file_path}

@app.post("/uploadfile/")
async def create_upload_file(file: UploadFile):
    return {"filename": file.filename}



@app.get("/infection_mask_dataset/{file_path}")
async def infection_mask_dataset(file_path: str):
    # code to add image to dataset
    response = urllib.request.urlopen(file_path)
    with open('image.jpg', 'wb') as f:
        f.write(response.file.read())

