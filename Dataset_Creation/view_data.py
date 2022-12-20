from matplotlib import pyplot as plt
import numpy as np

data = np.load('Datasets/extracted_np_slices/coronacases_001/image_data.npy')

plt.imshow(data[100], interpolation='nearest')
plt.show()

