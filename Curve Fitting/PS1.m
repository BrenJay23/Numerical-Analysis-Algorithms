A = [4 -1 0 0 0 0 ; -1 4 -1 0 0 0 ; 0 -1 4 -1 0 0 ; 0 0 -1 4 -1 0 ; 0 0 0 -1 4 -1 ; 0 0 0 0 -1 4 ];
b = [0 ; 5 ; 0 ;  6 ; -2 ; 6];
n = length(A);
x = zeros(1,n);
ex = ones(1,n);
tol = 0.001;
k = 1;
while max(ex) > tol
    x = vertcat(x,zeros(1,n));
    for i = 1:n
        u = 0;
        for j = 1:(i-1)
            u = u + (A(i,j) .* x(k+1,j));
        end
        v = 0;
        for j = (i+1):n
            v = v + (A(i,j) .* x(k,j));
        end
        x(k+1,i) = (1 ./ A(i,i)) .* (- u - v + b(i));
        ex(i)=abs(x(k+1,i)-x(k,i));
    end
    k=k+1;
end
disp(x(k,:));