function plot_exp_res_last(gray, res, res_partial_s1, res_partial_s2, res_partial_t, Key)
    subplot(2,5,1),imshow(gray), title(['gray, psnr: ', num2str( psnr(gray, gray))]);
    subplot(2,5,2),imshow(bitxor(uint8(res),uint8(Key))), title(['res full, psnr:', num2str(psnr(gray, uint8(res)))]);
    subplot(2,5,3),imshow(bitxor(uint8(res_partial_s1),uint8(Key))), title(['res partial s1, psnr: ', num2str( psnr(gray, uint8(res_partial_s1)))]);
    subplot(2,5,4),imshow(bitxor(uint8(res_partial_s2),uint8(Key))), title(['res partial s2, psnr: ', num2str( psnr(gray, uint8(res_partial_s2)))]);
    subplot(2,5,5),imshow(bitxor(uint8(res_partial_t),uint8(Key))), title(['res partial t, psnr: ', num2str( psnr(gray, uint8(res_partial_t)))]);
    
    nbins = 10;
    subplot(2,5,6),histogram(gray, nbins), title('raw img');
    subplot(2,5,7),histogram(bitxor(uint8(res),uint8(Key)), nbins), title('res');
    subplot(2,5,8),histogram(bitxor(uint8(res_partial_s1),uint8(Key)), nbins), title('res partial s1');
    subplot(2,5,9),histogram(bitxor(uint8(res_partial_s2),uint8(Key)), nbins), title('res partial s2');
    subplot(2,5,10),histogram(bitxor(uint8(res_partial_t),uint8(Key)), nbins), title('res partial t');
    
end