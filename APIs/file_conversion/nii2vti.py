
from vtk import vtkStructuredPointsReader
from vtk import vtkXMLImageDataWriter
import SimpleITK as sitk
import os



def nii2vti(listInputImageFileLocation):

    for inputImageFileLocation in listInputImageFileLocation:

        print('starting file conversion for: ', inputImageFileLocation)
        base_name = os.path.basename(inputImageFileLocation).split('.')[0]
        file_location = os.path.dirname(os.path.dirname(inputImageFileLocation))
        vtk_file_path = os.path.join(os.path.join(file_location, '.vtk'), base_name + '.vtk')
        vti_file_path = os.path.join(os.path.join(file_location, '.vti'), base_name + '.vti')

        image = sitk.ReadImage(inputImageFileLocation, imageIO="NiftiImageIO")
        sitk.WriteImage(image, vtk_file_path)

        print('--------- .nii.gz converted to .vtk ---------')

        vtkReader = vtkStructuredPointsReader()
        vtkReader.SetFileName(vtk_file_path)

        vtiWriter = vtkXMLImageDataWriter()
        vtiWriter.SetInputConnection(vtkReader.GetOutputPort())

        vtiWriter.SetFileName(vti_file_path)
        vtiWriter.Write()
        print('--------- .vtk converted to .vti ---------')

imagesToConvert = []
imagesToConvert.append('Datasets/Model_CTA_Maps/.nii.gz/CTA_Bilateral_SFA_Multifocal_Stenoses_Full_Low.nii.gz')
imagesToConvert.append('Datasets/Model_CTA_Maps/.nii.gz/Neg_Bilateral_SFA_Multifocal_Stenoses.nii.gz')
imagesToConvert.append('Datasets/Model_CTA_Maps/.nii.gz/Pos_Bilateral_SFA_Multifocal_Stenoses.nii.gz')

nii2vti(imagesToConvert)
