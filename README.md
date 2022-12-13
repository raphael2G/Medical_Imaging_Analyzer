# How to start web viewer
1. cd into the "viewer" directory
2. run command in terminal "npm install --force"
3. run command in terminal "npm start"
The viewer is now open. You can upload .vti files (more to be implemented soon, see to-do) to display volumes. See usage on more. 

# How to enable model inference and integrated file conversion
1. cd into the "APIs" directory
2. run command in terminal "uvicorn API:app --reload"
3. Identify the locally hosted port on which the API is running
4. Access the file viewer/src/components/reader/slicereader.js
5. ctr+f "http:" and replace existing link with locally hosted port
model inference and integrated file conversion is now enabled. You are now able to load all supported file types, and make inferences in supported methods. 