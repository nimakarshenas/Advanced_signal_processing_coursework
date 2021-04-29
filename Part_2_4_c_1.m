nasdaq = load('NASDAQ.mat');
nasdaq = nasdaq.NASDAQ.Close;
N = length(nasdaq);
nasdaq = (nasdaq - mean(nasdaq))/std(nasdaq);
a = aryule(nasdaq, 1);
a1 = a(2);
CRLB_sig = zeros(20, 20);
CRLB_a = zeros(20, 20);
rxx = xcorr(nasdaq, 'unbiased');
rxx0 = rxx(N);
N = 1001:-50:1;
sig = 1:50:1001;
for i = 1:21

    for j = 1:21
        
        CRLB_sig(i, j) = (2*(sig(j)^4))/N(i);
        CRLB_a(i, j) = (sig(j))^2/(N(i)*rxx0);
        
    end
    
end


figure(1)

heatmap(sig, N,CRLB_sig, 'ColorScaling','log', 'Colormap',summer)
xlabel("\sigma")
ylabel("N")
title("CRLB of a_1")
figure(2)
heatmap(sig, N, CRLB_a,  'ColorScaling','log', 'Colormap',summer)
xlabel("\sigma")
ylabel("N")
title("CRLB of \sigma^2")