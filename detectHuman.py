import time
import imutils
import numpy as np
from cv2 import cv2


class hogObject:
    detector = cv2.HOGDescriptor()
    def __init__(self):
        self.detector.setSVMDetector(cv2.HOGDescriptor_getDefaultPeopleDetector())


def getHogObject():
    return hogObject()


def detectHumanFromFrame(image, hog):
    image = np.asarray(image)
    image = imutils.resize(image, width=min(400, image.shape[1]))

    # Detecting all the regions in the Image that has a pedestrians inside it
    (regions, _) = hog.detector.detectMultiScale(
        image, winStride=(4, 4), padding=(4, 4), scale=1.05)

    # Drawing the regions in the image
    for (x, y, w, h) in regions:
        cv2.rectangle(image, (x, y), (x + w, y + h), (0, 0, 255), 2)
        
    return  image 


if __name__ == "__main__":

    hog = hogObject()
    
    cap = cv2.VideoCapture('livedata.mp4')
    ret, image = cap.read()

    t_end = time.time() + 10
    while time.time() < t_end:
        # Reading the video stream
        ret, image = cap.read()
        if ret:
            image = detectHumanFromFrame(image, hog)
            cv2.imshow("Image", image)
            cv2.waitKey(5)
            if cv2.waitKey(5) & 0xFF == ord('q'):
                exit()
        else:
            break

    cap.release()
    cv2.destroyAllWindows()
