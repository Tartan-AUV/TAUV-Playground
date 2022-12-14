from types import NoneType
import cv2 as cv
import numpy as np
import scipy.ndimage as sp
import math
import skimage.morphology as morph
from skimage.transform import hough_line, hough_line_peaks
import matplotlib.pyplot as plt
from matplotlib import cm

GBRATIO = .9
RBRATIO = 1.5
SIGMA = 0.5
STDMULTIPLIER = 2
POINTDISTTHRESH = 50
LINETHRESH = 100

CANNYTHRESH1 = 200
CANNYTHRESH2 = 250
APTSIZE = 7

#used to weight the degree dif in HoughNMS
degWeight = 100

#visualization helper functions
def visualizeImage(img):
    cv.imshow("Image", img)
    cv.waitKey(0)

def visualizeParamLines(lines, points, image):
    image = cv.cvtColor(image, cv.COLOR_GRAY2RGB)

    if lines is not None:
        for i in range(0, len(lines)):
            rho = lines[i][0]
            theta = lines[i][1]
            a = math.cos(theta)
            b = math.sin(theta)
            x0 = a * rho
            y0 = b * rho
            pt1 = (int(x0 + 5000*(-b)), int(y0 + 5000*(a)))
            pt2 = (int(x0 - 5000*(-b)), int(y0 - 5000*(a)))
            cv.line(image, pt1, pt2, (0,0,255), 3, cv.LINE_AA)

    for point in points:
        cv.circle(image, (round(point[0]),round(point[1])), 10, color=(255, 0, 255), thickness=-1)
    
    cv.imshow("Detected Lines", image)
    cv.waitKey(0)

#performs NMS on line detections, merging close detections to improve line accuracy
def HoughNMS(lines):
    unique = []
    for i in range(0, len(lines)):
        rho = lines[i][0]
        theta = lines[i][1]

        found = False
        #for already detected lines
        for k in range(len(unique)):
            #calculate Euclidean distance between lines
            posmeas = np.linalg.norm([rho-unique[k][1],degWeight*(theta - unique[k][2])])
            if(posmeas<LINETHRESH):
                num = unique[k][0]

                #if close line found, we average the line measurements
                pointX = (unique[k][1]*num+rho)/(num+1)
                pointY = (unique[k][2]*num+theta)/(num+1)
                unique[k] = [num+1, pointX, pointY]
                found = True
                break
        
        #if not, add to points
        if(not found):
            unique.append([1,rho,theta])

    if(len(unique)==0):
        return []

    return np.array(unique)[:,1:3]


#performs a shape erosion, essentially thinning lines and eliminating thin intensity areas
def thinLines(img, itr = 1):
    return cv.erode(img, cv.getStructuringElement(cv.MORPH_RECT, (3,3)), iterations = itr)


#hue must be combination of "red" or "green" or "black"
#filters accordingly by color or intesity ratios of image
#NMS thins the lines of the resulting filtered image
def colorFilter(img, hue = "red", thresh = 0, NMS = True, itr = 1):
    if(type(img)==NoneType or len(img)==0):
        return

    #blur image
    img = sp.gaussian_filter(img,SIGMA)

    #extract color ratios from the image
    #http://www.aui.ma/sse-capstone-repository/pdf/spring-2020/UNDERWATERIMAGECOLORRESTORATION.pdf
    filtered = np.zeros((len(img),len(img[0])))

    #calculates pixels where green hues above image mean
    if("green" in hue):
        pixelRatios = np.divide(img[:,:,1],img[:,:,0])
        Med = np.mean(pixelRatios)
        STD = np.std(pixelRatios)
        filtered += np.where(pixelRatios>(Med+STDMULTIPLIER*STD), pixelRatios, 0)

    #calculates pixels where red hues above image mean
    if("red" in hue):
        pixelRatios = np.divide(img[:,:,2],img[:,:,0])
        Med = np.mean(pixelRatios)
        STD = np.std(pixelRatios)
        filtered += np.where(pixelRatios>(Med+STDMULTIPLIER*STD), pixelRatios, 0)

    #calculates pixels where color intensity above image mean
    if("black" in hue):
        pixelRatios = np.mean(img, axis=2)
        Med = np.mean(pixelRatios)
        STD = np.std(pixelRatios)
        filtered += np.where(pixelRatios>(Med+STDMULTIPLIER*STD), pixelRatios, 0)

    FILTERED = np.array(np.where(filtered>thresh, 255, 0),dtype=np.uint8)

    if(NMS):
        return thinLines(FILTERED, itr)

    return FILTERED

# points[k] is the 3-tuple (interection_count, x_coord, y_coord)
# intCount[i] is the number of intersections for the ith line,
# intPoints[i] is list of points k the ith line intersects
# minLineInt is the minimum number intersections along a line we want to consider 
#   (e.g. for gate we only want to consider lines that are intersected by at least 2 other pole lines)
# minPointInt is the minimum number of line intersections at a point we want to consider
# 
def extractPoints(points, intCount, intPoints, minLineInt=1, minPointInt=1):
    if(len(points)==0):
        return []

    points = np.array(points)
    #if any intersection accepted, return all detected points as array
    if(minLineInt!=1 and len(intCount)>0):
        #find line points one lines with at least minLineInt intersections
        linePoints = np.array(intPoints, dtype=object)
        lineIntersections = np.array(intCount, dtype=np.uint8)
        validPoints = np.extract(lineIntersections>=minLineInt, linePoints)

        if(len(validPoints)==0 or np.ndim(validPoints)==0):
            return []
        
        linePoints = np.unique(np.concatenate(validPoints))

        points = np.take(points,linePoints, axis = 0)

    if(minPointInt!=1):
        points = np.extract(points[:,:,0]>=minPointInt, points)

    return points[:,1:3]

#returns points on image from lines with at least MININT line intersections
#width and height are the sizes of the image frame, used to constrain intersection point coordinates
def findIntersectionPoints(lines, width, height, MININT = 1, MINPOINTINT = 1):
    points = []
    numLineInt = [0 for line in lines]
    linePoints = [[] for line in lines]

    #find where every line intersects w each other
    for i in range(0, len(lines)):
        c1 = lines[i][0]
        a1 = math.cos(lines[i][1])
        b1 = math.sin(lines[i][1])

        #for every other line
        for j in range(i+1, len(lines)):
            c2 = lines[j][0]
            a2 = math.cos(lines[j][1])
            b2 = math.sin(lines[j][1])

            x = 0
            #account for division by 0 (zero slope instances)
            if(b2==0 and b1==0):
                continue
            elif(b1==0 and b2!=0):
                x = (c1/a1)
            elif(b2==0 and b1!=0):
                x = (c2/a2)
            else:
                if((a1/b1 - a2/b2)==0):
                    continue
                x = (c1/b1 - c2/b2)/(a1/b1 - a2/b2)
            
            #if point within image bounds
            if(x>0 and x<width):
                if(b2==0):
                    y = (c1 - a1*x)/b1
                else:
                    y = (c2 - a2*x)/b2

                if(y>0 and y<height):
                    #check whether a close point has been found
                    found = False
                    for k in range(len(points)):
                        if(np.linalg.norm(np.subtract([x,y],points[k][1:3]))<POINTDISTTHRESH):
                            num = points[k][0]
                            pointX = (points[k][1]*num+x)/(num+1)
                            pointY = (points[k][2]*num+y)/(num+1)
                            points[k] = [num+1, pointX, pointY]
                            found = True

                            #append to line-specific intersections
                            linePoints[j].append(k)
                            linePoints[i].append(k)
                            numLineInt[i]+=1
                            numLineInt[j]+=1

                            break

                    #if not, add to points
                    if(not found):
                        #append to line-specific intersections
                        linePoints[j].append(len(points))
                        linePoints[i].append(len(points))
                        numLineInt[i]+=1
                        numLineInt[j]+=1

                        points.append([1,x,y])

    return extractPoints(points, numLineInt, linePoints, MININT, MINPOINTINT)


# numLineInt is the minimum number intersections along a line we want to consider 
#   (e.g. for gate we only want to consider lines that are intersected by at least 2 other pole lines)
# numPointInt is the minimum number of line intersections at a point we want to consider
def findGatePoints(img, numLineInt = 1, numPointInt = 1):
    #uses pixel ratios to filter, should be converted to hue
    img = sp.gaussian_filter(img,SIGMA)
    pixelRatios = np.divide(img[:,:,2],img[:,:,0])
    Med = np.mean(pixelRatios)
    STD = np.std(pixelRatios)
    filtered = np.where(pixelRatios>(Med+STDMULTIPLIER*STD), pixelRatios, 0)

    #cv.erode(img, cv.getStructuringElement(cv.MORPH_RECT, (3,3)), iterations = itr)
    filtered = morph.remove_small_objects((filtered/255).astype(np.uint8),min_size=100)
    filtered = morph.opening(filtered, morph.square(5))
    filtered = morph.closing(filtered,  morph.square(20))
    image = morph.skeletonize(filtered).astype(np.uint8)*255

    visualizeImage(filtered*255)
    visualizeImage(image)

    #edges = cv.Canny(filtered, CANNYTHRESH1,CANNYTHRESH2, apertureSize = APTSIZE)
    #lines = cv.HoughLines(edges, 1, np.pi / 180, LINETHRESH, None, 0, 0)[:,0,:]

    #if(type(lines)==NoneType):
    #    return ([], [])

    #lines = HoughNMS(lines[:,0,:])
    #points = findIntersectionPoints(lines, len(edges[0]), len(edges), MININT = numLineInt, MINPOINTINT = numPointInt)

    #visualizeParamLines(lines, [], filtered)

    #tested_angles = np.linspace(-np.pi / 2, np.pi / 2, 360, endpoint=False)
    h, theta, d = hough_line(image)

    #fig, axes = plt.subplots(1, 3, figsize=(15, 6))
    #ax = axes.ravel()

    #ax[2].imshow(image, cmap=cm.gray)
    #ax[2].set_ylim((image.shape[0], 0))
    #ax[2].set_axis_off()
    #ax[2].set_title('Detected lines')
    image = cv.cvtColor(image, cv.COLOR_GRAY2RGB)

    for _, angle, dist in zip(*hough_line_peaks(h, theta, d)):
        (x0, y0) = dist * np.array([np.cos(angle), np.sin(angle)])
        #ax[2].axline((x0,y0), slope=np.tan(angle + np.pi/2))
        slope=np.tan(angle + np.pi/2)
        if(angle==0):
            slope = 1000
        cv.line(image, (int(x0), int(y0)), (int(x0+5000), int(y0+5000*slope)), (0,0,255), 3, cv.LINE_AA)

    #plt.tight_layout()
    #plt.show()
    cv.imshow("lines", image)
    cv.waitKey(0)

    return ([],None)
