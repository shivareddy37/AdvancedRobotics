function [ ] = square( x,y,a )
%% function based on the coordinates of center (x,y) and the length of the side a
% draws a square in cartesian plane 
fp1x=x-(a/2);
fp1y=y+(a/2);

fp2x=fp1x+a;
fp2y=fp1y;

fp3x=fp2x;
fp3y=fp2y-a;

fp4x=fp3x-a;
fp4y=fp3y;

x=[fp1x,fp2x,fp3x, fp4x,fp1x];
y=[fp1y,fp2y,fp3y,fp4y,fp1y];

% genrating points along perimeter of the square  to plot in the theta
% space
x1=linspace(fp1x,fp2x,101);
y1=linspace(fp1y,fp4y,101);

x2=linspace(fp3x,fp4x,101);
y2=linspace(fp2y,fp3y,101);


figure(1)
plot(x,y)

l1=1;
l2=1;

for i=1:length(l1)
[t1, t2,t1_b,t2_b]=IK(x1,repmat(fp1y,[1 101]),l1(i),l2(i));
[t3, t4,t3_b,t4_b]=IK(repmat(fp1x,[1 101]),y1,l1(i),l2(i));
[t5, t6,t5_b,t6_b]=IK(x2,repmat(fp3y,[1 101]),l1(i),l2(i));
[t7, t8,t7_b,t8_b]=IK(repmat(fp2x,[1 101]),y2,l1(i),l2(i));

end




PLOT_theta(t1,t2,30,-110,180,0)
PLOT_theta(t3,t4,30,-110,180,0)
PLOT_theta(t5,t6,30,-110,180,0)
PLOT_theta(t7,t8,30,-110,180,0)

PLOT_theta(t1_b,t2_b,30,-110,180,0)
PLOT_theta(t3_b,t4_b,30,-110,180,0)
PLOT_theta(t5_b,t6_b,30,-110,180,0)
PLOT_theta(t7_b,t8_b,30,-110,180,0)



PLOT_theta(t1-360,t2,30,-110,180,0)
PLOT_theta(t3-360,t4,30,-110,180,0)
PLOT_theta(t5-360,t6,30,-110,180,0)
PLOT_theta(t7-360,t8,30,-110,180,0)

PLOT_theta(t1_b-360,t2_b,30,-110,180,0)
PLOT_theta(t3_b-360,t4_b,30,-110,180,0)
PLOT_theta(t5_b-360,t6_b,30,-110,180,0)
PLOT_theta(t7_b-360,t8_b,30,-110,180,0)

















end

