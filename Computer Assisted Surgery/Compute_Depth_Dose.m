% Function to compute radiation dose at any point from Gamma Knife
% radiosurgery.
%
% Inputs: max depth from skin (maxDepth) 
%         point of max radiation (d0) [x
%         resolution of depth (increment)
%
% Output: depth dose global look up table (depthDoseTable)
%
% Function created on Decemeber 11th, 2015 by Eric Braun 10121660


function [depthDoseTable] = Compute_Depth_Dose(maxDepth, d0, increment)

    % For the increment decided by depthRes find depth dose at each
    % position
    for i = 0:increment:maxDepth
        if (i <= d0)
            dose(2,i+1) = Compute_Linear_Function([0,0],[d0,1],i);
            dose(1,i+1) = i;
        else % if i > d0 
            dose(2,i+1) = Compute_Linear_Function([d0,1],[d0 * 6,0.5],i);
            dose(1,i+1) = i;
        end
    end

    depthDoseTable = dose';

end