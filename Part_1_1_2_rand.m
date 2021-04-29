

means = zeros(1,10);
stds = zeros(1,10);
for i=0:9
    randdist = zeros(1, 1000);
    for j=0:999
        randdist(j+1) = rand;
    end 
    means(i+1)=mean(randdist);
    stds(i+1)=std(randdist);
end

means
stds