sunspot = load('sunspot.dat');
sunspot = sunspot(:,2);
N = length(sunspot);
sunspot_nrm = (sunspot - mean(sunspot))/std(sunspot);



N = length(sunspot);
[a1, var1] = aryule(sunspot, 1);
[a2, var2] = aryule(sunspot, 2);
[a10, var10] = aryule(sunspot, 10);

[P1, w] = freqz(sqrt(var1), a1, N/2);
P2 = freqz(sqrt(var2), a2, N/2);
P10 = freqz(sqrt(var10), a10, N/2);
[f, Py] = pgm(sunspot);

figure
subplot(1, 2, 1)
hold on
plot(f, Py, 'g')
plot(w./(2*pi), abs(P1).^2,   'LineWidth', 1)
plot(w./(2*pi), abs(P2).^2,   'LineWidth', 1)
plot(w./(2*pi), abs(P10).^2,  'LineWidth', 1)


xlim([0 0.5])
ax = gca;
ax.YAxis.Exponent = 0;
legend({'Periodogram','AR(1)', 'AR(2)', 'AR(10)'}, 'FontSize', 12, "FontWeight", "bold")
xlabel("Normalised Frequency(f)", 'FontSize', 12, "FontWeight", "bold")
ylabel("P_Y(f)", 'FontSize', 12, "FontWeight", "bold")
title("PSD estimation of un-normalised suspot series")
hold off

%normalised
[a1, var1] = aryule(sunspot_nrm, 1);
[a2, var2] = aryule(sunspot_nrm, 2);
[a10, var10] = aryule(sunspot_nrm, 10);
[a70, var70] = aryule(sunspot_nrm, 70);

[P1, w] = freqz(sqrt(var1), a1, N/2);
P2 = freqz(sqrt(var2), a2, N/2);
P10 = freqz(sqrt(var10), a10, N/2);
P70 = freqz(sqrt(var70), a70, N/2);
[f, Py] = pgm(sunspot_nrm);

subplot(1, 2, 2)
hold on
plot(f, Py, 'g')
plot(w./(2*pi), abs(P1).^2,   'LineWidth', 1)
plot(w./(2*pi), abs(P2).^2,   'LineWidth', 1)
plot(w./(2*pi), abs(P10).^2,  'LineWidth', 1)

xlim([0 0.5])
legend({'Periodogram', 'AR(1)', 'AR(2)', 'AR(10)'}, 'FontSize', 12, "FontWeight", "bold")
xlabel("Normalised Frequency(f)", 'FontSize', 12, "FontWeight", "bold")
ylabel("P_Y(f)", 'FontSize', 12, "FontWeight", "bold")
title("PSD estimation of normalised suspot series")
hold off



figure
hold on
plot(f, Py, 'g')
plot(w./(2*pi), abs(P2).^2,   'LineWidth', 1)
plot(w./(2*pi), abs(P70).^2, 'b',  'LineWidth', 1)
xlim([0 0.5])
legend({'Periodogram', 'AR(2)', 'AR(70)'}, 'FontSize', 12, "FontWeight", "bold")
xlabel("Normalised Frequency(f)", 'FontSize', 12, "FontWeight", "bold")
ylabel("P_Y(f)", 'FontSize', 12, "FontWeight", "bold")
title("PSD estimation of normalised suspot series; zoomed")
zoom on 
hold off


