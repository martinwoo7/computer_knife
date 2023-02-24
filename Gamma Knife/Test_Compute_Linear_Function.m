function [y] = Test_Compute_Linear_Function(P1,P2,x)

	point1 = [1,1];
	point2 = [5,5];
	disp('First point: [1,1]');
	disp('Second point: [5,5]');
	for x = 0:6
		y = Compute_Linear_Function(point1, point2, x);
		disp(sprintf('x-value: %d		y-value:%d',x,y));
	end

end