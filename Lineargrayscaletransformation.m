function output_img=Lineargrayscaletransformation(img,k)%斜率
    output_img=img*tan(k/180*pi);
end