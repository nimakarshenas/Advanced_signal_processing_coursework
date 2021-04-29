nasdaq = load('NASDAQ.mat');
nasdaq = nasdaq.NASDAQ.Close;
N = length(nasdaq);
nasdaq = (nasdaq - mean(nasdaq))/std(nasdaq);

MDLs = zeros(1, 10);
AICs = zeros(1, 10);
AICcs = zeros(1, 10);
Eps = zeros(1, 10);

figure(1)
grid on
hold on

for p = 1:10
    
    a = aryule(nasdaq, p);
    
    stem(p, a(p+1), 'b')
    x = filter([0 -a(1, 2:end)], [1], nasdaq);
    
    E_p = sum((nasdaq-x).^2);
    Eps(p) = log(E_p);
    MDL = log(E_p)+((p*log(N))/N);
    AIC = log(E_p)+((p*2)/N);
    AICc = AIC+((2*p*(p+1))/(N-p-1));
    MDLs(p) = MDL;
    AICs(p) = AIC;
    AICcs(p) = AICc;
    
end
xlim([-1 11])
yline(0.1, '--', '0.1')
yline(-0.1, '--', '-0.1')
title("PACF of NASDAQ")
xlabel("Model order(p)")
ylabel("PACF")
hold off

figure(2)
hold on 
grid on    

plot(Eps, 'LineWidth', 2)
plot(MDLs, 'LineWidth', 2)
plot(AICs, 'LineWidth', 2)
plot(AICcs, 'LineWidth', 2)
title("MDL, AIC, AIC_c of NASDAQ")
xlabel("Model order(p)")
ylabel("Value")
legend('E_p', 'MDL', 'AIC', 'AIC_c')

hold off