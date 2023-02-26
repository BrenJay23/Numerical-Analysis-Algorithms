syms y_e(t)
%sample solution y_e(t)=((t+1)^2)-(.5*exp(t));
%sample values
    %y = @(t,y_n) y_n - (t.^2) + 1
    %t = 0:(2/20):2
    %y1 = 0.5
y=input('Enter vector function of t and y_n : ');
t=input('Enter time domain vector : ');
y1=input('Enter initial condition : ');
disp('1 : Euler explicit method')
disp('2 : second order Runge-Kutta method modified Euler')
k=input('Enter method number : ');
% sample solution graph fplot(y_e,[t(1),t(length(t))]);
hold on
switch k
    case 1
        y_n=ODEIVPsolver_EEM(y,t,y1);
        plot(t,y_n,'--r');
    case 2
        y_n=ODEIVPsolver_RKM2ME(y,t,y1);
        plot(t,y_n,'--r');
end
