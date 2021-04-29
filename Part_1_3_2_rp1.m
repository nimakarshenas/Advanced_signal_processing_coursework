figure
samples = [100, 1000, 10000, 100000];
A = 0;

for i=1:4
    N = samples(i);
    ub = N*0.02;
    u = -(ub/2):0.001:ub+(ub/2);
    y = unifpdf(u,A,ub);

    subplot(1,4,i)
    x = rp1(1,N);
    pdf_est(x)
    hold on
    plot(u, y, 'LineWidth', 2)
    title("N="+string(N) )
    xlim([-(ub/2) ub+(ub/2)]);
    hold off
    
end


