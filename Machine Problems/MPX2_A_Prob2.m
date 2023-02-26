%Lagrange
syms x
g=input('Enter function, f = ');%f(x)=((x^2)-1)/(1+exp(x))
f=inline(g);
a=input('Enter lower limit, a = ');%test:1
b=input('Enter upper limit, b = ');%test:10
z=input('Enter number of elements, z=');%test:5
ezplot(f,a,b)
hold on
Y = linspace(a,b,z);%Vector
q=feval(f,Y);
L=0;
num=1;
denom=1;
for j=1:z%Coded Lagrange formula
    for k=1:z
        if k~=j
            num=num*(x-Y(k));
            denom=denom*(Y(j)-Y(k));
        end
    end
    L=L+((num*q(j))/denom);
    num=1;
    denom=1;
end
disp(L)%Lagrange Equation
ezplot(L,a,b)