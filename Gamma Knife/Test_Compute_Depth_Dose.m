function [] = Test_Compute_Depth_Dose(head)

	disp('Test: Replicate graph in assignment');
	disp('Max depth: 18');
	disp('d0: 2');
	disp('Resolution increment: 1');
	table = Compute_Depth_Dose(18,2,1);
	disp('Depth dose look up table: ');
	disp(table);
	
	maxDepth = max(head);
	maxDepth = maxDepth * 2;
	global DepthDoseTable;
	DepthDoseTable = Compute_Depth_Dose(maxDepth, 2, 1);

end