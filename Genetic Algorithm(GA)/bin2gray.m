function gray = bin2gray(bin)
n = length(bin); 
gray = zeros(1, n);
gray(1) = bin(1); % 格雷码向量的第一位与二进制向量相同
for ii = 2:n
    gray(ii) = xor(bin(ii-1), bin(ii)); % 根据格雷码定义计算
end
end