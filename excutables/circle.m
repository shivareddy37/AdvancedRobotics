function [ t1,t2,t1_b,t2_b] = circle( x,y,a )
xunit=[];
yunit=[];
%% plotting the circle for given center (x,y) and radius (a)

    for th=0:pi/50:2*pi
        xunit=[xunit a*cos(th)+(x)];
        yunit=[yunit a*sin(th)+(y)];
    end

figure(1)
title ('cartesian plane')
axis([-2 2 -2 2]);
plot(xunit,yunit)
hold on
l1=0.95;
l2=0.95;

[t1,t2,t1_b,t2_b]=IK(xunit,yunit,l1,l2);

end

