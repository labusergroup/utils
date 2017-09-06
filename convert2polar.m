function polarpic = convert2polar(A,centerx,centery)
%converts input picture A, with center at centerx/centery into a polar
%image
%the maximum radius is set to 310pixels
%the angle resolution is set to 360degrees

[dimx,dimy] = size(A);
% centerx = 446;
% centery = 540;

aax = (0 : 359)/360*2*pi;
rax = 0 : 310;
xax = (1:dimx);
yax = (1:dimy);

%creates the meshgrids for the output image
for ind1 = 1 : length(aax)
    alpha = aax(ind1);      %angle
    cc = cos(alpha);
    ss = sin(alpha);
    for ind2 = 1 : length(rax)
        R = rax(ind2);
        X2(ind1,ind2) = centerx + R * cc;
        Y2(ind1,ind2) = centery + R * ss;   
    end;
end;

  

polarpic = interp2(xax,yax',A',X2,Y2,'linear');

