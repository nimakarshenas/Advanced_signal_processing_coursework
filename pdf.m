function pdf(samples)

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
    histogram('BinCounts', y, 'BinEdges', edges)
    xlabel("x");
    ylabel("pdf(x)");
    
end