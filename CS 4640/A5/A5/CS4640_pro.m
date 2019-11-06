load('chars45.mat');
figure(1)
clf
imshow(mask);
b1 = bwtraceboundary(mask,[217,406],'E');
b2 = bwtraceboundary(mask,[283,439],'E');
b3 = bwtraceboundary(mask,[216,422],'E');
clf
plot(b1(:,2),2018-b1(:,1),'g+');
hold on
plot(b2(:,2),2018-b2(:,1),'b*');
plot(b3(:,2),2018-b3(:,1),'ko');
[D,Z,TP] = procrustes(b1(1:75,:),b2);
D
TP
TP.T
TP.c(1,:)
plot(Z(:,2),2018-Z(:,1),'ro');
[D,Z,TP] = procrustes(b1,b3(1:80,:));
D
plot(Z(:,2),2018-Z(:,1),'b*');

tch = 0;