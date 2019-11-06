function m = CS4640_char_template(T,C)
% CS4640_char_template - measure similarity of template and character
% On input:
% T (25x15 binary array): character template
% C (MxN binary array): input test character
% On output:
% m (float): distance measure between template and test character
% Call:
% m = CS4640_char_template(T_A,cc);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019

T = ['A','B','C','D','E','F','G','H','I','K','L','M','N','O','R','S','T','U','V','Y'...
'a','c','d','e','f','g','h','i','k','l','m','n','o','p','r','s','t','u','v','y'...
'0','1','2','3','4','5','6','7','8','9'];

%%
% Read images and binarize the plate image
load('chars45.mat');
figure(1)
clf
imshow(mask);

char_template = imread(mask);
char_template = rgb2gray(char_template);
max_ = max(char_template(:));
quant = zeros(size(char_template), 'uint8') + max_;
char_template = ~round(char_template ./ quant)

%%
% Crop the characters from template
s = regionprops(char_template,'BoundingBox');
BoundingBox = cat(1, s.BoundingBox);
BoundingBox = floor(BoundingBox);
BoundingBox(:, 3) = BoundingBox(:, 3)+1;
BoundingBox(:, 4) = BoundingBox(:, 4)+1;

figure
imshow(char_template);
hold on;
for i=1:size(BoundingBox, 1)
    rectangle('Position',...
              [BoundingBox(i,1), BoundingBox(i,2), BoundingBox(i,3), BoundingBox(i,4)],...
               'EdgeColor', 'r',...
               'LineWidth', 1.5);
end

%%
s1 = regionprops(im_license_bw,'BoundingBox');
BoundingBox1 = cat(1, s1.BoundingBox);
BoundingBox1 = floor(BoundingBox1);
BoundingBox1(:, 3) = BoundingBox1(:, 3)+1;
BoundingBox1(:, 4) = BoundingBox1(:, 4)+1;

% Calculate the ratio of template
ratio_w = BoundingBox(25, 3) / BoundingBox1(5, 3);
ratio_h = BoundingBox(25, 4) / BoundingBox1(5, 4);
