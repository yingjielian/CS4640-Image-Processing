function T = CS4640_persp_t(pts1,pts2)
% CS4640_persp_t - find perspective transform between pts1 and pts2
% On input:
% pts1 (Nx2 array): first set of 2D points
% pts2 (Nx2 array): second set of 2D points
% On output:
% T (3x3 array): perspective transform matrix
% Call:
% T = CS4640_persp_t(pts1,pts2);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019

pts1 = [10 10; 110 10; 10 310; 110 310];
pts2 = [0 0;100 0;0 60;100 60]; 
T = cp2tform(pts1,pts2,'projective')
ImageMeasurePoint = [60 160];
RealMeasurePoint = tformfwd(T,ImageMeasurePoint)