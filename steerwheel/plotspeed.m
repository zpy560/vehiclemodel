%% speed figure;
% close all;
Num = length(FRspeed);
t = 0:1:Num-1;
t = t * 0.02;
figure();
plot(t,FRspeed,'LineWidth',1,'Color','r');hold on;
plot(t,FLspeed,'LineWidth',1,'Color','k');
plot(t,RRspeed,'LineWidth',1,'Color','b');
plot(t,RLspeed,'LineWidth',1,'Color','g');
legend('frspeed','fl','rr','rl');
%% pulse figure
% close all;
Num = length(frpulse);
t = 0:1:Num-1;
t = t * 0.02;
figure();
plot(t,frpulse,'LineWidth',1,'Color','r');hold on;
plot(t,flpulse,'LineWidth',1,'Color','k');
plot(t,rrpulse,'LineWidth',1,'Color','b');
plot(t,rlpulse,'LineWidth',1,'Color','g');
legend('frpulse','fl','rr','rl');
%% steer angle
Num = length(steerwheelangle);
t = 0:1:Num-1;
t = t * 0.01;
figure();
plot(t,steerwheelangle,'LineWidth',1,'Color','g');
legend('steerwheelangle');
%% phi
Num = length(Curr_PHI);
t = 0:1:Num-1;
t = t * 0.02;
figure();
plot(t,Curr_PHI,'LineWidth',2,'Color','r');
legend('phi');
%% Radium
Num = length(Curr_R);
t = 0:1:Num-1;
t = t * 0.02;
figure();
plot(t,Curr_R,'LineWidth',2,'Color','r');
legend('CurrR');
%% leftorright
Num = length(leftorright);
t = 0:1:Num-1;
t = t * 0.02;
figure();
plot(t,leftorright,'LineWidth',2,'Color','r');
legend('leftorright');
%% 画轨迹点X,Y;
% Num = min([NumengineT,Numpulse,Numspeed,Numsteer]);
% t = 0:1:Num-1;
% t = t * 0.02;
% plot(t',Curr_X,'LineWidth',1,'Color','g');
% plot(t',Curr_Y,'LineWidth',1,'Color','b');
% plot(t',fMiddleDis,'LineWidth',1,'Color','k');
% scatter(Curr_X,Curr_Y);
%figure(2);hold on;
% hold on;
figure();plot(Curr_X,Curr_Y,'LineWidth',2,'Color','b');
% axis([-160 20 -20 20]);
xlabel('X(m)');ylabel('Y(m)');
% scatter(Curr_X,Curr_Y,'LineWidth',2,'Color','r');
%% 轨迹点 orgin
load vehicletrack_s1.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','r');clear ;hold on;
load vehicletrack_s2.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','b');clear ;
load vehicletrack_s3.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','k');clear ;
load vehiclestraight1.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','m');clear ;
load vehiclestraight2.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','g');clear ;
load RADStraight.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','c');clear ;
legend('track-s1','track-s2','track-s3','straight1','straight2','RADStraight');
%% 轨迹点 right1circle
figure();
load right1circle_coff16.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','r');clear ;hold on;
load right1circle_coff15.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','b');clear ;
load right1circle_coff14.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','k');clear ;
load right1circle_coff13.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','m');clear ;
load right1circle_coff12.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','g');clear ;
legend('coff16','coff15','coff14','coff13','coff12');
%% 轨迹点 opt
load vehicletrack_s1opt.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','r');clear ;hold on;
load vehicletrack_s2opt.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','b');clear ;
load vehicletrack_s3opt.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','k');clear ;
load vehiclestraight1_opt.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','m');clear ;
load vehiclestraight2_opt.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','g');clear ;
load RADStraight.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','c');clear ;
legend('track-s1','track-s2','track-s3','straight1','straight2','RADStraight');
%% 画轨迹对比 s1
load vehicletrack_s1.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','r');clear ;hold on;
load vehicletrack_s1opt.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','b');clear;
legend('s1','s1opt');%close all;
%% 画轨迹对比 s2
load vehicletrack_s2.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','k');clear ;hold on;
load vehicletrack_s2opt.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','m');clear;
legend('s1','s1opt');%close all;
%% 画轨迹对比 s3
load vehicletrack_s3.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','g');clear ;hold on;
load vehicletrack_s3opt.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','c');clear;%close all;
legend('s3','s3opt');
%% 画轨迹对比 vehiclestraight1
load vehiclestraight1.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','g');clear ;hold on;
load vehiclestraight1_opt.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','c');clear;
legend('vehiclestraight1','opt');%close all;
%% 画轨迹对比 vehiclestraight2
load vehiclestraight2.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','g');clear ;hold on;
load vehiclestraight2_opt.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','c');clear;
legend('vehiclestraight2','opt');%close all;
%% 画轨迹对比 RADStraight
load RADStraight.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','g');clear ;hold on;
load RADStraight_opt.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','c');clear;
legend('RADStraight','opt');%close all;
%% 画轨迹对比 first1
figure();
% load first1opt_data.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','r');
clear;hold on;
% load second.mat;
load first_100R.mat;
% figure();
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','g');
load first_1000R.mat;
plot(Curr_X,Curr_Y,'LineWidth',2,'Color','k');
legend('opt','opt-100','opt-1000');%close all;
% legend('opt','first1');
% legend('opt','second');
%% 画轨迹对比 first1 steerwheelangle
figure();
load first1opt_data.mat;
Num = length(Curr_PHI);
t = 0:1:Num-1;
t = t * 0.02;
plot(t,Curr_PHI,'LineWidth',2,'Color','r');clear;hold on;
load first1_data.mat;
Num = length(Curr_PHI);
t = 0:1:Num-1;
t = t * 0.02;
figure();
plot(t,Curr_PHI,'LineWidth',2,'Color','g');
legend('opt','first1');%close all;
% plot(t,wheelangle*180/3.1415926,t,steerwheelangle(1:2:end-37),'LineWidth',2);
% legend('opt','first1');
%% 画轨迹对比 first1 steerwheelangle
figure();
load first1opt_data.mat;
Num = length(Curr_R);
t = 0:1:Num-1;
t = t * 0.02;
plot(t,Curr_R,'LineWidth',2,'Color','r');clear;hold on;
load first1_data.mat;
Num = length(Curr_R);
t = 0:1:Num-1;
t = t * 0.02;
plot(t,Curr_R,'LineWidth',2,'Color','g');
legend('opt','first1');
%% test turn  R 转弯半径
Num = length(FRspeed);
t = 0:1:Num-1;
t = t * 0.02;
tanv = zeros(Num,1);
for i = 1:Num 
    if FRspeed(i) > RRspeed(i)
        tanv(i) = acos(RRspeed(i)/FRspeed(i));
    end
end
figure();
plot(t,steerwheelangle(1:2:end-37)/180*3.1415926,'LineWidth',2);hold on;
scatter(t,tanv);%,'LineWidth',2,'Color','r');

%% delta_phi
[v,k] = find(wheelangle);
opt = wheelangle(v);
plot(v,opt,'Color','g');hold on;
cmp = diff(steerwheelangle(1:2:end-35)/180*3.1415926)/0.04;
plot(cmp,'Color','r');
%% Radius Turn
[v,k] = find(Curr_R<600);
opt = Curr_R(v);
figure();
plot(v,opt,'Color','g');grid on;hold on;
load first1_data.mat;
[v,k] = find(Curr_R<600);
opt = Curr_R(v);
plot(v,opt,'Color','r');
% plot(Curr_R,'Color','r');
%%
figure();scatter(1:length(FLspeed),FLspeed-RLspeed);