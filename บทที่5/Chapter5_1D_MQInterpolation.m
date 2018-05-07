clc
clear all
%-------------------------------------------------
x=linspace(-1,1,5);
N=length(x);
exp=1;
for i=1:N
    for j=1:N
        r(i,j)=abs(x(i)-x(j));
        y(i)=(1+25*(x(i))^2)^(-1);
        MQ(i,j)=sqrt(1+(exp*r(i,j).^2));
        
    end
end
Q=(MQ\(y'));
%---------------------------------------------------
x1=linspace(-1,1,4);
N1=length(x1);

for i=1:N1
    for j=1:N
        r1(i,j)=abs(x1(i)-x(j));
         MQ1(i,j)=sqrt(1+(exp*r1(i,j).^2));
%         H(i,j)=(exp^2+abs(x1(i)-x1(j)))^(1/2);
        y1(i)=(1+25*(x1(i))^2)^(-1);
        
    end
end
H=MQ1*Q
Yext=y1';
format short
Error=abs((H-Yext))
xi=-1:0.1:1;
Ni=length(xi);
for i=1:Ni
    yi(i)=(1+25*(xi(i))^2)^(-1);
end

yinter=interp1(xi,yi,xi,'spline');
%-----------------------------------------------------
title('Solution Comparision');
hold on
ylabel('y=1\(1+25x^2)');
hold on
xlabel('x');
hold on
plot(x1,y1,'o');
hold on
plot(xi,yinter);
hold on
legend('Exact','Interpolate')
hold on
grid on
