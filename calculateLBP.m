function [lbp_hist] = calculateLBP(image, radius, neighbors,state)%可以为1   8
    % 将图像转换为灰度图
    grayImage = image;
    
    % 获取图像的高度和宽度
    [m, n] = size(grayImage);
    
    % 创建一个与输入图像大小相同的零矩阵，用于存储LBP特征
    lbpImage = zeros(m, n);
    
    % 遍历图像中的每个像素
    for i = 1:m
        for j = 1:n
            % 获取当前像素的灰度值
            center = grayImage(i, j);
            
            % 初始化LBP值
            lbp = 0;
            
            % 计算每个邻域的LBP值
            for k = 1:neighbors
                % 计算邻域像素的坐标
                x = round(i + radius * cos(2 * pi * (k - 1) / neighbors));
                y = round(j - radius * sin(2 * pi * (k - 1) / neighbors));
                
                % 检查坐标是否在图像边界内
                if x >= 1 && x <= m && y >= 1 && y <= n
                    neighbor = grayImage(x, y);
                    if neighbor > center
                        lbp = lbp + 2^(k - 1);
                    end
                end
            end
            
            % 将LBP值存储在LBP图像矩阵中
            lbpImage(i, j) = lbp;
        end
    end
    
    % 计算LBP特征的直方图
    lbp_hist = histcounts(lbpImage(:), 2^neighbors - 1); 
    % 归一化直方图
    lbp_hist = lbp_hist / numel(image);
    if state==1
        bar(lbp_hist);
        title('LBP Histogram');
        xlabel('LBP Value');
        ylabel('Frequency');
    end
end