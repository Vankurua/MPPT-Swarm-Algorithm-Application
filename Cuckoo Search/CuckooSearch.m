N=20; %粒子/巢个数
%没有迭代次数这个概念
Xmax = 50;
Xmin = 0;

x = rand(N,1)*(Xmax-Xmin)+Xmin; %随机生成粒子位置
x_Fitness = zeros(N,1);
x_best = 0; %当前最好的巢
x_worst = 0; %当前最差的巢


T = 30; %最大迭代次数

for t = 1:T
    for i = 1:N
        x_Fitness(i) = f_Multiple_Peak(x(i));
    end
    if(rand()>0.25) %有 75%的概率对最差的点进行LevyFlight
        [m,i] = max(x_Fitness); %m为最大值，i为下标
        x_best = x(i);          
        [m,i] = min(x_Fitness);
        x_worst = x(i);
        x(i) = levyflight(x_best,x(i)); %对最差的点进行Levy flight飞行
        x_Fitness(i) = f_Multiple_Peak(x(i));
    end
        
    [m,i] = max(x_Fitness);
    x_best = x(i);
    %disp(['迭代次数是：',num2str(t),'最优解是：',num2str(x_best)]);
    for q = 1:N
        x(q) = levyflight(x_best,x(q));
    end
end

function dfinal=levyflight(dbest,d)
beta=3/2;
kcoeff=0.8;
sigmau=(gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
sigmav=1;
u=normrnd(0,(sigmau)^2);
v=normrnd(0,(sigmav)^2);
dup=d+(kcoeff*(abs(u)/((abs(v))^(1/beta)))*(dbest-d));


if(dup>50)
    dfinal=50;
elseif(dup<0)
    dfinal=0;
else
    dfinal=dup;
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