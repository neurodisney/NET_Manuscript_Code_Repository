% requires custom scripts readV1Angles.m & readV2Angles.m 
% requires circular statistics toolbox in MATLAB
% Berens, P. (2009). CircStat: A MATLAB Toolbox for Circular Statistics. 
% Journal of Statistical Software, 31(10), 1–21. https://doi.org/10.18637/jss.v031.i10
%https://www.mathworks.com/matlabcentral/fileexchange/10676-circular-statistics-toolbox-directional-statistics


%grab and combine data for V1 and V2
readV1Angles
AngleV1=Angle;
AnimalV1=Animal;
clear Angle
clear Animal

readV2Angles
AngleV2=Angle;
AnimalV2=Animal;
clear Angle
clear Animal

%concatenate to make single vector of all angles
V1dim = size(AngleV1);
V2dim = size(AngleV2);
numAngles =V1dim(1) + V2dim(1);
Angle = NaN(numAngles,1);
Angle(1:V1dim(1)) = AngleV1;
Angle(V1dim(1)+1:end) = AngleV2;

%make combined V1/V2 data circular, convert to radians and remove NaNs
useAngle = 2.*Angle;
useAngle = deg2rad(useAngle);
useAngle = useAngle(~isnan(useAngle));

%do Rayleigh test % report result
[p_Ray,z] = circ_rtest(useAngle);

p_Ray
z

if p_Ray < 0.05
    disp('Rayleigh:The distribution is significantly non-uniform.');
else
    disp('Rayleigh:The distribution is not significantly non-uniform.');
end

%plot 
figure
polarhistogram(useAngle,36,'FaceColor',[0.2 0.2 0.2])
rticks([0 20 40])
thetaticks([0 45 90 135 180 225 270 315])
