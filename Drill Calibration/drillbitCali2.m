function pcal = drillbitCali2(markers)
% Drill bit calibration using sphere fitting.
% Takes in a nx3 matrix of marker points and returns the pivot point in the
% marker coordinate system
	s1 = [];
	s2 = [];
	s3 = [];
	% Gets individial points for each marker
	for i = 1:3:length(markers)
		s1 = vertcat(s1, markers(i,:));
	end
	for j = 2:3:length(markers)
		s2 = vertcat(s2, markers(j,:));
	end
	for k = 3:3:length(markers)
		s3 = vertcat(s3, markers(k,:));
	end
	
	% finds the average
	B = (s1 + s2 + s3)/3;
	
	% Flip and add to original points to get full sphere
	R3 = [cosd(180) 0 -sind(180); 0 1 0; sind(180) 0 cosd(180)];
	flipped = [];
	for h = 1:length(B)
		flipped = vertcat(flipped, (R3*B(h,:)')');
	end
	C = vertcat(B,flipped);
% 	plot3(C(:,1),C(:,2),C(:,3),'.');
	
	dataset = C';
	[n,m] = size(dataset);
	% A = -2*x' of 1's. x' is the transpose of set.
	A = [(-2).*dataset', ones(m,1)];
	b = [];
	for i = 1:length(dataset)
		% b = negative of the transpose of data multiplied by the data
		b = vertcat(b, (-1).*((dataset(:,i))'*(dataset(:,i))));
	end
% 	disp(A);
% 	disp(b);
	% The sphere equation is now of the form -2x'*g + g'*g - p^2 = -x'*x
	% Performs QR decomposition. Gets a tall thin matrix
	[Q,R] = qr(A,0);
	% solves Rx = Q'b using back substitution. Solves for an approximation
	% of x. This gives [gx, gy, gz, sigma] where [gx, gy, gz] = g. 
	% 'g' is the approximated center and sigma = g'*g-r, where r
	% is the approximated radius of sphere.
	approx = backsub(R,Q'*b);

	%gets the g vec (center)
	g = approx(1:length(approx)-1,1);
	
	% Takes the average of the transformed points to get the pivot point in
	% the marker coordinate system
	pcali = [];
	for i = 1:3:length(markers)
		[R1,t] = rigid(markers(i,:),markers(i+1,:),markers(i+2,:));
		pcali = vertcat(pcali, (inv(R1)*(g-t))');
% 		pcali = vertcat(pcali, (R1*y -t)');
	end
	pcal = mean(pcali);


end