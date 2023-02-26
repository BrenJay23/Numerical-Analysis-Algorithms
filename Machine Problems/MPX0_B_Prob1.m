%MPX0-B-Pro1
%Input:
y=1; %for looping
while y~=0 %IVT Checker for roots
    g=input('Enter function, f = ', 's');    
    f=inline(g);
    c1=input('Enter lower limit, ai = ');
    c2=input('Enter upper limit, bi = ');
    t=input('Enter tolerance, eps = ');
    k=0;
    f_ai=feval(f,c1);
    f_bi=feval(f,c2);
    x=linspace(c1,c2,50);
    F=feval(f,x);    
    plot(x,F);    
    if ((k>f_ai) && (k<f_bi)) || ((k<f_ai) && (k>f_bi))
        y=0;
    else    
        disp('f does not satisfy IVT')
    end
end
x=1;
while x~=0
    c=(1/2)*(c1+c2); %midpoint
    if abs(feval(f,c))<=t %tolerance checker
        disp('Maximum tolerance has been reached')
        break
    %bisecting points exchanger
    elseif ((feval(f,c1))*(feval(f,c)))<0
        c2=c;
    elseif ((feval(f,c1))*(feval(f,c)))>0
        c1=c;
    end
end
disp(c)
hold on
plot(c,feval(f,c),'r.','markersize',10);
