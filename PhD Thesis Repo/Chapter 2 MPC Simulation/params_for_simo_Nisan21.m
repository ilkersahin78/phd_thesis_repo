% RUN THIS SCRIPT FIRST TO LOAD REQUIRED DATA TO SIMULATION
Rs=2.3;
Lls =4e-3;
Rr = 3.1;
Llr = 2e-3; 
Lm=98e-3;
PP=1;
Ls=Lm+Lls;
Lr=Lm+Llr;
lf=1-(Lm*Lm)/(Ls*Lr); %leakage factor, denoted by sigma
kr=Lm/Lr;
Req=Rs+kr*kr*Rr;
Lstr=lf*Ls; %Lsigma, stator transient inductance
taus=Lstr/Req; %stator transient time constant
taur=Lr/Rr;
fcontrol=40e3;%activation freq. of MPC block, i.e control frequency
T=1/fcontrol;
Tmpc=T;
OCLimit=10; % Irated peak = 10,2, overcurrent limit = 3xIrated 
PTlimit=3; 
NTlimit=-3;
SpeedSensorGain=1/314.15;
PhisRef=0.3;
Lambda=50; %found to be optimal by trial error
alpbet=[2/3, -1/3, -1/3; 0, sqrt(3)/3, -sqrt(3)/3 ];
ExCLimit=15;
flag=0;
X=(Rs/Lstr)+((Lm*Lm*Rr)/(Lstr*Lr*Lr));
Y=Lm/(Lstr*Lr);
%w=[0.1;0.1;0.005;0.005;1];
w=[0.1;0.1;0.002;0.002;1];
Q=diag(w);
u=[0.01;0.01];
R=diag(u);
Pinit=eye(5,5);
C=[1,0,0,0,0;0,1,0,0,0];
Jb= [1-X*T,0,(Y/taur)*T,0,0;
    0,1-X*T,0,(Y/taur)*T,0;
    (Lm/taur)*T,0,1-T/taur,0,0;
    0,(Lm/taur)*T,0,1-T/taur,0;
    0,0,0,0,1];
Jb2=Jb;
BM=zeros(10,5);
BMn=zeros(5,10);
dene=zeros(5,5);
a1=Tmpc/(taus+Tmpc);
a2=kr/Req;
K=1/(a1*a2);

%FULL ORDER OBSERVER PARAMETERS

ar11=-1/taus;
ar12=kr/(taur*Lstr);
ai12=-kr/Lstr;
ar21=Lm/taur;
ar22=-1/taur;
b1=1/Lstr;
c=Lstr/kr;
kobs=12;
g1=(kobs-1)*(ar11+ar22);
g2=(kobs-1); %hýzla çarpýlacak
g3=(kobs^2-1)*(c*ar11+ar21)-c*(kobs-1)*(ar11+ar22);
g4=-c*(kobs-1); %hýzla çarpýlacak








