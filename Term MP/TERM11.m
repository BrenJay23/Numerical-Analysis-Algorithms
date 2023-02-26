hc = 40;
P = 0.016;
k = 240;
Ac = 1.6e-5;
Ts = 293;
a = 0;
b = 0.1;
hold on
for N = [5 10 20 50]
    T = [];
    T(1) = 473;
    T(N+1) = 293;
    h = (a+b)/N;
    A = eye(N-1,N-1)*-(2+h^2*hc*P/(k*Ac));
    for i = 1:N-2
        A(i,i+1) = 1;
        A(1+i,i) = 1;
    end
    C = [];
    for i = 1:N-1
        C(i) = -h^2*hc*P/(k*Ac)*Ts;
    end
    C = C';
    C(1) = C(1)-T(1);
    C(N-1) = C(N-1)-T(N+1);
    T(2:N) = A\C;
    plot(a:h:b,T);
    display(T)
end
xlabel('x')
ylabel('T')
legend('N=5','N=10','N=20','N=50')
