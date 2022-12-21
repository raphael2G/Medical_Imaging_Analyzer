import SimpleITK as sitk  
import os
import numpy as np

def extract_slices(file):
    current=os.getcwd()

    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
    #Create directory in the working directory for saving extracted data 
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
    directory_name=os.path.join('Datasets/extracted_np_slices', 'temporary')
    try:
        os.mkdir(directory_name)

    except OSError:
        print ("Creation of data directory failed (Maybe the directory already exists)")
    else:
        print ("Successfully created data directory")

    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
    #Extract and save data in the created directory (in numpy format)
    #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
    itk_image = sitk.ReadImage(file)
    #Extract and save image data in numpy format
    image = sitk.GetArrayFromImage(itk_image)  #multidimensional array
    image_path=current+"/"+directory_name+"/"+"image_data" #for win system
    np.save(image_path, image, allow_pickle=True)

    print('Done!')