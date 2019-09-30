function CS4640_truth
% CS4640_truth - use clustering to find semantic parts if map
% On input:
%     N/A (reads map1.jpg)
% On output:
%     displays segment number for water and forests
%     display area of water and forests
%     shows water and forest segments (separately)
% Call:
%     CS4640_truth
% Author:
%     T. Henderson
%     UU
%     Fall 2019
%

map1 = imread('map1.jpg');
[M,N,P] = size(map1);
pts = reshape(double(map1),M*N,3);
[cidx,ctrs] = kmeans(pts,7);
seg = reshape(cidx,M,N);

figure(4);
clf
w = seg(617,752)
area_water = sum(sum(seg==w))
combo(map1,~(seg==w));

figure(5);
clf
f = seg(157,216)
area_forest = sum(sum(seg==f))
combo(map1,~(seg==f));

figure(6);
clf
r = seg(655,315)
rail_way = sum(sum(seg==r))
combo(map1,~(seg==r));

tch = 0;