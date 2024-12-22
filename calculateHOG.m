 function features = calculateHOG(image)%可以为1   8
   I_gray = image;
    % 计算水平和垂直梯度
    Gx = imfilter(double(I_gray), [-1 0 1], 'replicate');
    Gy = imfilter(double(I_gray), [-1; 0; 1], 'replicate');
    % 计算梯度的合成幅度和方向
    Mag = sqrt(Gx.^2 + Gy.^2);
    Theta = atan2(Gy, Gx);

    % 设置直方图的bin数
    numBins = 9; 
    % 初始化直方图
    h = zeros(1, numBins);
    for pixelIdx = 1:numel(Mag)
        binIndex = floor((Theta(pixelIdx) + pi) / (2*pi) * numBins) + 1;
        % 确保binIndex在正确的范围内
        if binIndex > numBins
            binIndex = numBins;
        elseif binIndex < 1
            binIndex = 1;
        end
        h(binIndex) = h(binIndex) + Mag(pixelIdx);
    end
    h=h/10000;
    % 归一化直方图
     features=h/sum(h);
end


