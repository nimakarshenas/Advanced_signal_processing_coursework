function [yhat, e,  wopts] = lms_signe(x, z, mu, order)
	N = length(x);
    yhat = zeros(1,N);
    e = zeros(1,N);
    wopts = zeros(N,order);
    Nw = order-1;
    for i = 1:N
        xdelays = zeros(1,order);
        xdelays(1) = x(i);
        for j = 1:Nw
            if (i-j) > 0
                xdelays(j+1) = x(i-j);
            else
                xdelays(j+1) = 0;
            end
        end
        yhat(1,i) = wopts(i,:)*(xdelays');
        e(1, i) = z(1, i) - yhat(1, i);
        wopts(i+1, :) =  wopts(i, :) + ((mu*sign(e(i))).*xdelays);
    end
    
end