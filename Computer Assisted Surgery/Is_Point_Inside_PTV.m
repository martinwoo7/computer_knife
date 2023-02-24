% Function to check if a point is within the primary target volume(PTV)
% Returns a 2 if it within the PTV and 0 if it is not

function[inPTV] = Is_Point_Inside_PTV(Point, PTV)
    
   PTVradius = PTV(1);
   PTVpos = [PTV(2), PTV(3), PTV(4)];
   
   dist = norm(Point - PTVpos);
  
   if (dist <= PTVradius)
       inPTV = 1;
   else 
       inPTV = 0;
   end

end