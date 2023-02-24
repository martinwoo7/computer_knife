% Function to test question 6, HW4, CISC 330. Compute radial dose.
%
% Created on December 13th, 2015 by Eric Braun 10121660.

function[] = Test_Compute_Radial_Dose(Helmet)
    disp('Test: Replicate graph from assignment.');
    disp('Max radial distance: 3');
    disp('Beam radius: 1');
    disp('Resolution increment: 1');
    table = Compute_Radial_Dose(3,1,1);
    disp('Radial dose look up table: ');
    disp(table);
    
    radius = Helmet(2);
    maxDist = 3 * radius;
    global RadialDoseTable;
    RadialDoseTable = Compute_Radial_Dose(maxDist, radius, 1);

end