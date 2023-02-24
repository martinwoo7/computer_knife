function [ctr, ctrm, bases] = markerFrame(A, B, C)
% Takes in 3 vectors A,B,C where A,B,C are vectors of the marker points.
% Creates an orthonormal coordinate system and returns the center in
% tracker & marker coordinates, and the vectors of the system in markers
% coordinates
% in track coord
x = B - A;
z = cross(x, (C - A));
y = cross(z, x);

%normalize system
xnorm = x/norm(x);
ynorm = y/norm(y);
znorm = z/norm(z);

%calculates the center of gravity of triangle
ctr = (A + B + C)/3;

% Sets coordinate system to center of points
xvec = xnorm + ctr;
yvec = ynorm + ctr;
zvec = znorm + ctr;

bases = [xnorm; znorm; ynorm];
% bases = [xvec;zvec;yvec];
ctrm = 0;

end