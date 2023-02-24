% Function to test Question 9, HW4, CISC330. Compute skin entry point table
% 
% Created on December 14th 2015 by Eric Braun 10121660

function[] = Test_Compute_Skin_Entry_Point_Table(head,helmet,isocenter)
    fprintf('Skin entry point table with isocenter at [%d,%d,%d]',isocenter(1),isocenter(2),isocenter(3));
    fprintf('\n');
    global SkinPointTable;
    [SkinPointTable] = Compute_Skin_Entry_Point_Table(head,helmet,isocenter);
    disp(SkinPointTable);
end