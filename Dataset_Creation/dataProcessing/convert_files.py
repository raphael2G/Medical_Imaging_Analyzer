import os
from nii2vti import convertNii2Vti

def convertFolderNii2Vti(source_path, vtk_download_target, vti_download_target):
    dir_list = os.listdir(source_path)

    for i, file_name in enumerate(dir_list):
        if file_name == '.DS_Store': 
            continue
        file_name = dir_list[i].split('.')[0]
        convertNii2Vti(source_path, vtk_download_target, vti_download_target, file_name)
    print('= = = = = = = = = = File Converted = = = = = = = = = = ')


#Infection Mask
source_path = 'Data/InfectionMask/niiGzFiles'
vtk_download_target = 'Data/InfectionMask/vtk'
vti_download_target = 'Data/InfectionMask/vti'
convertFolderNii2Vti(source_path, vtk_download_target, vti_download_target)

#Lung and Infection Mask
source_path = 'Data/InfectionMask/niiGzFiles'
vtk_download_target = 'Data/Lung_and_infection_mask/vtk'
vti_download_target = 'Data/Lung_and_infection_mask/vti'
convertFolderNii2Vti(source_path, vtk_download_target, vti_download_target)

#Lung Mask
source_path = 'Data/Lung_mask/niiGz'
vtk_download_target = 'Data/Lung_mask/vtk'
vti_download_target = 'Data/Lung_mask/vti'
convertFolderNii2Vti(source_path, vtk_download_target, vti_download_target)






