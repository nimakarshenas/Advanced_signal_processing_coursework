figure
samples = [100, 1000, 10000, 100000];
A = 0;
u = -10:.1:10;
y = normpdf(u,0,1);

for i=1:4
    N = samples(i);
    x = randn(1, N);
    subplot(1,4,i)     
    pdf(x)
    hold on
    plot(u, y, 'LineWidth', 2)
    title("N="+string(N) )
    xlim([-5 5]);
    hold off
end


