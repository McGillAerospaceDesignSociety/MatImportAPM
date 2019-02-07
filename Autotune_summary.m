close all; clc

Axis = data.ATUN.Axis;

RLL = numel(Axis(Axis == 0));
PIT = RLL + numel(Axis(Axis == 1));
YAW = PIT +numel(Axis(Axis == 2));

roll_rate_P = data.ATUN.RP(1:RLL,:);
roll_rate_D = data.ATUN.RD(1:RLL,:);
roll_P = data.ATUN.SP(1:RLL,:);
RLLprog = linspace(1,100,RLL);

figure
    plot(RLLprog, roll_rate_P, RLLprog, roll_rate_D);
    hold on
    yyaxis right
    plot(RLLprog, roll_P);
    hold off
    title('Roll');
    xlabel('Tuning progress');
    ylabel('Value');
    legend('rate K_P', 'rate K_D', 'angle K_P');

pitch_rate_P = data.ATUN.RP(RLL:PIT,:);
pitch_rate_D = data.ATUN.RD(RLL:PIT,:);
pitch_P = data.ATUN.SP(RLL:PIT,:);
PITprog = linspace(1,100,PIT-RLL+1);

figure
    plot(PITprog, pitch_rate_P, PITprog, pitch_rate_D);
    hold on
    yyaxis right
    plot(PITprog, pitch_P);
    hold off
    title('Pitch');
    xlabel('Tuning progress');
    ylabel('Value');
    legend('rate K_P', 'rate K_D', 'angle K_P');

yaw_rate_P = data.ATUN.RP(PIT:YAW,:);
yaw_rate_D = data.ATUN.RD(PIT:YAW,:);
yaw_P = data.ATUN.SP(PIT:YAW,:);
YAWprog = linspace(1,100,YAW-PIT+1);

figure
    plot(YAWprog, yaw_rate_P, YAWprog, yaw_rate_D);
    hold on
    yyaxis right
    plot(YAWprog, yaw_P);
    hold off
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