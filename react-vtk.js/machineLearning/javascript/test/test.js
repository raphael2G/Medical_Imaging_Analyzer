const model = tf.Sequential()
model.add(tf.layers.conv2d({inputShape: (224, 224, 3), filters: 32,}))