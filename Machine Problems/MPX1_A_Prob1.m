%MPX1-A-Pro1
%Input:
syms x
f=input('Enter function, f = ');

x_0=input('Enter the pivot point, x_0 = ');

n=input('Enter the order, n = ');

a=input('Enter lower interval, a = ');

b=input('Enter upper interval, b = ');
taylor(f, x, 'ExpansionPoint',x_0,'Order',n+1) %Matlab Taylor
ezplot(f,[a,b]) %function Plot
hold on
t=0;

for k=0:n
    t=t+(subs(diff(f,x,k),x,x_0)*(x-x_0)^k)/factorial(k);%Taylor Equation
end
disp(t);%Own Coded Taylor
ezplot(t);%Own Coded Taylor Plot
hold on;
    
 
