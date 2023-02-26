%MPX-A-Pro4

%INPUT:

x_0 = input('Enter initial x coordinate, x_0='); %x_0 = 0;
y_0= input('Enter initial y coordinate, y_0='); %y_0=0;
v_0= input('Enter initial velocity (as vector), v_0='); %v_0=25:5:60;
theta= input('Enter angle, theta='); %theta=0;
t= input('Enter time of flight (0:dt:end), t='); %t=0:0.5:5;
M=length(t);
N=length(v_0);
x=zeros(M,N);
y=zeros(M,N);
for j=1:N
        for i=1:M
            [x(i,j),y(i,j)]=ProjectileMotion(x_0,y_0,v_0(j),theta,t(i));
        end
end
plot(x,y)
hold on
