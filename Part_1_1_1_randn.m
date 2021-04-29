N = 10000;
means = zeros(1,N);
stds = zeros(1,N);

randdist = randn(1,1000);
figure
hold on
for i = 1:1000
    scatter(i,randdist(i),3)
    
end
yline(0, 'b', '\mu','LabelHorizontalAlignment', 'left', 'LineWidth', 1.5,'FontSize', 12, 'FontWeight', 'bold')
yline(mean(randdist), '--r', 'sample mean', 'LineWidth', 1.3,'FontSize', 12, 'FontWeight', 'bold')
yline(1, 'b', '\sigma','LabelHorizontalAlignment', 'left', 'LineWidth', 1.5,'FontSize', 12, 'FontWeight', 'bold')
yline(std(randdist), '--r', 'sample standard deviation', 'LineWidth', 1.3,'FontSize', 12, 'FontWeight', 'bold')
title("1000 samples of rand, x=N(0,1)")
xlabel("sample(n)",'FontSize', 12, 'FontWeight', 'bold')
ylabel("x",'FontSize', 12, 'FontWeight', 'bold')
ylim([-3, 3])
hold off

