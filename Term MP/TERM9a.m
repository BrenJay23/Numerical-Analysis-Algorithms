syms y_e(t)
y_e(t)=7*exp(t)-t^3-3*t^2-6*t-6;
fplot(y_e,[0,10]);
hold on
p=5;
while p<16
    if p==5||p==15
        y=@(t,y_n) y_n+t.^3;
        y1=1;
        a = 0;
        b = 10;
        N = p;
        h = (b-a)/N;
        t = a:h:b; %time domain
        y_n=ODEIVPsolver_EEM(y,t,y1);
        plot(t,y_n);
    end
    p=p+1;
end
legend('exact','N=5','N=15')
xlabel('time')
ylabel('solution')