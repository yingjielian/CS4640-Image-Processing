function lines(im)

I = imread(im);
I = rgb2gray(I);

[dx,dy] = gradient(double(I));
mag = sqrt(dx.^2 + dy.^2);
ori = posori(atan2(dy,dx));
e90 = mag>0.07&ori>pi/2-0.025&ori<pi/2+0.025;
H = ones(1,50);
e90_H = conv2(e90,H);
figure;
CS4640_combo(I,e90_H>20);
title('\fontsize{20}1');