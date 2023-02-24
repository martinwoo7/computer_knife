% Function to test question 5, HW3, CISC 330. Compute radiation dose from
% depth.
%
% Created on December 13th, 2015

function [] = Test_Compute_Depth_Dose(Head)
    disp('Test: Replicate graph in assignment');
    disp('Max depth: 10');
    disp('d0: 1');
    disp('Resolution increment: 1');
    table = Compute_Depth_Dose(10,1,1);
    disp('Depth dose look up table: ');
    disp(table);
    
    maxDepth = max(Head);
    maxDepth = maxDepth * 2;
    global DepthDoseTable;
    DepthDoseTable = Compute_Depth_Dose(maxDepth, 20, 1);

end