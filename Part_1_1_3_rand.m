means = zeros(1,10);
stds = zeros(1,10);

for i = 1:10
    samples = zeros(1,1000);
    for n = 1:1000
        samples(n) = rand;
        
    end
    means(i)=mean(samples);
    stds(i)=std(samples);
end

figure
plot(means,0, 'x');
title("Plot of means for 10, 1000 sample realisations of rand")
xlabel("Sample mean", 'FontWeight', 'bold')
ylim([-0.5 0.5])
xlim([0.45 0.55])
xline(0.5, 'r', '\mu', 'LineWidth',1,'FontSize', 15, 'FontWeight', 'bold')
grid on;


figure
plot(stds, 0, 'x')
title("Plot of standard deviations for 10, 1000 sample realisations of rand");
xlabel("Sample \sigma", 'FontWeight', 'bold')
ylim([-0.5 0.5])
xlim([0.289-0.05 0.289+0.05])
xline(0.289, 'r', '\sigma', 'LineWidth',1,'FontSize', 15, 'FontWeight', 'bold')
grid on;

