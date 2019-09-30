function text = CS4640_text_hist(im)
% CS4640_text_hist - extract text and markings from an image
% On input:
% im (MxN array): gray level input image
% On output:
% text (MxN array): binary image of text and markings
% Call:
% text = CS4640_text_hist(d45);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019
%
I = imread(im);
text = I < 100;
imshow(text);