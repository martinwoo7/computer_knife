% Function used to compute the radiation dose accumualated at one point
% from all the x-ray beams. 
% This function will check the SafetyTable, if the point = 1, then it will
% compute the dose from that beam while adding it to the running sum
%
% Created on December 13 2015 by Eric Braun 10121660

function[doseValue] = Compute_Point_Dose_from_All_Beams(head, helmet, OAR, isocenter, point)

    global SafetyTable;
    radius = helmet(2);
    sizeT = size(SafetyTable);
    runningDose = 0;
    
    % Check all values in table for 1
    for i = 2:sizeT(1)
        for j = 2:sizeT(2)
            if (SafetyTable(i,j) == 1)
                % Add this beam to running dose
                runningDose = runningDose + Compute_Point_Dose_from_Beam(head,radius,SafetyTable(i,1),SafetyTable(1,j),isocenter,point);                
            end
        end
    end
    doseValue = runningDose;
end