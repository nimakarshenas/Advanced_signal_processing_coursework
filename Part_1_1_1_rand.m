N = 10000;
means = zeros(1,N);
stds = zeros(1,N);

randdist = rand(1,1000);
figure
hold on
for i = 1:1000
    scatter(i,randdist(i),3)
    
end
yline(0.5, 'b', '\mu','LabelHorizontalAlignment', 'left', 'LineWidth', 1.5,'FontSize', 12, 'FontWeight', 'bold')
yline(mean(randdist), '--r', 'sample mean', 'LineWidth', 1.3,'FontSize', 12, 'FontWeight', 'bold')
yline(0.289, 'b', '\sigma','LabelHorizontalAlignment', 'left', 'LineWidth', 1.5,'FontSize', 12, 'FontWeight', 'bold')
yline(std(randdist), '--r', 'sample standard deviation', 'LineWidth', 1.3,'FontSize', 12, 'FontWeight', 'bold')
title("1000 samples of rand, x=U(0,1)")
xlabel("sample(n)",'FontSize', 12, 'FontWeight', 'bold')
ylabel("x",'FontSize', 12, 'FontWeight', 'bold')
ylim([-0.3, 1.3])
hold off

for i=0:N
    randdist = zeros(1, 1000);
    for j=0:999
        randdist(j+1) = rand;
    end
    means(i+1) = mean(randdist);
    stds(i+1) = std(randdist);
end


figure
hold on
xline(mean(means), '--r', '\hat{\mu}', 'LineWidth', 2,'FontSize', 12, 'FontWeight', 'bold')
xline(mean(means), '--r', '\hat{\mu}', 'LineWidth', 2,'FontSize', 12, 'FontWeight', 'bold')
histogram(means, 30)

hold off

figure
hold on
histogram(stds, 30)
xline(mean(stds), '--r', '\hat{\sigma}', 'LineWidth', 2,'FontSize', 12, 'FontWeight', 'bold')
hold off
std(stds)
std(means)