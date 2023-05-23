clc;
clear;

N = 20; %种群大小为30 | group size
I = 11; %染色体长度 | size of string

T = 100; %最大迭代次数为100; | maximum Iteration times
PC = 0.8; %交配概率 | cross possibilities
PM = 0.1;% 变异概率 | mutate possibilities

nC = round(N * PC/2)*2; %需要保证下一代也是偶数 | the next generation of the iteration must be even so round.

Observe = ones(N,100); %储存每次变异的信息

template.x = []; %template.x储存基因型, 即二进制编码
template.y = []; %template.y储存表现型，即该个体的适应度

Parent = repmat(template,N,1); %父代，现在Parent(i).x表示位置，Parent(i).y表示适应度

%初始化种群
for i = 1:N
    Parent(i).x = randi([0,1],1,I); %对父代进行初始化
    Parent(i).y = f(bin2dec(num2str(Parent(i).x))/100); %对Parent赋值适应度
end

for t = 1:T
    Offspring = repmat(template,nC/2,2); %子代 换成了2列的形式，方便交叉
    
    for j = 1:nC/2
        p1 = selectPop(Parent);
        p2 = selectPop(Parent);
        [Offspring(j,1).x, Offspring(j,2).x] = crossPop(p1.x,p2.x); %交叉
    end
    Offspring = Offspring(:);
    
    %变异
    for k=1:nC
        Offspring(k).x = mutatePop(Offspring(k).x, PM);
        Offspring(k).y = f(bin2dec(num2str(Offspring(k).x))/100); %计算适应度值
    end
    
    newPop = [Parent; Offspring]; %串联矩阵
    [~,so]=sort([newPop.y],'descend');%从大到小排序 基于适应度
    newPop = newPop(so); %排序
    Parent = newPop(1:N); %锦标赛选择法，选出原来种群的个数
    
    temp = zeros(N,1);
    for z=1:N
        temp(z) = bin2dec(num2str(Parent(z).x))/100;
    end
    Observe(:,t) = temp;
    
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
function y = f(x)
    y = -power((x-10.32),2)+100.0002;
end
