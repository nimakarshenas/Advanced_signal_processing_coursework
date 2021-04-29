
x = zeros(1, 500);
z = zeros(1,500);

u = -1.5:0.001:2.5;
X = unifpdf(u,-0.5,0.5);
Z = unifpdf(u,0.5,1.5);

for i = 1:500
    x(i)= rand-0.5;
end
for i = 501:1000
    z(i-500) = rand+0.5;
end

figure
subplot(1,2,1)
pdf(x)
hold on 
plot(u, X, 'LineWidth', 2);
xlim([-1.5 2.5])
title('Estimation of PDF: v(1:500)')
hold off

subplot(1,2,2)
pdf(z)
hold on 
plot(u, Z, 'LineWidth', 2);
xlim([-1.5 2.5])
title('Estimation of PDF: v(501:1000)')
hold off