import time
# import imutils
import numpy as np
import cv2
import hogClass

def detectHumanFromFrame(image):

    hog = hogClass.hogObject()
    
    image = np.asarray(image)
    # image = imutils.resize(image, width=min(400, image.shape[1]))
    ratio = image.shape[0] / image.shape[1]
    new_height = int(400 * ratio)
    image = cv2.resize(image, (400,new_height))

    # Detecting all the regions in the Image that has a pedestrians inside it
    (regions, _) = hog.detector.detectMultiScale(
        image, winStride=(4, 4), padding=(4, 4), scale=1.05)

    # Drawing the regions in the image
    for (x, y, w, h) in regions:
        cv2.rectangle(image, (x, y), (x + w, y + h), (0, 0, 255), 2)
        
    return  image 


if __name__ == "__main__":
    
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
