disp('1 : Bisection Method')
%#2b. x=[0,45], tolerance:0.01, f(x)=6.5-6.85+60*tand(x)-(((60^2)*32.2)/(2*(65^2)*((cosd(x))^2)))
%#2b. answer: 13.9526
disp('2 : Secant Method')
disp('3 : Newton-Rhapson Method')
%#3. x=[0,0.01], tolerance:1*10^-5
%f(x)=-0.5+(((9.5*10^-6)*(2.75*10^-5)*x)/(2*0.885*10^-12))*(1-x/sqrt((x.^2)+0.1^2))
%#3. answer: 0.0035
disp('4 : Regula-Falsi Method')
%4a. V0=((pi*R^2)/2)*L
%Vd(h)=((h*sqrt(R^2-h.^2)+(R^2)*asin(h/R)).*L)
%4b. x=[0,1.5], tolerance:0.001,
%f(x)=(((pi*1.5^2)/2)*10)*.4-((x*sqrt(1.5^2-x.^2)+(1.5^2)*asin(x/1.5))*10)
%4b. answer: 1.5-0.4795=
n = input('Enter Method Number : ');
y=1;
while y~=0
    syms x
    g=input('Enter function, f = ');
    f=inline(g);
    c1=input('Enter lower limit, ai = ');
    c2=input('Enter upper limit, bi = ');
    t=input('Enter tolerance : ');
    k=0;
    f_ai=feval(f,c1);
    f_bi=feval(f,c2);
    x=linspace(c1,c2,50);
    F=feval(f,x);
    plot(x,F);
    if ((k>f_ai) && (k<f_bi)) || ((k<f_ai) && (k>f_bi))
        y=0;
    elseif n==3
        y=0;
    else
        disp('f does not satisfy IVT')
    end
end
switch n
    case 1
        x=1;
        while x~=0
            c=(1/2)*(c1+c2);
            if abs(feval(f,c))<=t
                disp('Maximum tolerance has been reached')
                break
            elseif ((feval(f,c1))*(feval(f,c)))<0
                c2=c;
            elseif ((feval(f,c1))*(feval(f,c)))>0
                c1=c;
            end
        end
        disp(c)
        hold on
        plot(c,feval(f,c),'r.','markersize',10);
    case 2
        c_3=c2-((c2-c1)*(f_bi))/(f_bi-f_ai);
        x=1;
        while x~=0
            c_3=c2-((c2-c1)*(f_bi))/(f_bi-f_ai);
            if abs(feval(f,c_3))<=t
                disp('Maximum tolerance has been reached')
                break
            end
            c1=c2;
            c2=c_3;
            x=feval(f,c_3);
            f_ai=feval(f,c1);
            f_bi=feval(f,c2);
        end
        disp(c_3)
        hold on
        plot(c_3,feval(f,c_3),'r.','markersize',10);
    case 3
        disp('1 : ai')
        disp('2 : bi')
        z=input('Select the point to be used : ');
        if z==1
            a=c1;
        elseif z==2
            a=c2;
        end
        b=a-((feval(f,a))/(feval(inline(diff(g)),a)));
        q=1;
        while q~=0
            if abs(feval(f,b))<=t
                disp('Maximum tolerance has been reached')
                break
            else
                b=b-((feval(f,b))/(feval(inline(diff(g)),b)));
            end
        end
        disp(b)
        hold on
        plot(b,feval(f,b),'r.','markersize',10);
    case 4
        x=1;
        while x~=0
            c=c1-(((feval(f,c1))*(c2-c1))/((feval(f,c2))-(feval(f,c1))));
            if abs(feval(f,c))<=t
                disp('Maximum tolerance has been reached')
                break
            elseif (feval(f,c1)>0 && feval(f,c)>0) || (feval(f,c1)<0 && feval(f,c)<0)
                c1=c;
            elseif (feval(f,c2)>0 && feval(f,c)>0) || (feval(f,c2)<0 && feval(f,c)<0)
                c2=c;
            end
        end
        disp(c)
        hold on
        plot(c,feval(f,c),'r.','markersize',10);
end