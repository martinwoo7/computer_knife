% Question 2 for Assignment 1 of CISC 330.
% Takes in 4 3D points A,B,C,D and returns their
% approximate intersection as well as the error between 
% the approximate and real intersection.
%

function [Intersection, error] = Q2A1(A, B, C, D)

% Read in point dimensions.
Point1 = [A(1); A(2); A(3)];
Point2 = [B(1); B(2); B(3)];
Point3 = [C(1); C(2); C(3)];
Point4 = [D(1); D(2); D(3)];

% Compute and normalize direction vector for first line.
dirVec = Point2 - Point1;
normVec = dirVec/norm(dirVec);

% Compute and normalize direction vector for second line
dirVec2 = Point4 - Point3;
normVec2 = dirVec2/norm(dirVec2);

% Compute third direction vector for perpendicular line using cross
% product
dirVec3 = cross(normVec, normVec2);
normVec3 = dirVec3/norm(dirVec3);

% P matrix = C-A (Point1 in line 1 - Point1 in line2)
PMatrix = [Point1(1)-Point3(1); 
           Point1(2)-Point3(2); 
           Point1(3)-Point3(3)];

% V Matrix from notes. First col = - first dirVec, 2nd col = second dirVec
% 3rd col = third dirvec
VMatrix = [-normVec(1), normVec2(1), normVec3(1); 
           -normVec(2), normVec2(2), normVec3(2); 
           -normVec(3), normVec2(3), normVec3(3)];

% Take inverse of VMatrix to get ready for multiplication w/ PMatrix.
invVMatrix = inv(VMatrix);

% Equation to find t values.
tMatrix = invVMatrix*PMatrix;

% First computed "Intersection" using L1 = P1 + t1(dirvec1)
Intersect1 = [Point1(1) + tMatrix(1)*normVec(1); 
              Point1(2) + tMatrix(1)*normVec(2); 
              Point1(3) + tMatrix(1)*normVec(3)];
          
% Second computed "Intersection" using L2 = P3 + t2(dirVec2)         
Intersect2 = [Point3(1) + tMatrix(2)*normVec2(1); 
              Point3(2) + tMatrix(2)*normVec2(2);
              Point3(3) + tMatrix(2)*normVec2(3)];

% Calculated approximate intersection is directly inbetween 2 computed
% intersections.
Intersection = (Intersect1 + Intersect2)/2;

% Error is the distance from approximate intersection to found intersection
% on line or half the distance between the two intersections.
error = sqrt((Intersect1(1)-Intersect2(1)).^2 + (Intersect1(2)-Intersect2(2)).^2 + (Intersect1(3) - Intersect2(3)).^2)/2;

end
