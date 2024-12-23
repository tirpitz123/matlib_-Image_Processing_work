
clear

img = imread("OIP-C.jpg"); %读取输入图片的数据
A=grey_image_generate(img);

calculateLBP(A,1,8,1);
calculateHOG(img);