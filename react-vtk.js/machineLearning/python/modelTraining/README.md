### Generating COVID-19 Classification Models

This explains the variety of methods and techniques that were utilized to train models to identify COVID-19 in axial Chest CT scans. 

## Dataset
The dataset used contains 2D axial slices from Chest CT scans in patients with and without COVID-19. 
https://github.com/UCSD-AI4H/COVID-CT

## Preprocessing
Images were first converted to RGB using PIL, then resized to 224, 224, 3.

## Data Augmentation
Images were randomly flipped horizontally before being sent to the model for training. 

## Performance
CNN - Achieved validation accuracy of 65%.
<br></br>
Trasnfer Learning ViT - Achieved validation accuracy --%

## Transfer Learning
The ViT was fine tuned on this dataset. Original ViT: _______

## Files Explained
### load_data.py
Takes list of image names from predetermined training, validation, and testing split, determines image path, and loads image path as a tensor, processes the image, and stores split as a tensorflow Dataset object. 

### training_loop.py
Loss Function: Sparse Categorical Cross Entropy
<br></br>
Optimizer: Adam
<br></br>
Learning Rate Scheduler: Cosine Decay

### vit.py
Used to instantiate ViT model. 
<br></br>
https://github.com/taki0112/vit-tensorflow

### train_model.py
Imports all functions to execute loading and processing data, training the model, evaluating model, and saving tf and tfjs instances of model. 

## To-Do
<li></li> Download, load and fine tune ViT model on this datast
<li></li> Implement Weights and Biases to monitor training, evaluate performance, and tune hyperparameters
<li></li> Recreate in javascript
<li></li> Implement models with react vtk.js viewer to run live inferences on medical ct scans
<li></li> Train on more robust dataset
