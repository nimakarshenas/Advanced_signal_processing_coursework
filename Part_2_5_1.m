rri =  load('RRI-DATA.mat');
rri1 = rri.xRRI1;
rri2 = rri.xRRI2;
rri3 = rri.xRRI3;
h1 = 60./rri1;
N = length(h1);
a = [1 0.6];
h2 = zeros(1, floor(N/10)-1);
h3 = zeros(1, floor(N/10)-1);



for i=1:(floor(N/10)-1)
   tmp = 0;
   for j =(10*i):((10*i)+9) 
       tmp = tmp + h1(j);
   end
   h2(i) = a(1)*tmp/10;
   h3(i) = a(2)*tmp/10;
end



pdf_2(h1)
xlim([50 120])
title("estimation of the pdf of h[n]", 'FontSize', 14, 'FontWeight', 'bold', 'interpreter','latex')

pdf_2(h2)
xlim([50 120])
title("estimation of the pdf of $$\hat{h}_1[n]$$", 'FontSize', 14, 'FontWeight', 'bold', 'interpreter','latex')

pdf_2(h3)
xlim([50 120])
title("estimation of the pdf of $$\hat{h}_2[n]$$", 'FontSize', 14, 'FontWeight', 'bold', 'interpreter','latex')

mean(h1)
var(h1)

mean(h2)
var(h2)

mean(h3)
var(h3)