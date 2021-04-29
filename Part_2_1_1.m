x = zeros(1, 1000);
for i = 1:1000
    x(i) = randn;
end
y = linspace(-1000, 1000, 1999);
figure
stem(y, xcorr(x, 'unbiased'), 'MarkerSize',5)
axis([-1000 1000 -1 1.5])
xlabel("\tau")
ylabel("R_x(\tau)")
title("Estimation of autocorrelation of WGN, zoomed")
zoom on
