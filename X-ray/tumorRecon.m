function [final, v] = tumorRecon(angles, tumors)

	% Gets the radius of the super-sphere and multiply it by 1.5
	sr = round(superSphere(angles, tumors)) * 1.5;
	% sets the step size
	step = sr/100;
	values = [];
	count = 1;
	% Looping through the x values
	for i = -sr:step:sr
		% Looping through the y values
		for j = -sr:step:sr
			% Looping through the z values
			for k = -sr:step:sr
				% If the equation is less than 1, that means the point is
				% in or on the ellipsoid/tumor
				if ((i - 1)^2)/(1^2) + ((j - 1)^2)/(2^2) + ((k - 1)^2)/(3^2) < 1
					% Saves the point
					values(count,:) = [i j k];
					count = count + 1;
				end
			end
		end
	end
	% Gets the sruface triangles of tumor and the volume
	[final, v] = convhull(values(:,1),values(:,2),values(:,3));
	trisurf(final,values(:,1),values(:,2),values(:,3),'FaceAlpha',0.1);

end
