function [radDose] = Compute_Radial_Dose (maxDist, r, increment)

	for i = -maxDist:increment:maxDist
		if (i >= -(r/2) && i <= (r/2))
			dose(2, i + maxDist + 1) = 1;
			dose(1, i + maxDist + 1) = i;
		else if (i > -r * 1.5 && i < r/2)
				dose(2, i + maxDist + 1) = Compute_Linear_Function([-r*1.5,0], [-(r/2),1], i);
				dose(1, i + maxDist + 1) = i;
			else if (i < r *1.5 && i > r/2)
				dose(2, i + maxDist + 1) = Compute_Linear_Function([r/2,1], [r*1.5,0], i);
				dose(1, i + maxDist + 1) = i;
				
			else
				dose(2, i + maxDist + 1) = 0;
				dose(1, i + maxDist + 1) = i;
				end
			end
		end
	end
	
	radDose = dose';
						
end