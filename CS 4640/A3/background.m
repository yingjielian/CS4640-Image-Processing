function backgound(im)

I = imread(im);
I = rgb2gray(I);
level = graythresh(I);
BW = imbinarize(I,level);
figure;
imshow(BW);
title('\fontsize{20}0');