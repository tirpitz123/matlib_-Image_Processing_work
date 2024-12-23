function equip_image=grey_histeq_equip(orgin,standard)
    %计算灰度直方图
    [m_o,n_o]=size(orgin); 
    orgin_hist=imhist(orgin)/(m_o*n_o);
    [m_s,n_s]=size(standard);
    standard_hist=imhist(standard)/(m_s*n_s);
    % 求累计频率
    startdard_value = cumsum(standard_hist);
    orgin_value = cumsum(orgin_hist);
    for i=1:256
        value{i}=startdard_value-orgin_value(i);
        value{i}=abs(value{i});
        [temp, index(i)]=min(value{i});
    end
    equip_image=orgin;
    for i=1:m_o
        for j=1:n_o
            equip_image(i,j)=index(orgin(i,j)+1)-1;
        end
    end
end