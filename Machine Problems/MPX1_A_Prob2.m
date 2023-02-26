%MPX1-A-Prob2
%Input:
syms y(x)
y(x)=dsolve(diff(y,1)==x*y)%initial conditions

syms y(x)
y(x)=dsolve(diff(y,1)==x*y,y(0)==5)%initial conditions

syms y(x)
y2=diff(y,2);%second derivative
y(x)=dsolve(diff(y,2)==cos(2*x)-y,y(0)==1,y2(0)==0)%initial conditions

syms x(t)
x(t)=dsolve((diff(x,1)+x)^2-1==0,x(0)==0)%initial conditions



