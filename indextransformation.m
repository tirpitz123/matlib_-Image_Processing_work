function output_img=indextransformation(img,a,b)% 倍数 指数 
    output_img=uint8(b.^(double(img)*a)-1);
end