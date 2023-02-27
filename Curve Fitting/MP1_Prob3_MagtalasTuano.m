x=input('Enter matrix of x values: ');
y=input('Enter matrix of y values: ');
%x=[1 1.1 1.3 1.5 1.9 2.1]
%y=[1.84 1.96 2.21 2.45 2.94 3.18]
N=length(x);
A=zeros(1,1);
b=zeros(1,1);
plot(x,y,'o')
hold on
for d=1:3;
  for i=1:d+1;
    for j=1:d+1;
      X=0;
      for k=1:N;
        X=X+x(k).^((j+i)-2);
      end
      A(i,j)=X;
    end
    Z=0;
    for l=1:N;
      Z=Z+(x(l).^(i-1).*y(l));
    end
    b(i,1)=Z;
  end
  if d==1;
    answer1=linsolve(A,b)
    F1=@(x) answer1(1)+answer1(2)*x
    fplot(F1,[1,2.1]);
    Error1=0;
    for i=1:N;
        Error1=Error1+(y(i)-feval(F1,x(i))).^2;
    end
    display(Error1)
  end
  if d==2;
    answer2=linsolve(A,b)
    F2=@(x) answer2(1)+answer2(2)*x+answer2(3)*x.^2
    fplot(F2,[1,2.1]);
    Error2=0;
    for i=1:N;
        Error2=Error2+(y(i)-feval(F2,x(i))).^2;
    end
    display(Error2)
  end
  if d==3;
    answer3=linsolve(A,b)
    F3=@(x) answer3(1)+answer3(2)*x+answer3(3)*x.^2+answer3(4)*x.^3
    fplot(F3,[1,2.1]);
    Error3=0;
    for i=1:N;
        Error3=Error3+(y(i)-feval(F3,x(i))).^2;
    end
    display(Error3)
  end
end



