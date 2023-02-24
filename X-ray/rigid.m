function Q = rigid(newPoint, dcor, e1, e2, e3)
% Takes in a set of point in c-arm coordinates and tranforms them into
% detector coordinates

	% Creates the translational matrix
	transMat = [[1 0 0 -dcor(1)]; [0 1 0 -dcor(2)];...
			[0 0 1 -dcor(3)];[0 0 0 1]]
	newPoint = transMat * [newPoint 1]'
	newPoint = newPoint(1:3);

	v1 = [1 0 0]';
	v2 = [0 1 0]';
	v3 = [0 0 1]';
	% Creats rotational matrix
	disp(e1);
	disp(e2);
	disp(e3);
	rotationM = [[dot(e1, v1) dot(e1, v2) dot(e1, v3) 0];...
		[dot(e2, v1) dot(e2, v2) dot(e2, v3) 0];...
		[dot(e3, v1) dot(e3, v2) dot(e3, v3) 0];...
		[0 0 0 1]]
	
	newPoint =	rotationM * [newPoint; 1];
	newPoint = newPoint(1:3);
	Q = [newPoint(1), newPoint(3), newPoint(2)];
%end
