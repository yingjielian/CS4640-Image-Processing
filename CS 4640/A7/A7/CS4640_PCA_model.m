function [V,MM,PCA_models] = CS4640_PCA_model(templates)
% CS4640_PCA_model - build PCA model from templates
% On input:
% templates (vector struct): n template images
% (k).im (MxN binary array): template image for character k
% On output:
% V (M*nxM*n array): eigenvectors
% MM (M*nx1 vector): mean vector
% PCA_models (nxk array): weight values for first k eigenvectors
% Call:
% [V,MM,PCA_models] = CS4640_PCA_model(templates);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019
%
% Eigenfaces
yf2 = zeros(25,15,50);
for n = 1:50
    yf2(:,:,n) = imresize(templates(n).im(:,:,n),[25,15]);
end
yalefaces = yf2;
[h,w,n] = size(yalefaces.im);
d = h*w;
% vectorize images
x = reshape(yalefaces,[d n]);
x = double(x);
%subtract mean
mean_matrix = mean(x,2);
MM = mean_matrix;
x = bsxfun(@minus, x, mean_matrix);
% calculate covariance
s = cov(x');
% obtain eigenvalue & eigenvector
[V,D] = eig(s);
eigval = diag(D);
% sort eigenvalues in descending order
eigval = eigval(end:-1:1);
V = fliplr(V);
% show mean and 1st through 15th principal eigenvectors
figure(4),subplot(4,4,1)
imagesc(reshape(mean_matrix, [h,w]))
colormap gray
for i = 1:15
    subplot(4,4,i+1)
    imagesc(reshape(V(:,i),h,w))
end

% Reconstruct known face
f9 = templates(1).im;
figure(5);
clf
imshow(f9);
f9 = f9(:);
w = zeros(50,1);
r = 0*V(:,1);
for k = 1:50
    w(k) = V(:,k)'*(double(f9(:))-double(mean_matrix));
    r = r + w(k)*V(:,k);
%    r = reshape(w(1)*V(:,1) + w(2)*V(:,2) + w(3)*V(:,3)+ w(4)*V(:,4)+w(5)*V(:,5),48,64);
end
PCA_models = w;
r = reshape(r,25,15);
figure(6);
clf
imshow(imresize(mat2gray(r),[243,320]));