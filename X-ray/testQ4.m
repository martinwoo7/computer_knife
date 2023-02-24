	[x,y,z] = makeSphere(100, 3);
	
	points = [x y z];
	angles = [0 45 90 135];
	h = [];
	for i = 1:length(angles);
		h = vertcat(h, tumorProject(angles(i), points));
	end
	
	figure;
	plot3(x,y,z,'.');
	hold on;
	[triangles, v] = tumorRecon(angles, h);