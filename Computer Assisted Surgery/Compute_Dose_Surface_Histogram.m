% Function used to create a histogram of radiation from the surface of both
% the OAR and PTV.
%
% Function created on December 13 2015 by Eric Braun 10121660

function [] = Compute_Dose_Surface_Histogram(head, helmet, isocenter, PTV, OAR)
    
    [doseValues] = Compute_Surface_Dose(head, helmet, isocenter, PTV, OAR);
    figure;
    h = histogram(doseValues);
    xlabel('Radiation dose');
    ylabel('Amount of points');
    title('Radiation on surface of PTV');


end