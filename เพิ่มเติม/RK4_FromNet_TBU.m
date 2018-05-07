% -----------------------
% This is an example of 
% RK4 for computing 
% dy/dt = y-t^2+1
% with INC y(0)=0.5
% ----------------------
clc
clear all
h = 0.5;
t = 0;
w = 0.5;

fprintf(' Step 0: t = %6.4f, Ext = 0.5000 , w = %6.4f\n ', t, w);
for i=1:4
 
f=@(t,y) y-t^2+1;

k1 = h*f(t,w);
k2 = h*f(t+h/2, w+k1/2);
k3 = h*f(t+h/2, w+k2/2);
k4 = h*f(t+h, w+k3);
w = w + (k1+2*k2+2*k3+k4)/6;
t = t + h;
exact=t^2+2*t+1-(0.5)*exp(t);
fprintf( 'Step %d: t = %6.4f, Ext = %6.4f , w = %6.4f\n ', i, t, exact, w);

end