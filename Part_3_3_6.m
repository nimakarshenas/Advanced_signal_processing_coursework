sunspot = load('sunspot.dat');
sunspot = sunspot(:,2);
N = length(sunspot);
n = 10:5:250;
L = length(n);
MSEs = zeros(1,L);

for i=1:L
    dat = sunspot(1:n(i));
    dat = zscore(dat);
    a1 = ar(dat, 2, 'ls');
    a = a1.a;
    x = filter([0 -a(1, 2:end)], [1], dat);
    
    MSE = mean((dat-x).^2);
    MSEs(1,i) = MSE;
    
end
figure
hold on
grid on
plot(n, MSEs, 'LineWidth', 2)
ylabel("MSE", "FontSize", 14, "FontWeight", "bold")
xlabel("data length(N)", "FontSize", 14, "FontWeight", "bold")
xlim([10 250])
title("MSE for changing data lengths of sunspot time series", "FontSize", 15)
grid on
hold off
