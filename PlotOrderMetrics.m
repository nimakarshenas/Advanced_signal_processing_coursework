function PlotOrderMetrics(series, max, name)
    N = length(series);
    figure
    hold on
    for p = 1:max
        
        a = aryule(series, p);
        stem(p, a(p+1))
        x = filter([0 -a(1, 2:end)], [1], series);

        E_p = sum((series-x).^2);
        MDL = log(E_p)+((p*log(N))/N);
        AIC = log(E_p)+((p*2)/N);
        AICc = AIC+((2*p*(p+1))/(N-p-1));
        MDLs(p) = MDL;
        AICs(p) = AIC;
        AICcs(p) = AICc;
    
    end
    hold off
    figure
    hold on 
    grid on    

    plot(MDLs, 'LineWidth', 2)
    plot(AICs, 'LineWidth', 2)
    plot(AICcs, 'LineWidth', 2)
    title("MDL, AIC, AIC_c of ;" + name, 'FontSize', 15)
    xlabel("Model order(p)", 'FontSize', 13, 'FontWeight', 'bold')
    ylabel("Value", 'FontSize', 13, 'FontWeight', 'bold')
    legend({'MDL', 'AIC', 'AIC_c'}, 'FontSize', 13, 'FontWeight', 'bold')

    hold off
    
end