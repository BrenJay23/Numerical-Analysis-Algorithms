function [y_n1,y_n2] = SecondOrderODEIVPsolver_EEM_S(y_1,y_2,t,y1,y2)
%Euler Explicit Method for a system Function
    %y_1=vector function f1(t,y_n1,y_n2)
    %y_2=vector function f2(t,y_n1,y_n2)
    %t=time domain vector
    %y1=initial condition for f1
    %y2=initial condition for f2
N=length(t)-1;
h=t(2)-t(1);
y_n1(1)=y1;
y_n2(1)=y2;
for j = 1:N
    y_n1(j+1) = y_n1(j) + h*feval(y_1,t(j),y_n1(j),y_n2(j));
    y_n2(j+1) = y_n2(j) + h*feval(y_2,t(j),y_n1(j),y_n2(j));
end
end

