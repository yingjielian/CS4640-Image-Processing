function Mpq = CS4640_central_moment(pts,p,q)
% CS4640_central_moment - compute a central moment
% Mpq = sum sum (xˆp*yˆq)
% x y
% On input:
% pts (nx2 array): row and cols of points
% p (int): exponent for x
% q (int): exponent for y
% On output:
% Mpq (float): Mpq moment
% Call:
% M00 = CS4640_central_moment([1 1; 2 2; 3 3],0,0);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019
  x = pts(1,:);
  y = pts(2,:);

  Mpq = sum(x.^p .* y.^q);