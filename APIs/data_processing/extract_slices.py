import SimpleITK as sitk  
import numpy as np


def extract_slices(file):
    # itk_image = sitk.ImageFileReader('APIs/temporary.vti')
    # return sitk.GetArrayFromImage(itk_image) 
    return np.load('../Datasets/extracted_np_slices/coronacases_001/image_data.npy')

