function [] = Test_Compute_Radial_Distance ()
	disp('First case: ');
	disp('Point: [2,2,0]');
	disp('Point on line: [3,4,0]');
	disp('Line direction vector: [0,-1,0]');
	
	P = [2,2,0];
	p1 = [3,4,0];
	v = [0,-1,0];
	
	distance = Compute_Radial_Distance(P,[p1,v]);
	
	fprintf('Distance: %d', distance);
	fprintf('\n');
	fprintf('\n');
	disp('Second case: ');
	disp('Point: [5,0,0]');
	disp('Point on line: [0,0,0]');
	disp('Line direction vector: [4,3,0]');
	
	P2 = [5,0,0];
	p12 = [0,0,0];
	v2 = [4,3,0];
	
	distance2 = Compute_Radial_Distance(P2,[p12,v2]);
	
	fprintf('Distance: %d', distance2);
	fprintf('\n');

end