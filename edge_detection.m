function J = edge_detection(I, method)
    I=double(I);
    % 根据选择的方法进行边缘检测
    switch lower(method)
        case 'roberts'
            J = roberts_edge(I);
        case 'prewitt'
            J = prewitt_edge(I);
        case 'sobel'
            J = sobel_edge(I);
        case 'laplacian'
            J = laplacian_edge(I);
        otherwise
            error('Unsupported method. Use "roberts", "prewitt", "sobel", or "laplacian".');
    end
    J=uint8(J);
end

function J = roberts_edge(I)
    Gx = [-1 0; 0 1];
    Gy = [0 -1; 1 0];
    Ix = custom_filter2(Gx, I);
    Iy = custom_filter2(Gy, I);
    J = sqrt(Ix.^2 + Iy.^2);
end

function J = prewitt_edge(I)
    Gx = [-1 -1 -1; 0 0 0; 1 1 1];
    Gy = [-1 0 1; -1 0 1; -1 0 1];
    Ix = custom_filter2(Gx, I);
    Iy = custom_filter2(Gy, I);
    J = sqrt(Ix.^2 + Iy.^2);
end

function J = sobel_edge(I)
    Gx = [-1 -2 -1; 0 0 0; 1 2 1];
    Gy = [-1 0 1; -2 0 2; -1 0 1];
    Ix = custom_filter2(Gx, I);
    Iy = custom_filter2(Gy, I);
    J = sqrt(Ix.^2 + Iy.^2);
end

function J = laplacian_edge(I)
    G = [0 -1 0; -1 4 -1; 0 -1 0];
    J = custom_filter2(G, I);
end

function J = custom_filter2(H, I)
    J = filter2(H, I);
end
