function filteredImage = frequencyFilter(I, filterType, cutoffFrequency, filterSize)
   % 将图像转换为频域
    I_freq = fft2(double(I));
    I_freq_shifted = fftshift(I_freq);
    
    % 创建滤波器
    if strcmp(filterType, 'ideal_lowpass')
        % 理想低通滤波器
        [a, b] = size(I_freq_shifted);
        a0 = round(a/2);
        b0 = round(b/2);
        h = zeros(a, b); % 初始化滤波器
        d = cutoffFrequency;
        for i = 1:a
            for j = 1:b
                distance = sqrt((i-a0)^2 + (j-b0)^2);
                if distance <= d
                    h(i, j) = 1;
                end
            end
        end
    elseif strcmp(filterType, 'gaussian_lowpass')
        % 高斯低通滤波器
        [M,N]=size(I);%获得图像的高度和宽度
        h=zeros(M,N);%滤波器函数
        %图像中心点
        M0=M/2;
        N0=N/2;
        %截至频率距离圆点的距离，delta表示高斯曲线的扩散程度
        D0=cutoffFrequency;
        delta=D0;
        for x=1:M
            for y=1:N
                %计算点（x,y）到中心点的距离
                d2=(x-M0)^2+(y-N0)^2;
                %计算高斯滤波器
                h(x,y)=exp(-d2/(2*delta^2));
            end
        end
    else
        error('Unsupported filter type.');
    end
    % 应用滤波器
    filteredImage_freq = I_freq_shifted .* h;    
    % 逆FFT以回到时域
    filteredImage_freq_restored = ifftshift(filteredImage_freq); % 移回原点
    filteredImage = ifft2(filteredImage_freq_restored); % 逆傅里叶变换
    % 转换回原始图像数据类型
    filteredImage = uint8(real(filteredImage));
end
