function dec = gray2dec(gray)
    bin = zeros(size(gray)); % 初始化二进制向量
    bin(1) = gray(1); % 二进制向量的第一位等于格雷码的第一位
    for ii = 2:length(gray)
        bin(ii) = xor(bin(ii-1),gray(ii)); % 根据格雷码的定义计算二进制向量
    end
    dec = bin2dec(num2str(bin)); % 将二进制向量转换为十进制数
end


