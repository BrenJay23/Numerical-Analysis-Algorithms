
%input x,y must be in lengthwise. a is the set of points to be evaluated in the interpolation
function e = QuadraticSpline(x,y,a);     

    n = size(x,1)-1;
    e = linspace(0,0,(size(a,2)))
    A = zeros((3*n),(3*n));
    b = zeros((3*n),1);
        %first run for equations, next run for dervatives
        for i = 1:n
            b((2*i-1),1) = y(i,1);
            b((2*i),1) = y((i+1),1);
            
            A((2*i-1),(3*i-2)) = (x(i,1))^2;            %a_n
            A((2*i),(3*i-2)) = (x((i+1),1))^2;
            
            A((2*i-1),(3*i-1)) = x(i,1);                %b_n
            A((2*i),(3*i-1)) = x((i+1),1);
            
            A((2*i-1),(3*i)) = 1;                       %c_n
            A((2*i),(3*i)) = 1;
            if i == 1
                A((2*n+1),1) = 2;
                %assumption that second derivative of first interval is 0
                %since default of b is all 0, no need to change value of b
            else
                %derivatives part
                A((2*n+i),((i-1)*n-2)) = 2*x(i,1);
                A((2*n+i),((i-1)*n-1)) = 1;
                A((2*n+i),((i-1)*n+1)) = -2*x(i,1);
                A((2*n+i),((i-1)*n+2)) = -1;
            end
        end
    
    r = linsolve(A,b);
    %disp(r)
    %start of finding the interval for every element in a
    for q = 1:size(a,2) %column numbers of a
        interval = 0;  
        for w = 1:n
            if (a(q)>x(w,1) & a(q)< x((w+1),1))
                interval =w;
            elseif a(q)==x(w,1)
                interval = w;
            elseif a(q)==x((n+1),1)
                interval = n;
            end
            %disp(interval)
        end
        e(1,q) = r((3*interval-2),1)*a(1,q)*a(1,q);      %a*x^2
        e(1,q) = e(1,q)+r((3*interval-1),1)*a(1,q);      %b*x
        e(1,q) = e(1,q)+r((3*interval),1);               %c
    end
end

