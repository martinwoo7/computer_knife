function[safetyTable] = Compute_Beam_Safety_Table(helmet,isocenter,OAR)
    increment = helmet(1);
    
    LongitudeIncrement = floor((360./increment) - 1);
    LongitudeAngles = zeros(LongitudeIncrement,1);
    for i = 0:LongitudeIncrement
        LongitudeAngles(i + 1) = i * increment;
    end
    
    LatitudeIncrement = floor(90./increment);
    LatitudeAngles = zeros(LatitudeIncrement,1);
    for i = 0:LatitudeIncrement
        LatitudeAngles(i + 1) = i * increment;
    end
    
    sizeLong = size(LongitudeAngles);
    n = sizeLong(1);
    
    sizeLat = size(LatitudeAngles);
    m = sizeLat(1);
    
    safetyTable = zeros(n,m);
    for i = 1:n
        for j = 1:m
            safetyTable(i,j) = Compute_Beam_Safety(helmet,LongitudeAngles(i),LatitudeAngles(j),isocenter,OAR);
        end
    end
    safetyTable = cat(1,LatitudeAngles',safetyTable);
    LongitudeAngles = cat(1,[0], LongitudeAngles);
    safetyTable = cat(2,LongitudeAngles,safetyTable);
    
end