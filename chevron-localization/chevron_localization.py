import numpy as np
import cv2
import matplotlib.pyplot as plt
from math import atan2, pi, cos, sin

def threshold(img):
    hsv_img = cv2.cvtColor(img, cv2.COLOR_RGB2HSV)

    r1 = np.array([160, 100, 100])
    r2 = np.array([180, 255, 255])
    r3 = np.array([0, 100, 100])
    r4 = np.array([20, 255, 255])

    img_threshold = cv2.inRange(hsv_img, r1, r2) | cv2.inRange(hsv_img, r3, r4)

    # r1 = np.array([0, 0, 160])
    # r2 = np.array([180, 255, 255])
    #
    # img_threshold = cv2.inRange(hsv_img, r1, r2)

    return img_threshold

def clean(img):
    kernel_close = np.ones((5, 5), np.uint8)
    kernel_open = np.ones((5, 5), np.uint8)
    img_closed = cv2.morphologyEx(img, cv2.MORPH_CLOSE, kernel_close)
    img_opened = cv2.morphologyEx(img_closed, cv2.MORPH_OPEN, kernel_open)

    img_opened[:, -200:] = 0

    return img_opened

def find_chevron(img):
    analysis = cv2.connectedComponentsWithStats(img,
                                                4,
                                                cv2.CV_32S)
    (totalLabels, label_ids, values, centroid) = analysis

    for i in range(1, totalLabels):
        area = values[i, cv2.CC_STAT_AREA]

        if area < 1000:
            continue

        output = np.where(label_ids == i, 255, 0).astype(np.uint8)

        return output

    return None

def find_contours(img):
    contours, _ = cv2.findContours(img, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    contour = contours[0]

    # contour_convex = cv2.convexHull(contour)
    perimeter = cv2.arcLength(contour, True)
    contour_approx = cv2.approxPolyDP(contour, 0.02 * perimeter, True)

    return contour_approx

def run_chevron_localization(img):
    cv2.imshow('img', img)

    img_threshold = threshold(img)
    cv2.imshow('img_threshold', img_threshold)

    img_clean = clean(img_threshold)
    cv2.imshow('img_clean', img_clean)

    img_chevron = find_chevron(img_clean)
    if img_chevron is None:
        return
    cv2.imshow('img_chevron', img_chevron)

    contour = find_contours(img_chevron)
    # img_contours = cv2.cvtColor(img_chevron, cv2.COLOR_GRAY2RGB)
    img_contours = img.copy()
    cv2.drawContours(img_contours, [contour], -1, (255, 0, 0), 2)

    for point in contour:
        cv2.circle(img_contours, (point[0, 0], point[0, 1]), 5, (0, 255, 0), -1)

    n_points = contour.shape[0]

    hull = cv2.convexHull(contour, returnPoints=False)

    points = {}
    side_i = 1

    for i in range(n_points):
        x1, y1 = contour[(i - 1) % n_points, 0, :]
        x2, y2 = contour[i, 0, :]
        x3, y3 = contour[(i + 1) % n_points, 0, :]

        angle = atan2(y3 - y2, x3 - x2) - atan2(y1 - y2, x1 - x2)

        angle = (angle + pi) % (2 * pi)

        if angle > pi:
            angle = angle - pi

        if np.abs(angle - (pi / 2)) < 0.2 and 50 <= x2 <= img.shape[1] - 450 and 50 <= y2 <= img.shape[0] - 50:
            if [i] in hull:
                cv2.putText(img_contours, "FRONT", (x2, y2 - 50), fontFace=cv2.FONT_HERSHEY_SIMPLEX,
                            fontScale=1, color=(0, 0, 255))
                points['front'] = i, (x2, y2)
            else:
                cv2.putText(img_contours, "BACK", (x2, y2 - 50), fontFace=cv2.FONT_HERSHEY_SIMPLEX,
                            fontScale=1, color=(0, 0, 255))
                points['back'] = i, (x2, y2)
        elif np.abs(angle - (3 * pi / 4)) < 0.2 and [i] in hull and 50 <= x2 <= img.shape[1] - 450 and 50 <= y2 <= img.shape[0] - 50:
            cv2.putText(img_contours, "SIDE", (x2, y2 - 50), fontFace=cv2.FONT_HERSHEY_SIMPLEX,
                        fontScale=1, color=(0, 0, 255))
            points[f'side_{side_i}'] = i, (x2, y2)
            side_i += 1
        elif np.abs(angle - (pi / 4)) < 0.2 and [i] in hull and 50 <= x2 <= img.shape[1] - 450 and 50 <= y2 <= img.shape[0] - 50:
            cv2.putText(img_contours, "TAIL", (x2, y2 - 50), fontFace=cv2.FONT_HERSHEY_SIMPLEX,
                        fontScale=1, color=(0, 0, 255))

        cv2.putText(img_contours, str(round(angle, 3)), (x2, y2 - 10), fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1, color=(0, 255, 0))
        cv2.putText(img_contours, str(i), (x2, y2 + 50), fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1, color=(0, 255, 0))

    if 'front' in points:
        front_i, front = points['front']

        x1, y1 = contour[(front_i - 1) % n_points, 0, :]
        x2, y2 = contour[front_i, 0, :]
        x3, y3 = contour[(front_i + 1) % n_points, 0, :]

        angle = (atan2(y3 - y2, x3 - x2) + atan2(y1 - y2, x1 - x2)) / 2
        if angle > 0:
            angle = angle - pi
        else:
            angle = angle + pi

        cv2.circle(img_contours, (int(front[0]), int(front[1])), 10, (0, 0, 255), -1)
        cv2.line(img_contours, (x2, y2), (int(x2 + 100 * cos(angle)), int(y2 + 100 * sin(angle))), (0, 0, 255), 5)

    cv2.imshow('img_contours', img_contours)
