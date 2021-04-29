x = zeros(1, 1000);
for i = 1:1000
    x(i) = randn;
end
figure(1)
y = filter(ones(9,1), [1], x);
z = linspace(-1000, 1000, 1999);
w = zeros(1, 1999);
for j = 0:8
    w(1000-j) =1;
end
hold on
stem(z, w, 'r', 'MarkerSize',5)
stem(z, xcorr(x, y,'unbiased'),'b','MarkerSize',5)
legend('Theoretical', 'Estimate')
axis([-20 20 -0.5 1.5])
xlabel("\tau")
ylabel("R_{XY}(\tau)")
title("Crosscorrelation of WGN and WGN filtered with MA(8)")
zoom on
hold off