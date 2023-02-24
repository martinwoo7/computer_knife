function ret = tumorProject(a, points)
% Input: Takes in an imaging angle and an array of tumor points in the C-arm
% coordinate system (x, y, z).
% Output: Returns the tumor contour as an array of points in the detector
% coordinate system (u, v, w=0).

s = size(points);
% creates a matrix of zeros
changedPoints = zeros(s(1), 3);

for i = 1: s(1)
	% project each point into the detector coordinate system
	changedPoints(i,:) = pointProject(a, points(i,:));
end

figure;
hold on;
x = changedPoints(:,1);
y = changedPoints(:,2);
plot(x,y,'.');

% get the boundary of the points
k = boundary(x,y,0.1);
plot(x(k), y(k));

a = size(x(k));

% boundary points with z axis
ret = [x(k) y(k) zeros(a(1),1)];
end
