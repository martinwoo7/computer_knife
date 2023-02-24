% Function to test question 11, HW 3, CISC 330. Compute Beam Safety Table
%
% Created on December 13th 2015 by Eric Braun 10121660

function [] = Test_Compute_Beam_Safety_Table(Helmet,isocenter, OAR)
    fprintf('isocenter located at: [%d %d %d]', isocenter(1),isocenter(2),isocenter(3));
    fprintf('\n');
    fprintf('Organ at risk located at: [%d %d %d] with radius of %d', OAR(2), OAR(3), OAR(4), OAR(1));
    fprintf('\n');
    fprintf('\n');
    global SafetyTable;
    [SafetyTable] = Compute_Beam_Safety_Table(Helmet,isocenter,OAR);
    disp(SafetyTable);
end