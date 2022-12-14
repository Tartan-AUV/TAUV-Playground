from CVPointHelper import *
from types import NoneType
import cv2 as cv

def calculateGatePose(img, depth):
    pts = findGatePoints(img)

    #gate not correctly detected in frame
    if(len(pts)==0):
        return []

    #find the pose using depth map and return
    return pts

#TODO: write ros node to listen to both camera images
#relative pose estimate of the graph, PNP: https://docs.opencv.org/4.x/d5/d1f/calib3d_solvePnP.html
#https://docs.opencv.org/4.x/d9/d0c/group__calib3d.html#ga1b2f149ee4b033c4dfe539f87338e243
def main():
    cap = cv.VideoCapture("./videos/Trimmed.mp4")
    frame_width = int(cap.get(cv.CAP_PROP_FRAME_WIDTH))
    frame_height = int(cap.get(cv.CAP_PROP_FRAME_HEIGHT))
    fps = int(cap.get(cv.CAP_PROP_FPS))

    fourcc = cv.VideoWriter_fourcc(*'XVID')
    out = cv.VideoWriter('./videos/output.mp4', fourcc, fps, (frame_width,frame_height))

    count = 500
    img = cv.imread("./images/"+str(count)+".png")
    while(count<5000):
        pts = calculateGatePose(img, [])
        
        for point in pts:
            cv.circle(img, (round(point[0]),round(point[1])), 10, color=(255, 0, 255), thickness=-1)
            
        cv.imwrite("./proccessed/"+str(count)+".png", img)

        out.write(img)

        img = cv.imread("./images/"+str(count)+".png")

        count+=1
    
    cap.release()
    out.release()
    return 0

main()