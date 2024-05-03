classdef detectHuman_detectHumanFromFrame < matlab.System
% Python def detectHumanFromFrame imported from python module detectHuman.py
methods(Access = protected)
function validateInputsImpl(obj, varargin)
if ~isempty(varargin{1})
    validateattributes(varargin{1}, {'uint8'}, {'size',[480 640 3]});
end
end
function setupImpl(obj)
    py.importlib.import_module('detectHuman');
end
function [image] = stepImpl(obj,image)
    image = uint8(py.detectHuman.detectHumanFromFrame(image));
end
function varargout = getOutputDataTypeImpl(obj)
    varargout{1} = 'uint8';
end
function varargout = getOutputSizeImpl(obj)
    varargout{1} = [300 400 3];
end
function varargout = isOutputComplexImpl(obj)
    varargout{1} = false;
end
function varargout = isOutputFixedSizeImpl(obj)
    varargout{1} = true;
end
end
methods(Static, Access = protected)
function simMode = getSimulateUsingImpl
    simMode = 'Interpreted execution';
end
end
end
