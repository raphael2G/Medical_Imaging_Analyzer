# import torch 
# import numpy as np
# import SimpleITK as sitk

'''
1. Load volume using sitk
2. resample volume to 256x256x256 using sitk
3. convert sitk to numpy 
4. reshape to 1x256x256x256 in numpy
5. convert to pytorch tensor
6. run inference on model, getting classication inference + heatmaps
7. convert inferences + heatmaps to form useable by web viewer
8. send inferences + heatmaps to web viewer using API
9. display inferences 
10. overlay heatmap volume on top of original volume
'''


