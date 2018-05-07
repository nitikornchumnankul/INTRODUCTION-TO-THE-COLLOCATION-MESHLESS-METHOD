clc
clear all
esp=2.5;    % the MQ-parameter
x=linspace(0,-1,10);
y=linspace(0,1,10);
LL=length(x);
f=(3.*x.^2)-(x*2.*y.^3)+(40);

  for j=1:LL
      for i=1:LL
xx(j+(i-1).*LL)=x(i);
         yy(j+(i-1).*LL)=y(j);
      end
  end
  f_ext=(3.*xx.^2).*yy-(xx*2.*yy.^3)+(40);
  EE=length(xx);
for i=1:EE
    for j=1:EE
    r(i,j)=sqrt((xx(i)-xx(j)).^2+(yy(i)-yy(j)).^2);
    MQ(i,j)=sqrt(esp.^2+r(i,j).^2);
    end
end
alpha=MQ\(f_ext)';

x1=linspace(0,-1,3);
y1=linspace(0,1,3);
LL1=length(x1);
f=(3.*x.^2)-(x*2.*y.^3)+(40);

  for j=1:LL1
      for i=1:LL1
         xx1(j+(i-1).*LL1)=x1(i);
         yy1(j+(i-1).*LL1)=y1(j);
      end
  end
 EE1=length(xx1);
  for i=1:EE1
    for j=1:EE
    r1(i,j)=sqrt((xx1(i)-xx(j)).^2+(yy1(i)-yy(j)).^2);
    MQ1(i,j)=sqrt(esp.^2+r1(i,j).^2);
      H(i,j)=(((xx1(i)-xx(j)))/(MQ1(i,j)));
    end
  end
  Z_Ezact=(6.*xx1.*yy1)-(2.*yy1.^3);
 Zinter=H*alpha;
 
  disp('interpolaion nodes')
   point=(1:1:EE1);
solu=zeros(EE1,5);

     disp('     Node      Xnode    Ynode     Inter.   Exact')
      for i=1:EE1
    solu(i,1)=point(i);
    solu(i,2)=xx1(i);
    solu(i,3)=yy1(i);
    solu(i,4)=Zinter(i,1);
    solu(i,5)= Z_Ezact(1,i);
     end
 disp(solu)

    