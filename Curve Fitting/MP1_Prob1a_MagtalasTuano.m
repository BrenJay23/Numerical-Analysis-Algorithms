A=input('Enter the coefficient matrix (in format: [x1, x2,...,xn; x1, x2,...,xn;...): ');
b=input('Enter b values (in format: [b1;b2;...;bn] : ');
#a.
#A=[2 -1 0; 1 -3 1 ; -1 1 -3];
#b=[2;-2;-6];
#b.
#A=[2 -1 0; 1 -3 1 ; -1 1 -3];
#b=[2;-2;-6];
x=zeros(1,length(A));
tol=input('Enter tolerance: ');
#tol=0.0001;
k=1;
ex=ones(1,length(A));
while min(ex)>tol;
  for i=1:length(A);
    inside=0;
    for j=1:length(A);
      if j~=i;
        inside=inside+A(i,j).*x(k,j);
      endif
    endfor
    x(k+1,i)=1./A(i,i).*(-inside+b(i));
    ex(i)=abs(x(k+1,i)-x(k,i));
  endfor
  k+=1;
endwhile
display('number of iterations:')
disp(k-1)
disp(x(k-3,:))
disp(x(k-2,:))
disp(x(k-1,:))
disp(x(k,:))
