%Gray(i,j)=0.299∗R(i,j)+0.578∗G(i,j)+0.114∗B(i,j)
%由于人眼对绿色的敏感最高，对蓝色敏感最低
function grey_image=grey_image_generate(picture) 
    imR=im2double(picture(:,:,1));
    imG=im2double(picture(:,:,2));
    imB=im2double(picture(:,:,3));
    grey=round((0.587*imR+0.299*imG+0.114*imB)*255);
    grey_image=picture(:,:,1);
    grey_image(:,:,1)=grey;
    %grey_image(:,:,2)=grey;
    %grey_image(:,:,3)=grey;
end