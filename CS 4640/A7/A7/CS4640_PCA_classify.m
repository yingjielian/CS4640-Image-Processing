function c = CS4640_PCA_classify(im,V,MM,PCA_models)
% CS4640_PCA_classify - classify image using PCA models
% On input:
% im (MxN binary array): input image
% V (M*NxM*N array): eigenvectors
% MM (M*Nx1 vector): mean vector
% PCA_models (nxk array): weight values for first k eigenvectors
% On output:distance = norm(a-H_models(j));
% c (int): class
% Call:
% [V,MM,PCAm] = CS4640_PCA_model(templates);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019
%
[length, x] = size(PCA_models);

w = V(:,1)'*(double(im(:))-double(MM));
c = intmax;
for i = 1:length
    distance = norm(w-PCA_models(i));
    if distance <= c
        c = distance;
    end
end
c = int(c);
