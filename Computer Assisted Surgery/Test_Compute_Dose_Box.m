% Function used to test question 1, Compute Dose Box, for Gamma Knife
% radiosurgery.
%
% Function created on December 13th, 2015 by Eric Braun 10121660


function [] = Test_Compute_Dose_Box(PTV,OAR)
    global doseBox;
    doseBox = Compute_Dose_Box(PTV, OAR);
    fprintf('Primary target position: [%d,%d,%d]',PTV(2),PTV(3),PTV(4));
    fprintf('\n');
    fprintf('Primary target radius: %d', PTV(1));
    fprintf('\n');
    fprintf('Organ at risk position: [%d,%d,%d]',OAR(2),OAR(3),OAR(4));
    fprintf('\n');
    fprintf('Organ at risk radius: %d', OAR(1));
    fprintf('\n');
    disp('Dose Box: ');
    fprintf('\n');
    disp(doseBox);
end



