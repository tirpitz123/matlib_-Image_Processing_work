function a=targetExtractthetarget(back,target)
    i1=imread(back);
    i2=imread(target);
    A=i1;
    [rows , cols ,colors ] = size(A);%得到原来图像的矩阵的参数  
    Res = zeros(rows , cols ,colors);%创建一个空矩阵用来存储新的灰度图
    Res = uint8(Res);
    Res(:,:,1)=255-A(:,:,1);
    Res(:,:,2)=255-A(:,:,2);
    Res(:,:,3)=255-A(:,:,3); 
    B=i2;
    [rows , cols , colors] = size(B);%得到原来图像的矩阵的参数  
    Res1 = zeros(rows , cols);%创建一个空矩阵用来存储新的灰度图
    Res1 = uint8(Res1);
    Res1(:,:,1)=255-B(:,:,1);
    Res1(:,:,2)=255-B(:,:,2);
    Res1(:,:,3)=255-B(:,:,3);
    C=Res1-Res;
    figure,imshow(C);
    img=C;
    img = im2bw(img); %转换为灰度图
    img=imopen(img,strel('disk',5)); % 对图像开运算
    img=imclose(img,strel('disk',7)); % 对图像闭运算
    figure,imshow(img);
    b=img;
    [centers,radii] = imfindcircles(b,[6 90],'ObjectPolarity','bright','Sensitivity',0.90,'EdgeThreshold',0.82); %在图片中寻找圆形
    viscircles(centers,radii,'Color','r'); %绘制圆形
    a=length(radii); %显示圆形个数
    disp('圆形区域的个数是');
    disp(a); %输出结果
end
