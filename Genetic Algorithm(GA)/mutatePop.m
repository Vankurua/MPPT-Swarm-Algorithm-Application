function p = mutatePop(x,mu)
%单点变异
    if rand <= mu
        n = numel(x);
        s = randi([1,n]);%变异点在这个位置
        if x(s) == 0
            x(s) = 1;
        elseif x(s) == 1
            x(s) =0;
        end
    end
     p=x;
end