x=input('Enter matrix of x values: ');
y=input('Enter matrix of y values: ');
%x=[1 1.1 1.3 1.5 1.9 2.1]
%y=[1.84 1.96 2.21 2.45 2.94 3.18]
N=length(x);
A=zeros(1,1);
b=zeros(1,1);
plot(x,y,'o')
hold on
%d1 is y=a*b^x
for i=1:2;
    for j=1:2;
        X=0;
        for k=1:N;
            X=X+x(k).^((j+i)-2);
        end
        A(i,j)=X;
    end
    Z=0;
    for l=1:N;
        Z=Z+(x(l).^(i-1).*log(y(l)));
    end
    b(i,1)=Z;
end
answer1=linsolve(A,b);
a1=exp(answer1(1))
b1=exp(answer1(2))
F1=@(x) a1*b1.^(x);
fplot(F1,[1,2.1]);
Error1=0;
for i=1:N;
    Error1=Error1+(y(i)-feval(F1,x(i))).^2;
end
display(Error1)
%y=a+b*ln(x)
for i=1:2;
    for j=1:2;
        X=0;
        for k=1:N;
            X=X+log(x(k)).^((j+i)-2);
        end
        A(i,j)=X;
    end
    Z=0;
    for l=1:N;
        Z=Z+(log(x(l)).^(i-1).*y(l));
    end
    b(i,1)=Z;
end
answer2=linsolve(A,b);
a2=answer2(1)
b2=answer2(2)
F2=@(x) a2+b2*log(x);
fplot(F2,[1,2.1]);
Error2=0;
for i=1:N;
    Error2=Error2+(y(i)-feval(F2,x(i))).^2;
end
display(Error2)
%y=a*exp(b*x)
for i=1:2;
    for j=1:2;
        X=0;
        for k=1:N;
            X=X+x(k).^((j+i)-2);
        end
        A(i,j)=X;
    end
    Z=0;
    for l=1:N;
        Z=Z+(x(l).^(i-1).*log(y(l)));
    end
    b(i,1)=Z;
end
answer3=linsolve(A,b);
a3=exp(answer3(1))
b3=answer3(2)
F3=@(x) a3*exp(b3*x);
fplot(F3,[1,2.1]);
Error3=0;
for i=1:N;
    Error3=Error3+(y(i)-feval(F3,x(i))).^2;
end
display(Error3)



