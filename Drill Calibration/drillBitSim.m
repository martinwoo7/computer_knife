function matPoints = drillBitSim(number, range)
	% Takes in number and range, where number is the number of poses, and
	% range is the range of the poses
	% Returns a nx3 matrix of points of the markers

% 	number = 20;
% 	range = 15;
	ra = range/4;
	
	% number of poses
	h = 360/number;
	points = [5 0 20; 11 0 20; 5 0 26];
	matPoints = [];

% 	figure; hold on;
% 	xlabel('x Axis');
% 	ylabel('y Axis');
% 	zlabel('Z Axis');

	% All these points are in tracker coord
	% I belive my points are wrong.
	
	% If entered range is 0, just rotate around the Z axis
	if range == 0
		for i = h:h:360
		%	Y rotate
		% 	R = [cosd(i) 0 -sind(i); 0 1 0; sind(i) 0 cosd(i)];
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
			
% 			plot3([triangle(1,:) triangle(1,1)], [triangle(2,:) triangle(2,1)], [triangle(3,:) triangle(3,1)]);
% 	 		plot3(triangle(1,:), triangle(2,:) , triangle(3,:),'.');
		end
	% else rotate around the Y axis as well
	else

		for j = 0:-ra:-range
			% Y Rot
			R2 = [cosd(j) 0 -sind(j); 0 1 0; sind(j) 0 cosd(j)];
			points2 = [(R2*points(1,:)')'; (R2*points(2,:)')'; (R2*points(3,:)')'];

% X rotate doesn't work
% 		for g = 1
% 			R3 = [1 0 0; 0 cosd(g) sind(g); 0 -sind(g) cos(g)];
% 			points2 = [(R3*points3(1,:)')'; (R3*points3(2,:)')'; (R3*points3(3,:)')'];
		
			for i = h:h:360

			%	Z rotate
				R = [cosd(i) -sind(i) 0; sind(i) cosd(i) 0; 0 0 1];
				final = [(R*points2(1,:)')'; (R*points2(2,:)')'; (R*points2(3,:)')'];
				matPoints = vertcat(matPoints, final);
			% 	plot3(final(1,1), final(1,2), final(1,3),'*b');
			% 	plot3(final(2,1), final(2,2), final(2,3),'*g');
			% 	plot3(final(3,1), final(3,2), final(3,3),'*r');
				v1 = final(1,:);
				v2 = final(2,:);
				v3 = final(3,:);
				triangle = [v1(:),v2(:),v3(:)];
				
				plot3([triangle(1,:) triangle(1,1)], [triangle(2,:) triangle(2,1)], [triangle(3,:) triangle(3,1)]);
		 		plot3(triangle(1,:), triangle(2,:) , triangle(3,:),'.');

			end
		end	
	end
end

	
