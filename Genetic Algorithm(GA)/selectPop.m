function p = selectPop(Parent) 
    %锦标赛选择法
    n = numel(Parent); 
    index = randperm(n); %index包含了1-30 并且是不重复的序列,其实就相当于生成了1-30的随机序列
    p1 = Parent(index(1)); %只选出其中的两个个体进行比较
    p2 = Parent(index(2));
    if p1.y >= p2.y %选择适应度较大的那个
        p=p1;
    else
        p=p2;
    end
        
end