function [] = main()
	
	head = [80, 100, 80, 0, 0, 0];
	PTV = [15, 30, 0, 15];
	OAR = [15, 0, 30, 45];
	helmet = [10, 15];
	isocenter = [PTV(2), PTV(3), PTV(4)];
	
	fprintf('\n');
	
% 	% 1. Compute dose box around PTV and OAR
	disp('Question 1: Compute Dose Box');
	fprintf('\n');
	Test_Compute_Dose_Box(OAR, PTV);
	fprintf('\n');
	
	% 2. Create 3D plot of head w/ PTV OAR and Isocenter
	disp('Question 2: Create 3D scene');
	Test_Draw_3D_Scene(head, PTV, OAR);
	fprintf('\n');
% 	
	% 3. Compute_Linear_Function
	disp('Question 3: Compute Linear Function');
	fprintf('\n');
	Test_Compute_Linear_Function;
	fprintf('\n');
% 	
	% 4. Compute radial distance of point from line
	disp('Question 4: Compute Radial Distance');
	fprintf('\n');
	Test_Compute_Radial_Distance;
	fprintf('\n');
% 	
	% 5. Compute radiation dose from depth
	disp('Question 5: Compute Depth Dose');
	fprintf('\n');
	Test_Compute_Depth_Dose(head);
	fprintf('\n');
% 	
	% 6. Compute radiation dose from radius
	disp('Question 6: Compute Radial Dose');
	fprintf('\n');
	Test_Compute_Radial_Dose(helmet);
	fprintf('\n');
% 	
	% 7. Compute Beam Direction Vector
	disp('Question 7: Compute Beam Direction Vector');
	fprintf('\n');
	Test_Compute_Beam_Direction_Vector;
	fprintf('\n');
% 	
	% 9. Compute Skin entry Point Table
	disp('Question 9: Compute Skin Entry Point Table')
	Test_Compute_Skin_Entry_Point_Table(head, helmet, isocenter);
	fprintf('\n');
% 	
	% 11. Compute Beam Safety Table
	disp('Question 11: Compute Beam Safety Table');
	fprintf('\n');
	Test_Compute_Beam_Safety_Table(helmet, isocenter, OAR);
	fprintf('\n');
% 	
	% 12. Compute Point Dose from Beam
	disp('Question 12: Compute Point Dose from Beam');
	fprintf('\n');
	Test_Compute_Point_Dose_from_Beam(head, helmet, isocenter);
	fprintf('\n');
% 	
	% 14. Compute Dose Volume Histogram
	disp('Question 14: Compute Dose Volume Histogram');
	fprintf('\n');
	Compute_Dose_Volume_Histogram(head, helmet, PTV, OAR, isocenter);
	fprintf('\n');
% 	
% 	% 15. Compute Surface Dose
	disp('Question 15: Compute Surface Dose of PTV and OAR');
	fprintf('\n');
	Compute_Surface_Dose(head, helmet, isocenter, PTV, OAR);
	fprintf('\n');
% 	
	% 16. Compute Dose Surface Histogram
	disp('Question 16: Compute Dose Surface Histogram');
	fprintf('\n');
	Compute_Surface_Dose_Histogram(head, helmet, isocenter, PTV, OAR);
	fprintf('\n');


end