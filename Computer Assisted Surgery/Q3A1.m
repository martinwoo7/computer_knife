% Question 3 Assignment 1, CISC 330
% Takes in N amount of lines and finds their approx. intersection and error
% while eliminating outliers.
% Input: N amounts of lines, Array B with all the coordinates in x,y,z
% order.
% Output : Found intersection and error.

function [Intersections, error] = Q3A1(N, B)
% set markers for start of for points
i = 1;
j = 4;
k = 7;
l = 10;
sizeB = size(B);
IntersectionOutputs = [];
ErrorOutputs = [];

% Start i at top
while i < sizeB(2) - 6
    % Fill in points to use.
    P1 = [B(i), B(i+1), B(i+2)];
    P2 = [B(j), B(j+1), B(j+2)];
    P3 = [B(k), B(k+1), B(k+2)];
    P4 = [B(l), B(l+1), B(l+2)];
    % Fill intersection and error into matrix.
    [Intersection, error] = Q2A1(P1, P2, P3, P4);
    IntersectionOutputs = cat(1,IntersectionOutputs,Intersection);
    % Concacinate results
    ErrorOutputs = cat(1,ErrorOutputs,error);
    ErrorOutputs = cat(1,ErrorOutputs,error);
    ErrorOutputs = cat(1,ErrorOutputs,error);
    % Move k & l to next points running Q2 until they reach the end.
    k = k + 6;
    l = l + 6;
    if l > sizeB(2) 
        i = i + 6; %once k and l reach end move i and j over and start again.
        j = j + 6;
        k = i + 6;
        l = j + 6;
    end
end

% Concatinate results into single matrix
Outputs = cat(2,IntersectionOutputs,ErrorOutputs);
% find SD and mean of the errors.
SD = std(Outputs(:,2));
meanErr = mean(Outputs(:,2));

% Go through and find the rows that need to be deleted because they are
% outliers (the error is greater than one SD from the mean error).
y = 1;
yMat = zeros(500,1);
while y <= N*3   % Length of outputs 
   if (Outputs(y,2) > (meanErr + SD))
       yMat(y) = y;
   end
   y = y + 1;
end
% Removes 0's from matrix.
yMat = yMat(yMat~=0);

sizey = size(yMat);
v = 1;
% Go through and throw 0's into the rows which are outliers.
while v <= sizey(1)
    Outputs(v,:) = [0,0];
    v = v + 1;
end
% Intersections are the left column
Intersections = Outputs(:,1);
% Take out zeros
Intersections = Intersections(Intersections~=0);
% errors are the right column
error = Outputs(:,2);
% Take out zeros
error = error(error~=0);
% Take mean for error.
error = mean(error);
end

        