% Function to test question 12, HW3, CISC 330. Calculate dose point from a
% beam.
%
% Created on December 14th, 2015 by Eric Braun 10121660.

function[] = Test_Compute_Point_Dose_from_Beam(Head,Helmet,Isocenter)
    disp('Computed radiation doses at [0,0,0]');
    disp('Isocenter point at [0,0,0]');
    radius = Helmet(2);
    Point = [0,0,0];
    Isocenter = [0,0,0];
    dose1 = Compute_Point_Dose_from_Beam(Head,radius,0,0,Isocenter,Point);
    disp('Longitude of 0 degrees, Latitude of 0 degrees');
    disp(dose1);
    fprintf('\n');
    dose2 = Compute_Point_Dose_from_Beam(Head,radius,0,90,Isocenter,Point);
    disp('Longitude of 0 degrees, Latitude of 90 degrees');
    disp(dose2);
    fprintf('\n');
    dose3 = Compute_Point_Dose_from_Beam(Head,radius,90,0,Isocenter,Point);
    disp('Longitude of 90 degrees, Latitude of 0 degrees');
    disp(dose3);
    fprintf('\n');
    dose4 = Compute_Point_Dose_from_Beam(Head,radius,90,90,Isocenter,Point);
    disp('Longitude of 90 degrees, Latitude of 90 degrees');
    disp(dose4);
    global RadialDoseTable;
    disp(RadialDoseTable);
    global DepthDoseTable;
    disp(DepthDoseTable);
end