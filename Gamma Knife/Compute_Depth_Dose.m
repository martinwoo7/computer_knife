% Function computes radiation dose at any point
%
% Inputs: max depth from skin (maxDepth)
%		  point of max radiation (d0) [x]
%		  resolution of depth (increment)
%
% Output: depth dose global look up table (depthDoseTable)

function [depthDoseTable] = Compute_Depth_Dose (maxDepth, d0, increment)

	% For the increment decided by DepthRes find depth dose at each
	% position
	for i = 0:increment:maxDepth
		if (i <= d0)
			dose(2, i + 1) = Compute_Linear_Function([0,0], [d0,1], i);
			dose(1, i + 1) = i;
		else % if i > d0
			dose(2, i+1) = Compute_Linear_Function([d0,1], [12, 0.5], i);
			if (dose(2, i + 1) < 0)
				dose(2, i + 1) = 0;
			end
			dose(1, i + 1) = i;
		end
	end

	depthDoseTable = dose';


end