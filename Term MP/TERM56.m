%Note: The plot may take a while to appear, about 2-3 minutes, but it works
disp('1 : Vandermonde')
disp('2 : Lagrange')
n = input('Enter Method Number : ');
syms x v g
f=input('Enter function, f = ');
%#6. X=[1.0 1.5 2.0 3.0 5.0] 
%B=(1-(8./pi.^2).*((1./cosh((pi.*x)./2))+symsum((1./(((2.*v+1).^2).*cosh(((2.*v+1).*pi.*x)./2))),v,1,Inf)))
%A=((1./3).*(1-(192./((pi.^5).*x)).*(tanh((pi.*x)./2)+symsum((tanh(((2.*g+1).*pi.*x)./2)./(2.*g+1).^5),g,1,Inf))))
%K=@(x) B./A
Y=input('Enter vector X = ');
z=length(Y);
a=Y(1);
b=Y(z);
fplot(f,[a b])%original function plot
hold on
q=feval(f,Y);
switch n
    case 1
        A=zeros(z,z);
        for j=1:z%Vander Matrix
            for k=1:z
                A(j,k)=Y(j)^(k-1);
            end
        end
        w = linsolve(A,q');%Matrix solution
        L=0;
        for i=1:z%Vander Equation
            L=L+w(i)*x^(i-1);
        end
        disp(L)
        fplot(L,[a b])
        legend('function plot','vander plot')
    case 2
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
        fplot(L,[a b])
        legend('function plot','lagrange plot')
end
        
    