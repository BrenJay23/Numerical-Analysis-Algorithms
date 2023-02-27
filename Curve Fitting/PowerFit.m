function [alpha,beta] = PowerFit(x,y)
N = length(x);
A = zeros(1,1);
b = zeros(1,1);
for i = 1:2
    for j = 1:2
        X = 0;
        for k = 1:N
            X = X + log(x(k)) .^ ((j + i) - 2);
        end
        A(i,j) = X;
    end
    Z = 0;
    for l = 1:N
        Z = Z + (log(x(l)) .^ (i - 1) .* log(y(l)));
    end
    b(i,1) = Z;
end
answer = linsolve(A,b);
alpha = exp(answer(1));
beta = answer(2);