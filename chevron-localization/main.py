import numpy as np
import cv2
import matplotlib.pyplot as plt
from chevron_localization import run_chevron_localization

def main():
    cap = cv2.VideoCapture('data/test-5.mp4')

    while cap.isOpened():
        ret, frame = cap.read()

        if not ret:
            break

        img = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

        run_chevron_localization(img)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()
