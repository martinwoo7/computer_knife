% Function to test question 4, HW4, CISC330 compute radial distance between
% an arbirary point and a line.
%
% Created on December 13th, 2015

function [] = Test_Compute_Radial_Distance()
    disp('First case: ');
    disp('Point: [2,2,0]');
    disp('Point on line: [3,4,0]');
    disp('Line direction vector: [0,-1,0]');
    P = [2,2,0];
    Pl = [3,4,0];
    V = [0,-1,0];
    distance = Compute_Radial_Distance(P,[Pl,V]);
    fprintf('Distance: %d', distance);
    fprintf('\n');
    fprintf('\n')
    disp('Second case: ');
    disp('Point: [5,0,0]');
    disp('Point on line: [0,0,0]');
    disp('Line direction vector: [4,3,0]');
    P2 = [5,0,0];
    Pl2 = [0,0,0];
    V2 = [4,3,0];
    distance2 = Compute_Radial_Distance(P2,[Pl2,V2]);
    fprintf('Distance: %d', distance2);
    fprintf('\n');
end