% with Matlab, R2020a
clear;
clc;

%% paras
n_value = 4; % paricipants
k_value = 3; % Polynomial degree
m_value = 3;
p = [5 11 23];
extra_secret = 80;

%% 
% 1, content owner
% 1.1, get the image
img_name = "";
Img_rgb = imread(img_name);
Img_gray = rgb2gray(Img_rgb);

% 1.2, get the blocking image
[Img_blocking, Key] = get_blocking_image(img_name);
Img_size = size(Img_blocking);
% 1.3, visualization

%%
% 2, data hider
[shares, crt_shares] = SIS(Img_blocking, n_value, k_value, p, extra_secret);

shares1 =shares(:, :, 1);
shares1_plot = uint8(shares1);
crt_shares1 = uint8(crt_shares(:, :, 3, 1));

fprintf('Q1: \n');
fprintf('entropy: gray %f, blocking %f, share %f, crt_share %f \n', entropy(Img_gray), entropy(Img_blocking), entropy(shares1_plot), entropy(crt_shares1));
fprintf('psnr: blocking %f, share %f, crt_share %f \n', psnr(Img_blocking, Img_gray), psnr(shares1_plot, Img_gray), psnr(crt_shares1, Img_gray));
fprintf('ssim: blocking %f, share %f, crt_share %f \n', ssim(Img_blocking, Img_gray), ssim(shares1_plot, Img_gray), ssim(crt_shares1, Img_gray));


%%
% 3, receiver
% specified for k_value equals to 3
select = [1 2 3];
[res, extra_res] = reconstruct(crt_shares, n_value, k_value, p, select);


select = [0 2 3];
[res_partial_s1, extra_res_partial_s1] = reconstruct(crt_shares, n_value, k_value, p, select);

select = [1 0 3];
[res_partial_s2, extra_res_partial_s2] = reconstruct(crt_shares, n_value, k_value, p, select);

select = [1 0 0];
[res_partial_t, extra_res_partial_t] = reconstruct(crt_shares, n_value, k_value, p, select);


[w, h] = size(res);
fprintf('Q2: \n');
fprintf('entropy: full %f, lost_one_1 %f, lost_one_2 %f, lost_two %f \n', entropy(res), entropy(res_partial_s1), entropy(res_partial_s2), entropy(res_partial_t));
%fprintf('psnr: lost_one_1 %f, lost_one_2 %f, lost_two %f \n', psnr(res_partial_s1, res), psnr(res_partial_s2, res), psnr(res_partial_t, res));
fprintf('ssim: lost_one_1 %f, lost_one_2 %f, lost_two %f \n', ssim(res_partial_s1, res), ssim(res_partial_s2, res), ssim(res_partial_t, res));
fprintf('secret: full %f, lost_one_1 %f, lost_one_2 %f, lost_two %f \n', unique(extra_res), unique(extra_res_partial_s1), unique(extra_res_partial_s2), unique(extra_res_partial_t(:)));
fprintf('correct: full %f, lost_one_1 %f, lost_one_2 %f, lost_two %f \n', length(find((Img_gray==res)==1))/(w*h)*100, length(find((Img_gray==res_partial_s1)==1))/(w*h)*100, length(find((Img_gray==res_partial_s2)==1))/(w*h)*100, length(find((Img_gray==res_partial_t)==1))/(w*h)*100);
