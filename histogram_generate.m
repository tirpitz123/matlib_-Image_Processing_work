function index=histogram_generate(grey_image)
    index=zeros(1,256);
    [m,n]=size(grey_image);
    for i=1:m  %统计灰度像素出现个数
        for j=1:n
            index(grey_image(i,j)+1)=index(grey_image(i,j)+1)+1;
        end
    end
end
