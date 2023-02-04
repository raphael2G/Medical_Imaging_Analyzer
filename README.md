# Purpose
This repository is a for the purpose of deep learning based medical imaging analysis research engine. Using vtk.js + react we visualize medical volumes. Using this framework, we're able to process data volumes to useable image and image sequences for the purpose of analysis via machine learning based architectures, namely CNNs, ViT, and U-Net (among others). 

# How to start web viewer
- cd into the "viewer" directory

```cd viewer```

- install npm dependencies

```npm install --force```

- start viewer on local host

```npm start```

The viewer is now open. You can upload .vti files (more to be implemented soon, see to-do) to display volumes. See usage for more. 

# How to enable API
- cd into the "APIs" directory

```cd APIs```
- install python dependencies

```pip install requirements.txt```
- start API 

```uvicorn API:app --reload```
- Identify the locally hosted port on which the API is running
- Access the file "viewer/src/components/reader/slicereader.js"
- ctr+f "http:" and replace existing link with locally hosted port
model inference and integrated file conversion is now enabled. You are now able to load all supported file types, and make inferences in supported methods 


# File structure
The repository is broken down into various different folders. Here is an overview on the purpose of each folder. 
- APIs
Contains code for creating a locally hosted API enabling file converison and model inference in the web based volume renderere through FastAPI
- Dataset_Creation
Contains code for loading, parsing, converting, and structuring medical volume datasets
- How_To
Contains coded examples on select functionalities 
- Models
Stores model architectures (ViT, CNN, UNet), model training loops, and pretrained models
- viewer
Contains code for rendering volumes to the browser using vtk.js and react. 


# To-Do
- Revamp imaging viewer to previous estabishment (reenabling window, level, transfer functions)
- Implement native IP and port detection for API usage
- Integrate file conversion API
- Implement segmentation model visualization through API

 
