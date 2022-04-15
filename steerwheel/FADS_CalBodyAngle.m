function fCarBodyAngle = FADS_CalBodyAngle(R,fMiddleDis,steerwheelangle,CurrCar)
anglechange = fMiddleDis/R;
% if gear == 4 % 前进
if steerwheelangle > 5
    fCarBodyAngle = CurrCar.PHI + anglechange;
    if fCarBodyAngle > 2*pi
        fCarBodyAngle = fCarBodyAngle - 2*pi;
    end
elseif steerwheelangle < -5
    fCarBodyAngle = CurrCar.PHI - anglechange;
    if fCarBodyAngle > 2*pi
        fCarBodyAngle = fCarBodyAngle - 2*pi;
    end
else
    fCarBodyAngle = CurrCar.PHI;
    if fCarBodyAngle > 2*pi
        fCarBodyAngle = fCarBodyAngle - 2*pi;
    end
end
% elseif gear ==2 % 后退
%     if steerwheelangle > 0
%         fCarBodyAngle = CurrCar.PHI - anglechange;
%     elseif steerwheelangle < 0
%         fCarBodyAngle = CurrCar.PHI + anglechange;
%     else
%         fCarBodyAngle = CurrCar.PHI;
%     end
% else
%     fCarBodyAngle = CurrCar.PHI;
% end
end