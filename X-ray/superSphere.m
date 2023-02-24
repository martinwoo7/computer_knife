function [r] = superSphere(angles, tumors)	 
% Input: takes in a vector of imaging angles and a matrix of tumor
% silhouettes in detector coordinate system
% Output: returns the radius of the calculated supersphere

% Honestly, my superSphere is kinda screwy
% It doesn't work when only 1 angle is passed into it
% and it doesn't work if two opposite angles are passed in (0, 180)

	[n,m] = size(angles);
	[q,w] = size(tumors);
	finPoints = [];
	
	% Specificallu makes a rotated data set to use for sphere reconstruction
	if m == 1
		R = [1 0 0; 0 cosd(angles(1)) sind(angles(1)); 0 -sind(angles(1)) cosd(angles(1))];
		angle2 = angles(1) + 90;
		R2 = [1 0 0; 0 cosd(angle2) sind(angle2); 0 -sind(angle2) cosd(angle2)];
		
		rotatedP = [];
		
		for i = 1:length(tumors)
			rotatedP = vertcat(rotatedP, (R * tumors(i,:)')');
		end
		for j = 1:length(tumors)
			rotatedP = vertcat(rotatedP, (R2 * tumors(j,:)')');
		end
		finPoints = rotatedP;
	
	else
		for i = 1:m
			% Rotatational matrix around the x-axis
			R = [1 0 0; 0 cosd(angles(i)) sind(angles(i)); 0 -sind(angles(i)) cosd(angles(i))];

			rotatedP = [];

			% Rotate points by corresponding angles around the x-axis
			for j = 1:length(tumors)
				rotatedP = vertcat(rotatedP, (R * tumors(j,:)')');
			end

			finPoints = vertcat(finPoints, rotatedP);
		end
	end
	
% 	figure;
% 	xlabel('x axis');
% 	ylabel('y axis');
% 	Plotting the rotated silhouettes
% 	plot3(finPoints(:,1), finPoints(:,2), finPoints(:,3));
	
	
	% Fitting a sphere to the points with least-squares
	dataset = [finPoints(:,1)';finPoints(:,2)';finPoints(:,3)'];
	% A = -2*x' of 1's. x' is the transpose of set.
	A = [(-2).*dataset', ones(length(dataset),1)];
	b = [];
	for i = 1:length(dataset)
		% b = negative of the transpose of data multiplied by the data
		b = vertcat(b, (-1).*((dataset(:,i))'*(dataset(:,i))));
	end
	% The sphere equation is now of the form -2x'*g + g'*g - p^2 = -x'*x
	% Performs QR decomposition. Gets a tall thin matrix
	[Q,R] = qr(A,0);
	% solves Rx = Q'b using back substitution. Solves for an approximation
	% of x. This gives [gx, gy, gz, sigma] where [gx, gy, gz] = g. 
	% 'g' is the approximated center and sigma = g'*g-r, where r
	% is the approximated radius of sphere.
	approx = backsub(R,Q'*b);
	%gets sigma
	sigma = approx(length(approx));
	%gets the g vec
	g = approx(1:length(approx)-1,1);
	%gets the approximated radius
	r = sqrt(dot(g,g)-sigma);

	% Plotting the super-sphere
	[xf, yf, zf] = sphere;
	xx = xf * r + g(1);
	yy = yf * r + g(2);
	zz = zf * r + g(3);
	figure;
	hold on;
	surface(xx, yy, zz, 'FaceAlpha', 0.1);	
	
end
