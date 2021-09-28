classdef python_HumanDetector < matlab.System
    % Pre-computed constants
    properties(Access = private, Nontunable)
        hog
    end

    methods(Access = protected)
        function setupImpl(obj)
            % Perform one-time calculations, such as computing constants
            obj.hog = py.detectHuman.getHogObject();
        end

        function y = stepImpl(obj,u)
            % Calculate y as a function of input u and discrete states.
            out = py.detectHuman.detectHumanFromFrame(u, obj.hog);
            y = uint8(out);
        end

        function out = getOutputSizeImpl(obj)
            out = [300 400 3];
        end
        
        function y1 = getOutputDataTypeImpl(obj)
            y1 = 'uint8';
        end
        
        function y1 = isOutputComplexImpl(~)
            y1 = false;
        end
        
        function out = isOutputFixedSizeImpl(obj)
            out = true;
        end

    end
end
