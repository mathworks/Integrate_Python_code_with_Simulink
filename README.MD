Integrate Python Code into Simulink for Simulation

Using Python Human Detection Algorithm in Simulink Example
Copyright 2012-2021 The MathWorks, Inc.

This example shows users how to integrate Python Human detection code into Simulink for simulation. This example reads a pre-recorded video, applies the human detection algorithm defined in Python, and generates the output video with human marked. This example includes the following files:

runme.m: This file provides the prep steps when using this example. Since the Python algorithm is based on OpenCV, you will need to install the needed packages if they are not available on your computer. This file also helps set the "out of Process" execution mode to avoid possible MATLAB crashes.   


detectHuman.py: this file contains the Python algorithm using OpenCV Histogram of Oriented Gradients (HOG) for human detection. 

livedata.mp4: this file is a pre-recorded video showing several people walking.  

python_HumanDetector.m: this file contains the MATLAB System Object integrating the Python human detection algorithm.

videoReader.m: this file contains the MATLAB System Object reading the pre-recorded video of livedata.mp4. This can be replaced if you have DSP System Toolbox available (see below). 

base_python_example_21a.slx: this file shows how Simulink can integrate Python code for simulation by using either MATLAB Function block or MATLAB System block. You could use the manual switch to select either method to bring in Python code. When you run this file, the output video will show blue boxes drawn around detected people.  

If you have DSP System Toolbox available, you could use the "From Multimedia File" block to replace the videoReader System block for simpler video reading; If you have Computer Vision Toolbox available, you can use the "To video Display" block to replace the Video_with_human_detection MATLAB function block for simpler video play.  

To use this example, open and run the runme.m first in MATLAB; Then start the base_python_example_21a.slx and run the simulation.   

Products needed for using this example :

MATLAB; 
Simulink; 
DSP System Toolbox (optional); 
Computer Vision Toolbox (optional); 