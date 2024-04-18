function plot_comparison_pre(Img_gray, Img_blocking, Key)
    Img_reconst = bitxor(uint8(Img_blocking),uint8(Key));
    subplot(1,3,1),imshow(Img_gray), title('raw');
    subplot(1,3,2),imshow(Img_blocking), title('blocking');
    subplot(1,3,3),imshow(Img_reconst), title('recover');
end