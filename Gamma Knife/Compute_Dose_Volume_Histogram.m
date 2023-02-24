% This function creates dose volume histograms. This checks every point
% insdie the dosebox at given interval or voxelsize to finf which points
% are in OAR and which are in PTV.
% After finding points, it will compute dose from all beams for every point
% in each organ then plot histograms

function [] = Compute_Dose_Volume_Histogram (head, helmet, PTV, OAR, center)

	global doseBox;
	lowerLeft = [doseBox(1), doseBox(2), doseBox(3)];
	upperRight = [doseBox(4), doseBox(5), doseBox(6)];
	
	OARpoints = [];
	oCount = 1;
	PTVpoints = [];
	pCount = 1;
	
	% Define increment/voxsize
	voxelSize = 2;
	
	% Check dose vox for which point are in OAR and PTV
	for i = lowerLeft(1):voxelSize:upperRight(1)
		for j = lowerLeft(2):voxelSize:upperRight(2)
			for k = lowerLeft(3):voxelSize:upperRight(3)
				if (Is_Point_Inside_OAR([i,j,k], OAR) == 1)
					OARpoints(oCount, 1:3) = [i,j,k];
					oCount = oCount + 1;
				end
				if (Is_Point_Inside_PTV([i,j,k], PTV) == 1)
					PTVpoints(pCount, 1:3) = [i,j,k];
					pCount = pCount + 1;
				end
			end
		end
	end
	
% 	disp(PTVpoints);
% 	disp(OARpoints);
	
	OARdose = [];
	PTVdose = [];
	sizeO = size(OARpoints);
	sizeO = sizeO(1);
	sizeP = size(PTVpoints);
	sizeP = sizeP(1);
	
	% Calculate the dosevalue for every point in each OARdose and PTVdose
	for i = 1:sizeO
		OARdose(i,1) = Compute_Point_Dose_from_All_Beams(head, helmet, OAR, center, OARpoints(i,:));
	end
	
	for j = 1:sizeP
		PTVdose(j,1) = Compute_Point_Dose_from_All_Beams(head, helmet, OAR, center, PTVpoints(j,:));
	end
	
	figure;
	
	% Plot histogram
	his1 = histogram(OARdose);
	title('OAR');
	xlabel('Radiation dose');
	ylabel('Number of points');
	
	figure;
	his2 = histogram(PTVdose);
	title('PTV');
	xlabel('Radiation dose');
	ylabel('Number of points');
	

end