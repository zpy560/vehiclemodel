
% fileID = fopen('RADS.asc');
%% 四轮轮速脉冲
index_wspulse = find(RADS(:,3)=='124');
wspulsedata = RADS(index_wspulse,7:14);
Numpulse = length(wspulsedata(:,1));
frpulse = zeros(Numpulse,1);
flpulse = zeros(Numpulse,1);
rrpulse = zeros(Numpulse,1);
rlpulse = zeros(Numpulse,1);
for i = 1:Numpulse
   signal = wspulsedata(i,:);
   sc = join(signal);
   fr_hex = strcat(signal(1),extract(sc,4));
   fl_hex = strcat(extract(sc,5),signal(3));
   rr_hex = strcat(signal(4),extract(sc,13));
   rl_hex = strcat(extract(sc,14),signal(6));
   frpulse(i,1) = hex2dec(fr_hex);%designal(1) + extract(sc,4);
   flpulse(i,1) = hex2dec(fl_hex);
   rrpulse(i,1) = hex2dec(rr_hex);
   rlpulse(i,1) = hex2dec(rl_hex);
end
%% 前轮速
index_F_wsvalue = find(RADS(:,3)=='122');
Fwsvaluedata = RADS(index_F_wsvalue,7:14);
Numspeed = length(Fwsvaluedata(:,1));
FRspeed = zeros(Numspeed,1);
FLspeed = zeros(Numspeed,1);
for i = 1:Numspeed
   signal = Fwsvaluedata(i,:);
   sc = join(signal);
   FLspeed(i,1) = (hex2dec(strcat(signal(1),extract(sc,4)))) * 2 * 0.05625;
   FRspeed(i,1) = (hex2dec(strcat(signal(3),extract(sc,10)))) * 2 * 0.05625;
end

%% 后轮速
index_R_wsvalue = find(RADS(:,3)=='123');
Rwsvaluedata = RADS(index_R_wsvalue,7:14);
Numspeed = length(Rwsvaluedata(:,1));
RRspeed = zeros(Numspeed,1);
RLspeed = zeros(Numspeed,1);
for i = 1:Numspeed
   signal = Rwsvaluedata(i,:);
   sc = join(signal);
   RLspeed(i,1) = (hex2dec(strcat(signal(1),extract(sc,4)))) * 2 * 0.05625;
   RRspeed(i,1) = (hex2dec(strcat(signal(3),extract(sc,10)))) * 2 * 0.05625;
end
%% 方向盘角度 10ms
index_steerwheel = find(RADS(:,3)=='e0');
steerwsvaluedata = RADS(index_steerwheel,7:14);
Numsteer = length(steerwsvaluedata(:,1));
steerwheelangle = zeros(Numsteer,1);

for i = 1:Numsteer
   signal = steerwsvaluedata(i,:);
   sc = strcat(signal(1),signal(2));
   steerwheelangle(i,1) = hex2dec(sc)*0.1;
   if steerwheelangle(i,1) > 3276.7
       steerwheelangle(i,1) = steerwheelangle(i,1) - 6553.5;
   end
end

%% EMS 扭矩 10ms
index_enginetorq = find(RADS(:,3)=='82');
engintorqwsvaluedata = RADS(index_enginetorq,7:14);
NumengineT = length(engintorqwsvaluedata(:,1));
engintorq = zeros(NumengineT,1);

for i = 1:NumengineT
   signal = engintorqwsvaluedata(i,:);
   sc = strcat(signal(1),signal(2));
   engintorq(i,1) = (hex2dec(strcat(signal(1),extract(sc,4))))*0.5 - 1000;
end

%% APS 挡位 20ms
index_gear = find(RADS(:,3)=='190');
gearwsvaluedata = RADS(index_gear,7:14);
NumengineT = length(gearwsvaluedata(:,1));
gear = zeros(NumengineT,1);

for i = 1:NumengineT
   signal = gearwsvaluedata(i,:);
   sc = extract(signal(4),1);
   gear(i,1) = floor(hex2dec(sc)/2);
end
%% 车辆模型
Num = min([NumengineT,Numpulse,Numspeed,Numsteer]);
CurrCar = vehicleobj;CurrCar.X = 0;CurrCar.Y = 0;CurrCar.PHI = 0;
Curr_R = zeros(Num,1);
Curr_X = zeros(Num,1);
Curr_Y = zeros(Num,1);
Curr_PHI = zeros(Num,1);
fMiddleDis = zeros(Num,1);
leftorright = zeros(Num,1);
for i = 1:Num
    steer_i = 2*i - 1; % 处理调度周期不同
    [Curr_R(i),leftorright(i)] = GetTurnRadianFromSteerAngle(steerwheelangle(steer_i,1));
    fMiddleDis(i) = CalMoveDis(rrpulse,rlpulse,i);%根据轮速脉冲计算车辆移动量
    Curr_PHI(i) = FADS_CalBodyAngle(Curr_R(i),fMiddleDis(i),steerwheelangle(steer_i),CurrCar);
    [Curr_X(i),Curr_Y(i)] = FADS_CalCoordinateXY(fMiddleDis(i),Curr_PHI(i),CurrCar);
    CurrCar.PHI = Curr_PHI(i);CurrCar.X = Curr_X(i);CurrCar.Y = Curr_Y(i);
end

