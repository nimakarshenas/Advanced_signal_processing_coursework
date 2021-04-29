w = randn(1, 1024);
w1 = w(1:128);
w2 = w(129:256);
w3 = w(257:384);
w4 = w(385:512);
w5 = w(513:640);
w6 = w(641:768);
w7 = w(769:896);
w8 = w(897:1024);

figure(1)

hold on 
subplot(2, 4, 1)
[f Pw1] = pgm(w1);
plot(f, Pw1)
xlabel("Normalised Frequency(f)", "FontWeight", "bold")
ylabel("P_X(f)")
grid on

subplot(2, 4, 2)
[f Pw2] = pgm(w2);
plot(f, Pw2)
xlabel("Normalised Frequency(f)", "FontWeight", "bold")
ylabel("P_X(f)")
grid on

subplot(2, 4, 3)
[f Pw3] = pgm(w3);
plot(f, Pw3)
xlabel("Normalised Frequency(f)", "FontWeight", "bold")
ylabel("P_X(f)")
grid on

subplot(2, 4, 4)
[f Pw4] = pgm(w4);
plot(f, Pw4)
xlabel("Normalised Frequency(f)", "FontWeight", "bold")
ylabel("P_X(f)")
grid on

subplot(2, 4, 5)
[f Pw5] = pgm(w5);
plot(f, Pw5)
xlabel("Normalised Frequency(f)", "FontWeight", "bold")
ylabel("P_X(f)")
grid on

subplot(2, 4, 6)
[f Pw6] = pgm(w6);
plot(f, Pw6)
xlabel("Normalised Frequency(f)", "FontWeight", "bold")
ylabel("P_X(f)")
grid on

subplot(2, 4, 7)
[f Pw7] = pgm(w7);
plot(f, Pw7)
xlabel("Normalised Frequency(f)", "FontWeight", "bold")
ylabel("P_X(f)")
grid on

subplot(2, 4, 8)
[f Pw8] = pgm(w8);
plot(f, Pw8)
xlabel("Normalised Frequency(f)", "FontWeight", "bold")
ylabel("P_X(f)")
grid on

sgtitle("PSD estimate of 8, 128-sample segments of a 1024-sample sequence WGN")
hold off

avg_psd = zeros(1, 128);
for i = 1:128
   avg_psd(i) = (Pw1(i) + Pw2(i) +Pw3(i) +Pw4(i) +Pw5(i) +Pw6(i) +Pw7(i) + Pw8(i))/8;
end

figure(2)
hold on
plot(f, Pw8)
plot(f, avg_psd, 'LineWidth', 2)
y1 = yline(1, 'r', '1');
y1.LineWidth = 1.5;

legend({'PSD of 1 segment', 'PSD of 8 averaged segments', 'theoretical PSD'}, 'FontSize', 11, 'FontWeight', 'bold')
xlabel("Normalised Frequency(f)", "FontWeight", "bold")
ylabel("P_X(f)")
title("Averaged PSD of WGN")

grid on
hold off

