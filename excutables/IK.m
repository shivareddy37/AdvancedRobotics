function [ t1,t2,t1_bar,t2_bar] = IK( xunit,yunit,l1,l2 )

%% Inverse Kinematics 
t1=[];
t2=[];
t1_bar=[];
t2_bar=[];
k1=[];
k2=[];
g=[];
cs_theta=zeros(size(xunit));
term2=zeros(size(xunit));
c1=zeros(size(xunit));


for i=1:length(xunit)
cs_theta(i)= (((xunit(i)^2)+(yunit(i)^2)-(l1^2)-(l2^2)/(2*l1*l2)))^2;
term2(i)=((xunit(i)^2)+(yunit(i)^2)-(l1^2)-(l2^2))/(2*l1*l2);
end
for i=1:length(xunit)
 c1(i)=sqrt(1-cs_theta(i));
end

for i=1:length(xunit)
    
    if(c1(i)<=1&&c1(i)>=-1 && real(c1(i))~=0)
        
    t2(i)=atan2(c1(i), term2(i));
    t2_bar(i)=atan2(-c1(i),term2(i));
    end
end

for i=1:length(xunit)
    k1(i)=l1+l2*cos(t2(i));
    k2(i)=l2*sin(t2(i));
    
end

for i=1:length(xunit)
    g(i)=atan2(k2(i),k1(i));
    
end
for i=1:length(xunit)
    t1(i)=atan2(yunit(i),xunit(i))-g(i);
end
t1=57.2958.*t1;
t2=57.2958.*t2;
for i=1:length(xunit)
    k1(i)=1+cos(t2_bar(i));
    k2(i)=sin(t2_bar(i));
    
end

for i=1:length(xunit)
    g(i)=atan2(k2(i),k1(i));
    
end

for i=1:length(xunit)
    t1_bar(i)=atan2(yunit(i),xunit(i))-g(i);

end
t1_bar=57.2958.*t1_bar;
t2_bar=57.2958.*t2_bar;





end

