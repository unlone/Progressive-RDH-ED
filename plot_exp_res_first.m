function plot_exp_res_first(Img_gray, Img_blocking, shares1, crt_shares1)
    subplot(2,4,1),imshow(Img_gray), title('gray');
    subplot(2,4,2),imshow(Img_blocking), title('blocking');
    subplot(2,4,3),imshow(shares1), title('share');
    subplot(2,4,4),imshow(crt_shares1), title('crt share');
    
    nbins = 10;
    subplot(2,4,5),histogram(Img_gray, nbins), title('gray his');
    subplot(2,4,6),histogram(Img_blocking, nbins), title('blocking his');
    subplot(2,4,7),histogram(shares1, nbins), title('share his');
    subplot(2,4,8),histogram(crt_shares1, nbins), title('crt share his');
end