function [] = Test_Compute_Beam_Safety_Table(helmet, isocenter, OAR)

	fprintf('isocenter located at: [%d,%d,%d]', isocenter(1), isocenter(2), isocenter(3));
	fprintf('\n');
	fprintf('Organ at risk @: [%d,%d,%d] with radius is %d', OAR(2), OAR(3), OAR(4), OAR(1));
	fprintf('\n');
	fprintf('\n');
	
	global SafetyTable;
	[SafetyTable] = Compute_Beam_Safety_Table(helmet, isocenter, OAR);
	disp(SafetyTable);

end