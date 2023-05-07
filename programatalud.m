clear all;
clc;

%GT=input('El talud tendrá Grieta de Tensión (Si(1) o No(0)):');
GT=1;
%FE=input('El talud se le aplicara Fuerza externa(Si(1) o No(0)):');
E=0;
%FA=input('El talud se le aplicara Fuerza anclaje(Si(1) o No(0)):');
T=0;
%U=input('Se tomará en cuenta la presión del agua(Si(1) o No(0)):');
U=1;
% Y=input('ingrese el echado de los planos');
Y=[45,70,12,65,70];
% Q=input('ingrese la direcciion de los planos');
Q= [105,235,195,185,165];
% fi=input('Ingrese el ángulo de fricción del suelo del plano 1 y 2');
fhi=[20,30];
% H1=input('ingresa la altura');
H1=100;
% L=input('Distacia de la grieta de tensión, medida a lo largo del plano 1');
L=40;
%gmr=input('Peso especifico de la roca:');
gmr=160;
%gma=input('Peso especifico de la agua:');
gma=62.43;
C1=500;
C2=1000;
%%%%%% Valores constantes %%%%%%
n1=1;
 

% A)Cálculo de componentes de los vectores en las direcciones normaless 
ai=[(sin(Y(1,1)*pi()/180)*sin(Q(1,1)*pi()/180)),(sin(Y(1,1)*pi()/180)*cos(Q(1,1)*pi()/180)),cos(Y(1,1)*pi()/180)];
bi=[(sin(Y(1,2)*pi()/180)*sin(Q(1,2)*pi()/180)),(sin(Y(1,2)*pi()/180)*cos(Q(1,2)*pi()/180)),cos(Y(1,2)*pi()/180)];
di=[(sin(Y(1,3)*pi()/180)*sin(Q(1,3)*pi()/180)),(sin(Y(1,3)*pi()/180)*cos(Q(1,3)*pi()/180)),cos(Y(1,3)*pi()/180)];
fi=[(sin(Y(1,4)*pi()/180)*sin(Q(1,4)*pi()/180)),(sin(Y(1,4)*pi()/180)*cos(Q(1,4)*pi()/180)),cos(Y(1,4)*pi()/180)];
fsi=[(sin(Y(1,5)*pi()/180)*sin(Q(1,5)*pi()/180)),(sin(Y(1,5)*pi()/180)*cos(Q(1,5)*pi()/180)),cos(Y(1,5)*pi()/180)];
%ti=[(sin(Y(1,5)*pi()/180)*sin(Q(1,5)*pi()/180)),(sin(Y(1,5)*pi()/180)*cos(Q(1,5)*pi()/180)),cos(Y(1,5)*pi()/180)];
%ei=
%B)Componentes de los vectores en las lineas de intersección de varios planos
gi=[(fi(1,2)*ai(1,3)-fi(1,3)*ai(1,2)),(fi(1,3)*ai(1,1)-fi(1,1)*ai(1,3)),(fi(1,1)*ai(1,2)-fi(1,2)*ai(1,1))];
gsi=[(fsi(1,2)*ai(1,3)-fsi(1,3)*ai(1,2)),(fsi(1,3)*ai(1,1)-fsi(1,1)*ai(1,3)),(fsi(1,1)*ai(1,2)-fsi(1,2)*ai(1,1))];
ii=[(bi(1,2)*ai(1,3)-bi(1,3)*ai(1,2)),(bi(1,3)*ai(1,1)-bi(1,1)*ai(1,3)),(bi(1,1)*ai(1,2)-bi(1,2)*ai(1,1))];
ji=[(fi(1,2)*di(1,3)-fi(1,3)*di(1,2)),(fi(1,3)*di(1,1)-fi(1,1)*di(1,3)),(fi(1,1)*di(1,2)-fi(1,2)*di(1,1))];
jsi=[(fsi(1,2)*di(1,3)-fsi(1,3)*di(1,2)),(fsi(1,3)*di(1,1)-fsi(1,1)*di(1,3)),(fsi(1,1)*di(1,2)-fsi(1,2)*di(1,1))];

%Vector entre la línea de intersección de los 1-2 con el plano 1
ki=[(ii(1,2)*bi(1,3)-ii(1,3)*bi(1,2)),(ii(1,3)*bi(1,1)-ii(1,1)*bi(1,3)),(ii(1,1)*bi(1,2)-ii(1,2)*bi(1,1))];

%Vector entre la línea de intersección de los planos 1-2 con el plano 2
li=[(ai(1,2)*ii(1,3)-ai(1,3)*ii(1,2)),(ai(1,3)*ii(1,1)-ai(1,1)*ii(1,3)),(ai(1,1)*ii(1,2)-ai(1,2)*ii(1,1))];

%C)Número proporcionales a cosenos de varios ángulos 
m=gi(1,1)*di(1,1)+gi(1,2)*di(1,2)+gi(1,3)*di(1,3);
ms=gsi(1,1)*di(1,1)+gsi(1,2)*di(1,2)+gsi(1,3)*di(1,3);
n=bi(1,1)*ji(1,1)+bi(1,2)*ji(1,2)+bi(1,3)*ji(1,3);
ns=bi(1,1)*jsi(1,1)+bi(1,2)*jsi(1,2)+bi(1,3)*jsi(1,3);
p=ii(1,1)*di(1,1)+ii(1,2)*di(1,2)+ii(1,3)*di(1,3);
q=bi(1,1)*gi(1,1)+bi(1,2)*gi(1,2)+bi(1,3)*gi(1,3);
qs=bi(1,1)*gsi(1,1)+bi(1,2)*gsi(1,2)+bi(1,3)*gsi(1,3);
r=ai(1,1)*bi(1,1)+ai(1,2)*bi(1,2)+ai(1,3)*bi(1,3);
%s=
%vi=
%w=
%se=
%ve=
%we=
Ss=ai(1,1)*fsi(1,1)+ai(1,2)*fsi(1,2)+ai(1,3)*fsi(1,3);
vs=bi(1,1)*fsi(1,1)+bi(1,2)*fsi(1,2)+bi(1,3)*fsi(1,3);
ws=ii(1,1)*fsi(1,1)+ii(1,2)*fsi(1,2)+ii(1,3)*fsi(1,3);
lm=ii(1,1)*gi(1,1)+ii(1,2)*gi(1,2)+ii(1,3)*gi(1,3);
lms=ii(1,1)*gsi(1,1)+ii(1,2)*gsi(1,2)+ii(1,3)*gsi(1,3);
ep=fi(1,1)*fsi(1,1)+fi(1,2)*fsi(1,2)+fi(1,3)*fsi(1,3);

%D)Diversos Factores
R=(1-r^2)^0.5;
rho=(1/R^2)*((n*q)/(abs(n*q)));
mu=(1/R^2)*((m*q)/(abs(m*q)));
nu=(1/R)*((p)/(abs(p)));
G=gi(1,1)^2+gi(1,2)^2+gi(1,3)^2;
GS=gsi(1,1)^2+gsi(1,2)^2+gsi(1,3)^2;
M=(G*p^2-2*m*p*lm+m^2*R^2)^0.5;
MS=(GS*p^2-2*ms*p*lms+ms^2*R^2)^0.5;
h=H1/(abs(gi(1,3)));
hs=(M*h-(abs(p))*L)/(MS);

B=(tan(fhi(1,1)*pi/180)^2+tan(fhi(1,2)*pi/180)^2-(2)*((r*(mu))/rho)*tan(fhi(1,1)*pi/180)*tan(fhi(1,2)*pi/180))/R^2;
%E)Tendencia de la línea respecto de los planos 1 y 2
Yi=(asin(nu*ii(1,3)))*(180/pi);
Qi=180+(atan((-nu*ii(1,1))/(-nu*ii(1,2))))*(180/pi);

%F)Geometria de Cuña 
%  if((((p*ii(1,3))<0))||((n*p*ii(1,3))<0) && ((((n1*q*ii(1,3))<0))||((hs)>1))&& (abs((ms*hs)/(m*h))>1)||(abs((n*qs*ms*hs)/(ns*q*m*h))))
if ((((p*ii(1,3))<0)||((n*p*ii(1,3))<0))&&((((n1*q*ii(1,3))<0))||((hs)>1))&&((abs((ms*hs)/(m*h))>1)||(abs((n*qs*ms*hs)/(ns*q*m*h)))))
%     if ((p*ii(1,3))<0)&&((n1*q*ii(1,3))<0)
    disp('La cuña y la grieta de tensión no cumple con las condiciones,terminar el cálculo')
  else 
    %G)Area y peso de la cuña 
 A1=((m*q*h^2)-(ms*qs*hs^2))/(2*abs(p));
  A2=(((abs(q)*m^2*h^2)/(abs(n)))-((abs(qs)*ms^2*hs^2)/(abs(ns))))/(2*abs(p));
   A5=(abs(ms*qs)*hs^2)/(2*abs(ns));
    W= (gmr*(((q^2*m^2*h^3)/(abs(n)))-((qs^2*ms^2*hs^3)/(abs(ns)))))/(6*abs(p));
    
end
 
%H)Presión del agua
 
 if((U==1) && (GT==1)) %Presión de agua con grieta de tención 
     u1=(gma*hs*abs(ms))/(3*(di(1,3)));
     v=u1*A5*n1*(ep/(abs(ep)));
   elseif((U==1) && (GT==0)) %Presión de agua sin grieta por presión
         u1=(gma*hs*abs(ms))/(6*abs(p));
        else  
         u1=0;
           v=0;
 end
 
 %I)Reacciones normales efectivas en los planos 1 y 2
 N1=rho*(( W*ki(1,3))+(v*(r*vs-Ss)))-u1*A1;
 N2=mu*(( W*li(1,3))+(v*(r*Ss-vs)))-u1*A2;
 
 %Calculo de Factor de seguridad 
 if (N1<0 && N2<0)
     FS=0;
 elseif (N1>0 && N2<0)
     Na=W*ai(1,3)-v*Ss-u1*A1*r;
     Sx=Na*a(1,1)+v*fs(1,1)+u1*A1*bi(1,1);
     Sy=Na*a(1,2)+v*fs(1,2)+u1*A1*bi(1,2);
     Sz=(Na*a(1,3)+v*fs(1,3)+u1*A1*bi(1,3))+W;
     Sa=(Sx^2+Sy^2+Sz^2)^1/2;
     Qa=(Na-u1*A1)*tan(fhi(1,1)*pi/180)+C1*A1;
     FS1=(Qa/Sa);
 elseif (N1<0 && N2>0)
      Nb=W*bi(1,3)-v*vs-u1*A2*r;
     Sx=Nb*b(1,1)+v*fs(1,1)+u1*A2*ai(1,1);
     Sy=Nb*b(1,2)+v*fs(1,2)+u1*A2*ai(1,2);
     Sz=(Nb*b(1,3)+v*fs(1,3)+u1*A2*ai(1,3))+W;
     Sb=(Sx^2+Sy^2+Sz^2)^1/2;
     Qb=(Nb-u1*A2)*tan(fhi(1,2)*pi/180)+C2*A2;
     FS2=(Qb/Sb);
 else (N1>0 && N2>0);
     S=nu*(W*ii(1,3)-v*ws);
     Q1=N1*tan(fhi(1,1)*pi/180)+N2*tan(fhi(1,2)*pi/180)+C1*A1+C2*A2;
     FS3=(Q1/S);
     
 end
 %Calculo del minimo Factor de Seguridad 
 if (N1<0 && N2<0)
     FS=0;
     disp('Se termina el calculo')
     elseif(N1>0 && N2<0)
     if(FS1<1)
       disp('Se termina el calculo')  
     else
         FS1=(Sa*Qa-E(Qa^2+((Sa^2-E^2)*tan(fhi(1,1)*pi/180))))^0.5/(Sa^2-E^2)
         Ye1=asin(Sz/Sa)-atan((tan(fhi(1,1))/FS1)*pi/180)
         
         
     end 
 elseif(N1>0 && N2>0)
     if(FS3<1)
         disp('No se puede calculas FACTOR DE SEGURIDAD MINIMO')
     else 
         FSM=(S*Q1-E*((Q1^2)+B*(S^2-E^2))^0.5)/(S^2-E^2);
         X=(B+FSM^2)^0.5;
        ex=-((FSM*nu*ii(1,1))-(rho*ki(1,1)*tan(fhi(1,1)*pi/180))-(mu*li(1,1)*tan(fhi(1,2)*pi/180)))/X;
         ey=-((FSM*nu*ii(1,2))-(rho*ki(1,2)*tan(fhi(1,1)*pi/180))-(mu*li(1,2)*tan(fhi(1,2)*pi/180)))/X;
          ez=-((FSM*nu*ii(1,3))-(rho*ki(1,3)*tan(fhi(1,1)*pi/180))-(mu*li(1,3)*tan(fhi(1,2)*pi/180)))/X;
          Ye3=asin(-ez)*180/pi;
          if (ii(1,1)<0 && ii(1,2)<0)
           De3=(atan(ex/ey)*180/pi);
          else (ii(1,1)<0) && (ii(1,2)>0)
         De3=(atan(ex/ey)*180/pi)+180;
          end
     end 
     se=ai(1,1)*ex+ai(1,2)*ey+ai(1,3)*ez;
     ve=bi(1,1)*ex+bi(1,2)*ey+bi(1,3)*ez;
     N11=N1+(E*rho)*((r*ve)-se);
      N22=N2+(E*mu)*((r*se)-ve);
 end
%  Tensión mínima del cable o perno Tmin Tensión mínima del cable o perno Tmin 
    if N2<0 
    else
        
        FS=1.5;
       X=(FS^2+B)^(0.5);
        T3=(FS*S-Q)/X;
         tx=((FS*nu*ii(1,1))-(rho*ki(1,1)*tan(fhi(1,1)*pi/180))-(mu*li(1,1)*tan(fhi(1,2)*pi/180)))/X;
         ty=((FS*nu*ii(1,2))-(rho*ki(1,2)*tan(fhi(1,1)*pi/180))-(mu*li(1,2)*tan(fhi(1,2)*pi/180)))/X;
          tz=((FS*nu*ii(1,3))-(rho*ki(1,3)*tan(fhi(1,1)*pi/180))-(mu*li(1,3)*tan(fhi(1,2)*pi/180)))/X;
          Yt3=asin(-tz)*(180/pi);
          if ii(1,1)<0 && ii(1,2)<0
              Dt3=(atan(tx/ty)*180/pi)+180;
              
          elseif ii(1,1)<0 && ii(1,2)>0
               Dt3=(atan(tx/ty)*180/pi)+360;
          elseif ii(1,1)>0 && ii(1,2)>0
              Dt3=(atan(tx/ty)*180/pi);
          else 
              Dt3=(atan(tx/ty)*180/pi)+180;
          end
          
    end 
    
     
         

 