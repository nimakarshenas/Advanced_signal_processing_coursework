n = 128;
for i = 1:3
    
    N = n*(2^(i-1));
    w = randn(1, N);
    [f Pw] = pgm(w);
    Pw2 = filter(0.2*[1 1 1 1 1], [1], Pw);
    
    figure(i)
    
    hold on
    grid on
    
    plot(f, Pw)
    plot(f, Pw2, 'LineWidth', 2)
    
    y1 = yline(1, 'r', '1');
    y1.LineWidth = 1.5;
    
    legend({'Periodogram', 'Filtered Periodogram', 'theoretical PSD'}, 'FontSize', 12, 'FontWeight', 'bold')
    xlabel("Normalised Frequency(f)", 'FontWeight', 'bold', 'FontSize', 14)
    ylabel("P_X(f)", 'FontSize', 14)
    title("PSD estimate of "+string(N)+"-sample realisation of WGN", 'FontSize', 16)
    
    hold off
    
end