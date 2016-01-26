clear all;
close all;
clc;

% Global parameters
KDfw = 10;
KDrv = 10;
n = 1;
krC = 10;
krD = 10;
A_FB_EN = 1;
B_FB_EN = 1;
A_FB_EN_FI = 0;
B_FB_EN_FI = 0;
C_FF_EN = 1;
D_FF_EN = 1;
ratC = 0;
ratD = 0;

% (block 1)
A_FB_EN1 = 1;
B_FB_EN1 = 0;

D_FF_EN1 = 1;

A_FB_EN4 = 0.5;
krC4 = 20;

A_FB_EN5 = 0;
ratC4 = 1;
ratC5 = 3;
KDrv5 = 10000000;

A_FB_EN6 = 0;
ratC6 = 0;
KDrv6 = 10000000;

% krC2 = 5; % cut into half when A_dimer<->A+A and deg exists
% KDfw2 = 5; % cut into half when A_dimer<->A+A and deg exists -> old
KDfw2 = 10;
% KDrv2 = 5; % cut into half when A_dimer<->A+A and deg exists -> old
KDrv2 = 10;
ratC7 = 2; % double when A_dimer<->A+A and deg exists
kr11 = 10; % no need to change this
kr22 = 5; % cut into half when A_dimer<->A+A and deg exists

ratC8 = 0.1;
ratC9 = 0;
ratC10 = 0.6;
ratC11 = 0.2;
% ratC11*kr2 should be equal to kr1/KDfw

%%%%% From here, new basic block
B_FB_EN11 = 1;
A_FB_EN12 = 0;
B_FB_EN12 = 0;
C_FF_ENb = 0;
ratC12 = 1;
ratC13 = 2;
ratC14 = 3;
ratC15 = 10;
kr1 = 10;
kr2 = 5;
% kr2 = 1;

%%% From here, compare with Cadence
A_FB_EN0 = 1;
B_FB_EN0 = 1;
ratC0 = 0;
KDfw0 = 10;
KDrv0 = 10;
A_FB_EN01 = 0;
B_FB_EN01 = 0;
ratC01 = 1;
ratC02 = 0.1;
ratC03 = 2;
ratC04 = 0.5;
ratC05 = 10;

kr1_01 = 5;
KDfw01 = 5;
KDrv01 = 10;
KDfw02 = 10;
KDrv02 = 5;
KDfw03 = 30;
KDrv03 = 10;


sim('test_buildingblocks_newbasicblk_20150723');

figure(1);
hold on
% plot(Adimer.Time, Adimer.Data, 'b', 'LineWidth',2)
% plot(Afree.Time, Afree.Data, 'r', 'LineWidth',2)
plot(Adimer2.Time, Adimer2.Data, 'b', 'LineWidth',2)
plot(Afree2.Time, Afree2.Data, 'r', 'LineWidth',2)
% plot(Ctot.Time, Ctot.Data, 'k', 'LineWidth',2)
% plot(Dtot.Time, Dtot.Data, 'm', 'LineWidth',2)
% plot(P01free.Time, P01free.Data, 'k', 'LineWidth',2)
% plot(P11free.Time, P11free.Data, 'm', 'LineWidth',2)
% plot(P02free.Time, P02free.Data, 'c', 'LineWidth',2)
% plot(P12free.Time, P12free.Data, 'g', 'LineWidth',2)
% plot(afree.Time, afree.Data, 'y', 'LineWidth',2)
% plot(rfree.Time, rfree.Data, 'b', 'LineWidth',2)
% plot(Atot.Time, Atot.Data, 'b', 'LineWidth',2)
% plot(Btot.Time, Btot.Data, 'r', 'LineWidth',2)

set(gca,'FontSize',12);
ylabel('Concentration');
xlabel('Time (seconds)');
%axis([0 tmax 0 2^12]);
legend({'Adimer','Afree','Ctot','Dtot'},'Location','NorthEast');
grid on;

figure(2);
hold on
plot(Adimer1.Time, Adimer1.Data, 'b', 'LineWidth',2)
plot(Afree1.Time, Afree1.Data, 'r', 'LineWidth',2)

figure(3);
hold on
plot(Adimer3.Time, Adimer3.Data, 'b', 'LineWidth',2)
plot(Afree3.Time, Afree3.Data, 'r', 'LineWidth',2)

figure(4);
hold on
plot(Adimer.Time, Adimer.Data, 'b', 'LineWidth',2)
plot(Afree.Time, Afree.Data, 'r', 'LineWidth',2)

figure(5);
hold on
plot(Adimer4.Time, Adimer4.Data, 'b', 'LineWidth',2)
plot(Afree4.Time, Afree4.Data, 'r', 'LineWidth',2)
plot(rate_up4.Time, rate_up4.Data, 'k', 'LineWidth',2)
plot(Atot4.Time, Atot4.Data, 'm', 'LineWidth',2)
legend({'Adimer','Afree','rateup','Atot'},'Location','NorthEast');

figure(6);
hold on
plot(Adimer5.Time, Adimer5.Data, 'b', 'LineWidth',2)
plot(Afree5.Time, Afree5.Data, 'r', 'LineWidth',2)
plot(Atot5.Time, Atot5.Data, 'k', 'LineWidth',2)
legend({'Adimer','Afree','Atot'},'Location','NorthEast');

figure(7);
hold on
plot(Efree.Time, Efree.Data, 'b', 'LineWidth',2)
plot(Sfree.Time, Sfree.Data, 'r', 'LineWidth',2)
plot(ESfree.Time, ESfree.Data, 'k', 'LineWidth',2)
plot(Pfree.Time, Pfree.Data, 'm', 'LineWidth',2)
legend({'Efree','Sfree','ESfree','Pfree'},'Location','NorthEast');
grid on;

figure(8);
hold on
plot(Afree6.Time, Afree6.Data, 'b', 'LineWidth',2)
plot(Bfree6.Time, Bfree6.Data, 'r', 'LineWidth',2)
plot(Cfree6.Time, Cfree6.Data, 'k', 'LineWidth',2)
plot(Dfree6.Time, Dfree6.Data, 'm', 'LineWidth',2)
legend({'Afree','Bfree','Cfree','Dfree'},'Location','NorthEast');
grid on;

figure(9);
hold on
plot(Afree0.Time, Afree0.Data, 'b', 'LineWidth',2)
plot(Bfree0.Time, Bfree0.Data, 'r', 'LineWidth',2)
plot(Ctot0.Time, Ctot0.Data, 'k', 'LineWidth',2)
plot(Cfree0.Time, Cfree0.Data, 'm', 'LineWidth',2)
plot(Dfree0.Time, Dfree0.Data, 'c', 'LineWidth',2)
plot(Efree0.Time, Efree0.Data, 'g', 'LineWidth',2)
plot(Ffree0.Time, Ffree0.Data, 'y', 'LineWidth',2)
plot(Gfree0.Time, Gfree0.Data, 'b', 'LineWidth',2)
legend({'Afree','Bfree','Ctot','Cfree','Dfree','Efree','Ffree','Gfree'},'Location','NorthEast');
grid on;

figure(10);
hold on
plot(Afree01.Time, Afree01.Data, 'b', 'LineWidth',2)
plot(Bfree01.Time, Bfree01.Data, 'r', 'LineWidth',2)
plot(Ctot01.Time, Ctot01.Data, 'k', 'LineWidth',2)
plot(Cfree01.Time, Cfree01.Data, 'm', 'LineWidth',2)
plot(Dfree01.Time, Dfree01.Data, 'c', 'LineWidth',2)
plot(Efree01.Time, Efree01.Data, 'g', 'LineWidth',2)
plot(Ffree01.Time, Ffree01.Data, 'y', 'LineWidth',2)
legend({'Afree','Bfree','Ctot','Cfree','Dfree','Efree','Ffree'},'Location','NorthEast');
grid on;

figure(11);
hold on
plot(Afree02.Time, Afree02.Data, 'b', 'LineWidth',2)
plot(Bfree021.Time, Bfree021.Data, 'r', 'LineWidth',2)
plot(Bfree022.Time, Bfree022.Data, 'k', 'LineWidth',2)
plot(Bfree023.Time, Bfree023.Data, 'm', 'LineWidth',2)
plot(Cfree021.Time, Cfree021.Data, 'c', 'LineWidth',2)
plot(Cfree022.Time, Cfree022.Data, 'g', 'LineWidth',2)
plot(Cfree023.Time, Cfree023.Data, 'y', 'LineWidth',2)
legend({'Afree','Bfree1','Bfree2','Bfree3','C1','C2','C3'},'Location','NorthEast');
grid on;
