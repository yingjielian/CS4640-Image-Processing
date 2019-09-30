function segs = CS4640_shapes(im)
% CS4640_shapes - extract simple shapes from image
% On input:
% im (MxN array): input gray level image
% On output:
% segs (MxN array): labeled image:
% 0: background or unknown
% 1: line object
% 2: circular object
% 3: text object
% Call:
% segs = CS4640_shapes(im);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019
%

background(im);
lines(im);
circular(im);
texts(im);