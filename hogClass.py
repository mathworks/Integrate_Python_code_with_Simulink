import cv2

class hogObject:
    detector = cv2.HOGDescriptor()
    def __init__(self):
        self.detector.setSVMDetector(cv2.HOGDescriptor_getDefaultPeopleDetector())


def getHogObject():
    return hogObject()
