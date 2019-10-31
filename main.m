%strr = input('Input file name: ');
imageinfo = dicominfo('E9.dcm'); % Obtains image info
image = dicomreadVolume('E9.dcm'); % Reads out data (4D)

image = squeeze(image); % Removes the 4th dimension
imageSize = size(image);
%spacing of TE
spTE =  imageinfo.PerFrameFunctionalGroupsSequence.Item_1.MREchoSequence.Item_1.EffectiveEchoTime;
%x-axis in ms
EchoTimes = [spTE:spTE:spTE*imageSize(3)]';
threshold = 5000; %set binary threshold on masks.
masks = createIndividualMasks(image,imageSize,threshold);
if ~exist ('T2Map','var') %this takes some time, so skip it if it already exists.
    T2Map = makeParametricT2Map(EchoTimes,image,imageSize,threshold);
end
T2List = calculateAverageT2(T2Map,masks);
booleanPlot = true; %change to false if u wanna skip plot
concentrations = [0,0.005,0.010,0.025,0.05]; %in M
r2 = calculateRelaxivity(T2List,concentrations,booleanPlot);
format short;
fprintf('\n Calculated r_2 relaxativity of Cd calculated to be %f (M*ms)^-1. \n',r2);