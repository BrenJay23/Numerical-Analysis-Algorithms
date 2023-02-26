function [y_n] = ODEIVPsolver_EEM(y,t,y1)
%Euler Explicit Method Function
    %y=vector function of t and y_n
    %t=time domain vector
    %y1=initial condition
N=length(t)-1;
h=t(2)-t(1);
y_n(1)=y1;
for j = 1:N
    y_n(j+1) = y_n(j) + h*feval(y,t(j),y_n(j));
end
end

