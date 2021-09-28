classdef videoReader < matlab.System
    % Pre-computed constants
    properties(Access = private, Nontunable)
        v
    end

    methods(Access = protected)
        function setupImpl(obj)
            % Perform one-time calculations, such as computing constants
            obj.v = VideoReader('livedata.mp4');
        end

        function y = stepImpl(obj)
            % Calculate y as a function of input u and discrete states.
            if hasFrame(obj.v)
                out = readFrame(obj.v);
            else
                out = zeros(480, 640, 3);
            end

            y = uint8(out);
        end

        function out = getOutputSizeImpl(obj)
            out = [480 640 3];
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