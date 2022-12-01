import cv2
import numpy as np
import depthai as dai
from matplotlib import pyplot as plt

class BottleDetector:
    def __init__(self):
        self.__blur_kernel_size = 5
        self

    def detect_edges(self, image):
        image_blurred = cv2.blur(image, (self.__blur_kernel_size, self.__blur_kernel_size))
        edges = cv2.Canny(image=image_blurred, threshold1=100, threshold2=150)
        return edges

    def hough_transform(self, image):
        pass

# Create pipeline
pipeline = dai.Pipeline()

cam_rgb = pipeline.create(dai.node.ColorCamera)
stereo = pipeline.create(dai.node.StereoDepth)
cam_left = pipeline.create(dai.node.MonoCamera)
cam_right = pipeline.create(dai.node.MonoCamera)
xout_rgb = pipeline.create(dai.node.XLinkOut)
xout_depth = pipeline.create(dai.node.XLinkOut)

xout_rgb.setStreamName("rgb")
xout_depth.setStreamName("depth")


cam_left.setResolution(dai.MonoCameraProperties.SensorResolution.THE_400_P)
cam_right.setResolution(dai.MonoCameraProperties.SensorResolution.THE_400_P)
cam_rgb.setBoardSocket(dai.CameraBoardSocket.RGB)
cam_rgb.setResolution(dai.ColorCameraProperties.SensorResolution.THE_1080_P)
cam_rgb.setInterleaved(True)
cam_rgb.setColorOrder(dai.ColorCameraProperties.ColorOrder.BGR)

stereo.setDefaultProfilePreset(dai.node.StereoDepth.PresetMode.HIGH_ACCURACY)
stereo.initialConfig.setMedianFilter(dai.StereoDepthProperties.MedianFilter.KERNEL_7x7)
stereo.setLeftRightCheck(True)
stereo.setExtendedDisparity(True)
stereo.setSubpixel(False)
stereo.setDepthAlign(dai.CameraBoardSocket.RGB)

cam_rgb.video.link(xout_rgb.input)
cam_left.out.link(stereo.left)
cam_right.out.link(stereo.right)
stereo.depth.link(xout_depth.input)

#cap = cv2.VideoCapture('bottles_only_2.mp4')
#if not cap.isOpened():
#    print("Error")
counter = 0
bottle_detector = BottleDetector()
target_rgb = np.array([[[207, 49, 2]]], dtype=np.uint8)
target_hsv = cv2.cvtColor(target_rgb, cv2.COLOR_RGB2HSV)[0][0]
delta = np.array([10, 80, 80])
lower = target_hsv - delta
upper = target_hsv + delta

with dai.Device(pipeline) as device:
    video_stream = device.getOutputQueue('rgb')
    depth_stream = device.getOutputQueue('depth')
    plt.axis([0, 300, 0, 10000])
    plt.ion()
    plt.show()
    while True:
        rgb_frame = video_stream.get().getCvFrame()
        depth_frame = depth_stream.get().getCvFrame()
        #depth_upscaled = cv2.resize(depth_frame, rgb_frame.shape[:2])
        image_blurred = cv2.blur(rgb_frame, (15, 15))
        depth_mask = cv2.inRange(depth_frame, 0, 2000)
        hsv = cv2.cvtColor(image_blurred, cv2.COLOR_BGR2HSV)
        contour_mask = cv2.inRange(hsv, lower, upper)
        filtered = cv2.bitwise_and(image_blurred, image_blurred, mask=contour_mask)
        edges = cv2.Canny(image=filtered, threshold1=150, threshold2=255)
        edges_masked = cv2.bitwise_and(edges, edges, mask=depth_mask)
        contours, hierarchy = cv2.findContours(edges, mode=cv2.RETR_TREE,
                                               method=cv2.CHAIN_APPROX_NONE)
        candidateContours = []
        lines = None
        contoursBlurred = None
        contoursImg = np.zeros(rgb_frame.shape, dtype=np.uint8)
        all_masks = np.zeros((1080,1920), dtype=np.uint8)
        if contours is not None and hierarchy is not None:
            plt.clf()
            bottles = []
            for c, h in zip(contours, hierarchy[0]):
                if cv2.contourArea(c) < 1500:
                    continue
                bounding_rect = cv2.minAreaRect(c)
                if max(bounding_rect[1]) / min(bounding_rect[1]) > 10:
                    continue
                candidateContours.append(c)
                contour_mask = np.zeros(depth_frame.shape, np.uint8)
                cv2.drawContours(contour_mask, c, -1, 255, cv2.FILLED)
                depth_hist = cv2.calcHist([depth_frame], [0], contour_mask, [300], [0, 3000])
                depth_hist_n = (depth_hist * 255 / depth_hist.max()).astype(np.uint8)
                depth_current_peak = None
                frequency_current_peak = None
                peaks = []
                threshold = 70
                gap_counter = 0
                gap_threshold = 7
                for i, n in enumerate(depth_hist_n):
                    if depth_current_peak:
                        if n[0] > threshold:
                            if n > frequency_current_peak:
                                frequency_current_peak = n[0]
                                depth_current_peak = i
                        else:
                            if gap_counter > gap_threshold:
                                peaks.append((depth_current_peak, frequency_current_peak))
                                depth_current_peak = None
                                frequency_current_peak = None
                                gap_counter = 0
                            else:
                                gap_counter += 1
                    elif n[0] > threshold:
                        depth_current_peak = i
                        frequency_current_peak = n[0]
                depths = [peak[0] for peak in peaks]
                bottles.append((cv2.boundingRect(c), depths))
                # if len(peaks) == 0:
                #     continue
                # if len(peaks) == 1:
                #     depth, _ = peaks[0]
                #     bottles.append((cv2.boundingRect(c), depth))
                # else:
                #     thresholds = [0]
                #     for i in range(len(peaks)-1):
                #         depth, _ = peaks[i]
                #         next_depth, _ = peaks[i+1]
                #         thresholds.append((depth+next_depth)//2)
                #     thresholds.append(255)
                #     for i in range(len(thresholds)-1):
                #         depth_mask = cv2.inRange(depth_frame, thresholds[i], thresholds[i + 1])
                #         mask = cv2.bitwise_and(depth_mask, contour_mask)
                #         bottles.append((cv2.boundingRect(mask), depth))


            cv2.drawContours(rgb_frame, candidateContours, -1, 255, 2, cv2.LINE_AA)
            for rect, depths in bottles:
                print(rect)
                (x,y,w,h) = rect
                x, y, w, h = int(x), int(y), int(w), int(h)
                occlusion = len(depths) > 1
                color = (0,255,0) if not occlusion else (0,0,255)
                cv2.rectangle(rgb_frame, (x,y), (x+w, y+h), color, 2, cv2.LINE_AA)
                text = f'Bottle, depth(s) = {depths} '
                if occlusion:
                    text += '(OCCLUSION!)'
                cv2.putText(rgb_frame, text, (x, y - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9,
                            color, 2)

        cv2.imshow('edges', edges_masked)
        cv2.imshow('rgb', rgb_frame)
        cv2.imshow('filtered', filtered)
        cv2.imshow('contours, depth', (depth_frame / 10).astype(np.uint8))
        cv2.waitKey(1)

cap.release()
cv2.destroyAllWindowss