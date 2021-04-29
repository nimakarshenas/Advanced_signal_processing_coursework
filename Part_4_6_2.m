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

%-------------LMS-------------------
order = 5;
mu = 0.08; 
[y_e, e_e, w_e] = lms_(enext,e,mu,order);



R_pe = 10*log10((std(e))^2/(std(e_e))^2);
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


%-----------------------SIGN E-----------------------------
order = 5;
mu = 0.08; 
[y_e, e_e, w_e] = lms_signe(enext,e,mu,order);



R_pe = 10*log10((std(e))^2/(std(e_e))^2);
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
title("Evolution of adaptive weights, sign-error; letter 'e'", "FontSize", 13)
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


%---------------------------SIGN X-------------------------------
order = 5;
mu = 0.08; 
[y_e, e_e, w_e] = lms_signx(enext,e,mu,order);



R_pe = 10*log10((std(e))^2/(std(e_e))^2);
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
title("Evolution of adaptive weights, sign-regressor; letter 'e'", "FontSize", 13)
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


%-----------------------------------SIGN SIGN--------------------------
order = 5;
mu = 0.08; 
[y_e, e_e, w_e] = lms_signex(enext,e,mu,order);



R_pe = 10*log10((std(e))^2/(std(e_e))^2);
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
title("Evolution of adaptive weights, sign-sign; letter 'e'", "FontSize", 13)
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