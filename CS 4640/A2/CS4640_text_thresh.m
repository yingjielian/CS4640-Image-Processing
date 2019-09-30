function text = CS4640_text_thresh(im)
% CS4640_text_thresh - extract text and markings from an image
% On input:
% im (MxN array): gray level input image
% On output:
% text (MxN array): binary image of text and markings
% Call:
% text = CS4640_text_thresh(d45);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019
%
I = imread(im);
[width,height]=size(I);
T1=1;
for i=1:width
    for j=1:height
        if(I(i,j)<T1)
            text(i,j)=0;
        else 
            text(i,j)=1;
        end
    end
end
imshow(text);