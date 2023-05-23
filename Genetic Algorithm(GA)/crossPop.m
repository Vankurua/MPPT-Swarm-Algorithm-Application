function [y1,y2] = crossPop(x1,x2)
    %单点交叉
    n = numel(x1);
    s = randi([1,n-1]); %交换点的位置
    %交叉操作
    y1 = [x1(1:s) x2(s+1:end)]; %y1 = x1(1-s)拼接上x2的(s+1-end)
    y2 = [x2(1:s) x1(s+1:end)]; %y2 = x2(1-s)拼接上x1的(s+1-end)
end