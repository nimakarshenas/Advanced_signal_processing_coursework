w =  randn(1, 1064);
y = filter([1], [1, 0.9], w);
y = y(41:end);

[h, w] = freqz([1], [1, 0.9], 512);
[f Py] = pgm(y);
figure
hold on
plot(f, Py, 'r')
plot(w/(2*pi),abs(h).^2, 'b', 'LineWidth', 1.1)
xlim([0 0.5])
legend({'Periodogram estimate', 'Theoretical PSD'}, 'FontSize', 14)
xlabel("Normalised Frequency(f)", 'FontSize', 14, 'FontWeight', 'bold')
ylabel("P_Y(f)", 'FontSize', 14, 'FontWeight', 'bold')
title("PSD of an AR(1) process; zoomed", 'FontSize', 16)
zoom on
grid on
hold off
