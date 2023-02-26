%MPX0-A-Prob2

%INPUT:

f=input('Enter function, f = ');

a=input('Enter lower limit, a = ');

b=input('Enter upper limit, b = ');

k=input('Enter intermediate value, k = ');

%COMPUTE:

%f=@(x) x*cosd(x)-2*x.^2+3*x-1
%a=0.2, b=0.4

%g=@(x) (x-2).^2-log(x)
%a=exp(1), b=exp(1)+1

%h=@(x) 2*x*cosd(2*x)-(x-2).^2
%a=3, b=4

%p=@(x) x-(log(x)).^x
%a=4, b=5

f_a=feval(f,a);

f_b=feval(f,b);

if ((k>f_a) && (k<f_b)) || ((k<f_a) && (k>f_b))
    
    disp('f satisfies IVT')
    
else
    
    disp('f does not satisfy IVT')
    
end
    
