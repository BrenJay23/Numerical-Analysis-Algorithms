syms y_e(t)
y_e(t)=7*exp(t)-t^3-3*t^2-6*t-6;
fplot(y_e,[0,10]);
hold on
N=5;
y=@(t,y_n) y_n+t.^3;
y1=1;
a = 0;
b = 10;
h = (b-a)/N;
t = a:h:b; %time domain
y_n(1)=y1;
y_m(1)=y1;
for j = 1:N
    k1=feval(y,t(j),y_m(j));
    k2=feval(y,t(j)+(h/2),y_m(j)+(h*k1)/2);
    y_m(j+1) = y_m(j) + k2*h;
end
plot(t,y_m);
y_n=ODEIVPsolver_RKM2ME(y,t,y1);
plot(t,y_n);
legend('exact','Midpoint','Modified Euler')
xlabel('time')
ylabel('solution')