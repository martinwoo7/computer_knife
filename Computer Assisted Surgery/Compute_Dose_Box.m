% Function used to compute the Dose Box around the prescribed target volume
% and the organ at risk.
%
% Inputs: prescribed target volume radius and position (PTV)
%               Will be [radius, x, y, z]
%         organ at risk radius and position (OAR)
%               Will be [radius, x, y, z]
%
% Output: computed Dose Box (doseBox)
%
% Function created on December 11, 2015 by Eric Braun 10121660

function [doseBox] = Compute_Dose_Box(PTV, OAR)
    
    PTVradius = PTV(1);
    PTVcenter = [PTV(2),PTV(3),PTV(4)];
    OARradius = OAR(1);
    OARcenter = [OAR(2), OAR(3), OAR(4)];
    
    xPositions = [PTVcenter(1) + PTVradius, PTVcenter(1) - PTVradius, OARcenter(1) + OARradius, OARcenter(1) - OARradius];
    yPositions = [PTVcenter(2) + PTVradius, PTVcenter(2) - PTVradius, OARcenter(2) + OARradius, OARcenter(2) - OARradius];
    zPositions = [PTVcenter(3) + PTVradius, PTVcenter(3) - PTVradius, OARcenter(3) + OARradius, OARcenter(3) - OARradius];
    
    LowerLeft = [min(xPositions),min(yPositions),min(zPositions)];
    UpperRight = [max(xPositions),max(yPositions),max(zPositions)];
        
    doseBox = [LowerLeft, UpperRight];
    
    

end