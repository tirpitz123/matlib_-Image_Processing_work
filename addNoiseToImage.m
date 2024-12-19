function noisyImage = addNoiseToImage(image, noiseType, noiseParams) 
    % 初始化噪声图像
    grayImage = image;
    noisyImage = grayImage;
    % 根据噪声类型添加相应的噪声
    switch noiseType
        case 'salt & pepper'
            % 添加椒盐噪声
            noiseRatio = noiseParams(1);
            noisyImage = imnoise(grayImage, 'salt & pepper', noiseRatio);
        case 'gaussian'
            % 添加高斯噪声
            meanValue = noiseParams(1); % 噪声均值
            varianceValue = noiseParams(2); % 噪声方差
            noisyImage = imnoise(grayImage, 'gaussian', meanValue, varianceValue);
        case 'speckle'
            % 添加斑点噪声
            % 斑点噪声模型通常表示为: I_speckle = I * (1 + 0.5 * (rand - 0.5))
            varianceValue = noiseParams(1); % 斑点噪声的方差
            noisyImage = grayImage .* (1 + sqrt(varianceValue) * (randn(size(grayImage)) - 0.5));
        case 'poisson'
            % 添加泊松噪声
            lambda = noiseParams(1); % 平均亮度
            noisyImage = poissonNoise(grayImage, lambda);
        otherwise
            error('Unsupported noise type.');
    end
end

% 泊松噪声的辅助函数
function noisyImage = poissonNoise(image, lambda)
    % 根据图像的亮度生成泊松分布的随机变量
    noisyImage = poissrnd(lambda * image);
end
