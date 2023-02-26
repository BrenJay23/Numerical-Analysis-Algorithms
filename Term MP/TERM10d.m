y_1= @(t,y_n1,y_n2) 32.2-(((14./5).*y_n2)./2)-4.*((((y_n2.^2)-1)*y_n1)/2);
y_2= @(t,y_n1,y_n2) y_n2;
a = 0;
b = 1;
y1=0; %velocity
y2=0.75; %position
for i=5:50
    if i==5||i==10||i==20||i==50
       h = (b-a)/i;
       t = a:h:b; %time domain
       [y_n1,y_n2]=SecondOrderODEIVPsolver_RKM2ME_S(y_1,y_2,t,y1,y2);
       figure
       hold on
       title(strcat("RKM2ME-S N=",string(i)))
       plot(t,y_n2);
       plot(t,y_n1);
       xlabel('time')
       ylabel('solution')
       legend('position','velocity')
       hold off
    end
end


