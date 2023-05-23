clear;
clc;
close all;

N = 20; %粒子个数
T = 30; %最大迭代次数

c1 = 2; %c1 是自身对自身的学习因子
c2 = 2; %c2 是自身对全局的学习因子

Wmax = 0.8; %惯性权重最大值
Wmin = 0.4; %惯性权重最小值

Xmax = 50; %位置最大值
Xmin = 0; %位置最小值

Vmax = 0.6*((Xmax-Xmin)/2); %速度最大值
Vmin = -1*Vmax; %速度最小值
adCurve = zeros(N*T,1);
x= rand(N,1)*(Xmax-Xmin)+Xmin; %粒子位置信息
x_v = rand(N,1)*(Vmax-Vmin)+Vmin; %粒子速度信息

x_Best_Position = zeros(N,1); %保存那个粒子历史最优解位置
%可以再写个保存适应度，但是没必要，调用下f(x)就能得出


global_Position = 0; %记录全局最优解位置
global_Fitness = 0; %记录全局最优适应度

for i = 1:T
    for j = 1:N %去循环每个粒子
        %更新粒子
        if(f_Multiple_Peak(x(j))>f_Multiple_Peak(x_Best_Position(j)))
            x_Best_Position(j) = x(j); %更新粒子历史最优解
        end
        if(f_Multiple_Peak(x_Best_Position(j))>f_Multiple_Peak(global_Position))
            global_Position = x_Best_Position(j);
        end
        w = Wmax-(Wmax-Wmin)*i/T; %计算动态惯性权重
        %更新该粒子的速度和位置
        x_v(j) = w*x_v(j)+c1*rand*(x_Best_Position(j)-x(j))+c2*rand*(global_Position-x(j));
        x(j) = x(j)+x_v(j);
        %如果超出范围就重置个体
        if (x_v(j) > Vmax) | (x_v(j) < Vmin)
            x_v(j) = rand * (Vmax-Vmin)+Vmin;
        end
        if (x(j) > Xmax) | (x(j) < Xmin)
            x(j) = rand * (Xmax-Xmin)+Xmin;
        end
    end
end

function y = f_Multiple_Peak(x)
if x>0 & x<=14.5
    y=-power((x-10.01),2)+150;
elseif x>14.5 & x<=24.5
    y=-power((x-20.02),2)+160;
elseif x>24.5 & x<=35.8           
    y =-power((x-30.03),2)+170;
else
    y =-power((x-40.04),2)+155;
end
end
