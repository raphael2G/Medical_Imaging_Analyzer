import tensorflow as tf
import keras
import tensorflowjs as tfjs

model = keras.Sequential([
    keras.layers.Conv2D(32, (3, 3), activation='relu', input_shape=(224, 224, 3)),
    keras.layers.Flatten(),
    keras.layers.Dense(2)
])

tfjs.converters.save_keras_model(model, 'savedModels/dummyModel')

data = tf.zeros((1, 224, 224, 3))
print(model(data))


