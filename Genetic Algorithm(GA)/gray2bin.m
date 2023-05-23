function bin = gray2bin(gray)
bin = zeros(size(gray)); % 初始化二进制向量
bin(1) = gray(1); % 二进制向量的第一位等于格雷码的第一位
for ii = 2:length(gray)
    bin(ii) = xor(bin(ii-1),gray(ii)); % 根据格雷码的定义计算二进制向量
end
end