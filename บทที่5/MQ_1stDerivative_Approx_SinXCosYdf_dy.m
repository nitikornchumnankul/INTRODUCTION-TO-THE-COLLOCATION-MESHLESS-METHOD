%---------------------------df/dy------------------------------------
clear all
clc
esp=input('Parameter :')
n=input('Set center point :')
x=linspace(0,4*pi,n);
y=linspace(0,4*pi,n);
Lx=length(x);
Ly=length(y);

for i=1:Lx
    for j=1:Ly
         xkn(j+(i-1)*Ly)=x(i);
         ykn(j+(i-1)*Ly)=y(j);
    end
end

disp(' The co-ordinates of centre points ');
XYcentr=[xkn' ykn']
% z's values at centre points 
zkn=sin(xkn).*cos(ykn);

 L=length(xkn);
for i=1:L
    for j=1:L
       r(i,j)=((xkn(i)-xkn(j))^2+(ykn(i)-ykn(j))^2)^(1/2);
       Bmq(i,j)=sqrt((r(i,j)^2)+esp^2);
    end
end

Alpha=inv(Bmq)*(zkn');

% ---- The interpolating process  -----
n1=input('The interpolating point :')
xx=linspace(0,4*pi,n1);
yy=linspace(0,4*pi,n1);
E2=length(xx); %[D2,E2]=size(xx);
EE2=length(yy); %[DD2,EE2]=size(yy);
% Setting the new points 
for i=1:E2
    for j=1:EE2
         xxx(j+(i-1)*EE2)=xx(i);
         yyy(j+(i-1)*EE2)=yy(j);
    end
end
disp(' The co-ordinates of interpolated points ');
XYinter=[xxx' yyy']

LL=length(xxx);

for i=1:LL
    for j=1:L
    r1(i,j)=((xxx(i)-xkn(j))^2+(yyy(i)-ykn(j))^2)^(1/2);
    y1(i,j)=(yyy(i)-ykn(j));
    Bmq1(i,j)=(y1(i,j))*inv(sqrt((r1(i,j)^2)+esp^2));
    end
end

Zinter=Bmq1*Alpha;
Xext=linspace(0,4*pi,10);
Yext=linspace(0,4*pi,10);
xo=linspace(0,0,10);
Lext=length(Xext);
for i=1:Lext
    for j=1:Lext
         Zext(i,j)=(sin(Xext(i)).*(-sin(Yext(j))));
         Qext(j+(i-1)*Lext)= Zext(i,j);
        
    end
end
LL=100;

nod=1:1:LL; 
node=(nod');

Solu=zeros(LL,5);
disp(' The Comparison of z is as follows ')
disp('          node     x        y      Approx.     Exact  ')
for i=1:LL
Solu(i,1)=node(i,1);
Solu(i,2)=XYinter(i,1);
Solu(i,3)=XYinter(i,2);
Solu(i,4)=Zinter(i,1);
Solu(i,5)=Qext(1,i);
end
Solu

figure; 
        plot3(Solu(:,2),Solu(:,3),Solu(:,4),'r*','markersize',3,'LineWidth',2)
        hold on
        plot3(Solu(:,2),Solu(:,3),Solu(:,5),'ko','markersize',8,'LineWidth',2)
        xlabel('x','FontSize',12);
        ylabel('y','FontSize',12);
        zlabel('z','FontSize',12);
        title('Solution Comparison of z','FontSize',12);
%          legend('Int. z','Ext. z','FontSize',12);
        xlim([0 14])
        ylim('auto')
        zlim('auto')
        grid on
%--------- Plotting Together with smooth exact surface ----------------------
        figure; 
        plot3(Solu(:,2),Solu(:,3),Solu(:,4),'ko','markersize',8,'LineWidth',2)
%         legend('Interpolated z','FontSize',12);
        hold on
        % Construct a smooth surface of exact solution
        [x3,y3] = meshgrid(0:0.025:13.5);
        Zgh=sin(x3).*(-sin(y3));
        mesh(x3,y3,Zgh);
%          surf(x3,y3,Zgh);
        xlabel('x','FontSize',12);
        ylabel('y','FontSize',12);
        zlabel('df/dy','FontSize',12);
        title('Solution Comparison of z','FontSize',14);
        xlim([0 14])
        ylim('auto')
        zlim('auto')
        grid on