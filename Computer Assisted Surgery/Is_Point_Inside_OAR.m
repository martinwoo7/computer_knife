% Function to check if a given point is within the organ at risk (OAR)
% Outputs 1 if it is within the OAR and 0 if it is not.

function[inOAR] = Is_Point_Inside_OAR(Point, OAR)

    OARradius = OAR(1);
    OARpos = [OAR(2), OAR(3), OAR(4)];
    
    dist = norm(Point - OARpos);
    
    if (dist <= OARradius)
        inOAR = 1;
    else 
        inOAR = 0;
    end

end