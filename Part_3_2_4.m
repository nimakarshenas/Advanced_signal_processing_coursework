w =  randn(1, 1064);
y = filter([1], [1, 0.9], w);
y = y(41:end);

ycorr = xcorr(y, 'unbiased');
N = length(y);
a_hat = -ycorr(N+1)/ycorr(N);
var_hat = ycorr(N) + (a_hat*ycorr(N+1));

[P_hat, w] = freqz([sqrt(var_hat)], [1, a_hat], N/2);
[h, w] = freqz([1], [1, 0.9], 512);
[f, Py] = pgm(y);

figure
hold on
plot(f, Py, 'g')
plot(w./(2*pi),abs(h).^2, 'b', 'LineWidth', 1.5)
plot(w./(2*pi), abs(P_hat).^2, 'r',  'LineWidth', 2)
xlim([0 0.5])
legend({'Periodogram Estimate', 'Theoretical PSD', 'Model Based Estimate'}, 'FontSize', 14, "FontWeight", "bold")
xlabel("Normalised Frequency(f)", 'FontSize', 14, "FontWeight", "bold")
ylabel("P_Y(f)", 'FontSize', 14, "FontWeight", "bold")
title("Model Based PSD estimation", 'FontSize', 15)
grid on
zoom on
hold off

figure
hold on
plot(f, Py, 'g')
plot(w./(2*pi),abs(h).^2, 'b', 'LineWidth', 1.5)
plot(w./(2*pi), abs(P_hat).^2, 'r',  'LineWidth', 2)
xlim([0 0.5])
legend({'Periodogram Estimate', 'Theoretical PSD', 'Model Based Estimate'}, 'FontSize', 14, "FontWeight", "bold")
xlabel("Normalised Frequency(f)", 'FontSize', 14, "FontWeight", "bold")
ylabel("P_Y(f)", 'FontSize', 14, "FontWeight", "bold")
title("Model Based PSD estimation; zoomed", 'FontSize', 15)
grid on
zoom on
hold off