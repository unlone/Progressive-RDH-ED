function plot_error(extra_res, extra_secret)
    [m, n] = size(extra_res);
    diff = (extra_res - extra_secret)/250;
    x = (1:100:n*m);
    y = reshape(diff, 1, n*m);
    plot(x,y(1:100:end));
    title('error');
    xlabel('x');
    ylabel('error');

end