rri =  load('RRI-DATA.mat');


rri.xRRI1 = (rri.xRRI1-mean(rri.xRRI1))/(std(rri.xRRI1));
rri.xRRI2 = (rri.xRRI2-mean(rri.xRRI2))/(std(rri.xRRI2));
rri.xRRI3 = (rri.xRRI3-mean(rri.xRRI3))/(std(rri.xRRI3));



fn = fieldnames(rri);
for k=1:numel(fn)
    if( isnumeric(rri.(fn{k})) )
        MDLs = zeros(1, 10);
        AICs = zeros(1, 10);
        AICcs = zeros(1, 10);
        Eps = zeros(1, 10);

        figure(k)
        subplot(2, 1, 1)
        grid on
        hold on
        for p = 1:12

            a = aryule(rri.(fn{k}), p);
               
            stem(p, a(p+1), 'b')
            x = filter([0 -a(1, 2:end)], [1], rri.(fn{k}));

            E_p = sum((rri.(fn{k})-x).^2);
            Eps(p) = log(E_p);
            MDL = log(E_p)+((p*log(N))/N);
            AIC = log(E_p)+((p*2)/N);
            AICc = AIC+((2*p*(p+1))/(N-p-1));
            MDLs(p) = MDL;
            AICs(p) = AIC;
            AICcs(p) = AICc;

        end
        dat = string(fn{k});
        dat = char(dat);
        dat = dat(2:end);
        xlim([-1 11])
        yline(0.25, '--', '0.25')
        yline(-0.25, '--', '-0.25')
        title("PACF of " + dat)
        ylabel("PACF")
        hold off

        subplot(2, 1, 2)
        hold on 
        grid on    

        plot(Eps, 'LineWidth', 2)
        plot(MDLs, 'LineWidth', 2)
        plot(AICs, 'LineWidth', 2)
        plot(AICcs, 'LineWidth', 2)
        
        title("MDL, AIC, AIC_c of " + dat)
        xlabel("Model order(p)", 'FontWeight', 'bold')
        ylabel("Value", 'FontWeight', 'bold')
        legend({'E_p', 'MDL', 'AIC', 'AIC_c'},  'FontSize', 10)

        hold off
    end
end
    