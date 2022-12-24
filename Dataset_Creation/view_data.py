from matplotlib import pyplot as plt
import numpy as np

data = np.load('Datasets/extracted_np_slices/coronacases_001/image_data.npy')
print(data[108])
plt.imshow(data[108], interpolation='nearest')
plt.show()

