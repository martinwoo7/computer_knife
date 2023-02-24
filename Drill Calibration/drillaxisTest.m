Poses = 20;
points = drillAxisSim(Poses);
drillVector = drillaxisCali(points);
disp('Expected vector: [0 0 1]');
disp('Received vector: ');
disp(drillVector);