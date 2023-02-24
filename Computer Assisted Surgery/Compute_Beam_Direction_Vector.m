% Function Compute_Beam_Direction_Vector used for Gamma Knife radiosurgery.
% This function creates a line from the point on the helmet with given
% longitude and latitude and the isocenter (where the target will be), then
% computes the direction vector.
% Inputs: Beam Longitude (long)
%         Beam Latitude (lat)
%
% Output: Beam Direction Vector (dirVec)
%
% Function created on Decemeber 6, 2015 by Eric Braun

function [dirVec] = Compute_Beam_Direction_Vector(long, lat)

    % Convert longitude and latitude to radians.
    long = (long * pi)/180;
    lat = (lat * pi)/180;

    % Because the latitude is the degree between "equator" plane and line between
    % point and center, and longitude is degree between vertical plane and
    % line between point and center, we can use them as azimuth and
    % elevation
    x = cos(lat) .* cos(long);
    y = cos(lat) .* sin(long);
    z = sin(lat);  
    
    % Create point on hemisphere
    Point1 = [x,y,z];
    Point2 = [0,0,0]; % isocenter.
    
    % Distance between source and isocenter
    dirVec = Point2 - Point1;
    % Normalize
    dirVec = dirVec/norm(dirVec);

end