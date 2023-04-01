import numpy as np
import cv2
import sys
from math import sin, cos, pi


def main():
    input_file = sys.argv[1]
    img = cv2.imread(input_file)
    val = process(img) 
    if (val == None):
        print("No pathmarker found")
        return None
    else:
        print("Pathmarker found")
        return val 

def process(img):
    hsv_img = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    #creating a mask to separate color as orange and non orange
    orange = np.array([5, 0, 0])
    r2 = np.array([25, 255, 255]) #these values were just theo + add
    comp_orange = np.array([135, 0, 0])
    r4 = np.array([145, 255, 255]) #these values were just theo + add
    mask_1_img = cv2.inRange(hsv_img, orange, r2)
    mask_2_img = cv2.inRange(hsv_img, comp_orange, r4)
    gray_img = mask_1_img | mask_2_img
    blurred = cv2.GaussianBlur(gray_img, (5, 5), 0)

    #Now we do the contour stuff 
    contours, _ = cv2.findContours(blurred, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
    contour_area_threshold = 10000
    #print("Right before for loop")
    large_contours = [contour for contour in contours if cv2.contourArea(contour) >= contour_area_threshold]
    large_contours_img = img.copy()
    cv2.drawContours(large_contours_img, large_contours, -1, (0, 255, 0), cv2.FILLED)
    cv2.imshow("large_contours_img", large_contours_img)
    cv2.waitKey(1000)
    # print(large_contours)
    found = False
    for contour in large_contours:
        (top_left, (width, height), angle) = cv2.minAreaRect(contour)
        rect = (top_left, (width, height), angle)
        # print("Top Left: ", top_left)
        # print("Width: ", width)
        # print("Height: ", height)
        box = cv2.boxPoints(rect)
        # print(box)
        box = np.int64(box)
        top_left = np.int64(top_left)
        box_img = cv2.drawContours(large_contours_img, [box], 0, (0, 255, 255), 2)
        box_img = cv2.circle(box_img, top_left, radius=0, color=(0,255,0), thickness=25)
        aspect_ratio = min(width, height) / max(width, height)
        #print(aspect_ratio)
        classification = "pathmarker" if aspect_ratio > 0.16 and aspect_ratio < 0.21 else "not_pathmarker"
        if (classification == "pathmarker"):
            box = cv2.boxPoints(rect)
            box = np.int64(box)
            box_img = cv2.drawContours(large_contours_img, [box], 0, (0, 255, 255), 2)
            pos_len_neg_width = None
            neg_len_neg_width = None
            pos_len_pos_width = None
            neg_len_pos_width= None
            dist_0_to_1 = np.linalg.norm(box[1] - box[0])
            dist_1_to_2 = np.linalg.norm(box[2] - box[1])
            if (dist_0_to_1 < dist_1_to_2):
                pos_len_neg_width = box[3]
                pos_len_pos_width = box[2]
                neg_len_neg_width = box[0]
                neg_len_pos_width = box[1]
            else:
                pos_len_neg_width = box[2]
                pos_len_pos_width = box[1]
                neg_len_neg_width = box[3]
                neg_len_pos_width = box[0]
            # box_img = cv2.circle(box_img, pos_len_neg_width, radius=0, color=(0,0,255), thickness=25)
            # cv2.imshow("box_img0", box_img)
            # cv2.waitKey(5000)
            # box_img = cv2.circle(box_img, pos_len_pos_width, radius=0, color=(0,0,255), thickness=25)
            # cv2.imshow("box_img1", box_img)
            # cv2.waitKey(5000)
            # box_img = cv2.circle(box_img, neg_len_neg_width, radius=0, color=(0,0,255), thickness=25)
            # cv2.imshow("box_img2", box_img)
            # cv2.waitKey(5000)
            # box_img = cv2.circle(box_img, neg_len_pos_width, radius=0, color=(0,0,255), thickness=25)
            # cv2.imshow("box_img3", box_img)
            # cv2.waitKey(5000)
            fx = 1035
            fy = 1035
            ox = 640.5
            oy = 360.5
            camera_intrinsics = np.array([
                [fx, 0, ox],
                [0, fy, oy],
                [0, 0, 1]
            ], dtype="float32")
            distortion_coefficients = np.zeros((4, 1), dtype="float32")
            length = 1.2 
            width = 0.15
            world_points = np.array([
                [(length / 2), -(width / 2), 0],
                [(length /2), (width / 2), 0],
                [-(length / 2), (width /2), 0],
                [-1 * (length / 2), -1 * (width /2), 0]
            ], dtype="float32")
            image_points = np.array([
                pos_len_neg_width,
                pos_len_pos_width,
                neg_len_pos_width,
                neg_len_neg_width
            ], dtype="float32")
            # print("World: ", world_points)
            # print("Image: ", image_points)
            res, rvec, tvec = cv2.solvePnP(world_points, image_points, camera_intrinsics, distortion_coefficients, flags=0)
            # print(res, rvec, tvec)
            world_axes = np.array([
                [0, 0, 0],
                [0.1, 0, 0],
                [0, 0.1, 0],
                [0, 0, 0.1],
            ], dtype="double")
            image_axes, _ = cv2.projectPoints(world_axes, rvec, tvec, camera_intrinsics, distortion_coefficients)
            image_axes = np.floor(image_axes)
            image_axes = np.array(image_axes, dtype="int")
            #print("Image Axes: ", image_axes)
            cv2.line(large_contours_img, tuple(image_axes[0,0,:]), tuple(image_axes[1,0,:]), color=(0, 0, 255), thickness=3)
            cv2.line(large_contours_img, tuple(image_axes[0,0,:]), tuple(image_axes[2,0,:]), color=(255, 0, 255), thickness=3)
            cv2.line(large_contours_img, tuple(image_axes[0,0,:]), tuple(image_axes[3,0,:]), color=(255, 0, 0), thickness=3)
            cv2.imshow("FINAL RESULT", large_contours_img)
            cv2.waitKey(30000)
            return res, rvec, tvec
        else:
            print("No pathmarker found!")
            return None
               
        
main()
print("Exiting file!")


