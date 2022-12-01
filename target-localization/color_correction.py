import numpy as np
import cv2

def to_grayscale(img):
    gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    return gray_img