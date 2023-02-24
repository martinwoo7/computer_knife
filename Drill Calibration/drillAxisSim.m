function matPoints = drillAxisSim(number)
% Takes in the number of poses and returns a nx3 matrix of the points of the
% markers 
% 	points = [5 5 5; 5 10 5; 10 5 5];
	points = [5 0 20; 11 0 20; 5 0 26];
	matPoints = [];
	figure; hold on;
	xlabel('x Axis');
	ylabel('y Axis');
	zlabel('Z Axis');
	j = 360/number;
	for i = j:j:360
	%	Z rotate
		R = [cosd(i) -sind(i) 0; sind(i) cosd(i) 0; 0 0 1];
		final = [(R*points(1,:)')'; (R*points(2,:)')'; (R*points(3,:)')'];
		matPoints = vertcat(matPoints, final);
	% 	plot3(final(1,1), final(1,2), final(1,3),'*b');
	% 	plot3(final(2,1), final(2,2), final(2,3),'*g');
	% 	plot3(final(3,1), final(3,2), final(3,3),'*r');
		v1 = final(1,:);
		v2 = final(2,:);
		v3 = final(3,:);
		triangle = [v1(:),v2(:),v3(:)];
		plot3([triangle(1,:) triangle(1,1)], [triangle(2,:) triangle(2,1)], [triangle(3,:) triangle(3,1)]);
	end
end