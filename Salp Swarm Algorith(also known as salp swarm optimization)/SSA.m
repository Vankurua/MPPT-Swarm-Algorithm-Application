N=20; %10个樽海鞘群数量
Xmax = 50; %定义上边界
Xmin = 0; %定义下边界

T = 30; %T 设最大迭代次数为50;
t=1; %t为当前的迭代次数
%其实也是有很大可能被限制在局部最优解的
P = rand(N,1)*(Xmax-Xmin)+Xmin; %初始化种群P 储存的是位置信息X
P_sorted = zeros(N,1);
Fitness = zeros(N,1); %F为储存适应度的数组
Convergence_curve = zeros(1,T); %输出曲线
Curve = zeros(N*T,1);
for i = 1:N
    Fitness(i) = f_Multiple_Peak(P(i)); %计算适应度
    
end

[sorted_Fitness,sorted_P] = sort(Fitness,'DESCEND'); %对该序列进行降序排序 即第一个为头

for index = 1:N
    P_sorted(index) = P(sorted_P(index)); %排序
end
%领导者Fj, aka 食物的位置
FoodPosition = P_sorted(1); %这个是位置
FoodFitness = sorted_Fitness(1); %这个是领导者的适应度

l=1;
for t=2:T+1
    c1 = 2*exp(-(4*t/T)^2); %c1表示在开发和探索之间的平衡的值
  
    for i=1:N
        if i == 1
            c2 = rand();
            c3 = rand();
            if c3<0.5
                P(i)=FoodPosition+c1*((Xmax-Xmin)*c2+Xmin);
            else
                P(i)=FoodPosition-c1*((Xmax-Xmin)*c2+Xmin);
            end        
        else
            point1 = P(i-1);
            point2 = P(i);
            
            P(i) = (point1+point2)/2;
        end
    end
    
    %边界判断
    for i=1:N
        Tp = P(i)>Xmax; 
        Tm = P(i)<Xmin; 
        P(i) = ( P(i) * (~(Tp+Tm)) )+Xmax*Tp+Xmin*Tm;
        
        Fitness(i) = f_Multiple_Peak(P(i));
        
        if Fitness(i)>FoodFitness
            FoodPosition=P(i);
            FoodFitness=Fitness(i);
        end
    end
    Convergence_curve(l)=FoodFitness;
    l=l+1;
end

plot(Convergence_curve);

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


