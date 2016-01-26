clear all;
close all;
clc;

% Global parameters
KDfw = 10;
KDrv = 10;
n = 1;
kr1 = 10;
kr2 = 10;
ratC = 0;

ratC1 = 1;

% Block 1 (p53)
% kr1_b1 = 200;
% kr2_b1 = 200;
kr1_b1 = 197.24;
kr2_b1 = 197.24;

% Block 2 (p53+Mdm2 binding)
kr1_b2 = 200;
KDfw_b2 = 0.724;

% Block 3 (Mdm2mRNA)
kr1_b3 = 23.91;
kr2_b3 = 23.91;

% Block 4 (Mdm2)
kr1_b4 = 118.3;
kr2_b4 = 239.1;
ratC_b4 = 0.433;

% Block 5 (IR) -> in Simulink, just use pulse input for IR

% Block 6 (damDNA)
kr1_b6 = 478;
kr2_b6 = 4.78;

% Block 7 (ARF)
kr1_b7 = 7.89;
kr2_b7 = 23.91;

% Block 8 (Mdm2+ARF binding)
kr1_b8 = 1195;
kr2_b8 = 239.1;
KDfw_b8 = 0.5;

sim('test_p53_compare_with_chip_20160118');

figure(1);
hold on
plot(p53tot.Time, p53tot.Data, 'b', 'LineWidth',2)
plot(Mdm2tot.Time, Mdm2tot.Data, 'r', 'LineWidth',2)
plot(Mdm2mRNA.Time, Mdm2mRNA.Data, 'k', 'LineWidth',2)
plot(damDNA.Time, damDNA.Data, 'c', 'LineWidth',2)
plot(ARF.Time, ARF.Data, 'm', 'LineWidth',2)
plot(test.Time, test.Data, 'g', 'LineWidth',2)
% plot(P12free.Time, P12free.Data, 'g', 'LineWidth',2)

set(gca,'FontSize',12);
ylabel('Concentration');
xlabel('Time (seconds)');
%axis([0 tmax 0 2^12]);
legend({'p53tot','Mdm2tot','Mdm2mRNA','damDNA','ARF','test'},'Location','NorthWest');
grid on;
% 
% figure(2);
% hold on
% plot(Afree1.Time, Afree1.Data, 'b', 'LineWidth',2)
% plot(Bfree1.Time, Bfree1.Data, 'r', 'LineWidth',2)
% plot(Cfree1.Time, Cfree1.Data, 'k', 'LineWidth',2)
% plot(test.Time, test.Data, 'c', 'LineWidth',2)
% 
% set(gca,'FontSize',12);
% ylabel('Concentration');
% xlabel('Time (seconds)');
% axis([0 10 0 120]);
% legend({'A','B','C','test'},'Location','NorthWest');
% grid on;

