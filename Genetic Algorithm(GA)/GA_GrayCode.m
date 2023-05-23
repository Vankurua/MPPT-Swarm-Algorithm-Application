clc;
clear;

%用格雷码实现

N = 20; %种群大小为30
I = 11; %染色体长度

T = 100; %最大迭代次数为100;
PC = 0.8; %交配概率
PM = 0.1;% 变异概率

nC = round(N * PC/2)*2; %需要保证下一代也是偶数

Observe = zeros(N,1);

template.x = []; %template.x储存基因型, 即二进制编码
template.y = []; %template.y储存表现型，即该个体的适应度

Parent = repmat(template,N,1); %父代，现在Parent(i).x表示位置，Parent(i).y表示适应度

%初始化种群
for i = 1:N
    Parent(i).x = randi([0,1],1,I); %对父代进行初始化
    Parent(i).y = f(gray2dec(Parent(i).x)/100); %对Parent赋值适应度
end

for t = 1:T
    Offspring = repmat(template,nC/2,2); %子代 两两交叉只是换了一种数组的形式就是可以有两种表示方式
    %Offspring(2).x  Offspring(1,2).x
    
    for j = 1:nC/2
        %锦标赛选择法
        p1 = selectPop(Parent);
        p2 = selectPop(Parent);
        %交叉
        [Offspring(j,1).x, Offspring(j,2).x] = crossPop(p1.x,p2.x);
    end
    Offspring = Offspring(:);  %拉成一个一维的数组
    %变异
    for k=1:nC
        Offspring(k).x = mutatePop(Offspring(k).x, PM);
        %计算适应度值
        Offspring(k).y = f(gray2dec(Offspring(k).x)/100);
    end
    newPop = [Parent; Offspring]; %串联矩阵
    [~,so]=sort([newPop.y],'descend');%从大到小排序
    newPop = newPop(so); %再赋值
    Parent = newPop(1:N); %选出前N个
    
    disp(['迭代次数', num2str(t),'最大值：','x是', num2str(gray2dec(Parent(i).x)/100), ' y是 ',num2str(Parent(1).y)]);
end
function y = f(x)
    y = -power((x-10.32),2)+100.0002;
end

