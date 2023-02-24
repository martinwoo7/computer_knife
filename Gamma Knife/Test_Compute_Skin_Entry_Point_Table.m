function [] = Test_Compute_Skin_Entry_Point_Table(head, helmet, isocenter)

	fprintf('Skin entry point table with isocenter @ [%d,%d,%d]', isocenter(1), isocenter(2), isocenter(3));
	fprintf('\n');
	global SkinPointTable;
	[SkinPointTable] = Compute_Skin_Entry_Point_Table(head, helmet, isocenter);
	disp(SkinPointTable);


end