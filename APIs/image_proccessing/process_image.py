import tensorflow as tf

def process_image(np_array, with_resize=False, with_normalization=False):


    print('***************************process_image********')

    img = tf.convert_to_tensor(np_array)

    if with_resize: 
        img = tf.image.resize(img, (224, 224))

    if with_normalization:
        img = img/255.0

    return img