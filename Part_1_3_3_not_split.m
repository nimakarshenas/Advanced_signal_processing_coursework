
x = zeros(1, 1000);
for i = 1:500
    x(i)= rand-0.5;
end
for i = 501:1000
    x(i) = rand+0.5;
end

figure
pdf(x)
title("Estimation of PDF: v(1:1000)")