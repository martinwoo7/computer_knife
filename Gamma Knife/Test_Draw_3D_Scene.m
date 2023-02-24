function [] = Test_Draw_3D_Scene (head, PTV, OAR)

	disp('Isocenter is chosen to be the center of PTV.');
	isocenter = [PTV(2),PTV(3),PTV(4)];
	doseBox = Compute_Dose_Box(PTV, OAR);
	Draw_3D_Scene(head, PTV, OAR, isocenter, doseBox);
	
end