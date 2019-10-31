%calculate the relaxivity constant r_2
function r2 = calculateRelaxivity(T2List,consentrations,booleanPlot)
    T2List = fliplr(sort(T2List));
    R2 = (1./T2List);
    c = polyfit(consentrations,R2,1);
    r2 = c(1);
    if booleanPlot
        figure();
        hold on;
        plot(consentrations,R2,'*');
        plot(consentrations, polyval(c,consentrations));
    end
end