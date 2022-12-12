import cv2
import os
import numpy as np

base_path = 'dummy_data/testing_crop/'

# this function takes in an inage (medical image with white background) and saves the medical image with no white background
# returns a numpy array
def remove_background(PIL_image):
    print('***************************remove_background********')


    # convert PIL image to cv2
    img = cv2.cvtColor(np.array(PIL_image), cv2.COLOR_BGR2RGB)

    ## (1) Convert to gray, and threshold
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    th, threshed = cv2.threshold(gray, 240, 255, cv2.THRESH_BINARY_INV)

    ## (2) Morph-op to remove noise
    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (11,11))
    morphed = cv2.morphologyEx(threshed, cv2.MORPH_CLOSE, kernel)

    ## (3) Find the max-area contour
    cnts = cv2.findContours(morphed, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)[-2]
    cnt = sorted(cnts, key=cv2.contourArea)[-1]

    ## (4) Crop and save it
    x,y,w,h = cv2.boundingRect(cnt)
    dst = img[y:y+h, x:x+w]

    return dst