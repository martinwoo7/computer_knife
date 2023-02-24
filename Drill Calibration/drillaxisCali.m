function len = drillaxisCali(matPoints) 
	% sum together a point to get the average. Then find the vector from the
	% averaged point with the drill bit point.
	
	[x] = drillbitCali(matPoints);
	plot3(x(4,:),x(5,:),x(6,:),'*');
	% This is in tracker
	% [x] = drillbitCali2(matPoints);
	
	% finf the avg point in the marker coord system
	avgVal = mean(matPoints);
	len = (avgVal' - x(4:6,:))/norm(avgVal' - x(4:6,:));

end