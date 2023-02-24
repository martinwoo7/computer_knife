function [x,y,z] = makeSphere (numberOfPoints, radius)
% Creates sperical [x y z] points
	rvals = [];
	elevation = [];
	azimuth = [];
	finalR = [];
	
	for i = 1:numberOfPoints
		temp = 2*rand(1,1)-1;
		rvals = vertcat(rvals, temp);
		elevation = vertcat(elevation, asin(temp));
		azimuth = vertcat(azimuth, 2*pi*rand(1,1));
		finalR = vertcat(finalR, radius);
	end
	
	[x,y,z] = sph2cart(azimuth, elevation, finalR);
end
