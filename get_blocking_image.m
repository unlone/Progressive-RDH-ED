function [Img_blocking, Key] = get_blocking_image(img_name)
    RGB = imread(img_name);
    Img_gray = rgb2gray(RGB);
    [L,W] = size(Img_gray);
    
    % generate the key matrix for img blocking
    Key = randi([0,255], L, W);
    
    % XOR encipher
    Img_blocking = bitxor(uint8(Img_gray), uint8(Key));
    
    % pixel value revise
    
    for i=1:L
        for j=1:W
             if Img_blocking(i,j) > 250
                 Img_blocking(i,j) = 250;
             end
         end
    end
    
end 