%空域处理
function noisyImage = applySpatialFilter(image, filterType, filterSize)
    % 初始化输出图像
    noisyImage = [];
    % 尝试执行图像滤波操作
    try
        grayImage = image;
        % 根据filterType创建相应的滤波器
        switch filterType
            case 'mean'
                filter = ones(filterSize) / filterSize^2;
            case 'gaussian'
                % 高斯滤波器标准差σ，可以根据需要调整
                sigma = 1;
                filter = fspecial('gaussian', [filterSize, filterSize], sigma);
            otherwise
                error('Unsupported filter type.');
        end
        % 使用imfilter函数进行空域滤波
        % 'replicate' 选项用于处理边界像素
        noisyImage = imfilter(grayImage, filter, 'replicate');
        
    catch ME
        % 如果发生错误，显示错误信息
        fprintf('An error occurred while processing the image:\n');
        fprintf('Error message: %s\n', ME.message);
    end
end
