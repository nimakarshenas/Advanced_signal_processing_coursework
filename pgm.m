function [f Px] = pgm(x)
    N = length(x);
    freqresp = fft(x);
    Px = (1/N).*(abs(freqresp)).^2;
    f = 0:(1/N):((N-1)/N);
end

