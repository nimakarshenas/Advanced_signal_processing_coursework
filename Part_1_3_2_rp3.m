


figure
samples = [100, 1000, 10000, 100000];
u = -1.5:0.001:2.5;
y = unifpdf(u,-1,2);

for i=1:4
    N = samples(i);
    subplot(1,4,i)
    x = rp3(1,N);
    pdf(x)
    hold on
    plot(u, y, 'LineWidth', 2)
    title("N="+string(N) )
    xlim([-1.5 2.5]);
    hold off
end