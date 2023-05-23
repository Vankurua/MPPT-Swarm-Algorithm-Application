function gray = dec2gray(dec)
bin = de2bi(dec, 'left-msb'); % 将十进制数转换为二进制向量，左边为最高位
n = length(bin); % 二进制向量长度
gray = zeros(1, n); % 初始化格雷码向量
gray(1) = bin(1); % 格雷码向量的第一位与二进制向量相同
for ii = 2:n
    gray(ii) = xor(bin(ii-1), bin(ii)); % 根据二进制向量的定义计算格雷码向量
end
end
