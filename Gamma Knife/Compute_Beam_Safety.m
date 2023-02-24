% This function checks if a beam from a certain longitude and latitude on
% the Gamma Knife radiosurgery helmet will be "safe" or not.
%	- a beam is safe if it dose not contact the organ at risk (OAR): 1
%	- a beam is unsafe if it does contact: 0
%
% Inputs: beam radius (radius) [int]
%		  source longitude (longitude) [int]
%		  source latitude (latitude) [int]
%		  isocenterPoint (center) [x,y,z]
%		  organ at risk (OAR) [radius, x,y,z]

function [safeCheck] = Compute_Beam_Safety (helmet, longitude, latitude, isocenter, OAR)

	beamRadius = helmet(2);
	EntryVector = Compute_Beam_Direction_Vector(longitude, latitude);
	
	OARradius = OAR(1);
	OARpos = [OAR(2), OAR(3), OAR(4)];
	
	beamLine = [isocenter, EntryVector];
	dist = Compute_Radial_Distance(OARpos, beamLine);
	
	if (dist <= beamRadius + OARradius)
		safeCheck = 0;
	else
		safeCheck = 1;
	end

end