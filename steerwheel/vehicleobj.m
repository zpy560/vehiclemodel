classdef vehicleobj % 车辆对象，车辆前进时坐标姿态计算
    properties
        X
        Y
        PHI 
        
    end
    methods
%         function [X,Y] = FADS_CalCoordinateXY(obj,fMiddleDis,fCarBodyAngle) 
%             fxchange = fMiddleDis * cos(fCarBodyAngle);
%             fychange = fMiddleDis * sin(fCarBodyAngle);
%             X = obj.X + fxchange;
%             Y = obj.Y + fychange;
%         end
        
%         function PHI = FADS_CalBodyAngle(obj,R,fMiddleDis,steerwheelangle)
%             anglechange = fMiddleDis/R;
%             if steerwheelangle > 0
%                 PHI = obj.PHI + anglechange;
%             elseif anglechange < 0
%                 PHI = obj.PHI - anglechange;
%             else
%                 
%             end
%         end
    end
end