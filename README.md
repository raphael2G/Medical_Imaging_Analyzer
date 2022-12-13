# How to start web viewer
- cd into the "viewer" directory
- run command in terminal "npm install --force"
- run command in terminal "npm start"
The viewer is now open. You can upload .vti files (more to be implemented soon, see to-do) to display volumes. See usage on more. 

# How to enable model inference and integrated file conversion
- cd into the "APIs" directory
- run command in terminal "pip install requirements.txt"
- run command in terminal "uvicorn API:app --reload"
- Identify the locally hosted port on which the API is running
- Access the file "viewer/src/components/reader/slicereader.js"
- ctr+f "http:" and replace existing link with locally hosted port
model inference and integrated file conversion is now enabled. You are now able to load all supported file types, and make inferences in supported methods 

# To-Do
- Revamp imaging viewer to previous estabishment (reenabling window, level, transfer functions)
- Implement native IP and port for API usage
- Integrate file conversion API
- Implement segmentation model through API
 
