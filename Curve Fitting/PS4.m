syms x v g
c = linspace(1,10,51);
N = length(c);
K = zeros(1,1);
F = @(x) (1-(8./pi.^2).*((1./cosh((pi.*x)./2))+symsum((1./(((2.*v+1).^2).*cosh(((2.*v+1).*pi.*x)./2))),v,1,Inf)))./((1./3).*(1-(192./((pi.^5).*x)).*(tanh((pi.*x)./2)+symsum((tanh(((2.*g+1).*pi.*x)./2)./(2.*g+1).^5),g,1,Inf))));
fplot(F,[1,10])
hold on
for i = 1:N
    K(i) = feval(F,c(i));
end
[alpha_exp,beta_exp] = ExponentialFit(c,K)
F_exp = @(x) alpha_exp .* exp(beta_exp .* x);
Error_exp = 0;
for i = 1:N
    Error_exp=Error_exp+(K(i)-feval(F_exp,c(i))).^2;
end
Error_exp
fplot(F_exp,[c(1),c(N)])
[alpha_pow,beta_pow] = PowerFit(c,K)
F_pow = @(x) alpha_pow .* x .^ beta_pow;
fplot(F_pow,[c(1),c(N)])
Error_pow = 0;
for i = 1:N
    Error_pow=Error_pow+(K(i)-feval(F_pow,c(i))).^2;
end
Error_pow
xlabel('c')
ylabel('K')
hold off
legend('exact','exponential','power')
