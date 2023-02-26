y_1=input('Enter vector function f1(t,y_n1,y_n2) : '); %example(@(t,y_n1,y_n2) (-y_n1 + y_n2).*exp(1-t) + 0.5.*y_n1)
y_2=input('Enter vector function f2(t,y_n1,y_n2) : '); %example( @(t,y_n1,y_n2)y_n1-y_n2.^2)
t=input('Enter time domain vector : '); %example(0:(2/20):2)
y1=input('Enter initial condition for y_n1 : '); %example(4)
y2=input('Enter initial condition for y_n2 : '); %example(0.5)
disp('1 : Euler explicit method for a system')
disp('2 : second order Runge-Kutta method modified Euler for a system')
k=input('Enter method number : ');
switch k
    case 1
        [y_n1,y_n2]=SecondOrderODEIVPsolver_EEM_S(y_1,y_2,t,y1,y2);
        plot(t,y_n1,'--r');
        hold on
        plot(t,y_n2,'--b');
        legend('f1','f2')
    case 2
        [y_n1,y_n2]=SecondOrderODEIVPsolver_RKM2ME_S(y_1,y_2,t,y1,y2);
        plot(t,y_n1,'--r');
        hold on
        plot(t,y_n2,'--b');
        legend('f1','f2')
end
