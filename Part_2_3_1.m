
a1_stable = [];
a2_stable = [];
a1_unstable = [];
a2_unstable = [];




for i = 1:1000
    a1 = (rand-0.5)*5;
    a2 = (rand-0.5)*3;

    a = [1, -a1, -a2];
    x = filter(1, a, randn(1000,1));
    if isstable(1, a)
        a1_unstable = [a1_unstable a1];
        a2_unstable = [a2_unstable a2];
    
    else
        a1_stable = [a1_stable a1];
        a2_stable = [a2_stable a2];
    end
end

hold on
s(1) = scatter(a1_stable, a2_stable, 'r', 'filled');
s(2) = scatter(a1_unstable, a2_unstable, 'b', 'filled');
ylabel("a_2")
xlabel("a_1")
title("Plot showing stability of an AR(2) process for varying AR coefficients")
s(3) = line([-2 0],[-1;1],'LineWidth',2);
s(4) = line([0;2],[1;-1], 'LineWidth',2);
s(5) = line([-2;2],[-1;-1],'LineWidth',2);
legend(s([1 2 3]), 'converges', 'unstable', 'stability triangle')

hold off