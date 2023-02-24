diff = [0 0 0];
figure; hold on;
xlabel('x axis');
ylabel('y axis');
for i = 0:0.1:5
	points = drillBitSim(20,0);
	r = (i - 0).*rand(1);
	r2 = (i - 0).*rand(1);
	r3 = (i - 0).*rand(1);		
	points(:,1) = points(:,1) + r;
	points(:,2) = points(:,2) + r2;
	points(:,3) = points(:,3) + r3;
	
	[y] = drillbitCali2(points);
	diff = [-7 0 -22] - y;
	
	Emax = i * 10;
	temp = max(diff);
	plot(Emax,temp,'r.');

	if max(diff) >= 0.1
		break;
	end
end

