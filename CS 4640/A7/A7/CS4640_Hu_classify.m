function classes = CS4640_Hu_classify(im,H_models)
% CS4640_Hu_classify - classify characters using Hu models
% On input:
% im (MxN binary image): input image
% H_models (nx7 array): Hu models for n characters
% On output:
% classes (kx2 array): class and distance for each CC
% Call:
% Hm = CS4640_Hu_classify(im,Hm);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019
%
CC = bwconncomp(im);
k = CC.NumObjects;
imsize = CC.ImageSize;

if imsize(1) ~= 25 && imsize(2) ~= 15
		error('This image is not a 25x15 image!');
end
classes = zeros(k,2);

[length, x] = size(H_models);

for i = 1:k
    im = CC.PixelIdxList{1,k};
    [rows, cols] = find(im);
    pts = [rows, cols];
    a = transpose(CS4640_Hu_moments(pts));
    min_dis = intmax;
    for j = 1:length
        distance = norm(a-H_models(j));
        if distance <= min_dis
            index = j;
            min_dis = distance;
        end
    end
    classes(i, 2) = distance;
    classes(i, 1) = index; 
end
classes