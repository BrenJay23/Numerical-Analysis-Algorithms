function area = trapezoid(x,y)
    n = size(y,2);
    area = 0;
    for i = 1:n
        j = y(i);
        if i == 1
            j = j*(x(i+1)-x(i))/2;
        elseif i == n
            j = j*(x(i)-x(i-1))/2;
        else
            j = j*(x(i)-x(i-1));
        end
        area = area + j;
    end
end