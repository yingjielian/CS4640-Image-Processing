function Epq = CS4640_normal_moment(pts,p,q)
% CS4640_normal_moment - compute a central normal moment
% Epq = <pq/M00ˆb where b = 1+(p+q)/2
% On input:
% pts (nx2 array): row and cols of points
% p (int): exponent for x
% q (int): exponent for y
% On output:
% Epq (float): Epq moment
% Call:
% E00 = CS4640_normal_moment([1 1; 2 2; 3 3],0,0);
% Author:
% <Yingjie Lian>
% UU
% Fall 2019
%

if (p+q) < 2
		error('normalized moments only valid for p+q >= 2');
end

Mpq = CS4640_central_moment(pts,p,q);    
b = (p+q)/2 + 1;
Epq = Mpq/ CS4640_central_moment(pts, 0, 0)^b;