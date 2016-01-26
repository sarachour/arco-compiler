function prog_vect=Simulation_dynamic_aug15(prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr)

% 150p, 100n, 150p, 400n, 150p, 1u, 150p
% IStotSweep(1,:) = digital_current_to_closest_bits('B00',0.1,1);
IStotSweep(1,:) = digital_current_to_closest_bits('B00',100,1);

% % 150p, 100n, 150p, 400n, 150p
% IStotSweep=[0 1 0 0 0 0 0; 1 0 1 0 0 0 1; 0 1 0 0 0 0 0;
%     1 0 1 0 1 0 1; 0 1 0 0 0 0 0]; 

numPoints=length(IStotSweep(:,1));
initSamples = 23;
numSamples=500;
Imeas=zeros(initSamples+numPoints*numSamples,9); %%%%%%%%%%%%%%%%%%%%%%% note!

% Scale factor from ADC output to analog current (when clk=5MHz)
ADCOUTtoCurrent = [3.05 2.84 3.05 4.13 4.12 2.64 3.09 2.86 2.40 3.58 3.18 3.47 2.33 3.80 3.08 4.97 4.40 3.36 4.30 2.85 2.77 3.38 4.20 2.49];
ADCOUTtoCurrent = 1./ADCOUTtoCurrent;

figure(1); clf; figure(2); clf;
% options={'o-','x-','+-','*-'};

% set simulation values
% recommended clk freq: 5MHz
disp('Loading simulation parameters..')
pause(1);

%%%%% INITIAL CONDITIONS %%%%%
for k = 1:1
    % Block 1 (A1 initial condition)
    prog_vect(1:7, k)=digital_current_to_closest_bits('IAtot_1',100,1); % IAtot = 100n
    prog_vect(8:14, k)=digital_current_to_closest_bits('IBtot_1',10,1); % IBtot = 100n
    prog_vect(15:21, k)=digital_current_to_closest_bits('IKDfw_1',10,1); % IKDfw = 100n
    prog_vect(22:28, k)=digital_current_to_closest_bits('Ikr1_1',50,1); % Ikr1 = 10n
    prog_vect(29:35, k)=digital_current_to_closest_bits('Ikr2_1',50,1); % Ikr2 = 1n
    prog_vect(36:42, k)=[0 0 0 0 0 0 0]; % IDfree = 0
    prog_vect(43:49, k)=digital_current_to_closest_bits('IKDrv_1',10,1); % IKDrv = 10n
    prog_vect(50:56, k)=[0 0 0 0 0 0 0]; % IratC = 100n
    
    % Block 2 (A1<->B)
    prog_vect(57:63, k)=[0 0 0 0 0 0 0]; % IAtot = 0
    prog_vect(64:70, k)=digital_current_to_closest_bits('IBtot_2',100,1); % IBtot = 100n
    prog_vect(71:77, k)=digital_current_to_closest_bits('IKDfw_2',100,1); % IKDfw = 100n
    prog_vect(78:84, k)=digital_current_to_closest_bits('Ikr1_2',50,1); % Ikr1 = 10n
    prog_vect(85:91, k)=digital_current_to_closest_bits('Ikr2_2',50,1); % Ikr2 = 1n
    prog_vect(92:98, k)=[0 0 0 0 0 0 0]; % IDfree = 100n
    prog_vect(99:105, k)=digital_current_to_closest_bits('IKDrv_2',100,1); % IKDrv = 100n
    prog_vect(106:112, k)=[0 0 0 0 0 0 0]; % IratC = 0     

    % Block 3 (B<->C->0)
    prog_vect(113:119, k)=[0 0 0 0 0 0 0]; % IAtot = 0
    prog_vect(120:126, k)=digital_current_to_closest_bits('IBtot_3',100,1); % IBtot = 10n
    prog_vect(127:133, k)=digital_current_to_closest_bits('IKDfw_3',100,1); % IKDfw = 10n
    prog_vect(134:140, k)=digital_current_to_closest_bits('Ikr1_3',50,1); % Ikr1 = 10n
    prog_vect(141:147, k)=digital_current_to_closest_bits('Ikr2_3',50,1); % Ikr2 = 1n
    prog_vect(148:154, k)=[0 0 0 0 0 0 0]; % IDfree = 100n
    prog_vect(155:161, k)=digital_current_to_closest_bits('IKDrv_3',100,1); % IKDrv = 10n
    prog_vect(162:168, k)=[0 0 0 0 0 0 0]; % IratC = 0
 
    % Block 4
    prog_vect(169:175, k)=digital_current_to_closest_bits('IAtot_4',50,1); % IAtot = 0
    prog_vect(176:182, k)=digital_current_to_closest_bits('IBtot_4',100,1); % IBtot = 10n
    prog_vect(183:189, k)=digital_current_to_closest_bits('IKDfw_4',100,1); % IKDfw = 10n
    prog_vect(190:196, k)=digital_current_to_closest_bits('Ikr1_4',50,1); % Ikr1 = 10n
    prog_vect(197:203, k)=digital_current_to_closest_bits('Ikr2_4',50,1); % Ikr2 = 1n
    prog_vect(204:210, k)=[0 0 0 0 0 0 0]; % IDfree = 0
    prog_vect(211:217, k)=digital_current_to_closest_bits('IKDrv_4',10,1); % IKDrv = 10n
    prog_vect(218:224, k)=[0 0 0 0 0 0 0]; % IratC = 0    

    % Block 5
    prog_vect(225:231, k)=[0 0 0 0 0 0 0]; % IAtot = 0
    prog_vect(232:238, k)=digital_current_to_closest_bits('IBtot_5',100,1); % IBtot = 10n
    prog_vect(239:245, k)=digital_current_to_closest_bits('IKDfw_5',100,1); % IKDfw = 10n
    prog_vect(246:252, k)=digital_current_to_closest_bits('Ikr1_5',50,1); % Ikr1 = 10n
    prog_vect(253:259, k)=digital_current_to_closest_bits('Ikr2_5',50,1); % Ikr2 = 1n
    prog_vect(260:266, k)=[0 0 0 0 0 0 0]; % IDfree = 100n
    prog_vect(267:273, k)=digital_current_to_closest_bits('IKDrv_5',100,1); % IKDrv = 100n
    prog_vect(274:280, k)=[0 0 0 0 0 0 0]; % IratC = 0          

    prog_vect(281:287, k)=digital_current_to_closest_bits('IOne',100,1); % One = 100n

    % Block 1
    prog_vect(288:291, k)=[1 1 1 1]; % hill_b<0:3> (1111: hill 1 ~ 0000: hill 4)
    prog_vect(292:293, k)=[0 0]; % A_FB_EN, B_FB_EN
    prog_vect(294:296, k)=[0 0 1]; % sel_useI, sel_Ctot, sel_rate
    % Block 2
    prog_vect(297:300, k)=[1 1 1 1]; % hill_b<0:3> (1111: hill 1 ~ 0000: hill 4)
    prog_vect(301:302, k)=[1 0]; % A_FB_EN, B_FB_EN
    prog_vect(303:305, k)=[0 0 1]; % sel_useI, sel_Ctot, sel_rate
    % Block 3
    prog_vect(306:309, k)=[1 1 1 1]; % hill_b<0:3> (1111: hill 1 ~ 0000: hill 4)
    prog_vect(310:311, k)=[1 0]; % A_FB_EN, B_FB_EN
    prog_vect(312:314, k)=[0 0 1]; % sel_useI, sel_Ctot, sel_rate
    % Block 4
    prog_vect(315:318, k)=[1 1 1 1]; % hill_b<0:3> (1111: hill 1 ~ 0000: hill 4)
    prog_vect(319:320, k)=[0 0]; % A_FB_EN, B_FB_EN
    prog_vect(321:323, k)=[0 0 1]; % sel_useI, sel_Ctot, sel_rate
    % Block 5
    prog_vect(324:327, k)=[1 1 1 1]; % hill_b<0:3> (1111: hill 1 ~ 0000: hill 4)
    prog_vect(328:329, k)=[1 0]; % A_FB_EN, B_FB_EN
    prog_vect(330:332, k)=[0 0 1]; % sel_useI, sel_Ctot, sel_rate
end

DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
disp('Initial condition set.')
pause(5);


%%%%% REAL PARAMETERS %%%%%
prog_vect(1:7, 1)=[0 0 0 0 0 0 0]; % IAtot = 100n
prog_vect(169:175, 1)=[0 0 0 0 0 0 0]; % IAtot = 100n

prog_vect(294:296, 1)=[0 1 1]; % sel_useI, sel_Ctot, sel_rate
prog_vect(303:305, 1)=[0 1 1]; % sel_useI, sel_Ctot, sel_rate
prog_vect(312:314, 1)=[0 1 1]; % sel_useI, sel_Ctot, sel_rate
prog_vect(321:323, 1)=[0 1 1]; % sel_useI, sel_Ctot, sel_rate
prog_vect(330:332, 1)=[0 0 0]; % sel_useI, sel_Ctot, sel_rate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
% disp('Done loading.')
% pause(3);

for iter_var=1:1
    
%     %%%%% change Gain&TC
%     if(iter_GainTC == 2)
%         prog_vect(267:273, 1)=digital_current_to_closest_bits('IA_mRNA',25,1); % IA_mRNA
%         prog_vect(274:280, 1)=digital_current_to_closest_bits('IB_mRNA',25,1); % IB_mRNA
%     elseif(iter_GainTC == 3)
%         prog_vect(267:273, 1)=digital_current_to_closest_bits('IA_mRNA',100,1); % IA_mRNA
%         prog_vect(274:280, 1)=digital_current_to_closest_bits('IB_mRNA',200,1); % IB_mRNA
%     elseif(iter_GainTC == 4)
%         prog_vect(267:273, 1)=digital_current_to_closest_bits('IA_mRNA',25,1); % IA_mRNA
%         prog_vect(274:280, 1)=digital_current_to_closest_bits('IB_mRNA',50,1); % IB_mRNA
%     elseif(iter_GainTC == 5)
%         prog_vect(267:273, 1)=digital_current_to_closest_bits('IA_mRNA',100,1); % IA_mRNA
%         prog_vect(274:280, 1)=digital_current_to_closest_bits('IB_mRNA',50,1); % IB_mRNA
%     elseif(iter_GainTC == 6)
%         prog_vect(267:273, 1)=digital_current_to_closest_bits('IA_mRNA',25,1); % IA_mRNA
%         prog_vect(274:280, 1)=digital_current_to_closest_bits('IB_mRNA',12.5,1); % IB_mRNA
%     end
%        
%     DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
%     pause(10);

    tstart=tic; % setting the start point for elapsed time measurement
    
    % Read dynamics (19 points. every 60ms)
    for i=1:initSamples % Note!
        DNAChip_read_chip_hsdio(hsdio_lib,hsdio_acq_session,ADCpoints,readArrayPtr);
        out1 = sum(bitget(readArrayPtr.Value, 17)); % DIO 16
        out2 = sum(bitget(readArrayPtr.Value, 18)); % DIO 17
        out3 = sum(bitget(readArrayPtr.Value, 19)); % DIO 18
        out4 = sum(bitget(readArrayPtr.Value, 20)); % DIO 19
        out5 = sum(bitget(readArrayPtr.Value, 21)); % DIO 20
        out6 = sum(bitget(readArrayPtr.Value, 22)); % DIO 21
        out7 = sum(bitget(readArrayPtr.Value, 23)); % DIO 22
        out8 = sum(bitget(readArrayPtr.Value, 24)); % DIO 23
        disp(['[READ] TFtot: ' num2str(out1) ', TFbnd: ' num2str(out2) ', TFfree: ' num2str(out3)]);
        disp(['[READ] DNAbnd1: ' num2str(out4) ', DNAbnd2: ' num2str(out5) ', mRNA: ' num2str(out6)]);

        Imeas(i,1)=toc(tstart);
        Imeas(i,2)=out1; % TFtot
        Imeas(i,3)=out2; % TFbnd
        Imeas(i,4)=out3; % TFfree
        Imeas(i,5)=out4; % DNAbnd1
        Imeas(i,6)=out5; % DNAbnd2
        Imeas(i,7)=out6; % mRNA     
        Imeas(i,8)=out7; % 
        Imeas(i,9)=out8; %  
    end  
    
    for k=1:numPoints
        % Start by reading initial value before update
        DNAChip_read_chip_hsdio(hsdio_lib,hsdio_acq_session,ADCpoints,readArrayPtr);
        out1 = sum(bitget(readArrayPtr.Value, 17)); % DIO 16
        out2 = sum(bitget(readArrayPtr.Value, 18)); % DIO 17
        out3 = sum(bitget(readArrayPtr.Value, 19)); % DIO 18
        out4 = sum(bitget(readArrayPtr.Value, 20)); % DIO 19
        out5 = sum(bitget(readArrayPtr.Value, 21)); % DIO 20
        out6 = sum(bitget(readArrayPtr.Value, 22)); % DIO 21
        out7 = sum(bitget(readArrayPtr.Value, 23)); % DIO 22
        out8 = sum(bitget(readArrayPtr.Value, 24)); % DIO 23
        disp('[Initial values]');
        disp(['[READ] TFtot: ' num2str(out1) ', TFbnd: ' num2str(out2) ', TFfree: ' num2str(out3)]);
        disp(['[READ] DNAbnd1: ' num2str(out4) ', DNAbnd2: ' num2str(out5) ', mRNA: ' num2str(out6)]);

        Imeas(initSamples+1+numSamples*(k-1),1)=toc(tstart); % 1,21,41,... (+initSamples)
        Imeas(initSamples+1+numSamples*(k-1),2)=out1; % TFtot
        Imeas(initSamples+1+numSamples*(k-1),3)=out2; % TFbnd
        Imeas(initSamples+1+numSamples*(k-1),4)=out3; % TFfree
        Imeas(initSamples+1+numSamples*(k-1),5)=out4; % DNAbnd1
        Imeas(initSamples+1+numSamples*(k-1),6)=out5; % DNAbnd2
        Imeas(initSamples+1+numSamples*(k-1),7)=out6; % mRNA
        Imeas(initSamples+1+numSamples*(k-1),8)=out7; % 
        Imeas(initSamples+1+numSamples*(k-1),9)=out8; % 

        % Update value
        ItoBits=IStotSweep(k,:);

%         prog_vect(197:203, 1)=ItoBits; % change B<0>

    %     prog_vect(8:14, 1)=ItoBits; % change IStot1_A
    %     prog_vect(106:112, 1)=ItoBits; % change IStot1_B

    %     prog_vect(1:7, 1)=ItoBits; % change IEtot1_A

%         DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
%         disp(['B00 changed to ' num2str(bi2de(ItoBits(1:4))*2^(2*bi2de(ItoBits(5:7))))]) % Ideal Stot value

        % Read dynamics (19 points. every 60ms)
        for i=2:numSamples % Note!
            DNAChip_read_chip_hsdio(hsdio_lib,hsdio_acq_session,ADCpoints,readArrayPtr);
            out1 = sum(bitget(readArrayPtr.Value, 17)); % DIO 16
            out2 = sum(bitget(readArrayPtr.Value, 18)); % DIO 17
            out3 = sum(bitget(readArrayPtr.Value, 19)); % DIO 18
            out4 = sum(bitget(readArrayPtr.Value, 20)); % DIO 19
            out5 = sum(bitget(readArrayPtr.Value, 21)); % DIO 20
            out6 = sum(bitget(readArrayPtr.Value, 22)); % DIO 21
            out7 = sum(bitget(readArrayPtr.Value, 23)); % DIO 22
            out8 = sum(bitget(readArrayPtr.Value, 24)); % DIO 23
            disp(['[READ] TFtot: ' num2str(out1) ', TFbnd: ' num2str(out2) ', TFfree: ' num2str(out3)]);
            disp(['[READ] DNAbnd1: ' num2str(out4) ', DNAbnd2: ' num2str(out5) ', mRNA: ' num2str(out6)]);

            Imeas(initSamples+i+numSamples*(k-1),1)=toc(tstart);
            Imeas(initSamples+i+numSamples*(k-1),2)=out1; % TFtot
            Imeas(initSamples+i+numSamples*(k-1),3)=out2; % TFbnd
            Imeas(initSamples+i+numSamples*(k-1),4)=out3; % TFfree
            Imeas(initSamples+i+numSamples*(k-1),5)=out4; % DNAbnd1
            Imeas(initSamples+i+numSamples*(k-1),6)=out5; % DNAbnd2
            Imeas(initSamples+i+numSamples*(k-1),7)=out6; % mRNA      
            Imeas(initSamples+i+numSamples*(k-1),8)=out7; % 
            Imeas(initSamples+i+numSamples*(k-1),9)=out8; % 
        end

        figure(1);
        plot(Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,2),'o-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,3),'o-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,4),'o-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,5),'o-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,6),'o-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,7),'o-');
        hold on;
        xlabel('Time (s)');
        ylabel('ADCOUT');
        legend('TFtot','TFbnd','TFfree','DNAbnd1','DNAbnd2','mRNA','Location','Northwest') 
        % axis([0 17 0 500]);

    %     figure(2);
    %     plot(Imeas(1:numSamples*k,1),Imeas(1:numSamples*k,2)*ADCOUTtoCurrent(1),'o-',Imeas(1:numSamples*k,1),Imeas(1:numSamples*k,3)*ADCOUTtoCurrent(2),'o-',Imeas(1:numSamples*k,1),Imeas(1:numSamples*k,4)*ADCOUTtoCurrent(3),'o-',Imeas(1:numSamples*k,1),Imeas(1:numSamples*k,5)*ADCOUTtoCurrent(4),'o-',Imeas(1:numSamples*k,1),Imeas(1:numSamples*k,6)*ADCOUTtoCurrent(5),'o-',Imeas(1:numSamples*k,1),Imeas(1:numSamples*k,7)*ADCOUTtoCurrent(6),'o-');    
    %     xlabel('Time (s)');
    %     ylabel('Current (nA)');
    %     legend('TFtot','TFbnd','TFfree','DNAbnd1','DNAbnd2','mRNA','Location','Northwest') 

        figure(2);
        plot(Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,2)*ADCOUTtoCurrent(1),'.-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,3)*ADCOUTtoCurrent(2),'.-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,4)*ADCOUTtoCurrent(3),'.-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,5)*ADCOUTtoCurrent(4),'.-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,6)*ADCOUTtoCurrent(5),'.-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,7)*ADCOUTtoCurrent(6),'.-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,8)*ADCOUTtoCurrent(7),'--',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,9)*ADCOUTtoCurrent(8),'--');    
%         plot(Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,2)*ADCOUTtoCurrent(1),'.-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,3)*ADCOUTtoCurrent(2),'.-',Imeas(1:initSamples+numSamples*k,1),Imeas(1:initSamples+numSamples*k,4)*ADCOUTtoCurrent(3),'.-');    

        hold on;
        xlabel('Time (s)');
        ylabel('Current (nA)');
%         legend('Ctot0','Afree1','Afree2','Afree3','Afree4','Ctot4','Location','Northwest') 
%         legend('A(init)','A','B','C','D','E','F','G','Location','Northwest') 
        legend('A1','B','C','A2','test','Location','Northwest') 

        % pause(1);    
    end
    
    elapsedtime=toc(tstart); % read elapsed time
    disp(['This operation took ' num2str(elapsedtime) ' seconds to run.'])
    
%     iter_var = iter_GainTC;
    save(['Aug15_20151228_chip1_' num2str(iter_var) '.mat'],'Imeas');
end

end

function ItoBits=digital_current_to_closest_bits(inputname,ADCOUT,scalefactor)

ItoBits = zeros(1,7); % bits to store the value of current

current = ADCOUT * scalefactor; % order of nA
fprintf(['[log] ' inputname ': desired I = ' num2str(current,3) 'nA, ']);

Iref_10u = 20000/2; % based on measured value. maybe change to 22000?

% clamp to max (10uA) or min (Iref_10u/2^17 ~76.3pA) current
% min current should not be 0 to prevent slow DAC operation
if current > 10000
    fprintf('but I > 10uA! Clamped to 10uA. ');
    current = 10000;
elseif current < Iref_10u / 2^17
    fprintf([', but I < Imin! Clamped to Imin (' num2str(Iref_10u/2^17,3) 'nA). ']);
    current = Iref_10u / 2^17;
end

LSBcurrents = [Iref_10u/2^17 Iref_10u/2^15 Iref_10u/2^13 Iref_10u/2^11 Iref_10u/2^9 Iref_10u/2^7 Iref_10u/2^5 Iref_10u/2^3]; % define this as global to make the program faster?
% also Iref is not 20u but ~22u. Multiply above currents by 22/20 to increase accuracy?
boundary = LSBcurrents * 15.5;

for i = 1:8
    if current < boundary(i)
        ItoBits(5:7)=de2bi(i-1,3); % set range
        current = current / LSBcurrents(i); % less than LSBcurrents * 15.5
        ItoBits(1:4)= de2bi(round(current),4); % set value
        fprintf(['closest I = ' num2str(round(current)*LSBcurrents(i),3) 'nA\n']);
        break
    end
end

end