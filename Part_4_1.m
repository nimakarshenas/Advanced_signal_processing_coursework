% ----- PART 1 -----
x = randn(1, 1000);
b = [1, 2, 3, 2, 1];
a = [1];

y = filter(b, a, x);
y1 = (y-mean(y))./std(y);

n = 0.1*randn(1, 1000);

z = y+n;
SNRz = snr(y1,n);
display(SNRz);
N=4; %change this value for assumed model order

acfx = xcorr(x,x,N); 
Rxx1 = toeplitz(acfx(N+1:end), -acfx(N+1:end));
ccfxz = xcorr(z, x, N);
pzx1 = ccfxz(1, N+1:end);

wopt = (inv(Rxx1))*(pzx1');
display(wopt)
%------PART 2-------
sigmas = [0.1, 2, 4, 6, 8, 10];
SNRs = zeros(1, length(sigmas));

figure
plot(b,  'r', 'LineWidth', 3)
hold on
for i = 1:length(sigmas)

    y = filter(b, a, x);
    y1 = (y-mean(y))./std(y);
    n = (sqrt(sigmas(i)))*randn(1, 1000);
    z = y+n;
    SNRz = snr(y1,n);
    SNRs(i) = SNRz;
    acfx = xcorr(x,x,N); 
    Rxx = toeplitz(acfx(N+1:end), conj(acfx(N+1:end)));
    ccfxz = xcorr(z, x, N);
    pzx = ccfxz(1, N+1:end);

    wopt = (inv(Rxx))*(pzx');
    p1 = plot(wopt, '-x');
end
title("Unknown system(b) estimation using Wiener Filter for varying noise powers", "FontSize", 13)
xlabel("b[n](n)", "FontSize", 14, "FontWeight", "bold")
ylabel("value", "FontSize", 14, "FontWeight", "bold")
legend(["theoretical","\sigma^2_n =0.1","\sigma^2_n =2","\sigma^2_n =4","\sigma^2_n =6","\sigma^2_n =8","\sigma^2_n =10"], "FontSize", 11, "FontWeight", "bold")
grid on
hold off