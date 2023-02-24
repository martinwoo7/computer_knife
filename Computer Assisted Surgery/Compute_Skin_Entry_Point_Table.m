

function[EntryMatrix] = Compute_Skin_Entry_Point_Table(head, helmet, isocenter)
    
    increment = helmet(1);

    LongitudeIncrement = (360./increment) - 1;
    LongitudeAngles = zeros(LongitudeIncrement,1);
    for i = 0:LongitudeIncrement
        LongitudeAngles(i + 1) = i * increment;
    end
    
    LatitudeIncrement = 90./increment;
    LatitudeAngles = zeros(LatitudeIncrement,1);
    for i = 0:LatitudeIncrement
        LatitudeAngles(i + 1) = i * increment;
    end
    
    [x,y,z] = ellipsoid(head(4), head(5), head(6), head(1), head(2), head(3));
    figure;
    h = surf(x,y,z);
    set(h, 'FaceAlpha', 0.82);
    hold on;
    
    
    LongitudeIncrement = LongitudeIncrement + 1;
    LatitudeIncrement = LatitudeIncrement + 1;
    EntryArray = zeros((LongitudeIncrement * LatitudeIncrement),3);
    count = 1;
    for i = 1:LatitudeIncrement
        for j = 1:LongitudeIncrement
            EntryPoint = Compute_Skin_Entry_Point(head,LongitudeAngles(j),LatitudeAngles(i), isocenter);
            EntryArray(count,:) = EntryPoint;
            count = count + 1;
            plot3(EntryPoint(1),EntryPoint(2),EntryPoint(3),'.r');
            hold on;
            dirVec = -(Compute_Beam_Direction_Vector(LongitudeAngles(j),LatitudeAngles(i)));
            dirVecArray = [dirVec * head(1) * 1.5, dirVec * head(2) * 1.5, dirVec * head(3) * 1.5];
            plot3([isocenter(1);dirVecArray(1) + isocenter(1)],[isocenter(2);dirVecArray(2) + isocenter(2)],[isocenter(3);dirVecArray(3) + isocenter(3)]);
            hold on;
        end
    end
    EntryMatrix = zeros(LongitudeIncrement, LatitudeIncrement * 3);
    count = 1;
    count2 = 1;
    while (count < LatitudeIncrement * 3)
        for i = 1:LongitudeIncrement
            EntryMatrix(i,count:count+2) = EntryArray(count2,1:3);
            count2 = count2 + 1;
        end
        count = count + 3;
    end   
    LatitudeAngles = LatitudeAngles';
    counter = 1;
    LatAngles = [];
    n = size(LatitudeAngles);
    n = n(2);
    for i = 1:n
        LatAngles(1,counter:counter + 2) = LatitudeAngles(i);
        counter = counter + 3;
    end
    LatAngles = cat(2,[0],LatAngles);
    EntryMatrix = cat(2,LongitudeAngles,EntryMatrix);
    EntryMatrix = cat(1,LatAngles,EntryMatrix);
    
    % If the last latitude value is 90, there should only be one beam so
    % make all except for first row 0.
    [long,lat] = size(EntryMatrix);
    if (EntryMatrix(1,lat) == 90)
        EntryMatrix(3:long,lat-2:lat) = 0;
    end
    
    plot3(isocenter(1), isocenter(2), isocenter(3), '.b', 'MarkerSize', 15);
    str2 = ('\uparrow isocenter');
    text(isocenter(1), isocenter(2), isocenter(3) - 2,str2, 'FontSize', 10);
    xlabel('x-axis');
    ylabel('y-axis');
    zlabel('z-axis');
end