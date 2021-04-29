function [yhat, e,  wopts] = lms_gear(x, z, order)
	N = length(x);
    yhat = zeros(1,N);
    e = zeros(1,N);
    wopts = zeros(N,order);
    Nw = order-1;
    mu_base = 0.07;
    mu = mu_base;
    p_e = 1;
    for i = 1:N
        if p_e<0.1 && i>100
            mu = mu_base*10/i;
        end
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
        p_e = abs(e(1, i)/z(1, i));
        display(mu)
        wopts(i+1, :) =  wopts(i, :) + ((mu*e(i)).*xdelays);
    end
    
    
end