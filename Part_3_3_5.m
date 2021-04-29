sunspot = load('sunspot.dat');
sunspot = sunspot(:,2);
sunspot = (sunspot - mean(sunspot))/std(sunspot);
N = length(sunspot);
a1 = ar(sunspot, 1, 'ls');
a2 = ar(sunspot, 2, 'ls');
a10 = ar(sunspot, 10, 'ls');

[P1, w] = freqz(sqrt(a1.NoiseVariance), a1.a, N/2);
P2 = freqz(sqrt(a2.NoiseVariance), a2.a, N/2);
P10 = freqz(sqrt(a10.NoiseVariance), a10.a, N/2);
[f, Py] = pgm(sunspot);

figure
hold on
plot(f, Py, 'g')
plot(w./(2*pi), abs(P1).^2,   'LineWidth', 1)
plot(w./(2*pi), abs(P2).^2,   'LineWidth', 1)
plot(w./(2*pi), abs(P10).^2,  'LineWidth', 1)


xlim([0 0.5])
grid on
ax = gca;
ax.YAxis.Exponent = 0;
legend({'Periodogram','AR(1)', 'AR(2)', 'AR(10)'}, 'FontSize', 12, "FontWeight", "bold")
xlabel("Normalised Frequency(f)", 'FontSize', 12, "FontWeight", "bold")
ylabel("P_Y(f)", 'FontSize', 12, "FontWeight", "bold")
title("PSD estimation of un-normalised suspot series")
hold off