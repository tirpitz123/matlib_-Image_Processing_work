%双线性插值
function output_img=grey_expend(img,exbend_size)%倍数 
    [h,w] = size(img);
    scale_w = round(w*exbend_size); 
    scale_h = round(h*exbend_size);
    output_img = zeros(scale_h, scale_w);
    for i = 1 : scale_h         %缩放后的图像的（i,j）位置对应原图的（x,y）
        for j = 1 : scale_w
            x = i * h / scale_h;
            y = j * w / scale_w;
            u = x - floor(x);
            v = y - floor(y); 
        
            if x < 1           %边界处理
                x = 1;
            end
        
            if y < 1
                y = 1;
            end 
        %用原图的四个真实像素点来双线性插值
            output_img(i, j) = img(floor(x), floor(y)) * (1-u) * (1-v) + ...
                               img(floor(x), ceil(y)) * (1-u) * v + ...
                               img(ceil(x), floor(y)) * u * (1-v) + ...
                               img(ceil(x), ceil(y)) * u * v;
        end
    end
end



