function fMiddleDis = CalMoveDis(rrpulse,rlpulse,i)
% FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RR = 0.04450964;
% FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RL = 0.04447892;
% FADS_ONE_WHEEL_PULSE_DISTANCE_AT_FL = 0.0481054;
% FADS_ONE_WHEEL_PULSE_DISTANCE_AT_FR = 0.0481975;
FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RR = 0.0484670;
FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RL = 0.0484094; % mm 换算成 m
delta = 10;
if i < delta +1
    fMiddleDis = 0;
else
%     temp1 = flpulse(i) - flpulse(i-delta);
%     temp2 = frpulse(i) - frpulse(i-delta);
    temp3 = rlpulse(i) - rlpulse(i-delta);
    temp4 = rrpulse(i) - rrpulse(i-delta);
%     if temp1 < 0
%         temp1 = (temp1 + 4095)*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_FL;
%     else
%         temp1 = temp1*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_FL;
%     end
%     if temp2 < 0
%         temp2 = (temp2 + 4095)*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_FR;
%     else
%         temp2 = temp2*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_FR;
%     end
    if temp3 < 0
        temp3 = (temp3 + 4096)*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RL/delta;
    else
        temp3 = temp3*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RL/delta;
    end
    if temp4 < 0
        temp4 = (temp4 + 4096)*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RR/delta;
    else
        temp4 = temp4*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RR/delta;
    end
%     temp1 = (flpulse(i) - flpulse(i-1))*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RR + (rlpulse(i) - rlpulse(i-1))*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RL;
%     temp2 = (frpulse(i) - frpulse(i-1))*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RR + (rrpulse(i) - rrpulse(i-1))*FADS_ONE_WHEEL_PULSE_DISTANCE_AT_RL;
%     temp5 = temp1 + temp3;
%     temp6 = temp2 + temp4;
    RR = temp4; 
    RL = temp3;
    fMiddleDis = (RR+RL)/2;
end
end