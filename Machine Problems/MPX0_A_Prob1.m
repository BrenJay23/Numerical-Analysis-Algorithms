%MPX-A-Prob1

%INPUT:
%f=x.^3-4*x.^2+5*x-1
%g=(x.^2+1)./(exp(x)-1)
%h=(x.^2-1)./sqrt(2*x-1)
%a=1, b=20, n=10

f=input('Enter function f=');

g=input('Enter function g=');

h=input('Enter function h=');

a=input('Enter lower limit, a=');

b=input('Enter upper limit, b=');

n=input('Enter number of elements, n=');

%COMPUTE:

x=linspace(a,b,n);

%OUTPUT:

plot(x,f,x,g,x,h);


