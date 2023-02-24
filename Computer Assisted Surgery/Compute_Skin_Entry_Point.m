% Function used to compute where the Gamma Knife x-ray will go through the
% person's skin. This function creates a line from the isocenter(tumor) and
% the point on the helmet determined by the longitude and latitude of source
% and radius of Gamma Knife. It then finds the intersection of this line
% and the head, defined as an elipsoid with 3 axis, A, B, and C. It then
% determines which of the (probable) 2 intersection points is closer to the
% source, and uses that as the skin entry point.
%
% Inputs: Ellipsoid of head given as [A,B,C] vertices (head)
%         Longitude of beam source (long)
%         Latitude of beam source (lat)
%         Center of hemisphere helmet (isocenter)
%         Radius of Gamma Knife helmet (radius)
%
% Output: Calculated skin entry point (EntryPoint)

function [EntryPoint] = Compute_Skin_Entry_Point(head, long, lat, isocenter)
    
    directionVector = Compute_Beam_Direction_Vector(long,lat);
    Point = isocenter - directionVector;

    % Calls question 4, assignment 1. Intersection of ellipsoid and line.
    % Outputs the two found intersections.
    % Use James Choi's code because mine was not working properly
    [EntryPoint1, EntryPoint2] = f4(Point, isocenter, head(1), head(2), head(3));
    
    
    
    if (EntryPoint1(3) > EntryPoint2(3))
        EntryPoint = EntryPoint1;
        return;
    else if (EntryPoint1(3) < EntryPoint2(3))
        EntryPoint = EntryPoint2;
        return;
    end
    if (isocenter(1) > isocenter(2))
            if (EntryPoint1(1) > EntryPoint2(1))
                EntryPoint = EntryPoint1;
                return;
            else if (EntryPoint1(1) < EntryPoint2(1))
                    EntryPoint = EntryPoint2;
                    return;
                end
            end
    end
    if (isocenter(2) > isocenter(1))
        if (EntryPoint1(2) > EntryPoint2(2))
            EntryPoint = Entrypoint1;
            return;
        else if (EntryPoint1(2) < EntryPoint2(2))
                EntryPoint = EntryPoint2;
                return;
            end
        end
    end
    EntryPoint = EntryPoint1;
    
end