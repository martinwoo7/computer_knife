function [x] = pointProject(angle, pointVec)
% Input: takes in a projected angle and a point in the C-arm coordinate
% space (x, y, z)
% Output: returns the projected point in the detector coordinate space (u,
% v, w=0)

% Creates the rotation matrix around z-axis based on the angle given
R = [cosd(angle) -sind(angle) 0; sind(angle) cosd(angle) 0; 0 0 1];
% Rotates the C-arm and the detector correspondingly
RArm = R * [0 75 0]';
nRArm = -RArm;

% Get points on detector plane
RPM = [nRArm'; (R * [1 -75 0]')'; (R * [0 -75 1]')'];

% Computes the intersect of the x-ray projected through the point onto the
% detector plane
intersect = double(interLinePlane([RArm'; pointVec], RPM));

% Computes the projeted points in detector coordinates
x = rigid(intersect, nRArm, RPM(3,:), R*[0 -74 0]', RPM(2,:));

figure;
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');
hold on;
% center
plot3(0,0,0,'bx');

% line from x-ray source to projected point on detector
plot3([RArm(1) intersect(1)], [RArm(2) intersect(2)], [RArm(3) intersect(3)],'r');

%  line straight down
plot3([RArm(1) nRArm(1)], [RArm(2) nRArm(2)], [RArm(3) nRArm(3)],'bl');

% point to project
plot3(pointVec(1), pointVec(2), pointVec(3),'*g');

% projected point
plot3(intersect(1),intersect(2),intersect(3),'o');

% relative point
plot3(x(1),x(2),x(3),'*b');


end
