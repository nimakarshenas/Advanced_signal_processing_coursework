e = audioread("e.mp3");
[a, Fs] = audioread("a.mp3");
s = audioread("s.mp3");
t = audioread("t.mp3");
x = audioread("x.mp3");

e = e(3000:3999);
e = (e-mean(e))./std(e);
e = e';
enext = zeros(1,1000);
enext(2:end) = e(1:end-1);

a = a(3000:3999);
a = (a-mean(a))./std(a);
a = a';
anext = zeros(1,1000);
anext(2:end) = a(1:end-1);

s = s(3000:3999);
s = (s-mean(s))./std(s);
s=s';
snext = zeros(1,1000);
snext(2:end) = s(1:end-1);

t = t(3000:3999);
t = (t-mean(t))./std(t);
t=t';
tnext = zeros(1,1000);
tnext(2:end) =t(1:end-1);

x = x(3000:3999);
x = (x-mean(x))./std(x);
x=x';
xnext = zeros(1,1000);
xnext(2:end) = x(1:end-1);
% PlotOrderMetrics(e, 30, "e");
% PlotOrderMetrics(a,30, "a");
% PlotOrderMetrics(s,30, "s");
% PlotOrderMetrics(t,30, "t");
% PlotOrderMetrics(x,30, "x");

%-------------E-------------------
order = 5;
mu = 0.08; 
[y_e, e_e, w_e] = lms_(enext,e,mu,order);



R_pe = 10*log10((std(enext))^2/(std(e_e))^2);
display(R_pe)

wopt1 = w_e(:,1);
wopt2 = w_e(:,2);
wopt3 = w_e(:,3);
wopt4 = w_e(:,4);
wopt5 = w_e(:,5);

figure 
subplot(2,1,1)
hold on
plot(wopt1, 'LineWidth', 1.5)
plot(wopt2, 'LineWidth', 1.5)
plot(wopt3, 'LineWidth', 1.5)
plot(wopt4, 'LineWidth', 1.5)
plot(wopt5, 'LineWidth', 1.5)
%change this as well
legend(["a_1", "a_2", "a_3", "a_4", "a_5"], "FontWeight", "bold")
xlabel("iteration(n)", "FontSize", 12, "FontWeight", "bold")
ylabel("Estimate", "FontSize", 12, "FontWeight", "bold")
%change
title("Evolution of adaptive weights, LMS; letter 'e'", "FontSize", 13)
grid on
hold off


subplot(2,1,2)
hold on
plot(e)
plot(y_e)
legend(["Original signal","Predicted signal"], "FontSize", 12, "FontWeight", "bold")
xlabel("sample(n)", "FontSize", 12, "FontWeight", "bold")
ylabel("y", "FontSize", 12, "FontWeight", "bold")
%CHANGE TITLE BASED ON LETTER
title("Predicted signal of letter 'e'")
grid on
hold off


%---------------------A-----------------------------

order = 6;
mu = 0.05; 
[y_e, e_e, w_e] = lms_(anext,a,mu,order);



R_pa = 10*log10((std(anext))^2/(std(e_e))^2);
display(R_pa)

wopt1 = w_e(:,1);
wopt2 = w_e(:,2);
wopt3 = w_e(:,3);
wopt4 = w_e(:,4);
wopt5 = w_e(:,5);
wopt6 = w_e(:,6);

figure 
subplot(2,1,1)
hold on
plot(wopt1, 'LineWidth', 1.5)
plot(wopt2, 'LineWidth', 1.5)
plot(wopt3, 'LineWidth', 1.5)
plot(wopt4, 'LineWidth', 1.5)
plot(wopt5, 'LineWidth', 1.5)
plot(wopt6, 'LineWidth', 1.5)
%change this as well
legend(["a_1", "a_2", "a_3", "a_4", "a_5", "a_6"], "FontWeight", "bold")
xlabel("iteration(n)", "FontSize", 12, "FontWeight", "bold")
ylabel("Estimate", "FontSize", 12, "FontWeight", "bold")
%change
title("Evolution of adaptive weights, LMS; letter 'a'", "FontSize", 13)
grid on
hold off


subplot(2,1,2)
hold on
plot(a)
plot(y_e)
legend(["Original signal","Predicted signal"], "FontSize", 12, "FontWeight", "bold")
xlabel("sample(n)", "FontSize", 12, "FontWeight", "bold")
ylabel("y", "FontSize", 12, "FontWeight", "bold")
%CHANGE TITLE BASED ON LETTER
title("Predicted signal of letter 'a'")
grid on
hold off


% -----------------------S -----------------------------

order = 2;
mu = 0.08; 
[y_e, e_e, w_e] = lms_(snext,s,mu,order);



R_pa = 10*log10((std(snext))^2/(std(e_e))^2);
display(R_pa)

wopt1 = w_e(:,1);
wopt2 = w_e(:,2);

figure 
subplot(2,1,1)
hold on
plot(wopt1, 'LineWidth', 1.5)
plot(wopt2, 'LineWidth', 1.5)

%change this as well
legend(["a_1", "a_2"], "FontWeight", "bold")
xlabel("iteration(n)", "FontSize", 12, "FontWeight", "bold")
ylabel("Estimate", "FontSize", 12, "FontWeight", "bold")
%change
title("Evolution of adaptive weights, LMS; letter 's'", "FontSize", 13)
grid on
hold off


subplot(2,1,2)
hold on
plot(s)
plot(y_e)
legend(["Original signal","Predicted signal"], "FontSize", 12, "FontWeight", "bold")
xlabel("sample(n)", "FontSize", 12, "FontWeight", "bold")
ylabel("y", "FontSize", 12, "FontWeight", "bold")
%CHANGE TITLE BASED ON LETTER
title("Predicted signal of letter 's'")
grid on
hold off




%-------------------T----------------------------------

order = 7;
mu = 0.05; 
[y_e, e_e, w_e] = lms_(tnext,t,mu,order);



R_pa = 10*log10((std(tnext))^2/(std(e_e))^2);
display(R_pa)

wopt1 = w_e(:,1);
wopt2 = w_e(:,2);
wopt3 = w_e(:,3);
wopt4 = w_e(:,4);
wopt5 = w_e(:,5);
wopt6 = w_e(:,6);
wopt7 = w_e(:,7);

figure 
subplot(2,1,1)
hold on
plot(wopt1, 'LineWidth', 1.5)
plot(wopt2, 'LineWidth', 1.5)
plot(wopt3, 'LineWidth', 1.5)
plot(wopt4, 'LineWidth', 1.5)
plot(wopt5, 'LineWidth', 1.5)
plot(wopt6, 'LineWidth', 1.5)
plot(wopt7, 'LineWidth', 1.5)
%change this as well
legend(["a_1", "a_2", "a_3", "a_4", "a_5", "a_6", "a_7"], "FontWeight", "bold")
xlabel("iteration(n)", "FontSize", 12, "FontWeight", "bold")
ylabel("Estimate", "FontSize", 12, "FontWeight", "bold")
%change
title("Evolution of adaptive weights, LMS; letter 't'", "FontSize", 13)
grid on
hold off


subplot(2,1,2)
hold on
plot(t)
plot(y_e)
legend(["Original signal","Predicted signal"], "FontSize", 12, "FontWeight", "bold")
xlabel("sample(n)", "FontSize", 12, "FontWeight", "bold")
ylabel("y", "FontSize", 12, "FontWeight", "bold")
%CHANGE TITLE BASED ON LETTER
title("Predicted signal of letter 't'")
grid on
hold off




%---------------------------X--------------------------------

order = 6;
mu = 0.08; 
[y_e, e_e, w_e] = lms_(xnext,x,mu,order);



R_pa = 10*log10((std(xnext))^2/(std(e_e))^2);
display(R_pa)

wopt1 = w_e(:,1);
wopt2 = w_e(:,2);
wopt3 = w_e(:,3);
wopt4 = w_e(:,4);
wopt5 = w_e(:,5);
wopt6 = w_e(:,6);

figure 
subplot(2,1,1)
hold on
plot(wopt1, 'LineWidth', 1.5)
plot(wopt2, 'LineWidth', 1.5)
plot(wopt3, 'LineWidth', 1.5)
plot(wopt4, 'LineWidth', 1.5)
plot(wopt5, 'LineWidth', 1.5)
plot(wopt6, 'LineWidth', 1.5)
%change this as well
legend(["a_1", "a_2", "a_3", "a_4", "a_5", "a_6"], "FontWeight", "bold")
xlabel("iteration(n)", "FontSize", 12, "FontWeight", "bold")
ylabel("Estimate", "FontSize", 12, "FontWeight", "bold")
%change
title("Evolution of adaptive weights, LMS; letter 'x'", "FontSize", 13)
grid on
hold off


subplot(2,1,2)
hold on
plot(x)
plot(y_e)
legend(["Original signal","Predicted signal"], "FontSize", 12, "FontWeight", "bold")
xlabel("sample(n)", "FontSize", 12, "FontWeight", "bold")
ylabel("y", "FontSize", 12, "FontWeight", "bold")
%CHANGE TITLE BASED ON LETTER
title("Predicted signal of letter 'x'")
grid on
hold off