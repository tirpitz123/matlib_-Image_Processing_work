
clear

img = imread("OIP-C.jpg"); %读取输入图片的数据
A=grey_image_generate(img);

B=addNoiseToImage(A,'gaussian',[0, 0.01]);
A=B;
B=applySpatialFilter(B,'mean',3);

figure;
imshow(A);
title('原图像')
figure;
imshow(B);
title('图像旋转（扩大背景）')


