rri =  load('RRI-DATA.mat');
rri1 = rri.xRRI1;
rri2 = rri.xRRI2;
rri3 = rri.xRRI3;

rri1 = (rri1-mean(rri1))/(std(rri1));

rri2 = (rri2-mean(rri2))/(std(rri2));
rri3 = (rri3-mean(rri3))/(std(rri3));
z1 = linspace(-length(rri1), length(rri1), 2*length(rri1)-1);
z2 = linspace(-length(rri2), length(rri2), 2*length(rri2)-1);
z3 = linspace(-length(rri3), length(rri3), 2*length(rri3)-1);
figure
subplot(3, 1, 1)
plot(z1, xcorr(rri1, 'unbiased'))
ylabel("R_x(\tau)","FontSize", 10, 'FontWeight', 'bold')
title("ACF of normalised $$RRI_1[n], RRI_2[n], RRI_3[n]$$", 'FontSize', 16,'interpreter','latex')

subplot(3, 1, 2)
plot(z2, xcorr(rri2, 'unbiased'))
ylabel("R_x(\tau)","FontSize", 10, 'FontWeight', 'bold')

subplot(3, 1, 3)
plot(z3, xcorr(rri3, 'unbiased'))
xlabel("$$\tau$$","FontSize", 14, 'FontWeight', 'bold', 'interpreter','latex', 'FontSize', 16)
ylabel("R_x(\tau)","FontSize", 10, 'FontWeight', 'bold')
