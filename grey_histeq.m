function histeq_grey_image=grey_histeq(grey_image)
    index=histogram_generate(grey_image);
    [m,n]=size(grey_image);
    index=index/(m*n);
    % 求累计概率
    s=zeros(1,256);  
    for i=1:256  
         for j=1:i  
             s(i)=index(j)+s(i);                  
         end  
    end
    a=round(s*255);
    histeq_grey_image=grey_image;
    for i=0:255
        histeq_grey_image(grey_image==i)=a(i+1);                
    end
end