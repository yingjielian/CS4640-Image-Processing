function im = CS4640_camera(f,pts,M,N,S,sigma2)
% CS4640_camera - produce an image from a set of 3D points
% On input:
% f (float): focal length (assume set to 1)
% pts (nx3 array): X,Y,Z 3D points from scene
% M (int): number of rows in output image
% N (int): number of cols in output image
% S (int): size of Gaussian filter window (one side)
% sigma2 (float): variance for Gaussian
% On output:
% im (MxN array): output image
% - 3D points at x,y extremes lie on image edges
% - pixel intensities are scaled by Z value
% - image is flipped up down (e.g., use flipud)
% - make sure intensities are between 0 and 255
% Call:
% im = CS4640_camera(f,pts,M,N,S,sigma2);
% Author:
% Yingjie Lian
% UU
% Fall 2019
%

% Get the X of pts in 1st column
x = pts(:,1);
% Get the Y of pts in 2nd column
y = pts(:,2);
% Get the Z of pts in 3rd column
z = pts(:,3);

%Get the image position x, y
x = (f.*x) ./ z;
y = (f.*y) ./ z;

% Find x_min, x_max, y_min, y_max
x_min = min(x);
x_max = max(x);
y_min = min(y);
y_max = max(y);

xx = linspace(x_min,x_max,N); 
yy = linspace(y_min,y_max,M);
[X,Y] = meshgrid(xx,yy);
grid_centers = [X(:),Y(:)];

imshow(grid_centers);
h = fspecial('gaussian',S,sigma2);
im = imfilter(grid_centers, h);
