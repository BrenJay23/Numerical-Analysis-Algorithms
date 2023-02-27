
%needs to run in same folder with trapezoid
function area = simpson(x,y)
    n = size(y,2);          %# of points, # of interval is n-1
    m=0;
    p=false;
    %default is to NOT use 3/8's rule
    area = 0;
    if mod((n-1),2)==1 && (n-1)>1
        m = (n-3);
        %number of points - 3 since the 4th to the last point will still be
        %used in the 1/3 rule
        p = true;
        %use 3/8's rule
    elseif (n-1)==1             %if there's only one interval
        area = trapezoid(x,y);
    elseif n<=1
        disp('Error. Try again.')
    else                        %no 3/8's rule used
        m = n;
    end
    %if intervals are odd, remove the last 3 intervals and put in in
    %simpson's 3/8's rule
    if p
        j = (x(n)-x(n-3))*(y(n)+3*y(n-1)+3*y(n-2)+y(n-3))/8;
        area = area + j;
        %area = area + h/3*3/8*(fx_0+3fx_1+3fx_2+fx_3)
        %disp(j)
    end
    for i = 1:m
        j = y(i);
        if i == 1
            j = j*(x(i+2)-x(i))/2/3;
        elseif i == m
            j = j*(x(i)-x(i-2))/2/3;
        elseif mod(i,2)==0
            j = j*(x(i+1)-x(i-1))/2*4/3;
        else
            j = j*(x(i+1)-x(i-1))/2*2/3;
        end
        area = area + j;
        %disp(j)
    end
    
end