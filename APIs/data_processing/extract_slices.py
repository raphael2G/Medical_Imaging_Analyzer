import SimpleITK as sitk  


def extract_slices(file):
    itk_image = sitk.ReadImage(file)
    return sitk.GetArrayFromImage(itk_image) 