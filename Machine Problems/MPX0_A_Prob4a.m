function [ x,y ] = ProjectileMotion( x_0,y_0,v_0,theta,t )
%ProjectileMotion Function
%INPUT:
    %(x0,y0)=coordinates
    %v0=initial velocity, in [m/s]
    %theta=initial angle, in [degrees]
    %t=time of flight, in [s]
    %g=9.81 [m/s]
%OUTPUT:
    %[x,y]=final coordinates
x=x_0+v_0*cosd(theta)*t;
y=y_0+v_0*sind(theta)*t-(1/2)*9.81*t.^2;
end

