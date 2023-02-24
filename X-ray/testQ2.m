	[x,y,z] = makeSphere(100, 3);
	
	k = tumorProject(0, [x y z]);
	
	[xx, yy, zz] = rand_ellipsoid(100, [1,2,3]);
	
	l = tumorProject(0, [xx,yy,zz]);
	
	j = tumorProject(90, [xx,yy,zz]);
	
	
