function [] = Test_Compute_Radial_Dose(helmet)

	disp('Test: Replicate graph from assignment.');
	disp('Max radial distance: 45');
	disp('Beam radius: 15');
	disp('Resolution increment: 1');
	table = Compute_Radial_Dose(45,15,1);
	disp('Radial dose look up table: ');
	disp(table);
	
	radius = helmet(2);
	maxDist = 3 * radius;
	global RadialDoseTable;
	RadialDoseTable = Compute_Radial_Dose(maxDist, radius, 1);


end