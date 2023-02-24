

function[doseValue] = Compute_Point_Dose_from_Beam(head, radius, long, lat, center, point)


    dirVec = Compute_Beam_Direction_Vector(long,lat);
    entryPoint = Compute_Skin_Entry_Point(head,long,lat,center);
    distanceFromBeam = round(Compute_Radial_Distance(point,[center,dirVec]));
    distanceFromEntry = norm(sqrt((point - entryPoint).^2));
    depth = round(norm(sqrt((distanceFromEntry.^2) - (distanceFromBeam).^2)));
    
    global RadialDoseTable;
    global DepthDoseTable;
    sizeRad = size(RadialDoseTable);
    sizeRad = sizeRad(1);
    sizeDep = size(DepthDoseTable);
    sizeDep = sizeDep(1);
    radDose = 0; 
    depDose = 0;
    if (distanceFromBeam < radius * 1.5) % within radius of radiation
       for i = 1:sizeRad
           if (RadialDoseTable(i,1) == distanceFromBeam)
               radDose = RadialDoseTable(i,2);
           end
       end
       for j = 1:sizeDep
           if (DepthDoseTable(j,1) == depth)
               depDose = DepthDoseTable(j,2);
           end
       end
    end
    doseValue = radDose * depDose;
end