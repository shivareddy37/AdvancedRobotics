function [  ] = PLOT_theta( val1,val2,str1,str2,end1,end2 )

%% for a given x and y(val 1 and val 2) plots in theta space 
% str1 str2 are the x and y coordinates on the start point
% end1 end2 are the x and y coordinates on the end point

figure(2)
title('theta plane')
axis([-270 270 -135 135])
hold on 
plot(val1,val2)
hold on
plot(str1,str2,'+r')
hold on
plot(end1,end2,'xc')
hold on
end

