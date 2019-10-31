%gives a T2 Map with same threshold as masks
function T2Map = makeParametricT2Map(EchoTimes,image,imageSize,threshold)
%requires Curve Fitting Toolbox
T2Map = zeros(imageSize(1:2));
doubleImage = double(image);
counter = 0;
imageMask = image(:,:,1) > threshold;
h = waitbar(0,'Starting T2Map-calculation');
for roww = 1:imageSize(1)
    for columnn = 1:imageSize(2)
       if imageMask(roww,columnn)
        f = fit(EchoTimes, squeeze(doubleImage(roww,columnn,:)),'exp1');
        f = coeffvalues(f);
        T2Map(roww,columnn) = -1/f(2);
       end
               counter = counter + 1;
               perc = floor(100*counter/(imageSize(1)*imageSize(2)));
               waitbar(perc/100,h,sprintf('Calculating T2-map, %d%% done...',perc));
    end

end
close(h);