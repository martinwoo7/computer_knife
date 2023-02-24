function [] = Test_Compute_Point_Dose_from_Beam(head, helmet, isocenter)

	disp('Computed radiation doses at [0,0,0]');
	disp('Isocenter point at [0,0,0]');
	radius = helmet(2);
	point = [0,0,0];
	isocenter = [0,0,0];
	
	dose1 = Compute_Point_Dose_from_Beam(head, radius, 0, 0, isocenter, point);
	disp('Longitude of 0 degrees, latitude of 0 degrees');
	disp(dose1);
	fprintf('\n');

	dose2 = Compute_Point_Dose_from_Beam(head, radius, 0, 90, isocenter, point);
	disp('Longitude of 0 degree, latitude of 90 degrees');
	disp(dose2);
	fprintf('\n');

	dose3 = Compute_Point_Dose_from_Beam(head, radius, 90, 0, isocenter, point);
	disp('Longitude of 90 degrees, latitude of 0 degrees');
	disp(dose3);
	fprintf('\n');

	dose4 = Compute_Point_Dose_from_Beam(head, radius, 90, 90, isocenter, point);
	disp('Longitude of 90 degrees, latitude of 90 degrees');
	disp(dose4);
	
% 	global RadialDoseTable;
% 	disp(RadialDoseTable);
% 	global DepthDoseTable;
% 	disp(DepthDoseTable);

end