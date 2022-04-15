function [Radius,leftorright] = GetTurnRadianFromSteerAngle(steerangle)
FADS_TURN_RIGHT = 1;
FADS_WHEEL_ANGLE_FR500_CV_DATA = 15.04853148;
FADS_WHEEL_ANGLE_FR400_CV_DATA = 15.71455425;
FADS_WHEEL_ANGLE_FR300_CV_DATA = 15.98513173;
FADS_WHEEL_ANGLE_FR200_CV_DATA = 16.20666411;
FADS_WHEEL_ANGLE_FL200_CV_DATA = 16.02398355;
FADS_WHEEL_ANGLE_FL300_CV_DATA = 15.86705637;
FADS_WHEEL_ANGLE_FL400_CV_DATA = 15.58499066;
FADS_WHEEL_ANGLE_FL500_CV_DATA = 14.93878465;
FADS_ANGLE_CONVERT_PARAMETER = 57.29578;
FADS_FRONT_WHEEL_BACK_WHEEL_DISTANCE = 2.580; % mm单位转化为m
% steerangle = steerangle/FADS_ANGLE_CONVERT_PARAMETER;
if steerangle > 5
    leftorright = 0; % 左转
elseif steerangle <-5
    leftorright = 1; % 右转
else
    leftorright = 3; % 直行
end
steerangle = abs(steerangle);
if(FADS_TURN_RIGHT == leftorright)
    if(steerangle >= 500.0)
        LfTransRatio  = FADS_WHEEL_ANGLE_FR500_CV_DATA;
    elseif(steerangle >= 400.0)
        LfTransRatio  = steerangle - 400.0;
        LfTempdate = FADS_WHEEL_ANGLE_FR500_CV_DATA - FADS_WHEEL_ANGLE_FR400_CV_DATA;
        LfTransRatio = LfTransRatio/100.0;
        LfTransRatio = LfTransRatio*LfTempdate;
        LfTransRatio = LfTransRatio + FADS_WHEEL_ANGLE_FR400_CV_DATA;
    elseif(steerangle >= 300.0)
        LfTransRatio  = steerangle - 300.0;
        LfTempdate = FADS_WHEEL_ANGLE_FR400_CV_DATA - FADS_WHEEL_ANGLE_FR300_CV_DATA;
        LfTransRatio = LfTransRatio/100.0;
        LfTransRatio = LfTransRatio*LfTempdate;
        LfTransRatio = LfTransRatio + FADS_WHEEL_ANGLE_FR300_CV_DATA;
    elseif(steerangle >= 200.0)
        LfTransRatio  = steerangle - 200.0;
        LfTempdate = FADS_WHEEL_ANGLE_FR300_CV_DATA - FADS_WHEEL_ANGLE_FR200_CV_DATA;
        LfTransRatio = LfTransRatio/100.0;
        LfTransRatio = LfTransRatio*LfTempdate;
        LfTransRatio = LfTransRatio + FADS_WHEEL_ANGLE_FR200_CV_DATA;
    else
        LfTransRatio  = FADS_WHEEL_ANGLE_FR200_CV_DATA;
    end
else %左转时
    if(steerangle >= 500.0)
        LfTransRatio  = FADS_WHEEL_ANGLE_FL500_CV_DATA;
    elseif(steerangle >= 400.0)
        LfTransRatio  = steerangle - 400.0;
        LfTempdate = FADS_WHEEL_ANGLE_FL500_CV_DATA - FADS_WHEEL_ANGLE_FL400_CV_DATA;
        LfTransRatio = LfTransRatio/100.0;
        LfTransRatio = LfTransRatio*LfTempdate;
        LfTransRatio = LfTransRatio + FADS_WHEEL_ANGLE_FL400_CV_DATA;
    elseif(steerangle >= 300.0)
        LfTransRatio  = steerangle - 300.0;
        LfTempdate = FADS_WHEEL_ANGLE_FL400_CV_DATA - FADS_WHEEL_ANGLE_FL300_CV_DATA;
        LfTransRatio = LfTransRatio/100.0;
        LfTransRatio = LfTransRatio*LfTempdate;
        LfTransRatio = LfTransRatio + FADS_WHEEL_ANGLE_FL300_CV_DATA;
    elseif(steerangle >= 200.0)
        LfTransRatio  = steerangle - 200.0;
        LfTempdate = FADS_WHEEL_ANGLE_FL300_CV_DATA - FADS_WHEEL_ANGLE_FL200_CV_DATA;
        LfTransRatio = LfTransRatio/100.0;
        LfTransRatio = LfTransRatio*LfTempdate;
        LfTransRatio = LfTransRatio + FADS_WHEEL_ANGLE_FL200_CV_DATA;
    else
        LfTransRatio  = FADS_WHEEL_ANGLE_FL200_CV_DATA;
    end
end
Tempdate = steerangle/LfTransRatio/FADS_ANGLE_CONVERT_PARAMETER; % 角度转化为弧度
if Tempdate < 0.1
    Radius = 1e3;
else  
    Radius = FADS_FRONT_WHEEL_BACK_WHEEL_DISTANCE/tan(Tempdate); 
end
end