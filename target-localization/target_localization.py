import numpy as np
import cv2
from math import sin, cos, pi


def process(img):
    resized_img = cv2.resize(img, (img.shape[1] // 4, img.shape[0] // 4), interpolation=cv2.INTER_CUBIC)

    hsv_img = cv2.cvtColor(resized_img, cv2.COLOR_BGR2HSV)

    r1 = np.array([0, 100, 100])
    r2 = np.array([5, 255, 255])
    r3 = np.array([175, 100, 100])
    r4 = np.array([180, 255, 255])

    mask_1_img = cv2.inRange(hsv_img, r1, r2)
    mask_2_img = cv2.inRange(hsv_img, r3, r4)
    gray_img = mask_1_img | mask_2_img

    cv2.imshow("gray_img", gray_img)

    blurred_img = cv2.GaussianBlur(gray_img, (5, 5), 0)

    cv2.imshow("blurred_img", blurred_img)

    contours, _ = cv2.findContours(blurred_img, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)

    contour_area_threshold = 5000
    large_contours = [contour for contour in contours if cv2.contourArea(contour) >= contour_area_threshold]

    contours_img = resized_img.copy()
    cv2.drawContours(contours_img, contours, -1, (0, 255, 0), 1)
    cv2.imshow("contours_img", contours_img)

    large_contours_img = resized_img.copy()
    # cv2.drawContours(large_contours_img, large_contours, -1, (0, 255, 0), cv2.FILLED)

    for contour in large_contours:
        convex_hull = cv2.convexHull(contour, returnPoints=False)
        convex_hull_pts = np.array([np.array(point).flatten() for point in contour[convex_hull]])
        # cv2.drawContours(large_contours_img, [convex_hull_pts], -1, (0, 0, 255), 3)
        defects = []
        convexity_defects = cv2.convexityDefects(contour, convex_hull)
        mean_convexity_defects = np.mean(convexity_defects[:,:,3])
        classification = "circle" if mean_convexity_defects < 1000 else "star"

        rect = cv2.minAreaRect(contour)
        box = cv2.boxPoints(rect)
        box = np.int0(box) 

        cv2.drawContours(large_contours_img,[box],0,(255,0,0),3)
        cv2.putText(large_contours_img, classification, (box[1][0], box[1][1] - 10), fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1, color=(255,0,0))

        fx = 1646
        fy = 1646
        ox = 946
        oy = 719

        camera_intrinsics = np.array([
            [fx, 0, ox],
            [0, fy, oy],
            [0, 0, 1]
        ], dtype="double")
        distortion_coefficients = np.zeros((4, 1), dtype="double")

        if classification == "circle":
            circle_diameter = 0.3 # 20cm

            image_points = np.array(box, dtype="double")

            flat_contour = contour.reshape((contour.shape[0], contour.shape[2]))

            M = cv2.moments(contour)
            centroid_x = int(M['m10']/M['m00'])
            centroid_y = int(M['m01']/M['m00'])

            max_idx = np.argmax(flat_contour, axis=0)
            min_idx = np.argmin(flat_contour, axis=0)

            max_x, max_y = flat_contour[max_idx]
            min_x, min_y = flat_contour[min_idx]

            (c0, c1), radius = cv2.minEnclosingCircle(contour)

            # cv2.circle(large_contours_img, (int(c0), int(c1)), int(radius), color=(0, 255, 0), thickness=3)

            ellipse = cv2.fitEllipse(contour)
            cv2.ellipse(large_contours_img, ellipse, color=(0, 255, 0), thickness=3)

            ((c0, c1), (w, h), t) = ellipse
            tr = np.deg2rad(t)

            rot = np.array([
                [np.cos(tr), -np.sin(tr)],
                [np.sin(tr), np.cos(tr)]
            ])
            center = np.array([c0, c1])

            ellipse_points = np.array([
                center + rot @ np.array([0, -h / 2]),
                center + rot @ np.array([w / 2, 0]),
                center + rot @ np.array([0, h / 2]),
                center + rot @ np.array([-w / 2, 0]),
            ], dtype="double")

            # max_idx = np.argmax(ellipse_points, axis=0)
            # min_idx = np.argmin(ellipse_points, axis=0)
            # max_x, max_y = ellipse_points[max_idx]
            # min_x, min_y = ellipse_points[min_idx]

            image_points = np.array([
                min_y,
                max_x,
                max_y,
                min_x,
                center
            ], dtype="double")

            # NED frame?
            world_points = np.array([
                [0, 0, -circle_diameter / 2],
                [0, circle_diameter / 2, 0],
                [0, 0, circle_diameter / 2],
                [0, -circle_diameter / 2, 0],
                [0, 0, 0],
            ], dtype="double")

            res, rvec, tvec = cv2.solvePnP(world_points, image_points, camera_intrinsics, distortion_coefficients, flags=0)

            world_axes = np.array([
                [0, 0, 0],
                [0.1, 0, 0],
                [0, 0.1, 0],
                [0, 0, 0.1],
            ], dtype="double")
            image_axes, _ = cv2.projectPoints(world_axes, rvec, tvec, camera_intrinsics, distortion_coefficients)
            image_axes = np.floor(image_axes)
            image_axes = np.array(image_axes, dtype="int")

            # Actual points on circle are points on ellipse rotated back by theta?

            print(image_axes)

            image_points = np.array(np.floor(image_points), dtype="int")

            cv2.circle(large_contours_img, tuple(image_points[0]), color=(255, 255, 0), radius=5)
            cv2.circle(large_contours_img, tuple(image_points[1]), color=(255, 255, 0), radius=5)
            cv2.circle(large_contours_img, tuple(image_points[2]), color=(255, 255, 0), radius=5)
            cv2.circle(large_contours_img, tuple(image_points[3]), color=(255, 255, 0), radius=5)
            cv2.circle(large_contours_img, tuple(image_points[4]), color=(255, 255, 0), radius=5)

            cv2.line(large_contours_img, tuple(image_axes[0,0,:]), tuple(image_axes[1,0,:]), color=(0, 0, 255), thickness=3)
            cv2.line(large_contours_img, tuple(image_axes[0,0,:]), tuple(image_axes[2,0,:]), color=(0, 255, 0), thickness=3)
            cv2.line(large_contours_img, tuple(image_axes[0,0,:]), tuple(image_axes[3,0,:]), color=(255, 0, 0), thickness=3)
        elif classification == "star":
            epsilon = 0.05 * cv2.arcLength(contour, True)
            contour_approx = cv2.approxPolyDP(contour, epsilon, True)

            cv2.drawContours(large_contours_img, [contour_approx], 0, (0, 255, 0), 3)

            flat_contour = contour_approx.reshape((contour_approx.shape[0], contour_approx.shape[2]))

            min_idx = np.argmin(flat_contour, axis=0)

            _, min_y_idx = min_idx

            print(min_y_idx)

            image_points = np.concatenate((
                flat_contour[min_y_idx:],
                flat_contour[:min_y_idx],
            ),
                dtype="double"
            )

            star_radius = 0.1
            star_angle = (2 * np.pi) / 5

            world_points = np.array([
                [0, star_radius * np.sin(0 * star_angle), star_radius * -np.cos(0 * star_angle)],
                [0, star_radius * np.sin(1 * star_angle), star_radius * -np.cos(1 * star_angle)],
                [0, star_radius * np.sin(2 * star_angle), star_radius * -np.cos(2 * star_angle)],
                [0, star_radius * np.sin(3 * star_angle), star_radius * -np.cos(3 * star_angle)],
                [0, star_radius * np.sin(4 * star_angle), star_radius * -np.cos(4 * star_angle)],
            ], dtype="double")

            print(image_points)
            print(world_points)

            res, rvec, tvec = cv2.solvePnP(world_points, image_points, camera_intrinsics, distortion_coefficients, flags=0)
            world_axes = np.array([
                [0, 0, 0],
                [0.1, 0, 0],
                [0, 0.1, 0],
                [0, 0, 0.1],
            ], dtype="double")
            image_axes, _ = cv2.projectPoints(world_axes, rvec, tvec, camera_intrinsics, distortion_coefficients)
            image_axes = np.floor(image_axes)
            image_axes = np.array(image_axes, dtype="int")

            cv2.line(large_contours_img, tuple(image_axes[0,0,:]), tuple(image_axes[1,0,:]), color=(0, 0, 255), thickness=3)
            cv2.line(large_contours_img, tuple(image_axes[0,0,:]), tuple(image_axes[2,0,:]), color=(0, 255, 0), thickness=3)
            cv2.line(large_contours_img, tuple(image_axes[0,0,:]), tuple(image_axes[3,0,:]), color=(255, 0, 0), thickness=3)


    cv2.imshow("large_contours_img", large_contours_img)


