% Function to test question 2, HW4, CISC 330. Draw 3D Scene.
%
% Function created on December 13th, 2015 by Eric Braun 10121660

function [] = Test_Draw_3D_Scene(Head,PTV,OAR)
    disp('isocenter choosen to be center of PTV.');
    isocenter = [PTV(2),PTV(3),PTV(4)];
    doseBox = Compute_Dose_Box(PTV,OAR);
    Draw_3D_Scene(Head,PTV,OAR,isocenter,doseBox);
end