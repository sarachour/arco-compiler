clear all;
close all;
clc;

Etot1_rate=100e-9;
Etot1_const=0e-9;
Stot1=10e-9;
n=1;
KD1=10e-9;

r1=800;
r2=800;

Etot2=10e-9;
KD2=50e-9;
kr2=100;

KD3=50e-9;
kr3=100;

E_FB_EN2=1;
S_FB_EN2=1;
E_FB_EN3=0;
S_FB_EN3=1;

sim('ITD_new');

figure(1);
hold on
plot(TFbnd.Time, TFbnd.Data, 'b', 'LineWidth',2)
plot(TFfree.Time, TFfree.Data, 'r', 'LineWidth',2)
plot(Sfree1.Time, Sfree1.Data, 'k', 'LineWidth',2)
plot(DNAbnd1.Time, DNAbnd1.Data, 'm', 'LineWidth',2)
plot(DNAbnd2.Time, DNAbnd2.Data, 'c', 'LineWidth',2)
plot(DNAfree.Time, DNAfree.Data, 'y', 'LineWidth',2)

set(gca,'FontSize',12);
ylabel('Concentration');
xlabel('Time (seconds)');
legend({'TFbnd','TFfree','Sfree1','DNAbnd1','DNAbnd2','DNAfree'},'Location','NorthWest');
grid on;

%%%%%%%%%%%% Steady State Simulation. Stot sweep.

Stot1_ss=logspace(-10,-5,100); % Inducer (100p~10u)
Sfree1_ss=zeros(length(Stot1_ss),1);
TFbnd_ss=zeros(length(Stot1_ss),1);
TFfree_ss=zeros(length(Stot1_ss),1);
DNAbnd1_ss=zeros(length(Stot1_ss),1);
DNAbnd2_ss=zeros(length(Stot1_ss),1);
DNAfree_ss=zeros(length(Stot1_ss),1);

for i=1:length(Stot1_ss)
    Stot1=Stot1_ss(i);
    sim('ITD_new');
    Sfree1_ss(i,1)=Sfree1.Data(length(Sfree1.Data));
    TFbnd_ss(i,1)=TFbnd.Data(length(TFbnd.Data));
    TFfree_ss(i,1)=TFfree.Data(length(TFfree.Data));
    DNAbnd1_ss(i,1)=DNAbnd1.Data(length(DNAbnd1.Data));
    DNAbnd2_ss(i,1)=DNAbnd2.Data(length(DNAbnd2.Data));
    DNAfree_ss(i,1)=DNAfree.Data(length(DNAfree.Data));
end

figure(3);
semilogx(Stot1_ss,Sfree1_ss(:,1),Stot1_ss,TFbnd_ss(:,1),Stot1_ss,TFfree_ss(:,1),Stot1_ss,DNAbnd1_ss(:,1),Stot1_ss,DNAbnd2_ss(:,1),Stot1_ss,DNAfree_ss(:,1),'LineWidth',2);
set(gca,'FontSize',12);
ylabel('Concentration');
xlabel('Stot');
axis([1e-10 1e-5 0 1e-7]);
legend({'Sfree1','TFbnd','TFfree','DNAbnd1','DNAbnd2','DNAfree'},'Location','NorthWest');
grid on;
