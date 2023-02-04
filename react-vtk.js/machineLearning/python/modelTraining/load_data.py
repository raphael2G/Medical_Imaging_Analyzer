import os

import tensorflow as tf
from keras import layers

from PIL import Image
import numpy as np

#@title create_file_list()
def create_file_list(non_covid_file_name_path, covid_file_name_path, training_file, labels_file, from_drive=False, drive_start='/content/drive/MyDrive'):
    non_covid_image_folder_path = 'COVID-CT/Images-processed/CT_NonCOVID'
    covid_image_folder_path = 'COVID-CT/Images-processed/CT_COVID'
    
    if from_drive:
      non_covid_file_name_path = os.path.join(drive_start, non_covid_file_name_path)
      covid_file_name_path = os.path.join(drive_start, covid_file_name_path)
      training_file = os.path.join(drive_start, training_file)
      labels_file = os.path.join(drive_start, labels_file)
      non_covid_image_folder_path = os.path.join(drive_start, non_covid_image_folder_path)
      covid_image_folder_path = os.path.join(drive_start, covid_image_folder_path)

    non_covid_file_name_list = open(non_covid_file_name_path).readlines()
    covid_file_name_list = open(covid_file_name_path).readlines()

    f = open(training_file, 'w')
    g = open(labels_file, 'w')

    for non_covid_file_name, covid_file_name in zip(non_covid_file_name_list, covid_file_name_list):
        
        non_covid_file_name = non_covid_file_name.strip()
        covid_file_name = covid_file_name.strip()

        non_covid_path = os.path.join(non_covid_image_folder_path, non_covid_file_name)
        covid_path = os.path.join(covid_image_folder_path, covid_file_name)
        f.write(non_covid_path + '\n')
        g.write('0\n')
        f.write(covid_path + '\n')
        g.write('1\n')

    f.close()
    g.close()

#@title create_data_from_list()
def create_data_from_list(data_folder, from_drive=False, drive_start='/content/drive/MyDrive'):
    if from_drive:
      data_folder = os.path.join(drive_start, data_folder)
      
    data_list = os.path.join(data_folder, 'data.txt')
    label_list = os.path.join(data_folder, 'labels.txt')

    training_data_list = open(data_list).readlines()
    training_label_list = open(label_list).readlines()

    training_tensors_data = []
    for i, file in enumerate(training_data_list):
        training_data_list[i] = file.strip()
        training_tensors_data.append(process_path(file.strip()))

    for i, label in enumerate(training_label_list):
        training_label_list[i] = int(label.strip())
    tensor_labels = tf.convert_to_tensor(training_label_list)

    IMG_SIZE = 224
    data_augmentation = tf.keras.Sequential([
        layers.Resizing(IMG_SIZE, IMG_SIZE, 'bilinear'),
        layers.Rescaling(1./255),
        layers.RandomFlip("horizontal_and_vertical"),
    ])

    for i, tensor_data in enumerate(training_tensors_data):
        training_tensors_data[i] = data_augmentation(tensor_data)

    training_tensors_data = tf.convert_to_tensor(training_tensors_data)
    dataset = tf.data.Dataset.from_tensor_slices((training_tensors_data, tensor_labels))
    
    return dataset

def process_path(file_path):
  img = Image.open(file_path)
  if np.shape(img)[-1] != 3:
      try: 
          img = img.convert('RGB')
      except:
          print('Invalid Data Removed: ')
          print(np.shape(img))
          return '', False

  img = np.asarray(img)
  return tf.convert_to_tensor(img)