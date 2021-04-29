Z = -0.5:0.001:1.5;
A = 0;
B = 1;
y = unifpdf(Z,A,B);
bins = 20;
samples = [1000, 100000];



for i =1:2
    x = rand(1, samples(i));

    [counts, edges] = histcounts(x, bins);

    sum_counts = sum(counts);
    width = edges(2)-edges(1);
    area = sum_counts*width;
    figure
    hold on
    histogram('BinCounts', counts/area, 'BinEdges', edges)
    plot(Z,y, 'r', 'LineWidth', 2)
    
    hold off;
    title("No. of samples ="+ string(samples(i)) +"; bins = "+string(bins), "FontSize",14)
    xlabel('$x$', "FontWeight", "bold", "FontSize",16, "interpreter", "Latex") 
    ylabel('pdf(x)', "FontWeight", "bold", "FontSize",14) 
end
