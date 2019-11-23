function H = CS4640_Hu_moments(pts)
% CS4640_Hu_moments - compute Hu’s 7 moments
% On input:
% pts (nx2 array): row and cols of points
% On output:
% H (7x1 vector): Hu moments
% Call:
% H = CS4640_Hu_moments([1 1; 2 2; 3 3]);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019
%
%% First Moment
n20=CS4640_normal_moment(pts,2,0);
n02=CS4640_normal_moment(pts,0,2);
H1=n20+n02;

%% Second Moment
n11=CS4640_normal_moment(pts,1,1);
H2=(n20-n02)^2+4*n11^2;

%% Third Moment
n30=CS4640_normal_moment(pts,3,0);
n12=CS4640_normal_moment(pts,1,2);
n21=CS4640_normal_moment(pts,2,1);
n03=CS4640_normal_moment(pts,0,3);
H3=(n30-3*n12)^2+(3*n21-n03)^2;

%% Fourth Moment
H4=(n30+n12)^2+(n21+n03)^2;

%% Fifth Moment
H5=(n30-3*n21)*(n30+n12)*(n30+n12)^2-3*(n21+n03)^2+(3*n21-n03)*(n21+n03)*(3*(n30+n12)^2-(n21+n03)^2);

%% Sixth Moment
H6=(n20-n02)*(n30+n12)^2-(n21+n03)^2+4*n11*(n30+n12)*(n21+n03);

%% Seventh Moment
H7=(3*n21-n03)*(n30+n12)*(n30+n12)^2-3*(n21+n03)^2-(n30+3*n12)*(n21+n03)*(3*(n30+n12)^2-(n21+n03)^2);



%% The vector H is a column vector containing H1,H2,....H7
H=[H1    H2     H3    H4     H5    H6    H7]';
