function [R,t] = rigid(A, B, C)
% [R,t] = rigid(A,B,C) where A,B,C are vectors of the
% marker points in tracker coordinates
% Returns R and t where R is the rotational matrix that transforms the
% marker points into marker coordiantes, and t is the transformational
% matrix that transforms markers points into the marker coodinates.

% 	A = [5 0 20];
% 	B = [11 0 20];
% 	C = [5 0 26];
	
	% Create orthonormal system from marker points
	[center, ctrm, bases] = markerFrame(A, B, C);
%  Translational vector
	t = [center(1); center(2); center(3)];
	
	v1 = [1 0 0]' ;
	v2 = [0 1 0]' ;
	v3 = [0 0 1]' ;

	% Create rotational matrix
	R = [[dot(bases(1,:), v1) dot(bases(1,:), v2) dot(bases(1,:), v3)];...
		[dot(bases(2,:), v1) dot(bases(2,:), v2) dot(bases(2,:), v3)];...
		[dot(bases(3,:), v1) dot(bases(3,:), v2) dot(bases(3,:), v3)]
		];
		
end