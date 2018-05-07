clc
clear all
%-----------MatrixInterpolation_1DSinX_TBU-------------
x_input=input('x_input:')
x=linspace(0,2*pi,x_input); 
y=sin(x); 
n=length(x);
for i=1:n
    for j=1:n
        r(i,j)=abs(x(i)-x(j));
    end
end
Alpha=r\(y');
%----------------New information------------------------
x_input_new=input('x_input_new:');
x_new=linspace(0,2*pi,x_input_new);
y_new=sin(x_new);
n_new=length(x_new);
for i=1:n_new
    for j=1:n
        r_new(i,j)=abs(x_new(i)-x(j));
    end
end
y_inter=r_new*Alpha %Y interpolation
Error=(abs((y_new')-y_inter));
%--------------------Show information-----------------------------
nod=1:1:n_new; 
node=(nod');
Solu=zeros(n_new,4);
disp('      node    y_inter      y_Exact.     Error  ')
for i=1:n_new
Solu(i,1)=node(i,1);
Solu(i,2)=y_inter(i,1);
Solu(i,3)=y_new(1,i);
Solu(i,4)=Error(i,1);
end
Solu
%--------------------Plot----------------------------------------
xlabel('X')
ylabel('y=sin(x)')
xk=0:0.5:7
yinter=interp1(x_new,y_new,xk,'spline');
title('Solution Comparision)')
legend('Exact','Interpolation')
plot(xk,yinter);
hold on
plot(x_new,y_inter,'o')
hold on
grid on






