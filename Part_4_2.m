
mu = 0.01;
x = randn(1, 1000);
b = [1, 2, 3, 2, 1];
a = [1];
y = filter(b, a, x);
sigmas = [0.1,2,4,6,8,10];
figure
plot(b,  'r', 'LineWidth', 3)
hold on
for i = 1:length(sigmas)
    n = sqrt(sigmas(i))*randn(1, 1000);
    z = y+n;
    [yhat, e, wopts] = lms_(x, z, mu, length(b));
    wopt = wopts(length(x)+1,:);
    p1 = plot(wopt, '-x');
end
title("LMS estimation of filter coefficients", "FontSize", 13)
xlabel("b[n](n)", "FontSize", 14, "FontWeight", "bold")
ylabel("value", "FontSize", 14, "FontWeight", "bold")
legend(["theoretical","\sigma^2_n =0.1","\sigma^2_n =2","\sigma^2_n =4","\sigma^2_n =6","\sigma^2_n =8","\sigma^2_n =10"], "FontSize", 9, "FontWeight", "bold")
grid on
hold off



