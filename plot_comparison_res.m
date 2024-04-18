function plot_comparison_res(Img_res, Key)
    Img_reconst_final = bitxor(uint8(Img_res),uint8(Key));
    subplot(1,2,1),imshow(Img_res), title('res');
    subplot(1,2,2),imshow(Img_reconst_final), title('recover final');
end