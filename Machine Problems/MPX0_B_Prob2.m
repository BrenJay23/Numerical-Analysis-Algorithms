%MPX0-B-Pro2
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
w=1;
while w~=0
    c_3=c2-((c2-c1)*(f_bi))/(f_bi-f_ai);
    if abs(feval(f,c_3))<=t %tolerance checker
        disp('Maximum tolerance has been reached')
        break
    end
    %secant exchanger
    c1=c2; 
    c2=c_3;
    f_ai=feval(f,c1);
    f_bi=feval(f,c2);
end
disp(c_3)
hold on
plot(c_3,feval(f,c_3),'r.','markersize',10);
            

