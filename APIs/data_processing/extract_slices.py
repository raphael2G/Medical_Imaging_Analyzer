import SimpleITK as sitk  


def extract_slices(file):
    itk_image = sitk.ImageFileReader('APIs/temporary.vti')
    return sitk.GetArrayFromImage(itk_image) 

print(extract_slices('goof'))