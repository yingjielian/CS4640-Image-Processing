
clear;clc;clf
AA=imread('map1.jpg');
RR=AA(:,:,1);%Red
GG=AA(:,:,2);%Green
BB=AA(:,:,3);%Blue
AA2=uint8(zeros(size(AA)));
TT1=GG<183;%Keep Blue and Green areas
TT2=GG>150&BB>150&RR>150;%Delete White areas
TT=TT1|TT2;
RR(TT)=nan;
GG(TT)=nan;
BB(TT)=nan;

AA2(:,:,1)=RR;
AA2(:,:,2)=GG;
AA2(:,:,3)=BB;

subplot(1,2,1)
imshow(AA)
title('Original Image')
subplot(1,2,2)
imshow(AA2)
title('Only show in red image')