%calculate the relaxivity constant r_2
function [r2,delta] = calculateRelaxivity(T2List,consentrations,booleanPlot)
    T2List = fliplr(sort(T2List));
    R2 = (1./T2List);
    c = fit(consentrations',R2','poly1')
    r2 = c(1);
    delta = confint(c);
    if booleanPlot
        figure();
        hold on;
        plot(consentrations,R2,'*');
        plot(c,consentrations,R2);
        digits(3);
        title(['Estimated relaxivity r_2 = ' num2str(r2,3) '\pm ' num2str(delta(2)-r2,3) ' L/(mmol*s).']);
        xlabel('[C.A.] (mol/L)')
        ylabel('1/T_2 ((ms)^{-1})');
    end
end