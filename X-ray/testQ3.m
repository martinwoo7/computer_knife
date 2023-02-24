	clear;
	[x, y, z] = rand_ellipsoid(100, [1 2 3]);
	
	points = [x y z];
	angles = [0 90];
	k = [];
	
	% Creates silhouettes at given angles
	for i = 1:length(angles);
		k = vertcat(k, tumorProject(angles(i), points));
	end
	
	% Gets radius of super-sphere
	approxR = superSphere(angles, k);

	% Ellipsoid centered at [0 0 0] with axis lengths of 1, 2 , and 3
	[q, w, e] = ellipsoid(0,0,0,1,2,3);
	surf(q, w, e);
	