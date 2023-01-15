# steps to load vit for heatmap generation and PAD classificaiton

'''
- - - - - steps to run classification inference and generate heatmap on 3d volume  - - - - -
1. load pytorch model 
2. load .nii.gz with sitk library
3. resample volume to 256x256x256 and save for future displaying
4. convert resized volume to numpy array
5. convert numpy array to pytorch Tensor
6. run classification inference on numpy array using ViT model
7. generate heatmap from vit model 
'''