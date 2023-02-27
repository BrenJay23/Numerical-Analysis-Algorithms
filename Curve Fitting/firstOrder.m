function result = firstOrder(x,y)
    n = size(y,2);
    result = zeros(1,n);
    for i = 1:n
        if i == 1
            result(1,i) = (y(i+1)-y(i))/(x(i+1)-x(i));
        elseif i == n
            result(1,i) = (y(i)-y(i-1))/(x(i)-x(i-1));
        else
            result(1,i) = (y(i+1)-y(i-1))/(x(i+1)-x(i-1));
        end
    end
end