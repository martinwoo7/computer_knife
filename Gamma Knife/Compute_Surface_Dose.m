% Function computes the amount of radiation on the surface of bot hthe OAR
% and PTV. Plots the points on spheres using sphere(). It will compute the
% dose of the points using Compute_Point_Dose_from_All_Beams. It will then
% find the min max of each organ and create a color scale and display the
% figure

function [dosePTV] = Compute_Surface_Dose (head, helmet, isocenter, PTV, OAR)

	% Define PTV Sphere
	PTVradius = PTV(1);
	PTVpos = [PTV(2), PTV(3), PTV(4)];
	
	[x,y,z] = sphere(30);
	
	x1 = PTVradius * x + PTVpos(1);
	y1 = PTVradius * y + PTVpos(2);
	z1 = PTVradius * z + PTVpos(3);
	
	% Define OAR sphere
	OARradius = OAR(1);
	OARpos = [OAR(2), OAR(3), OAR(4)];
	
	x2 = OARradius * x + OARpos(1);
	y2 = OARradius * y + OARpos(2);
	z2 = OARradius * z + OARpos(3);
	
	% Compute the dose radiation for the points on the spheres
	dosePTV = [];
	doseOAR = [];
	[n,m] = size(x1);
	maxPTVdose = 0;
	maxOARdose = 0;
	minPTVdose = 1000;
	minOARdose = 1000;
	
	% Calculate radiation at surface poitns, find min, max, and positions
	for i = 1:n
		for j = 1:m
			Point1 = [x1(i,j), y1(i,j), z1(i,j)];
			Point2 = [x2(i,j), y2(i,j), z2(i,j)];
			dosePTV(i) = Compute_Point_Dose_from_All_Beams(head, helmet, OAR, isocenter, Point1);
			if (dosePTV(i) > maxPTVdose)
				maxPTVdose = dosePTV(i);
				maxPTVpoint = Point1;
			end
			if (dosePTV(i) < minPTVdose)
				minPTVdose = dosePTV(i);
				minPTVpoint = Point1;
			end
			doseOAR(i) = Compute_Point_Dose_from_All_Beams(head, helmet, OAR, isocenter, Point2);
			if (doseOAR(i) > maxOARdose)
				maxOARdose = doseOAR(i);
				maxOARpoint = Point2;
			end
			if (doseOAR(i) < minOARdose)
				minOARdose = doseOAR(i);
				minOARpoint = Point2;
			end
		end
	end
	
	%Print
	fprintf('Hottest dose on PTV: %f, located at [%f,%f,%f]', maxPTVdose, maxPTVpoint(1), maxPTVpoint(2), maxPTVpoint(3));
	fprintf('\n');
	fprintf('Coldest dose on PTV: %f, located at [%f,%f,%f]', minPTVdose, minPTVpoint(1), minPTVpoint(2), minPTVpoint(3));
	fprintf('\n');
	fprintf('Hottest dose on OAR: %f, located at [%f,%f,%f]', maxOARdose, maxOARpoint(1), maxOARpoint(2), maxOARpoint(3));
	fprintf('\n');
	fprintf('Coldest dose on OAR: %f, located at [%f,%f,%f]', minOARdose, minOARpoint(1), minOARpoint(2), minOARpoint(3));


	% Doesn't work
% 	surf(x1,y1,z1,dosePTV);
% 	shading interp;
% 	
% 	surf(x2,y2,z2,doseOAR);
% 	shading interp;
% 	
% 	color = [];
% 	
% 	sizeP = size(dosePTV);
% 	sizeP = sizeP(1);
% 	for i = 1:sizeP
% 		color(i) = dosePTV(i)/100;
% 		plot3(x1(i),y1(i),z1(i),'Color',[color(i),0,0]);
% 	end
% 	
% 	plot3(x2,y2,z2, 'Color', [color,0,0]);
% 	plot3(x1,y1,z1,dosePTV);
% 	
% 	str1 = ('Hottest PTV points');
% 	text(maxPTVpoint(1) + 4, maxPTVpoint(2), maxPTVpoint(2), str1);

end