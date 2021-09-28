%%%%%%%%%%%%%%%%%
% Setting up python installer and getting packages 
% 1. install pip
% 2. install opencv
% 3. install imutils
%
% 1. intall pip (on Linux console)
% sudo apt install python-pip
%
% 2. install opencv
% python -m pip install opencv-python
%
% 3. install imutils
% python -m pip install imutils

% MATLAB may crash with python process - use "OutOfProcess" execution mode
% could avoid that
pyenv("ExecutionMode","OutOfProcess");
    
py.importlib.import_module('detectHuman');

pathToPyfun = fileparts(which('detectHuman.py'));
if count(py.sys.path,pathToPyfun) == 0
insert(py.sys.path,int32(0),pathToPyfun);
end