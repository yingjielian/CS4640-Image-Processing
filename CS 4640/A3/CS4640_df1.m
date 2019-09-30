function [dx1,dy1,dx,dy] = CS4640_df1(im)
% CS4640_df3 - first derivative in x and y
% On input:
%     im (gray level array): input image
% On output:
%     dx1 (float): df/dx
%     dy1 (float): df/dy
% Call:
%     [dx1,dy1,dx,dy] = CS4640_df1(cell);
% Author:
%     T. Henderson
%     UU
%     Fall 2019
%

Hx = [-1 0 1];
Hy = Hx';
dx1 = imfilter(double(im),Hx,'replicate','same')/2;
dy1 = imfilter(double(im),Hy,'replicate','same')/2;

[dx,dy] = gradient(double(im));