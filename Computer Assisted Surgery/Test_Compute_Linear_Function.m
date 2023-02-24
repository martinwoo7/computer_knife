% Function to test question 3, HW4, CISC 330. Compute Linear Function.
%
% Created on December 13th, 2015 by Eric Braun 10121660
function[y] = Test_Compute_Linear_Function(P1,P2,x)
     Point1 = [1,1];
     Point2 = [5,5];
     disp('First point: [1,1]');
     disp('Second point: [5,5]');
     for x = 0:6
        y = Compute_Linear_Function(Point1,Point2,x);
        disp(sprintf('x-value: %d    y-value: %d',x,y));
     end
end
    