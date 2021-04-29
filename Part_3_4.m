freq = zeros(12, 2);
col = [1209, 1336, 1477];
row = [697, 770, 852, 941];
for r = 1:4
    for c = 1:3
        freq((3*(r-1))+c, 1) = col(c);
        freq((3*(r-1))+c, 2) = row(r);
    end
end
phone = [0:9];
num = phone(randperm(numel(phone),8));
num = [0, 2, 0, num];
N = length(num);
Fs = 32768;
t = 0:(1/32768):5.25; %define each sample position
y = [];
window = 32768*0.5;
x = 0;
sigma = 0;
for i = 1:N-1
    tmp = num(i);
    if tmp == 0 %the correct frequencies for 0 are at row 11 of freq matrix
        f1 = freq(11,1);
        f2 = freq(11,2);
    else
        f1 = freq(tmp,1);
        f2 = freq(tmp, 2);
    end
    n0 = ((i-1)*window);
    ytemp = sin(2*f1*pi*(t(n0+1:n0+(window/2)))) + sin(2*f2*pi*(t(n0+1:n0+(window/2)))) + sigma*randn(1, 8192);
    pad = zeros(1, window/2) + sigma*randn(1, 8192);
    y = [y, ytemp];
    y = [y, pad];

end


ytemp = sin(2*f1*pi*(t(end-(window/2):end)))+ sin(2*f2*pi*(t(end-(window/2):end))) + sigma*randn(1, 8193);
y = [y, ytemp];
t_tick = 0:0.25:5.25;
figure
hold on
plot(t, y)
xlabel("time(s)", "FontSize", 13, "FontWeight", "bold")
ylabel("y", "FontSize", 13, "FontWeight", "bold")
title("Waveform of a randomly generated London landline number; digit '2'")
xlim([0 5.3])
zoom on 
hold off

figure
hold on
spectrogram(y, hamming(window/2), 0, window/2, Fs, 'yaxis')
title("\sigma_N="+string(sigma), "FontSize", 15)
xlim([0 5.25])
ylim([0 2])
hold off






