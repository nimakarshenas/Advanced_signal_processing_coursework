x = zeros(1, 1000);
for i = 1:1000
    x(i) = randn;
end
figure(1)
hold on
y = filter(ones(9,1), [1], x);
z = linspace(-1000, 1000, 1999);
stem(z, xcorr(y, 'unbiased'),'MarkerSize',5)
axis([-20 20 -2 11])
xlabel("\tau", "FontSize", 13, "FontWeight", "bold")
ylabel("R_x(\tau)", "FontSize", 13, "FontWeight", "bold")
title("Autocorrelation of WGN filtered with MA(8)")
grid on
zoom on
hold off
orders = [1, 2, 6, 9, 12];

figure(2)
hold on
for j = 1:5
    y = filter(ones(orders(j),1), [1], x);
    z = linspace(-1000, 1000, 1999);
    
    plot(z, xcorr(y, 'unbiased'), '-o', 'MarkerSize',5)
    axis([-20 20 -1 15])
    xlabel("\tau", "FontSize", 13, "FontWeight", "bold")
    ylabel("R_x(\tau)", "FontSize", 13, "FontWeight", "bold")
    zoom on
end
legend('R_X(\tau)','MA(1)','MA(5)','MA(8)','MA(11)', "FontSize", 13, "FontWeight", "bold")
title("Autocorrelation of WGN filter with a Moving Average of varying orders")
grid on
hold off