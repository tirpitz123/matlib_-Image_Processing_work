%B=grey_revolve(A,45 / 180 * pi);
function output_img=grey_revolve(img,theta)%倍数 
   R = [cos(theta), -sin(theta); sin(theta), cos(theta)]';
   sizeA = size(img);
   length = sizeA(1);
   width = sizeA(2);
   center1 = [length; width] / 2;
   %图像大小计算
   length2 = floor(width*sin(theta)+length*cos(theta))+1;
   width2 = floor(width*cos(theta)+length*sin(theta))+1;
   center2 = [length2; width2] / 2;
   output_img = uint8(ones(length2, width2)*255);%数字决定背景色
    for i = 1:length2
        for j = 1:width2
            p = [i; j];
            pp = (R*(p-center2)+center1);
            mn = floor(pp);
            ab = pp - mn;
            a = ab(1);
            b = ab(2);
            m = mn(1);
            n = mn(2);
            if (pp(1) >= 2 && pp(1) <= length-1 && pp(2) >= 2 && pp(2) <= width-1)
                output_img(i, j) = (1-a)*(1-b)*img(m, n) + a*(1-b)*img(m+1, n)...
                    +(1-a)*b*img(m, n)+a*b*img(m, n);
            end
        end
    end
end