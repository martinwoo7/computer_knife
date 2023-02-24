% Creates a histogram of surface radiation for both the OAR and PTV
function [] = Compute_Surface_Dose_Histogram (head, helmet, isocenter, PTV, OAR)

	[doseValues] = Compute_Surface_Dose(head, helmet, isocenter, PTV, OAR);
	figure;
	h = histogram(doseValues);
	xlabel('Radiation dose');
	ylabel('Number of points');
	title('Radiation on surface of PTV');



end