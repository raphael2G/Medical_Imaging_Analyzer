import os
import SimpleITK as sitk

from vtk import vtkStructuredPointsReader
from vtk import vtkXMLImageDataWriter

def convertNii2Vti(source_path, vtk_download_target, vti_download_target, file_base):
    niiGzImageFileName = file_base +'.nii.gz'
    vtkImageFileName = file_base +'.vtk'
    vtiImageFileName = file_base +'.vti'


    niiImageFilePath = os.path.join(source_path, niiGzImageFileName)
    vtkImageFilePath = os.path.join(vtk_download_target, vtkImageFileName)
    vtiImageFilePath = os.path.join(vti_download_target, vtiImageFileName)

    try: 
        vtkImageFile = open(vtkImageFilePath, 'x')
    except:
        print(vtkImageFileName + ' already exists. Rewriting current file.')
        vtkImageFile = open(vtkImageFilePath, 'w')

    try: 
        vtiImageFile = open(vtiImageFilePath, 'x')
    except:
        print(vtiImageFileName + ' already exists. Rewriting current file.')
        vtiImageFile = open(vtiImageFilePath, 'w')


    #convert .nii to .vtk
    niiReader = sitk.ImageFileReader()
    niiReader.SetImageIO("NiftiImageIO")
    niiReader.SetFileName(niiImageFilePath)
    niiImage = niiReader.Execute()

    vtkWriter = sitk.ImageFileWriter()
    vtkWriter.SetFileName(vtkImageFilePath)
    vtkWriter.Execute(niiImage)

    print('--------- .nii converted to .vtk ---------')

    #convert .vtk to .vti
    vtkReader = vtkStructuredPointsReader()
    vtkReader.SetFileName(vtkImageFilePath)

    vtiWriter = vtkXMLImageDataWriter()
    vtiWriter.SetInputConnection(vtkReader.GetOutputPort())

    vtiWriter.SetFileName(vtiImageFilePath)
    vtiWriter.Write()
    print('--------- .vtk converted to .vti ---------')


