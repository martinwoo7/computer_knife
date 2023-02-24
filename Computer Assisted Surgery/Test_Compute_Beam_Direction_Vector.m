% Function to test question 7, HW4, CISC 330. Compute beam direction vector
%
% Created on December 13, 2015 by Eric Braun 10121660

function [] = Test_Compute_Beam_Direction_Vector()
    Longitudes = [0,90,180,270];
    Latitudes = [0,90];
    DirectionVectors = zeros(size(Longitudes,2),size(Latitudes,2)*3);
    for i = 1:size(Longitudes,2)
        DirectionVectors(i,1:3) = Compute_Beam_Direction_Vector(Longitudes(i),Latitudes(1));
        DirectionVectors(i,4:6) = Compute_Beam_Direction_Vector(Longitudes(i),Latitudes(2));
    end
    Lat = [0,0,0,0,90,90,90];
    DirectionVectors = cat(2,Longitudes',DirectionVectors);
    DirectionVectors = cat(1, Lat, DirectionVectors);
    disp('Beam source longitudes: 0 90 180 270');
    disp('Beam source latitudes: 0 90');
    disp('Beam direction vectors table: ');
    disp(DirectionVectors);

end