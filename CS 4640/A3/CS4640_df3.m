function [dx3,dy3] = CS4640_df3(im)
% CS4640_df3 - third derivative of image in x and y
% On input:
% im (MxN array): input gray level image
% On output:
% dx3 (MxN double array): third derivative in x: dˆ3f/dxˆ3
% dy3 (MxN double array): third derivative in y: dˆ3f/dyˆ3
% Call:
% [dx3,dy3] = CS4640_df3(cells);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019
%
[dx1,dy1,dx,dy] = CS4640_df1(im);

dx3 = diff(diff(dx1));
dy3 = diff(diff(dy1));