import os
import SimpleITK as sitk

from vtk import vtkStructuredPointsReader
from vtk import vtkXMLImageDataWriter

base_path = 'pythonDataConverters'

niiImageFileName = 'pigImage.nii'
vtkImageFileName = niiImageFileName[:-4]+'.vtk'
vtiImageFileName = niiImageFileName[:-4]+'.vti'


niiImageFilePath = os.path.join(base_path, niiImageFileName)

try: 
    vtkImageFilePath = open(os.path.join(base_path, vtkImageFileName), 'x')
except:
    print(vtkImageFileName + ' already exists. Rewriting current file.')
    vtkImageFilePath = open(os.path.join(base_path, vtkImageFileName), 'w')

try: 
    vtiImageFilePath = open(os.path.join(base_path, vtiImageFileName), 'x')
except:
    print(vtiImageFileName + ' already exists. Rewriting current file.')
    vtiImageFilePath = open(os.path.join(base_path, vtiImageFileName), 'w')





#convert .nii to .vtk

niiReader = sitk.ImageFileReader()
niiReader.SetImageIO("NiftiImageIO")
niiReader.SetFileName(niiImageFilePath)
niiImage = niiReader.Execute()

vtkWriter = sitk.ImageFileWriter()
vtkWriter.SetFileName(vtkImageFileName)
vtkWriter.Execute(niiImage)

print('--------- .nii converted to .vtk ---------')

#convert .vtk to .vti

vtkReader = vtkStructuredPointsReader()
vtkReader.SetFileName(vtkImageFileName)

vtiWriter = vtkXMLImageDataWriter()
vtiWriter.SetInputConnection(vtkReader.GetOutputPort())

vtiWriter.SetFileName(vtiImageFileName)
vtiWriter.Write()
print('--------- .vtk converted to .vti ---------')