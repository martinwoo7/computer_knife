% Function to test HW4 CISC330
%
% Function created on December 11th, 2015 by Eric Braun 10121660


function[] = main4()

    Head = [80, 100, 80, 0, 0, 0];
    PTV = [15, 30, 0, 15];
    OAR = [15, 0, 30, 45];
    Helmet = [10, 15];
    Isocenter = [PTV(2), PTV(3), PTV(4)];
    
    fprintf('\n');

    % 1. Compute dose box around PTV & OAR
    disp('Question 1: Compute Dose Box');
    fprintf('\n');
    Test_Compute_Dose_Box(OAR, PTV);
    fprintf('\n');

    % 2. Create 3D plot of head w/ PTV OAR & isocenter
    disp('Question 2: Create 3D Scene');
    Test_Draw_3D_Scene(Head, PTV, OAR);
    fprintf('\n');
    
    % 3. Compute_Linear_Function
    disp('Question 3: Compute Linear Function');
    fprintf('\n');
    Test_Compute_Linear_Function;
    fprintf('\n')

    % 4. Compute radial distance of point from line
    disp('Question 4: Compute Radial Distance');
    fprintf('\n');
    Test_Compute_Radial_Distance;
    fprintf('\n');
    
    % 5. Compute radiation dose from depth
    disp('Question 5: Compute Depth Dose');
    fprintf('\n');
    Test_Compute_Depth_Dose(Head);
    fprintf('\n');
    
    % 6. Compute radiation dose from radius
    disp('Question 6: Compute Radial Dose');
    fprintf('\n');
    Test_Compute_Radial_Dose(Helmet);
    fprintf('\n');
    
    % 7. Compute Beam Direction Vector
    disp('Question 7: Compute Beam Direction Vector');
    fprintf('\n');
    Test_Compute_Beam_Direction_Vector;
    fprintf('\n');
    
    % 9. Compute Skin Entry Point Table
    disp('Question 9: Compute Skin Entry Point Table');
    Test_Compute_Skin_Entry_Point_Table(Head,Helmet,Isocenter);
    fprintf('\n');
    
    % 11. Compute Beam Safety Table
    disp('Question 11: Compute Beam Safety Table');
    fprintf('\n');
    Test_Compute_Beam_Safety_Table(Helmet,Isocenter,OAR);
    fprintf('\n');
    
    % 12. Compute Point Dose from Beam
    disp('Question 12: Compute Point dose from a Beam');
    fprintf('\n');
    Test_Compute_Point_Dose_from_Beam(Head,Helmet,Isocenter);
    fprintf('\n');
    
    % 14, Compute Dose Volume Histogram
    disp('Question 14: Compute Dose Volume Histogram');
    fprintf('\n');
    Compute_Dose_Volume_Histogram(Head,Helmet,PTV,OAR,Isocenter);
    fprintf('\n');
    
    % 15. Compute Surface Dose
    disp('Question 15: Compute Surface Dose of PTV and OAR');
    Compute_Surface_dose(Head,Helmet,Isocenter,PTV,OAR);
    fprintf('\n');
    
    % 15. Compute Dose Surface Histogram
    disp('Question 16: Compute Dose Surface Histogram');
    Compute_Dose_Surface_Histogram(Head,Helmet,Isocenter,PTV);
    fprintf('\n');
    
    
end