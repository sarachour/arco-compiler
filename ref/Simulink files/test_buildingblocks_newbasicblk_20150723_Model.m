function test_buildingblocks_newbasicblk_20150723_Model

tspan = [0, 100]; %% time span
x0 = [0; 0; 0; 0]; %% initial conditions
% x0 = [100; 20; 0; 20; 0; 30; 0]; %% initial conditions
options = odeset('RelTol',1e-8,'AbsTol',1e-11);
[t,x] = ode15s(@reaction_derivatives4, tspan, x0, options); %% compute ODE

figure(20);
clrs={'b','r','k','m','c','g','y','b'};
for i=1:4
    plot(t,x(:,i),clrs{i},'LineWidth',2); hold on;
end
% plot(t,x(:,1)+x(:,3),clrs{5},'LineWidth',2);
% plot(t,x(:,2)+x(:,3),clrs{6},'LineWidth',2);
grid on;

set(gca,'FontSize',12);
xlabel('Time (seconds)');
ylabel('Concentration');
% legend({'A','B','C','B2','C2','B3','C3'},'Location','NorthEast');
%axis([0 tmax 0 2^12]);
% legend({'A_{monomer}','A_{dimer}'},'Location','NorthEast');
% legend({'A_{dimer}','A_{monomer}'},'Location','NorthEast');
legend({'Efree','Sfree','ESfree','Pfree'},'Location','NorthEast');
% legend({'Afree','Bfree','Cfree','Dfree'},'Location','NorthEast');

function dxdt = reaction_derivatives(t,x) % monomerization without deg

%%% parameter values
kr1 = 10;
kr2 = 10;
KDrv = 10;

kf = kr1;
kr = kr1/KDrv;

%%% our differential equation
% change to matrix format!!
dvxdt = [-1*kf*x(1) + kr*x(2)*x(2);... %x(1)=A_dimer
        kf*x(1)*2 - kr*x(2)*x(2)*2]; %x(2)=A_monomer
    
function dxdt = reaction_derivatives2(t,x) % dimerization with deg

%%% parameter values
kr1 = 10;
kr2 = 5;
KDrv = 10;
KDfw = 10;
prod = 20*10/KDfw*kr1;
ratC4 = 1;
ratC5 = 3;

kf = kr1/KDfw;
kr = kr1;
degDimer = kr2*ratC4;
degMonomer = kr2*ratC5;

%%% our differential equation
% change to matrix format!!
dxdt = [prod - kf*x(1)*x(1)*2 + kr*x(2)*2 - degMonomer*x(1);... %x(1)=A_monomer
        kf*x(1)*x(1) - kr*x(2) - degDimer*x(2)]; %x(2)=A_dimer
    
function dxdt = reaction_derivatives3(t,x) % monomerization with deg

%%% parameter values
kr1 = 10;
kr2 = 10;
KDrv = 10;
KDfw = 10;
prod = 10*10/KDfw*kr1;
ratC4 = 1;
ratC7 = 1;

kf = kr1;
kr = kr1/KDrv;
degDimer = kr2*ratC7;
degMonomer = kr2*ratC4;

%%% our differential equation
% change to matrix format!!
dxdt = [prod - kf*x(1) + kr*x(2)*x(2) - degDimer*x(1);... %x(1)=A_dimer
        kf*x(1)*2 - kr*x(2)*x(2)*2 - degMonomer*x(2)]; %x(2)=A_monomer
    
function dxdt = reaction_derivatives4(t,x) % MM reaction test

%%% parameter values
kr1 = 10;
kr2 = 5;
KDrv = 10;
KDfw = 10;
ratC8 = 0.1;
ratC9 = 0.03;
ratC10 = 0.06;

prod_E = 10*10/KDfw*kr1;
prod_S = 5*10/KDfw*kr1;
deg_E = ratC8*kr2;
deg_S = ratC9*kr2;
deg_P = ratC10*kr2;

kf1 = kr1/KDfw;
kr = kr1;
kf2 = kr1/KDfw; % should be equal to ratC11*kr2

%%% our differential equation
% change to matrix format!!
dxdt = [prod_E - kf1*x(1)*x(2) + kr*x(3) + kf2*x(3) - deg_E*x(1);... % x(1)=Efree
        prod_S - kf1*x(1)*x(2) + kr*x(3) - deg_S*x(2);... % x(2)=Sfree
        kf1*x(1)*x(2) - kr*x(3) - kf2*x(3);... % x(3)=ESfree
        kf2*x(3) - deg_P*x(4)]; % x(4)=Pfree

function dxdt = reaction_derivatives5(t,x) 

%%% parameter values
kr1 = 10;
kr2 = 1;
KDrv = 10;
KDfw = 10;
prodA = 10*1/KDfw*kr1;
prodB = 5*1/KDfw*kr1;
ratC12 = 0.2;
ratC13 = 0.2;
ratC14 = 0.3;
ratC15 = 0.2;

kf = 1/KDfw*kr1;
kr = kr1/KDrv;
degA = kr2*ratC12;
degB = kr2*ratC13;
degC = kr2*ratC14;
degD = kr2*ratC15;

%%% our differential equation
% change to matrix format!!
dxdt = [prodA - kf*x(1)*x(2) + kr*x(3)*x(4) - degA*x(1);... %x(1)=Afree
        prodB - kf*x(1)*x(2) + kr*x(3)*x(4) - degB*x(2);... %x(2)=Bfree
        kf*x(1)*x(2) - kr*x(3)*x(4) - degC*x(3);... %x(3)=Cfree
        kf*x(1)*x(2) - kr*x(3)*x(4) - degD*x(4)]; %x(4)=Dfree
    
function dxdt = reaction_derivatives6(t,x) % Fanout test! A+B<->C, A+B2<->C2, A+B3<->C3

%%% parameter values
kr_1 = 10;
% kr_2 = 0.5;
KDrv = 10;
KDfw = 10;

KDfw01 = 5;
KDrv01 = 10;
KDfw02 = 10;
KDrv02 = 5;
KDfw03 = 30;
KDrv03 = 10;

kf1 = 1/KDfw01*kr_1;
kr1 = 10*kr_1/KDrv01;
kf2 = 1/KDfw02*kr_1;
kr2 = 10*kr_1/KDrv02;
kf3 = 1/KDfw03*kr_1;
kr3 = 10*kr_1/KDrv03;

%%% our differential equation
% change to matrix format!!
dxdt = [-kf1*x(1)*x(2) + kr1*x(3) - kf2*x(1)*x(4) + kr2*x(5) - kf3*x(1)*x(6) + kr3*x(7);... %x(1)=Afree
        -kf1*x(1)*x(2) + kr1*x(3);... %x(2)=Bfree
        kf1*x(1)*x(2) - kr1*x(3);... %x(3)=Cfree
        -kf2*x(1)*x(4) + kr2*x(5);... %x(4)=Bfree2
        kf2*x(1)*x(4) - kr2*x(5);... %x(5)=Cfree2
        -kf3*x(1)*x(6) + kr3*x(7);... %x(6)=Bfree3;
        kf3*x(1)*x(6) - kr3*x(7)]; %x(7)=Cfree3;
