function CS4640_combo(im,mask)
%

[M,N,P] = size(im);

if P==3
    imd = im;
else
    imd(:,:,1) = im;
    imd(:,:,2) = im;
    imd(:,:,3) = im;
end 

for r = 1:M
    for c = 1:N
        if mask(r,c)>0
            imd(r,c,1) = 255;
            imd(r,c,2) = 0;
            imd(r,c,3) = 0;
        end
    end
end

imshow(imd);