sunspot = load('sunspot.dat');
sunspot = sunspot(:,2);
N = length(sunspot);
sunspot = (sunspot - mean(sunspot))/std(sunspot);
orders = [1 2 10];
steps_ahead = [1 2 5 10];

for i = 1:3
    
    figure(i)
    a = ar(sunspot, orders(i));  %obtains the AR coefficients for current order
    plot(sunspot, 'LineWidth', 2)   %plot true sunspot
    hold on
    
    for j = 1:4
         x = predict(a, sunspot, steps_ahead(j));
         plot(x, 'LineWidth', 1.5)
    end

    legend({'sunspot', 'm=1','m=2','m=5','m=10'}, 'FontSize', 14)
    xlim([0 100])
    title("preditions of sunspot series: AR(" + string(orders(i)+")"), "FontSize", 15)
    xlabel("Sample(n)", 'FontWeight', 'bold')
    ylabel("Value",  'FontWeight', 'bold')
    hold off
     
end