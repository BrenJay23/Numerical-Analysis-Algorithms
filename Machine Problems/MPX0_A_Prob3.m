%MPX0-A-Prob3

%INPUT:

syms x

g=input('Enter function, f = ');

f=inline(g);

a=input('Enter lower limit, a = ');

b=input('Enter upper limit, b = ');

n=input('Enter number of elements, n=');

x=linspace(a,b,n);

%COMPUTE:

[f_c1]=min(feval(f,x));

[f_c2]=max(feval(f,x));

plot(x,feval(f,x));

display([f_c1,f_c2])
