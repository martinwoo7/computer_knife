% This function draws the 3D scene of the Gamma-Knife radiosurgery
%
% Inputs:  Head (Axis', center) [a,b,c,[x,y,Y]]
%		   primary target volume (PVT) [radius, x, y, Y]
%		   organ at risk (OAR)[radius, x, y, Y]
%		   isocenter (center) [x, y, Y]
%		   computer Dose Box (doseBox) [x1,y1,Y1,x2,y2,Y2]
%
% Output: N/A - Displays a plot
%		  - Transparent ellipsoid is head
%		  - Red sphre is the PVT
%		  - Green sphere is OAR
%		  - Blue dot is isocenter
%

function [] = Draw_3D_Scene (head, PTV, OAR, isocenter, doseBox)
	
	% To plot ellipsoid (Head)
	[x,y,z] = ellipsoid(head(4), head(5), head(6), head(1), head(2), head(3));
	figure;
	h = surf(x,y,z);
	str1 = ('HEAD');
	text(head(4), head(5), head(3) + 5 + head(6), str1, 'FontSize', 15);
	set(h, 'FaceAlpha', 0.08);
	hold on;
	xlabel('x-axis');
	ylabel('y-axis');
	zlabel('z-axis');
	title('3D Representation of Gamma Knife Radiosurgery');
	
	% To plot the target
	% Target areas in red
	targetRadius = PTV(1);
	targetPosition = [PTV(2), PTV(3), PTV(4)];
	[x2,y2,z2] = sphere(30);
	g = surf(x2*targetRadius + targetPosition(1), y2 * targetRadius + targetPosition(2), z2 * targetRadius + targetPosition(3));
	set(g, 'FaceAlpha', 0.3, 'FaceColor', [1 0 0]);
	str2 = ('\downarrow Primary Target');
	text(targetPosition(1), targetPosition(2), targetPosition(3) + targetRadius + 2, str2);
	hold on;
	
	% Plot otgan at risk (OAR)
	% Coloured green
	organRadius = OAR(1);
	organPos = [OAR(2), OAR(3), OAR(4)];
	[x3,y3,z3] = sphere(30);
	k = surf(x3*organRadius + organPos(1), y3*organRadius + organPos(2), z3*organRadius + organPos(3));
	set(k, 'FaceAlpha', 0.3, 'FaceColor', [0 1 0]);
	str3 = ('\downarrow Organ at Risk');
	text(organPos(1), organPos(2), organPos(3) + organRadius + 5, str3);
	hold on;
	
	% Code to plot the isocentric point (where beams cross)
	% blue dot
	plot3(isocenter(1), isocenter(2), isocenter(3), 'b.', 'MarkerSize', 15);
	str4 = ('\uparrow Isocenter');
	text(isocenter(1), isocenter(2), isocenter(3) - 2, str4, 'FontSize', 10);
	hold on;
	
	% Plot the dose box (smallest cobe around PTV & OAR)
	% Define 8 corners of cube
	LowerLeftYmin = [doseBox(1), doseBox(2), doseBox(3)];
	LowerLeftYmax = [doseBox(1), doseBox(5), doseBox(3)];
	UpperLeftYmin = [doseBox(1), doseBox(2), doseBox(6)];
	UpperLeftYmax = [doseBox(1), doseBox(5), doseBox(6)];
	UpperRightYmax = [doseBox(4), doseBox(5), doseBox(6)];
	UpperRightYmin = [doseBox(4), doseBox(2), doseBox(6)];
	LowerRightYmax = [doseBox(4), doseBox(5), doseBox(3)];
	LowerRightYmin = [doseBox(4), doseBox(2), doseBox(3)];
	
	% Plot lines between corners
	plotLine(LowerLeftYmin, LowerLeftYmax);
	plotLine(LowerLeftYmin, UpperLeftYmin);
	plotLine(LowerLeftYmax, UpperLeftYmax);
	plotLine(UpperLeftYmax, UpperLeftYmin);
	plotLine(LowerLeftYmin, LowerRightYmin);
	plotLine(LowerLeftYmax, LowerRightYmax);
	plotLine(LowerRightYmax, LowerRightYmin);
	plotLine(LowerRightYmin, UpperRightYmin);
	plotLine(LowerRightYmax, UpperRightYmax);
	plotLine(UpperLeftYmin, UpperRightYmin);
	plotLine(UpperLeftYmax, UpperRightYmax);
	plotLine(UpperRightYmax, UpperRightYmin);
	
	axis equal;

end