function [  ] = robot(  )

figure(1)
hold on

 basex= [-2 0] ;
 basey= [0 0];
 l1x=[0 0.866];
 l2x=[ 0.866 1.039];
 l1y=[0 0.5];
 l2y=[0.5 -0.4848];
 
[kl1_1x,kl1_1y]= FK1(30);
[kl1_2x,kl1_2y]=FK1(65);
[kl1_3x,kl1_3y]=FK1(230);
[kl1_4x,kl1_4y]= FK1(180);
[kl1_5x,kl1_5y]=FK1(200);
[kl1_6x,kl1_6y]=FK1(230);

[kl2_1x,kl2_1y]= FK2(30,-110);
[kl2_2x,kl2_2y]= FK2(65,-121);
[kl2_3x,kl2_3y]= FK2(230,-123);
[kl2_4x,kl2_4y]= FK2(180,0);
[kl2_5x,kl2_5y]= FK2(200,-55);
[kl2_6x,kl2_6y]= FK2(230,-123);


 
plot(basex,basey,'--r')

plot(l1x,l1y,'k')
plot([0 kl1_1x],[0 kl1_1y],'k')
plot([0 kl1_2x],[0 kl1_2y],'k')
 plot([0 kl1_3x],[0 kl1_3y],'k')
 plot([0 kl1_4x],[0 kl1_4y],'k')
plot([0 kl1_5x],[0 kl1_5y],'k')
 plot([0 kl1_6x],[0 kl1_6y],'k')

plot(l2x,l2y,'g')
plot([kl1_1x kl2_1x],[kl1_1y kl2_1y],'g')
plot([kl1_2x kl2_2x],[kl1_2y kl2_2y],'g')
plot([kl1_3x kl2_3x],[kl1_3y kl2_3y],'g')
plot([kl1_4x kl2_4x],[kl1_4y kl2_4y],'g')
plot([kl1_5x kl2_5x],[kl1_5y kl2_5y],'g')
plot([kl1_6x kl2_6x],[kl1_6y kl2_6y],'g')





end

