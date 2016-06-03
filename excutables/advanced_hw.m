clc;
clear all;
close all;

%% creating circular obstacles and plotting in theta space

% circ1e 1
[c1, c2,c1_b,c2_b]=circle(-1.625,-0.3,0.25);
PLOT_theta(c1,c2,30,-110,180,0);
PLOT_theta(c1_b,c2_b,30,-110,180,0);
PLOT_theta(c1+360,c2,30,-110,180,0);
PLOT_theta(c1_b+360,c2_b,30,-110,180,0);

%circle 2
[c3, c4,c3_b,c4_b]=circle(0.75,0,0.125);
PLOT_theta(c3,c4,30,-110,180,0);
PLOT_theta(c3_b,c4_b,30,-110,180,0);
PLOT_theta(c3+360,c4,30,-110,180,0);
PLOT_theta(c3_b+360,c4_b,30,-110,180,0);

%circle 3
[c5, c6,c5_b,c6_b]=circle(1.125,0,0.125);
PLOT_theta(c5,c6,30,-110,180,0);
PLOT_theta(c5_b,c6_b,30,-110,180,0);
PLOT_theta(c5,c6,30,-110,180,0);
PLOT_theta(c5_b,c6_b,30,-110,180,0);

square(-1.25,0.625,0.4);


%% trajectory in theta space

figure(2)
axis([-270 270 -135 135])
hold on
x=[30  65  230];
y=[ -110  -121  -123 ];
hold on
x1=[180  200  230];
y1=[ 0  -55  -123 ];
cs=spline(x,  y );
cs1=spline (x1,y1);
xx= linspace(30,230,101);
xx1= linspace (180,230,101);
plot(x,y,'o',xx,ppval(cs,xx),'-');
hold on
plot(x1,y1,'o',xx1,ppval(cs1,xx1),'-');


%% trajectory in cartesian space

robot();

%% getting the characterstics equation describing the position velocity and accleration of each joint 

theta1_i=30;
theta1_f= 180;
vel1_i=0;
vel1_f=0;
acc1_f=0;
acc1_i=0;
t_i=0;
t_f=4;
time= t_i:t_f;

theta2_i=-110;
theta2_f=0;
vel2_i=0;
vel2_f=0;
acc2_f=0;
acc2_i=0;



k1=[theta1_i theta1_f vel1_i vel1_f acc1_i acc1_f]';
mat=[1 t_i t_i^2 t_i^3 t_i^4 t_i^5 ;...
    1 t_f t_f^2 t_f^3 t_f^4 t_f^5 ;...
    0 1 2*t_i 3*t_i^2 4*t_i^3 5*t_i^4;...
    0 1 2*t_f 3*t_f^2 4*t_f^3 5*t_f^4;...
    0 0 2 6*t_i 12*t_i^2 20*t_i^3;...
    0 0 2 6*t_f 12*t_f^2 20*t_f^3];
coff1=(mat)\k1;

k2=[theta2_i theta2_f vel2_i vel2_f acc2_i acc2_f]';
mat=[1 t_i t_i^2 t_i^3 t_i^4 t_i^5 ;...
    1 t_f t_f^2 t_f^3 t_f^4 t_f^5 ;...
    0 1 2*t_i 3*t_i^2 4*t_i^3 5*t_i^4;...
    0 1 2*t_f 3*t_f^2 4*t_f^3 5*t_f^4;...
    0 0 2 6*t_i 12*t_i^2 20*t_i^3;...
    0 0 2 6*t_f 12*t_f^2 20*t_f^3];
coff2=(mat)\k2;

r=fliplr(coff1');
coff1=r';
q=fliplr(coff2');
coff2=q';

% position, velocity and accleration equations
syms t;
theta1=poly2sym(coff1,t);
theta2=poly2sym(coff2,t);
vel1=diff(theta1);
vel2=diff(theta2);
acc1=diff(vel1);
acc2=diff(vel2);

t1=zeros(1,5);
t2=zeros(1,5);
v1=zeros(1,5);
v2=zeros(1,5);
a1=zeros(1,5);
a2=zeros(1,5);

for i=1:length(time)
    t=time(i);
    t1(i)=subs(theta1);
    t2(i)=subs(theta2);
    v1(i)=subs(vel1);
    v2(i)=subs(vel2);
    a1(i)=subs(acc1);
    a2(i)=subs(acc2);
end

figure(3)
title('postion velocity acclerartion profiles')

subplot(3,1,1)

plot(time,t1,'r')
hold on
plot(time,t2,'g')

legend('joint1','joint2')

subplot(3,1,2)

plot(time,v1,'r')
hold on
plot(time,v2,'g')

subplot(3,1,3)

plot(time,a1,'r')
hold on
plot(time,a2,'g')


disp ('position equation for joint 1')
disp(theta1)
disp ('position equation for joint 2')
disp(theta2)
disp ('velocity equation for joint 1')
disp(vel1)
disp ('velocity equation for joint 2')
disp(vel2)
disp (' accleration equation for joint 1')
disp(acc1)
disp ('accleration equation for joint 2')
disp(acc2)