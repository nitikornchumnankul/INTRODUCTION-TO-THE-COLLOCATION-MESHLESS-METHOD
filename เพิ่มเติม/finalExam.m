clc
clear all



%n=20; %input('Enter the number of nodes ');
xx=linspace(0,10,10);% X-coordinates at which the function values are known
ykk=((2/3).*(xx).^3)-1; 
yknown=((2.*(xx).^2));
yknown(1,1)=((2.*(xx).^2));
esp=16;
n=length(xx);
%------ Interpolation By Linear PW ---------

for i=1:n
    for j=1:n
        r(i,j)=abs(xx(1,i)-xx(1,j));
        MQ(i,j)=sqrt((esp^2)+(r(i,j).^2));
    end
end
 

% 
% xx1=linspace(0,10,10);
% n1=10;
% for i=1:n1
%     for j=1:n
%         r1(i,j)=abs(xx1(1,i)-xx(1,j));
%         MQ1(i,j)=sqrt((esp^2)+r1(i,j).^2);
%        
%     end
% end




for i=1:n
    for j=1:n
             
      H(i,j)=(((xx(1,i)-xx(1,j)))/(MQ(i,j)));
    end
end
alpha=H\(ykk)'; 

Yinter=(MQ*alpha);

Error=abs(Yinter-ykk');
disp('************* BELOW ARE THE SOLUTIONS YOU EXPECTED ***********')
nod=1:1:n; node=(nod');
Solu=zeros(n,4);
for i=1:n
Solu(i,1)=node(i,1);
Solu(i,2)=Yinter(i,1);
Solu(i,3)=ykk(1,i);
Solu(i,4)=Error(i,1);  
end
disp('    node     Y-inter    Y-Exact    Error')
Solu
disp('*************** THANK YOU FOR THE SOLUTIONS *****************')
%  ==================================================
%  
% for i=1:n
%     for j=1:n
%         r(i,j)=abs(xx(1,i)-xx(1,j));
%         MQ11(i,j)=sqrt((esp^2)+r(i,j).^2);
%     end
% end
% alpha=MQ11\(yknown)'; 
% 
% xx1=linspace(0,2*pi,5);
% for i=1:n1
%     for j=1:n
%         r1(i,j)=abs(xx1(1,i)-xx(1,j));
%         MQ12(i,j)=sqrt((esp^2)+r1(i,j).^2);
%         
%     end
% end
% 
% 
% for i=1:n1
%     for j=1:n
%       
%       H2(i,j)=(esp^2)/(((esp^2)+r1(i,j).^2)^(3/2));
%     end
% end
% =====================================================
%   func=(MQ12*alpha);
%   yinter=H*alpha;% The solutions
% xx3=linspace(0,2*pi,100);
% disp('Yinter')
% disp(yinter)
% disp('YXcat')
% disp(yknown')

%  yknown1=sin(xx3);
%  yexact1=cos(xx3);
% =====================================================
%   yext2=(MQ12*alpha);
%   yinter2=H2*alpha;% The solutions
%    xx3=linspace(0,2*pi,100);
% 
%   yknown2=sin(xx3);
%   yexact2=(-sin(xx3));
%   ===================================================
% 
% figure
%  plot(xx3,yknown1,'r','linewidth',3);
%  hold on
% plot (xx3,yexact1,'--','linewidth',2.5);
% hold on
% plot(xx1,yinter,'ko','linewidth',2);
% 
%  legend('f(x)/sin(x)','Approx of df/dx','Exact of df/dx');
% title('Comparison of Solution');
% xlabel('x','FontSize',14);
% ylabel('y=df(x)/dx','FontSize',14);
% =====================================================
% figure
% plot(xx3,yknown2,'r','linewidth',3);
% hold on
% plot (xx3,yexact2,'--','linewidth',2.5);
% hold on
% plot(xx1,yinter2,'ko','linewidth',2);
% 
%  legend('f(x)/sin(x)','Approx of df/dx','Exact of df/dx');
% title('Comparison of Solution');
% xlabel('x','FontSize',14);
% ylabel('y=2nd,Derivative','FontSize',14);