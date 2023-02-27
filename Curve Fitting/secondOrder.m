

function result = secondOrder(x,y)
    n = size(y,2);
    result = zeros(1,n);
    for i = 1:n
        if i == 1
            result(1,i) = (y(i+2)-2*y(i+1)+y(i))/(x(i+1)-x(i))^2;
        elseif i == n
            result(1,i) = (y(i)-2*y(i-1)+y(i-2))/(x(i)-x(i-1))^2;
        else
            result(1,i) = (y(i+1)-2*y(i)+y(i-1))/(x(i+1)-x(i))^2;
        end
    end
end