x1 = randn(1, 10000);
a = [1 0.9 0.2];
x = filter(1, a, x1);
xnext = zeros(1,10000);
order = 2;
xnext(2:end) = x(1:end-1);


figure
hold on
mu = 0.01;
[yhat, e, wopts] = lms_(xnext, x, mu, order);

wopt1 = wopts(:,1);
wopt2 = wopts(:,2);


plot(wopt1, 'LineWidth', 1.5)
plot(wopt2, 'LineWidth', 1.5)
yline(-0.2, '--','a[1]', 'LabelHorizontalAlignment', 'right', 'LineWidth', 1,'FontSize', 10, 'FontWeight', 'bold')
yline(-0.9, '--','a[2]','LabelHorizontalAlignment', 'right', 'LineWidth', 1,'FontSize', 10, 'FontWeight', 'bold')


xlabel("iteration(n)", "FontSize", 12, "FontWeight", "bold")

ylabel("Estimate", "FontSize", 12, "FontWeight", "bold")
title("Evolution of adaptive weights, LMS; \mu=" + string(mu), "FontSize", 13)
grid on
hold off



