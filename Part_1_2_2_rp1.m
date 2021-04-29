x = rp1(4, 1000);
means = zeros(1, 4);
stds = zeros(1, 4);
for i=1:4
    means(i) = mean(x(i,:));
    stds(i) = std(x(i,:));
end
means
stds
 