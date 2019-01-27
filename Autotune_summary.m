close all; clc

Axis = data.Axis;

RLL = numel(Axis(Axis == 0));
PIT = RLL + numel(Axis(Axis == 1));
YAW = PIT +numel(Axis(Axis == 2));

roll_rate_P = data.RP(1:RLL,:);
roll_rate_D = data.RD(1:RLL,:);
roll_P = data.SP(1:RLL,:);
RLLprog = linspace(1,100,RLL);

figure
    plot(RLLprog, roll_rate_P, RLLprog, roll_rate_D, RLLprog, roll_P);
    title('Roll');
    xlabel('Tuning progress');
    ylabel('Value');
    legend('rate K_P', 'rate K_D', 'angle K_P');

pitch_rate_P = data.RP(RLL:PIT,:);
pitch_rate_D = data.RD(RLL:PIT,:);
pitch_P = data.SP(RLL:PIT,:);
PITprog = linspace(1,100,PIT-RLL+1);

figure
    plot(PITprog, pitch_rate_P, PITprog, pitch_rate_D, PITprog, pitch_P);
    plot(RLLprog, roll_rate_P, RLLprog, roll_rate_D, RLLprog, roll_P);
    title('Pitch');
    xlabel('Tuning progress');
    ylabel('Value');
    legend('rate K_P', 'rate K_D', 'angle K_P');

yaw_rate_P = data.RP(PIT:YAW,:);
yaw_rate_D = data.RD(PIT:YAW,:);
yaw_P = data.SP(YAW:YAW,:);
YAWprog = linspace(1,100,YAW-PIT+1);

figure
    plot(YAWprog, yaw_rate_P, YAWprog, yaw_rate_D, YAWprog, yaw_P);
    plot(RLLprog, roll_rate_P, RLLprog, roll_rate_D, RLLprog, roll_P);
    title('Yaw');
    xlabel('Tuning progress');
    ylabel('Value');
    legend('rate K_P', 'rate K_D', 'angle K_P');

%% Display final autotuned gains in console
disp('Autotuned gains are:');
disp(['ATC_RAT_RLL_P: ', mat2str(roll_rate_P(end))]);
disp(['ATC_RAT_RLL_D: ', mat2str(roll_rate_D(end))]);
disp(['ATC_ANG_RLL_P: ', mat2str(roll_P(end))]);
disp(['ATC_RAT_PIT_P: ', mat2str(pitch_rate_P(end))]);
disp(['ATC_RAT_PIT_D: ', mat2str(pitch_rate_D(end))]);
disp(['ATC_ANG_PIT_P: ', mat2str(pitch_P(end))]);
disp(['ATC_RAT_YAW_P: ', mat2str(yaw_rate_P(end))]);
disp(['ATC_RAT_YAW_D: ', mat2str(yaw_rate_D(end))]);
disp(['ATC_ANG_YAW_P: ', mat2str(yaw_P(end))]);