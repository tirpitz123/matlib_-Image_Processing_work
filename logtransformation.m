function output_img=logtransformation(img,a,b)%底数 倍数 2 25
    output_img=uint8((log(double(img)+1)/log(a))*b);
end