% This function computes the radial distance between the center line of a
% beam in Gamma Knife radiosurgery and an arbitrary point in space
%
% Inputs: the arbitrary point in space (Point) [x,y,z]
%		  the beam line (Line): (point on line, direction vector)
%				- [xPoint, yPoint, zPoint, xVec, yVec, zVec]
%
% Output: distance between cetner line and point (distance) [int]

function [distance] = Compute_Radial_Distance (Point, Line)

	LinePoint = [Line(1), Line(2), Line(3)];
	beamDirVec = [Line(4), Line(5), Line(6)];
	
	% Find direction vector of line perpendicular to beam through point
	pointLineDirVec = (Point - LinePoint);
	pointLineDirVec = cross(pointLineDirVec, beamDirVec);
	
	distance = pointLineDirVec/ norm(beamDirVec);
	distance = norm(distance);

end