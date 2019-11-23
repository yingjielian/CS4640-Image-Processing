function H_models = CS4640_Hu_build(templates)
% CS4640_Hu_models - produce Hu models for image templates
% On input:
% templates (n-element vector struct): template images
% (k).im (MxN binary image): image template
% On output:
% H_models (nx7 array): Hu models
% Call:
% Hm = CS4640_Hu_build(templates);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019
%
[n, length] = size(templates);

hu_array = zeros(length, 7);

for i = 1:length
    im = templates(i).W;
    [rows, cols] = find(im);
    pts = [rows, cols];
    a = transpose(CS4640_Hu_moments(pts));
    for j = 1:7
        hu_array(i,j) = a(1, j);
    end
end
H_models = hu_array;