function CS4640_week6
%

[f,tab] = imread('franklin.tif');
f = ind2rgb(f,tab);
fg = rgb2gray(f);
[M,N] = size(fg);
[dx,dy] = gradient(double(fg));
mag = sqrt(dx.^2 + dy.^2);
f_true = mag>0.07;
CS4640_combo(f,f_true);

f_rob = edge(fg,'roberts');
CS4640_combo(f,f_rob);

num_pix = M*N
num_tp = sum(sum(f_true))
num_rob = sum(sum(f_rob))
num_rob/num_tp

tp = sum(sum(f_rob==f_true&f_rob==1))
tp/num_tp

metro = imread('metro.jpg');
mg = rgb2gray(metro);
[dx,dy] = gradient(double(mg));
mag = sqrt(dx.^2+dy.^2);
m_true = mag>3;
CS4640_combo(metro,m_true);

% Question 2
steps = imread('steps.jpg');
[dx1,dy1,dx,dy] = CS4640_df1(steps);
clf
plot(steps(21,:),'k');
hold on
DX = [-1,1];
steps_dx = imfilter(steps,DX);

plot(steps_dx(21,:),'r'); % Simple df/dx filter
plot(dx(21,:),'r'); % gradient df/dx
plot(dx1(21,:),'b'); % modified simple dfdx to match gradient df/dx

[dx3o,dy3o,dx3,dy3,dxxx,dyyy] = CS4640_df3(steps);
plot(dx3o(21,:),'g');

plot(dxxx(21,:),'c');

dxlog = edge(steps,'log');
figure(2)
clf
plot(steps(21,:));
L = fspecial('laplacian')
dx2y2 = imfilter(steps,L);
hold on
plot(dx2y2(21,:),'g');
plot(dxlog(21,:),'r');

% linear objects
[dx,dy] = gradient(double(fg));
mag = sqrt(dx.^2 + dy.^2);
ori = posori(atan2(dy,dx));
e90 = mag>0.07&ori>pi/2-0.025&ori<pi/2+0.025;
H = ones(1,50);
e90_H = conv2(e90,H);
CS4640_combo(fg,e90_H>20);

W = fg(1201:1505,2051:2308);
W_cc = bwlabel(W<0.1);
num_cc = max(max(W_cc));
rects = [];
for cc = 1:num_cc
    [x,y] = find(W_cc==cc);
    xm = mean(x);
    ym = mean(y);
    pts = [x-xm,y-ym];
    C = pts'*pts;
    [V,D] = eigs(C);
    theta = posori(atan2(V(2,2),V(1,2)));
    degrees = theta*180/pi;
    T = [cos(-theta),-sin(-theta); sin(-theta),cos(-theta)];
    ptsr = (T*pts')';
    min_x = min(ptsr(:,1));
    max_x = max(ptsr(:,1));
    min_y = min(ptsr(:,2));
    max_y = max(ptsr(:,2));
    area = (max_x-min_x)*(max_y-min_y);
    if cc==158
        tch = 0;
        theta
        degrees
        figure(1);
        clf
        imshow(W_cc==cc);
        figure(2);
        clf
        plot(pts(:,2),306-pts(:,1),'k.');
        axis equal
        hold on
        plot(ptsr(:,2),306-ptsr(:,1),'ro');
    end
    if (area-sum(sum(W_cc==cc)))<15
        rects = [rects;cc];
    end
end

Wr = 0*W_cc;
for r = 1:167
    [rows,cols] = find(W_cc==rects(r));
    num_rows = length(rows);
    for rr = 1:num_rows
        Wr(rows(rr),cols(rr)) = r;
    end
end

tch = 0;