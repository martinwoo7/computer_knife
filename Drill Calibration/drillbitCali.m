 function [x] = drillbitCali(markers)
% [bit] = drillbitCali(markers) where markers is a array of [A,B,C] tracked
% markers, where A, B, C are vectors.
% Returns the drillbit position in marker system 

% Remember that we need to transform the drillbit into the
% marker system before returning.

% First implementation of drill bit calibration
A = [];
b = [];
oneMat = ones(3);
oneMat = -oneMat;
	for i = 1:3:length(markers)
		[R,t] = rigid(markers(i,:),markers(i+1,:),markers(i+2,:));
		A = vertcat(A, [R oneMat]);
		b = vertcat(b, -t);
	end
% Solves for Ax = b
x = pinv(A)*b;
end