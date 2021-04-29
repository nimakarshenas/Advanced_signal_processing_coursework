sunspot = load('sunspot.dat');
sunspot = sunspot(:,2);
zero_mean = (sunspot - mean(sunspot))/std(sunspot);

figure(1)
a = aryule(sunspot, 1);
a_0 = aryule(zero_mean, 1);
hold on
grid on

for p = 1:10
   a = aryule(sunspot, p);
   a_0 = aryule(zero_mean, p);
   stem(p, a(p+1), 'r')
   stem(p, a_0(p+1), 'b')
end

ylim([-1 1])
xlim([0 11])
yline(0.3, '--', '0.3')
yline(-0.3, '--', '-0.3')
legend('raw data','normalised');
xlabel("p")
ylabel("PACF")
title("PACF of the Sunspot series")
hold off