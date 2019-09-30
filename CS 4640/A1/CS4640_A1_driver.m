function im = CS4640_A1_driver(delx,M,N,S,sigma2)
% CS4640_A1_driver - runs CS4640_camera with railways
% On input:
%     delx (float): step in Z value for line
%     M (int): row dimension for image
%     N (int): col dimension for image
%     S (int): side length of Gaussian filter matrix
%     sigma2 (float): variance for Gaussian filter
% On output:
%     im (MxN array): output image of railway convergence
% Call:
%     im = CS4640_run_camera(0.01,101,101,15,0.1);
% Author:
%     T. Henderson
%     UU
%     Fall 2019
%

f = 1;
v = [1:delx:100];
num_v = length(v);
if rem(num_v,2)==1
    v(end+1) = 100;
    num_v = num_v + 1;
end
mid = ceil(num_v/2);
pts = zeros(2*num_v,3);
pts(1:mid,1) = -5;
pts(mid+1:end,1) = 5;
pts(:,2) = -1;
pts(1:num_v,3) = v;
pts(num_v+1:end,3) = v;

im = CS4640_camera(f,pts,M,N,S,sigma2);
imagesc(im);