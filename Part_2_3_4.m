sunspot = load('sunspot.dat');
sunspot = sunspot(:,2);
N = length(sunspot);
sunspot = (sunspot - mean(sunspot))/std(sunspot);

MDLs = zeros(1, 10);
AICs = zeros(1, 10);
AICcs = zeros(1, 10);
Eps = zeros(1, 10);
figure(1)
hold on 
grid on    


for p = 1:10
    
    a = aryule(sunspot, p);
    x = filter([0 -a(1, 2:end)], [1], sunspot);  %examine difference equations
    E_p = sum((sunspot-x).^2);
    Eps(p) = log(E_p);
    MDL = log(E_p)+((p*log(N))/N);
    AIC = log(E_p)+((p*2)/N);
    AICc = AIC+((2*p*(p+1))/(N-p-1));
    MDLs(p) = MDL;
    AICs(p) = AIC;
    AICcs(p) = AICc;
    
end
plot(Eps, 'LineWidth', 2)
plot(MDLs, 'LineWidth', 2)
plot(AICs, 'LineWidth', 2)
plot(AICcs, 'LineWidth', 2)
xlabel("p")
title("Metrics for model order selection")
legend('Log(E_p)', 'MDL', 'AIC', 'AIC_c')

hold off