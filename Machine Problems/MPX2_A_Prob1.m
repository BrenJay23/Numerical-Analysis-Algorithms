%MPX1-B
%Bren Jay Magtalas 2018-07503
syms x
g=input('Enter function, f = ');%f(x)=((x^2)-1)/(1+exp(x))
f=inline(g);
a=input('Enter lower limit, a = ');%test:1
b=input('Enter upper limit, b = ');%test:10
z=input('Enter number of elements, z=');%test:5
ezplot(f,a,b)
hold on
X = linspace(a,b,z);%Vector
A=zeros(z,z);
for j=1:z%Vander Matrix
    for k=1:z
        A(j,k)=X(j)^(k-1);
    end
end
Y = ((X.^2)-1)./(1+exp(X));
w = linsolve(A,Y');%Matrix solution
L=0;
for i=1:z%Vander Equation
    L=L+w(i)*x^(i-1);
end
disp(L)
ezplot(L,a,b)


        
