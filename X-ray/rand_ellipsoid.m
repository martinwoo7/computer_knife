function [ x, y, z ] = rand_ellipsoid( n, dims ) 
%  Returns random ellipsoidal points
d = dims .^ 2;  
r = max(dims);  
[x, y, z] = rand_sphere(n, r);
insphere = x.^2/d(1) + y.^2/d(2) + z.^2/d(3) <= 1;  
nredraw = sum(~insphere);  
while nredraw > 0  
    [xn, yn, zn] = rand_sphere(nredraw, r);
    insphere_new = xn.^2/d(1) + yn.^2/d(2) + zn.^2/d(3) <= 1;
    x(~insphere) = xn;
    y(~insphere) = yn;
    z(~insphere) = zn;
    insphere(~insphere) = insphere_new;
    nredraw = sum(~insphere_new);
end  
end 