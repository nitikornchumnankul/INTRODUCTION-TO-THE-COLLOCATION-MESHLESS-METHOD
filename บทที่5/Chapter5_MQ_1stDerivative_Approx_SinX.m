clear all
clc
%------------------------ Information----------------------------------
x=linspace(0,2*pi,10);
N=length(x);
y=sin(x);
%----------------------------Alpha--------------------------------------
esp=input('Constante:');
 for i=1:N
    for j=1:N
        r(i,j)=abs(x(1,i)-x(1,j));
        B(i,j)=(esp^2+r(i,j)^2)^(0.5);
    end
 end
format short
Alpha=B\(y');
%-------------------------------H-------------------------------------
x1=[0.000 1.571 3.142 4.712 6.283];
N1=length(x1);
format short
for i=1:N1
    for j=1:N
        r1(i,j)=abs(x1(1,i)-x(1,j));
        H(i,j)=(x1(i)-x(j))*inv((esp^2+r1(i,j)^2)^(0.5));
    end
end
S=H*Alpha;
%------------------------Information for plot graph--------------------
xp=[0.000 1.571 3.142 4.712 6.283];
xpp=0:0.1:6.3;
xdd=0:0.1:6;
yp=sin(xp);
ypinter=interp1(xp,yp,xpp,'spline');
ydinter=interp1(xp,S',xdd,'spline');
%------------------------plot graph------------------------------------
plot(xpp,ypinter);
hold on
plot(xp,S','o');
hold on
plot(xdd,ydinter);
grid on
title('Graph');
xlabel('x');
ylabel('y,dy/dx');
legend('f(x)=sin(x)','Approx. of df/dx','Exact')