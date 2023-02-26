function [y_n] = ODEIVPsolver_RKM2ME(y,t,y1)
%second order Runge-Kutta method modified Euler Function
    %y=vector function of t and y_n
    %t=time domain vector
    %y1=initial condition
N=length(t)-1;
h=t(2)-t(1);
y_n(1)=y1;
for j = 1:N
    y_n0 = y_n(j) + h*feval(y,t(j),y_n(j));
    y_n(j+1) = y_n(j) + (h/2)*(feval(y,t(j),y_n(j))+feval(y,t(j+1),y_n0));    
end
end

