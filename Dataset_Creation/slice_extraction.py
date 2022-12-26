#!/usr/bin/env python
"""
This code extracts data (header and image(s)) from compressed NIFTI file (.nii.gz) and saves it in numpy format.
The extracted header and image information are saved in two files in numpy format.
Usage: python Extract_NIFTI.py path_to_file_name.nii.gz
"""

import SimpleITK as sitk  #We can also use other libraries. e.g., NiBabel
import os
import numpy as np
from vtk import vtkStructuredPointsWriter
from vtk import vtkXMLPolyDataReader

def extract_slices(file_name):
    return np.load('Datasets/extracted_np_slices/coronacases_001/image_data.npy')

def developing_extract_slices(location_to_file):
    current=os.getcwd()


    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
    #Create directory in the working directory for saving extracted data 
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
    directory_name=os.path.join('Datasets/extracted_np_slices', os.path.basename(location_to_file)[:-7])
    try:
        os.mkdir(directory_name)

    except OSError:
        print ("Creation of data directory failed (Maybe the directory already exists)")
    else:
        print ("Successfully created data directory")


    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
    #Extract and save data in the created directory (in numpy format)
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
    itk_image = sitk.ReadImage(location_to_file)
    #Extract and save image data in numpy format
    image = sitk.GetArrayFromImage(itk_image)  #multidimensional array
    image_path=current+"/"+directory_name+"/"+"image_data" #for win system
    np.save(image_path, image, allow_pickle=True)

    print('Done!')

# developing_extract_slices('Datasets/COVID-19-CT/niiGz/coronacases_001.nii.gz')










