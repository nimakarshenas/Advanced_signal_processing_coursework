function pdf_2(samples)

    size=length(samples);
    if size<900
        bins = 10;
    
    elseif size<5000
        bins = 20;
    elseif size<50000
        bins = 50;
    else
        bins = 200;
    end
    [counts, edges] = histcounts(samples, bins); 
    sum_counts = sum(counts);
    width = edges(2)-edges(1);
    area = sum_counts*width*bins;
    y = counts/area;
    figure
    grid on
    histogram('BinCounts', y, 'BinEdges', edges)
    xlabel("x", 'FontSize', 12, 'FontWeight', 'bold');
    ylabel("pdf(x)", 'FontSize', 12, 'FontWeight', 'bold');
    
end