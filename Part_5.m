f = [0 0.1 0.2 0.3 0.4 0.5];
N = 0:1:9;

figure
hold on
for i = 1:length(f)
    x = cos(2*pi*N*f(i));
    [xax P] = pgm(x);
    plot(xax, P, "LineWidth", 1.5)
end

title("Periodogram")
xlabel("Normalised Frequency(f_0)", "FontSize", 12, "FontWeight", "bold")
ylabel("PSD", "FontSize", 12, "FontWeight", "bold")
legend(["f_0 = 0", "f_0 = 0.1", "f_0 = 0.2","f_0 = 0.3","f_0 = 0.4","f_0 = 0.5"], "FontSize", 10, "FontWeight", "bold")
hold off

%---------------NOW FIND MLE----------------------------
f = linspace(0,0.5,25);

N = 10;
n = 0:1:(N-1);

for i=1:25
    x = cos(2*pi*f(i)*n);
    [xax P] = pgm(x);
    [mle, index] = max(P);
    f1(i) = xax(index);  
end
N = 100;
n = 0:1:(N-1);
for i=1:25
    x = cos(2*pi*f(i)*n);
    [xax P] = pgm(x);
    [mle, index] = max(P);
    f2(i) = xax(index);  
end

figure
hold on
plot(f, f, 'linewidth', 1.2);
plot(f, f1, 'x', 'linewidth', 2,'MarkerSize',10);
plot(f, f2, 'x', 'linewidth', 2,'MarkerSize',10);

title('Real and estimated f_0', "FontSize", 12, "FontWeight", "bold")
xlabel('True f_0', "FontSize", 12, "FontWeight", "bold")
ylabel('Estimated f_0', "FontSize", 12, "FontWeight", "bold");
legend('Ideal','Experimental N=10', 'Experimental N=100', "FontSize", 12, "FontWeight", "bold")
grid on
hold off

