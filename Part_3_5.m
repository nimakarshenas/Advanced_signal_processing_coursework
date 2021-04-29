rri =  load('RRI-DATA.mat');



%for RRI1
rri1 = rri.xRRI1;
rri1 = detrend(rri1,0);
[f, Pgm] = pgm(rri1);

%50s Window:samples per window
N = 200;
%number of segments
M = floor(length(rri1)/N);
sum = zeros(1, N);
for i = 1:M
    rri1tmp = rri1((i-1)*N+1:i*N);
    [f_50, P] = pgm(rri1tmp);
    sum = sum + P;
end
ffty_rri1 = sum./M;


%150s Window:samples per window
N = 600;
%number of segments
M = floor(length(rri1)/N);
sum = zeros(1, N);
for i = 1:M
    rri1tmp = rri1((i-1)*N+1:i*N);
    [f_150, P] = pgm(rri1tmp);
    sum = sum + P;
end
oneffty_rri1 = sum./M;

figure
hold on 
plot(f.*4, Pgm)
plot(f_50.*4, ffty_rri1)
plot(f_150.*4, oneffty_rri1)
xlim([0 0.5])
legend({'Periodogram Estimate', '50s Window', '150s Window'}, 'FontSize', 14, "FontWeight", "bold")
xlabel("Frequency(Hz)", 'FontSize', 14, "FontWeight", "bold")
ylabel("P_Y(f)", 'FontSize', 14, "FontWeight", "bold")
title("PSD estimation of RRI1", 'FontSize', 15)

grid on
hold off

%RRI2
rri2 = rri.xRRI2;
rri2 = detrend(rri2,0);
[f, Pgm] = pgm(rri2);
mean(rri2)

%50s Window:samples per window
N = 200;
%number of segments
M = floor(length(rri2)/N);
sum = zeros(1, N);
for i = 1:M
    rri2tmp = rri2((i-1)*N+1:i*N);
    [f_50, P] = pgm(rri2tmp);
    sum = sum + P;
end
ffty_rri2 = sum./M;


%150s Window:samples per window
N = 600;
%number of segments
M = floor(length(rri2)/N);
sum = zeros(1, N);
for i = 1:M
    rri2tmp = rri2((i-1)*N+1:i*N);
    [f_150, P] = pgm(rri2tmp);
    sum = sum + P;
end
oneffty_rri2 = sum./M;

figure
hold on 
plot(f.*4, Pgm)
plot(f_50.*4, ffty_rri2)
plot(f_150.*4, oneffty_rri2)
xlim([0 0.5])
legend({'Periodogram Estimate', '50s Window', '150s Window'}, 'FontSize', 14, "FontWeight", "bold")
xlabel("Frequency(Hz)", 'FontSize', 14, "FontWeight", "bold")
ylabel("P_Y(f)", 'FontSize', 14, "FontWeight", "bold")
title("PSD estimation of RRI2", 'FontSize', 15)
grid on
hold off


%RRI3
rri3 = rri.xRRI3;
rri3 = detrend(rri3,0);
[f, Pgm] = pgm(rri3);
mean(rri3)

%50s Window:samples per window
N = 200;
%number of segments
M = floor(length(rri3)/N);
sum = zeros(1, N);
for i = 1:M
    rri3tmp = rri3((i-1)*N+1:i*N);
    [f_50, P] = pgm(rri3tmp);
    sum = sum + P;
end
ffty_rri3 = sum./M;


%150s Window:samples per window
N = 600;
%number of segments
M = floor(length(rri2)/N);
sum = zeros(1, N);
for i = 1:M
    rri3tmp = rri3((i-1)*N+1:i*N);
    [f_150, P] = pgm(rri3tmp);
    sum = sum + P;
end
oneffty_rri3 = sum./M;

figure
hold on 
plot(f.*4, Pgm)
plot(f_50.*4, ffty_rri3)
plot(f_150.*4, oneffty_rri3)
xlim([0 0.5])
legend({'Periodogram Estimate', '50s Window', '150s Window'}, 'FontSize', 14, "FontWeight", "bold")
xlabel("Frequency(Hz)", 'FontSize', 14, "FontWeight", "bold")
ylabel("P_Y(f)", 'FontSize', 14, "FontWeight", "bold")
title("PSD estimation of RRI3", 'FontSize', 15)
grid on
hold off
