x = rp1(100, 100);
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
plot(means, "LineWidth", 2)
xlabel("sample(n)", "FontSize", 13, "FontWeight", "bold")
ylabel("Ensemble Mean", "FontSize", 13, "FontWeight", "bold")
title("Ensemble Mean of RP1, N=100, M=100","FontSize", 14)
grid on
hold off;

figure
hold on 
plot(stds, "LineWidth", 2)
xlabel("sample(n)", "FontSize", 13, "FontWeight", "bold")
ylabel("Ensemble Mean", "FontSize", 13, "FontWeight", "bold")
title("Ensemble Standard Deviation of RP1, N=100, M=100","FontSize", 14)
grid on
hold off;


