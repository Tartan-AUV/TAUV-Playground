import numpy as np
import cv2

import target_localization

def main_video():
    cap = cv2.VideoCapture("footage/2022-finals-diver-5-targets.mp4")

    if not cap.isOpened():
        return

    while (cap.isOpened()):
        success, frame = cap.read()

        if not success:
            break

        target_localization.process(frame)

        if cv2.waitKey(25) & 0xFF == ord("q"):
            break

    cap.release()

    cv2.destroyAllWindows()

def main_image():
    image_files = [
        "footage/sarah-target-1.png",
        "footage/sarah-target-2.png",
        "footage/sarah-target-3.png",
    ]

    for image_file in image_files:
        frame = cv2.imread(image_file)

        target_localization.process(frame)


        while True:
            if cv2.waitKey(25) & 0xFF == ord("q"):
                break

        cv2.destroyAllWindows()

if __name__ == "__main__":
    main_image()