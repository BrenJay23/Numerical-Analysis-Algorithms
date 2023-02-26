syms y_e(t) k
y_e(t)=7*exp(t)-t^3-3*t^2-6*t-6;
fplot(y_e,[0,10]);
hold on
y=@(t,y_n) y_n+t.^3;
y1=1;
a = 0;
b = 10;
N = 5;
h = (b-a)/N;
t = a:h:b; %time domain
y_n=ODEIVPsolver_EEM(y,t,y1);
plot(t,y_n);
pivot=1;
for j=1:N+1
    D(1)=y1;
    for i=1:N
        D(i+1)=feval(y,pivot,D(i));
    end
    Taylor(j)=symsum((D(j)/factorial(k))*(t(j)-pivot)^k,k,0,5);
end
plot(t,Taylor);
legend('exact','Euler','Taylor')
xlabel('time')
ylabel('solution')