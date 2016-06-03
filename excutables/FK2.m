function [ x,y ] = FK2( t1,t2 )
%% forward kinametics of a 2DOF robot

x=1*cos(t1/57.2958)+1*cos((t1+t2)/57.2958);
y=1*sin(t1/57.2958)+1*sin((t1+t2)/57.2958);

end

