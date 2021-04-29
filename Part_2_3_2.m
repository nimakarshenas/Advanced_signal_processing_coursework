sunspot = load('sunspot.dat');
sunspot = sunspot(:,2);

samples = [5, 20, 250];

for i = 1:2
    zero_mean = sunspot(1:samples(i)) - mean(sunspot(1:samples(i)));
    figure(i)
    z = linspace(-samples(i)+1, samples(i)-1, (2*samples(i)-1));
    
    subplot(2,1,1)
    
    stem(z, xcorr(sunspot(1:samples(i)), 'unbiased'), 'MarkerSize',5)
    grid on
    title("N="+string(samples(i))+": non-zero mean")
    xlim([-samples(i) samples(i)])
    xlabel("\tau")
    ylabel("R_X(\tau)")

    subplot(2,1,2)
    
    stem(z, xcorr(zero_mean(1:samples(i)), 'unbiased'), 'MarkerSize',5)
    grid on
    title("N="+string(samples(i))+": zero mean")
    xlim([-samples(i) samples(i)])
    xlabel("\tau")
    ylabel("R_X(\tau)")
    
end

zero_mean = sunspot(1:samples(3)) - mean(sunspot(1:samples(3)));
figure(3)
z = linspace(-samples(3)+1, samples(3)-1, (2*samples(3)-1));
subplot(2,1,1)

plot(z, xcorr(sunspot(1:samples(3)), 'unbiased'), 'MarkerSize',5)
grid on
title("N="+string(samples(3))+": non-zero mean")
xlabel("\tau")
ylabel("R_X(\tau)")


subplot(2,1,2)

plot(z, xcorr(zero_mean(1:samples(3)), 'unbiased'), 'MarkerSize',5)
grid on
title("N="+string(samples(3))+": zero mean")
xlabel("\tau")
ylabel("R_X(\tau)")


