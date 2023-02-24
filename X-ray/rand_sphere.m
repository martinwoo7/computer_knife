function [ x, y, z ] = rand_sphere( n, r )  
theta = 2 * pi * rand(n, 1);  
phi = asin(2 * rand(n, 1) - 1);  
d = r * (rand(n, 1) .^ (1/3));  
[x, y, z] = sph2cart(theta, phi, d);
end  