sunspot = load('sunspot.dat');
sunspot = sunspot(:,2);
N = length(sunspot)-1;
sun0 = (sunspot - mean(sunspot))/std(sunspot);

figure
hold on
for p = 1:10
    
    model = ar(sun0,p,'ls');
    a1 = aryule(sun0, p);
    a = model.a;
    plot(-a(1,2:end));
    x = filter([0 -a(1, 2:end)], [1], sun0);
    
    E_p = sum((sun0-x).^2);
    Eps(p) = log(E_p);
    MDL = log(E_p)+((p*log(N))/N);
    AIC = log(E_p)+((p*2)/N);
    AICc = AIC+((2*p*(p+1))/(N-p-1));
    MDLs(p) = MDL;
    AICs(p) = AIC;
    AICcs(p) = AICc;
    
end
xlim([1 10])
grid on
yline(0.3, '--', '0.3')
yline(-0.3, '--', '-0.3')
title("AR coefficients of sunspot series for model order p", 'FontSize', 15)
legend({'p=1','p=2','p=3','p=4','p=5','p=6','p=7','p=8','p=9','p=10'}, 'FontSize', 9, 'FontWeight', 'bold')
xlabel("n", 'FontSize', 13, 'FontWeight', 'bold')
ylabel("a", 'FontSize', 13, 'FontWeight', 'bold')
hold off

figure(2)
hold on 
grid on    

plot(Eps, 'LineWidth', 2)
plot(MDLs, 'LineWidth', 2)
plot(AICs, 'LineWidth', 2)
plot(AICcs, 'LineWidth', 2)
title("MDL, AIC, AIC_c of Sunspot time series; using LSE", 'FontSize', 15)
xlabel("Model order(p)", 'FontSize', 13, 'FontWeight', 'bold')
ylabel("Value", 'FontSize', 13, 'FontWeight', 'bold')
legend({'E_p', 'MDL', 'AIC', 'AIC_c'}, 'FontSize', 13, 'FontWeight', 'bold')

hold off

