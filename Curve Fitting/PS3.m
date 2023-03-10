F = [24.65 29.35 31.55 33.35 34.85 35.75 36.65 37.55 38.85 39.65 40.45];
L = [12.585 12.825 12.915 12.955 13.055 13.215 13.355 13.495 14.085 14.215 14.485];
A_0 = 1.25 * 10 .^ (-4);
L_0 = 0.0125;
N = length(F);
x = zeros(1,1);
y = zeros(1,1);
for m = 1:N
    x(m) = log(L(m) ./ L_0);
    y(m) = (F(m) .* L(m)) ./ (A_0 .* L_0);
end
plot(x,y,'o')
hold on
[alpha,beta] = PowerFit(x,y)
F = @(x) alpha .* x .^ beta;
fplot(F,[x(1),x(N)])