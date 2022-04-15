function [X,Y] = FADS_CalCoordinateXY(fMiddleDis,fCarBodyAngle,CurrCar) % 车辆前进时坐标计算
% if gear == 4 % 前进
    fxchange = fMiddleDis * cos(fCarBodyAngle);
    fychange = fMiddleDis * sin(fCarBodyAngle);
    X = CurrCar.X + fxchange;
    Y = CurrCar.Y + fychange;
% elseif gear ==2 % 后退
%     fxchange = fMiddleDis * cos(fCarBodyAngle);
%     fychange = fMiddleDis * sin(fCarBodyAngle);
%     X = CurrCar.X - fxchange;
%     Y = CurrCar.Y - fychange;
% else % 其它
%     X = CurrCar.X;
%     Y = CurrCar.Y;
% end
end