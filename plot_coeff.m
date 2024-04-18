function plot_coeff(Img_blocking, shares1)
    N = 10000;
    r1 = ImCoef(Img_blocking, N);
    
    subplot(2,4,1),imshow(Img_blocking), title(['R_H=', num2str(r1(1))] );
    axis on;
    xlabel('(x, y)');
    ylabel('(x+1, y)');
    subplot(2,4,2),imshow(Img_blocking), title(['R_V=', num2str(r1(2))]);
    axis on;
    xlabel('(x, y)');
    ylabel('(x+1, y)');
    subplot(2,4,3),imshow(Img_blocking), title(['R_D=', num2str(r1(3))]);
    axis on;
    xlabel('(x, y)');
    ylabel('(x+1, y)');
    subplot(2,4,4),imshow(Img_blocking), title(['R_I_D=', num2str(r1(4))]);
    axis on;
    xlabel('(x, y)');
    ylabel('(x+1, y)');
    
    
    r2 = ImCoef(shares1, N);
    subplot(2,4,5),imshow(shares1), title(['R_H=', num2str(r2(1))]);
    axis on;
    xlabel('(x, y)');
    ylabel('(x+1, y)');
    subplot(2,4,6),imshow(shares1), title(['R_V=', num2str(r2(2))]);
    axis on;
    xlabel('(x, y)');
    ylabel('(x+1, y)');
    subplot(2,4,7),imshow(shares1), title(['R_D=', num2str(r2(3))]);
    axis on;
    xlabel('(x, y)');
    ylabel('(x+1, y)');
    subplot(2,4,8),imshow(shares1), title(['R_I_D=', num2str(r2(4))]);
    axis on;
    xlabel('(x, y)');
    ylabel('(x+1, y)');
end