function [inPTV] = Is_Point_Inside_PTV (Point, PTV)

	PTVradius = PTV(1);
	PTVpos = [PTV(2), PTV(3), PTV(4)];
	
	dist = norm(Point - PTVpos);
	
	if (dist <= PTVradius)
		inPTV = 1;
	else 
		inPTV = 0;
	end
end