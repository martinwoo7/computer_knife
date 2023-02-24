Poses = 20;
Range = 45;
matPoints = drillBitSim(Poses, Range);

	% this is solved using pseudo-inverse
	[x] = drillbitCali(matPoints);

	% this is solved using sphere fitting
	[y] = drillbitCali2(matPoints);

	


	