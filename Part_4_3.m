
x = randn(1, 1000);
b = [1, 2, 3, 2, 1];
a = [1];
y = filter(b, a, x);


figure
subplot(2,1,1)
hold on
n = 0.1*randn(1, 1000);
z = y+n;
[yhat, e, wopts] = lms_gear(x, z, length(b));

wopt1 = wopts(:,1);
wopt2 = wopts(:,2);
wopt3 = wopts(:,3);
wopt4 = wopts(:,4);
wopt5 = wopts(:,5);

yline(1, '--','w[0], w[4]', 'LabelHorizontalAlignment', 'right', 'LineWidth', 1,'FontSize', 10, 'FontWeight', 'bold')
yline(3, '--','w[2]','LabelHorizontalAlignment', 'right', 'LineWidth', 1,'FontSize', 10, 'FontWeight', 'bold')
yline(2, '--','w[1], w[3]','LabelHorizontalAlignment', 'right', 'LineWidth', 1,'FontSize', 10, 'FontWeight', 'bold')
ylim([0 3.5])

plot(wopt1, 'LineWidth', 1.5)
plot(wopt2, 'LineWidth', 1.5)
plot(wopt3, 'LineWidth', 1.5)
plot(wopt4, 'LineWidth', 1.5)
plot(wopt5, 'LineWidth', 1.5)


xlabel("iteration(n)", "FontSize", 12, "FontWeight", "bold")
grid on
ylabel("Estimate", "FontSize", 12, "FontWeight", "bold")
title("Evolution of adaptive weights using LMS; Gear shifting", "FontSize", 13)
hold off


subplot(2,1,2)
hold on 
plot(e.^2, 'r')
title("Squared error of LMS system identification; Gear shifting", "FontSize", 13)
xlabel("iteration(n)", "FontSize", 12, "FontWeight", "bold")
ylabel("e^2(n), squared error","FontSize", 12, "FontWeight", "bold")
grid on
hold off

