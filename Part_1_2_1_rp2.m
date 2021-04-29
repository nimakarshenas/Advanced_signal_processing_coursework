x = rp2(100, 100);
means = zeros(1,100);
stds = zeros(1,100);
for i=1:100
    means(i) = mean(x(:,i));
    stds(i) = std(x(:,i));
end
mean_of_means = mean(means);
mean_of_stds = mean(stds);
figure
hold on 
p1 = plot(means, "LineWidth", 2);
yline(mean_of_means, "r--", "LineWidth", 2)
xlabel("sample(n)", "FontSize", 13, "FontWeight", "bold")
ylabel("Ensemble Mean", "FontSize", 13, "FontWeight", "bold")
title("Ensemble Mean of RP2, N=100, M=100","FontSize", 14)
legend(["Ensemble Mean", "Mean of Ensemble Means"], "FontSize", 10, "FontWeight", "bold")
grid on
hold off;

figure
hold on 
p2 = plot(stds, "LineWidth", 2);
yline(mean_of_stds, "r--", "LineWidth", 2)
xlabel("sample(n)", "FontSize", 13, "FontWeight", "bold")
ylabel("Ensemble Mean", "FontSize", 13, "FontWeight", "bold")
title("Ensemble Standard Deviation of RP2, N=100, M=100","FontSize", 14)
legend(["Ensemble Standard Deviation", "Mean of Ensemble standart deviations"], "FontSize", 10, "FontWeight", "bold")
grid on
hold off;




