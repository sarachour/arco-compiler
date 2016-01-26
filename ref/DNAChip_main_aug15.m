function DNAChip_main_aug15

clear all;
close all;
clc;

ver='0.60, Oct 19, 2015'; % Program version and date
% 2/15/2013: modified 1-change input, added 6-display parameters
% 3/2013: replaced logic analyzer by NI PXI-6541 for acquisition
% 4/5/2013: replaced NI PXI-6733 by NI PXI-6541 for generation  
% 4/22/2013: added dynamic measurement
% 12/27/2013: modified for the 2nd chip (DNA_apr13)
% 4/7/2014: modified for the 3rd chip (DNA_nov13)
% ver0.5 10/27/2014: modified for the 4th chip (DNA_jun14)
% ver0.51 5/7/2015: added p53 simulation
% ver0.60 10/19/2015: modified for the 5th chip (DNA_aug15)

% Declare global variables
global SR_LENGTH
SR_LENGTH = 350; % length of programming shift register

[prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr,FPGA_lib,FPGA_xptr]=initialize(ver);

stringin='';

while ~strcmp(stringin,'q')
    disp(' ')
    disp('[Menu: 1-change input, 2-N/A, 3-input sweep&read, 4-change ADC output,')
    disp('       5-change ADC points, 6-display parameters, r-read output(HSDIO), t-change Itest setting')
    disp('       d-dynamic meas, f-feedback sim, s1-sim preset1, s2-sim preset2, pss-sel clkpss, q-exit]')
    stringin=input('<> ','s');

    if strcmp(stringin,'1')
        prog_vect=change_input(prog_vect,hsdio_lib,hsdio_gen_session);
        continue
    end
    
    if strcmp(stringin,'2') % previous read
        continue
    end
    
    if strcmp(stringin,'3') % previous general sweep
        continue
    end
    
    if strcmp(stringin,'4')
        set_connection_ADC(prog_vect,hsdio_lib,hsdio_gen_session)
        continue
    end
    
    if strcmp(stringin,'5')
        [ADCpoints,readArrayPtr]=change_ADCpoints(hsdio_lib,hsdio_acq_session,ADCpoints,readArrayPtr);
        continue
    end
    
    if strcmp(stringin,'6')
        display_params(prog_vect, ADCpoints);
        continue
    end
    
    if strcmp(stringin,'r')
        tic % setting the start point for elapsed time measurement
       
        DNAChip_read_chip_hsdio(hsdio_lib,hsdio_acq_session,ADCpoints,readArrayPtr);
        out1 = sum(bitget(readArrayPtr.Value, 17)); % DIO 16
        out2 = sum(bitget(readArrayPtr.Value, 18)); % DIO 17
        out3 = sum(bitget(readArrayPtr.Value, 19)); % DIO 18
        out4 = sum(bitget(readArrayPtr.Value, 20)); % DIO 19
        out5 = sum(bitget(readArrayPtr.Value, 21)); % DIO 20
        out6 = sum(bitget(readArrayPtr.Value, 22)); % DIO 21
        out7 = sum(bitget(readArrayPtr.Value, 23)); % DIO 22
        out8 = sum(bitget(readArrayPtr.Value, 24)); % DIO 23
        out9 = sum(bitget(readArrayPtr.Value, 25)); % DIO 24
        out10 = sum(bitget(readArrayPtr.Value, 26)); % DIO 25
        out11 = sum(bitget(readArrayPtr.Value, 27)); % DIO 26
        disp(['[READ] ADCOUT0: ' num2str(out1) ', ADCOUT1: ' num2str(out2) ', ADCOUT2: ' num2str(out3) ', ADCOUT3: ' num2str(out4) ', ADCOUT4: ' num2str(out5)]);
        disp(['[READ] ADCOUT5: ' num2str(out6) ', ADCOUT6: ' num2str(out7) ', ADCOUT7: ' num2str(out8) ', ADCOUT8: ' num2str(out9) ', ADCOUT9: ' num2str(out10)]);
        disp(['[READ] ADCOUT10: ' num2str(out11)]);
        
        elapsedtime=toc; % read elapsed time
        disp(['This operation took ' num2str(elapsedtime) ' seconds to run.'])  
        continue
    end
        
    if strcmp(stringin,'rr') % Read value from FPGA
        tic % setting the start point for elapsed time measurement

        % Trigger ADC read (10000 pts)
        epaddr = int32(hex2dec('40'));
        epbit = int32(hex2dec('04'));
        err = calllib(FPGA_lib, 'okFrontPanel_ActivateTriggerIn', FPGA_xptr, epaddr, epbit);
        
        readdone = 0;
        epaddr = int32(hex2dec('60'));
        epmask = uint32(hex2dec('01'));
        while(readdone == 0)
            calllib('okFrontPanel', 'okFrontPanel_UpdateTriggerOuts', FPGA_xptr);
            readdone = calllib(FPGA_lib, 'okFrontPanel_IsTriggered', FPGA_xptr, epaddr, epmask);
        end

        calllib(FPGA_lib, 'okFrontPanel_UpdateWireOuts', FPGA_xptr); % update wire values
        
        % Read wire values
        epaddr = int32(hex2dec('20'));
        readvalue1 = calllib(FPGA_lib, 'okFrontPanel_GetWireOutValue', FPGA_xptr, epaddr);
        epaddr = int32(hex2dec('21'));
        readvalue2 = calllib(FPGA_lib, 'okFrontPanel_GetWireOutValue', FPGA_xptr, epaddr);
        epaddr = int32(hex2dec('22'));
        readvalue3 = calllib(FPGA_lib, 'okFrontPanel_GetWireOutValue', FPGA_xptr, epaddr);
        
        disp(['[READ] count_reset: ' num2str(readvalue1) ', out0: ' num2str(readvalue2) ', out1: ' num2str(readvalue3)]);
        
        elapsedtime=toc; % read elapsed time
        disp(['This operation took ' num2str(elapsedtime) ' seconds to run.'])          
        continue
    end

    if strcmp(stringin,'ff') % read from FIFO in FPGA
        % reset FIFO for test
        % reset -> 1
        epaddr = int32(hex2dec('00'));
        epvalue = uint32(hex2dec('01'));
        epmask = uint32(hex2dec('01'));
        err = calllib('okFrontPanel', 'okFrontPanel_SetWireInValue', FPGA_xptr, epaddr, epvalue, epmask);
        calllib('okFrontPanel', 'okFrontPanel_UpdateWireIns', FPGA_xptr); % update
                
        % reset -> 0
        epaddr = int32(hex2dec('00'));
        epvalue = uint32(hex2dec('00'));
        epmask = uint32(hex2dec('01'));
        err = calllib('okFrontPanel', 'okFrontPanel_SetWireInValue', FPGA_xptr, epaddr, epvalue, epmask);
        calllib('okFrontPanel', 'okFrontPanel_UpdateWireIns', FPGA_xptr); % update

        for i=1:1
            % Trigger ADC read (10000 pts)
            epaddr = int32(hex2dec('40'));
            epbit = int32(hex2dec('05'));
            err = calllib(FPGA_lib, 'okFrontPanel_ActivateTriggerIn', FPGA_xptr, epaddr, epbit);

            readdone = 0;
            epaddr = int32(hex2dec('60'));
            epmask = uint32(hex2dec('01'));

%             while(readdone == 0)
%                 calllib('okFrontPanel', 'okFrontPanel_UpdateTriggerOuts', FPGA_xptr);
%                 readdone = calllib('okFrontPanel', 'okFrontPanel_IsTriggered', FPGA_xptr, epaddr, epmask);
%             end
            
            pause(3);

            calllib(FPGA_lib, 'okFrontPanel_UpdateWireOuts', FPGA_xptr); % update wire values

            % Read wire values
            epaddr = int32(hex2dec('20'));
            readvalue1 = calllib(FPGA_lib, 'okFrontPanel_GetWireOutValue', FPGA_xptr, epaddr);
            epaddr = int32(hex2dec('21'));
            readvalue2 = calllib(FPGA_lib, 'okFrontPanel_GetWireOutValue', FPGA_xptr, epaddr);
            epaddr = int32(hex2dec('22'));
            readvalue3 = calllib(FPGA_lib, 'okFrontPanel_GetWireOutValue', FPGA_xptr, epaddr);

            disp(['[READ] count_reset: ' num2str(readvalue1) ', out0: ' num2str(readvalue2) ', out1: ' num2str(readvalue3)]);
        end     
        
        
        tic % setting the start point for elapsed time measurement
        
        bsize = 2048; % should be multiple of 16. Also, 1 element in FIFO is 32 bit - corresponding to 2 data points)
        buf(bsize,1) = uint8(0);
        pv2 = libpointer('uint8Ptr', buf);
        readarray = zeros(bsize/2,3);
        
        for k=0:2
            % read from FIFO
            epaddr = int32(hex2dec('a0')+k);
            calllib('okFrontPanel', 'okFrontPanel_ReadFromPipeOut', FPGA_xptr, epaddr, bsize, pv2);
    %         epvalue2 = get(pv2, 'value')
    %         disp(pv2.value)
          
            for i=1:bsize/4
               readarray(2*i-1,k+1) = int32(pv2.value(4*i,1))*256 + int32(pv2.value(4*i-1,1));
               readarray(2*i,k+1) = int32(pv2.value(4*i-2,1))*256 + int32(pv2.value(4*i-3,1));
            end

    %         disp(readarray);
        end

        figure(5);
        maketime = 0.002:0.002:2;
        plot(maketime, readarray(1:1000,1),'.-',maketime, readarray(1:1000,2),'.-',maketime, readarray(1:1000,3),'.-');
        
        elapsedtime=toc; % read elapsed time
        disp(['This operation took ' num2str(elapsedtime) ' seconds to run.'])          
        continue
    end    
    



    if strcmp(stringin,'t') % previous dynamic simulation
        set_connection_Itest(prog_vect,hsdio_lib,hsdio_gen_session);        
        continue
    end
    
    if strcmp(stringin,'d') % dynamic simulation
        prog_vect=Simulation_dynamic_aug15(prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr);
        continue
    end

    if strcmp(stringin,'auto') % dynamic simulation of autorepressor
        prog_vect=Simulation_dynamic_autorepressor_nov13(prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr);
        continue
    end
    
    if strcmp(stringin,'rep') % dynamic simulation of repressilator
        prog_vect=Simulation_dynamic_repressilator_aug15(prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr);
        continue
    end

    if strcmp(stringin,'repf') % dynamic simulation of repressilator
        prog_vect=Simulation_dynamic_repressilator_jun14_readwFPGA(prog_vect,hsdio_lib,hsdio_gen_session,FPGA_lib,FPGA_xptr);
        continue
    end
    
    if strcmp(stringin,'ffn') % dynamic simulation of feedforward network (Collins' group)
        prog_vect=Simulation_feedforward_collins_jun14(prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr);
        continue
    end

    if strcmp(stringin,'do') % dynamic simulation of feedforward network (Collins' group)
        prog_vect=Simulation_delay_induced_osc_jun14(prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr);
        continue
    end

    if strcmp(stringin,'p53') % dynamic simulation of feedforward network (Collins' group)
        prog_vect=Simulation_p53_jun14(prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr);
        continue
    end
    
    if strcmp(stringin,'f') % previous Ramez's pos fb model simulation
        continue
    end

    if strcmp(stringin,'s1') % simulation preset for ITD circuit and hill simulation
        prog_vect=Simulation_ITD_Hill_aug15(prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr);
        continue
    end

    if strcmp(stringin,'s2') % simulation preset for multiple analogic DAC configs
        prog_vect=Simulation_analogic_DAC_nov13(prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr);
        continue
    end
    
    if strcmp(stringin,'DACtest')
        prog_vect=DACtest_DCsweep_Keithley2400_jun14(prog_vect,hsdio_lib,hsdio_gen_session);
        continue
    end

    if strcmp(stringin,'ADCtest')
        prog_vect=ADCtest_DCsweep_Keithley2400_jun14(prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr);
        continue
    end
    
    if strcmp(stringin,'pss')
        prog_vect=select_clkpss(prog_vect,hsdio_lib,hsdio_gen_session);
        continue
    end    
    
    if ~strcmp(stringin,'q')
        disp('Unknown command!');
    end
    
end

errCode = calllib(hsdio_lib,'niHSDIO_close',hsdio_gen_session); % close generation session
errCode = calllib(hsdio_lib,'niHSDIO_close',hsdio_acq_session); % close acquisition session
calllib(FPGA_lib, 'okFrontPanel_Destruct', FPGA_xptr); % finish using XEM6310
disp('Bye!')

end

function [prog_vect,ADCpoints,hsdio_lib,hsdio_gen_session,hsdio_acq_session,readArrayPtr,FPGA_lib,FPGA_xptr]=initialize(ver)

if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end

disp('--------------------------------------')
disp('DNA Chip Simulator')
disp(['version ' ver])
disp('--------------------------------------')
disp('Initialize...')

global SR_LENGTH

vdd=3.3; % chip supply voltage. was 1.8 for 1st, 2nd ver chips.
ADCpoints = 10000; % number of points to use for each A/D conversion
readArrayPtr = libpointer('voidPtr',[uint32(blanks(ADCpoints)) 0]);

[hsdio_lib,hsdio_gen_session,hsdio_acq_session]=DNAChip_init_hsdio(ADCpoints,vdd); % initialize NI PXI-6541 50MHz Digital I/O
[FPGA_lib,FPGA_xptr]=DNAChip_init_FPGA; % initialize Opal Kelly XEM6310-LX45 (Xilinx Spartan-6 FPGA)

prog_vect=zeros(SR_LENGTH,4); % programming bits for data

% Set initial bits
% Programming bits for DNA Structure
for k = 1:4
    % Block 1
    prog_vect(1:7, k)=[0 1 0 1 0 1 0]; % IAtot = 12n
    prog_vect(8:14, k)=[0 1 0 1 0 1 0]; % IBtot = 12n
    prog_vect(15:21, k)=[0 1 0 1 0 1 0]; % IKDfw = 12n
    prog_vect(22:28, k)=[0 1 0 1 0 1 0]; % Ikr1 = 12n
    prog_vect(29:35, k)=[0 1 0 1 0 1 0]; % Ikr2 = 12n
    prog_vect(36:42, k)=[0 0 0 0 0 0 0]; % IDfree = 0
    prog_vect(43:49, k)=[0 1 0 1 0 1 0]; % IKDrv = 12n
    prog_vect(50:56, k)=[0 0 0 0 0 0 0]; % IratC = 0
    
    % Block 2
    prog_vect(57:63, k)=[0 1 0 1 0 1 0]; % IAtot = 12n
    prog_vect(64:70, k)=[0 1 0 1 0 1 0]; % IBtot = 12n
    prog_vect(71:77, k)=[0 1 0 1 0 1 0]; % IKDfw = 12n
    prog_vect(78:84, k)=[0 1 0 1 0 1 0]; % Ikr1 = 12n
    prog_vect(85:91, k)=[0 1 0 1 0 1 0]; % Ikr2 = 12n
    prog_vect(92:98, k)=[0 0 0 0 0 0 0]; % IDfree = 0
    prog_vect(99:105, k)=[0 1 0 1 0 1 0]; % IKDrv = 12n
    prog_vect(106:112, k)=[0 0 0 0 0 0 0]; % IratC = 0       

    % Block 3
    prog_vect(113:119, k)=[0 1 0 1 0 1 0]; % IAtot = 12n
    prog_vect(120:126, k)=[0 1 0 1 0 1 0]; % IBtot = 12n
    prog_vect(127:133, k)=[0 1 0 1 0 1 0]; % IKDfw = 12n
    prog_vect(134:140, k)=[0 1 0 1 0 1 0]; % Ikr1 = 12n
    prog_vect(141:147, k)=[0 1 0 1 0 1 0]; % Ikr2 = 12n
    prog_vect(148:154, k)=[0 0 0 0 0 0 0]; % IDfree = 0
    prog_vect(155:161, k)=[0 1 0 1 0 1 0]; % IKDrv = 12n
    prog_vect(162:168, k)=[0 0 0 0 0 0 0]; % IratC = 0    
 
    % Block 4
    prog_vect(169:175, k)=[0 1 0 1 0 1 0]; % IAtot = 12n
    prog_vect(176:182, k)=[0 1 0 1 0 1 0]; % IBtot = 12n
    prog_vect(183:189, k)=[0 1 0 1 0 1 0]; % IKDfw = 12n
    prog_vect(190:196, k)=[0 1 0 1 0 1 0]; % Ikr1 = 12n
    prog_vect(197:203, k)=[0 1 0 1 0 1 0]; % Ikr2 = 12n
    prog_vect(204:210, k)=[0 0 0 0 0 0 0]; % IDfree = 0
    prog_vect(211:217, k)=[0 1 0 1 0 1 0]; % IKDrv = 12n
    prog_vect(218:224, k)=[0 0 0 0 0 0 0]; % IratC = 0    

    % Block 5
    prog_vect(225:231, k)=[0 1 0 1 0 1 0]; % IAtot = 12n
    prog_vect(232:238, k)=[0 1 0 1 0 1 0]; % IBtot = 12n
    prog_vect(239:245, k)=[0 1 0 1 0 1 0]; % IKDfw = 12n
    prog_vect(246:252, k)=[0 1 0 1 0 1 0]; % Ikr1 = 12n
    prog_vect(253:259, k)=[0 1 0 1 0 1 0]; % Ikr2 = 12n
    prog_vect(260:266, k)=[0 0 0 0 0 0 0]; % IDfree = 0
    prog_vect(267:273, k)=[0 1 0 1 0 1 0]; % IKDrv = 12n
    prog_vect(274:280, k)=[0 0 0 0 0 0 0]; % IratC = 0       

    prog_vect(281:287, k)=[0 1 0 1 0 1 0]; % One = 12n

    % Block 1
    prog_vect(288:291, k)=[1 1 1 1]; % hill_b<0:3> (1111: hill 1 ~ 0000: hill 4)
    prog_vect(292:293, k)=[1 1]; % A_FB_EN, B_FB_EN
    prog_vect(294:296, k)=[0 0 1]; % sel_useI, sel_Ctot, sel_rate
    % Block 2
    prog_vect(297:300, k)=[1 1 1 1]; % hill_b<0:3> (1111: hill 1 ~ 0000: hill 4)
    prog_vect(301:302, k)=[1 1]; % A_FB_EN, B_FB_EN
    prog_vect(303:305, k)=[0 0 1]; % sel_useI, sel_Ctot, sel_rate
    % Block 3
    prog_vect(306:309, k)=[1 1 1 1]; % hill_b<0:3> (1111: hill 1 ~ 0000: hill 4)
    prog_vect(310:311, k)=[1 1]; % A_FB_EN, B_FB_EN
    prog_vect(312:314, k)=[0 0 1]; % sel_useI, sel_Ctot, sel_rate
    % Block 4
    prog_vect(315:318, k)=[1 1 1 1]; % hill_b<0:3> (1111: hill 1 ~ 0000: hill 4)
    prog_vect(319:320, k)=[1 1]; % A_FB_EN, B_FB_EN
    prog_vect(321:323, k)=[0 0 1]; % sel_useI, sel_Ctot, sel_rate
    % Block 5
    prog_vect(324:327, k)=[1 1 1 1]; % hill_b<0:3> (1111: hill 1 ~ 0000: hill 4)
    prog_vect(328:329, k)=[1 1]; % A_FB_EN, B_FB_EN
    prog_vect(330:332, k)=[0 0 1]; % sel_useI, sel_Ctot, sel_rate

    prog_vect(333, k)=0; % JW_bits0<0>, JW_bits2<0> = SRAM programming enable, JW_bits1<0> = ADC reset, JW_bits3<0> = not used

    prog_vect(334, 1)=0; % JW_bits0<1> = sel_clkpass4<0>
    prog_vect(334, 2)=0; % JW_bits1<1> = sel_clkpass4<1>
    prog_vect(334, 3)=0; % JW_bits2<1> = sel_ngout_off
    prog_vect(334, 4)=0; % JW_bits3<1> = sel_ngout

    prog_vect(335, k)=0; % JW_bits<2> = sel_cco_cl_a (each)
    prog_vect(336, k)=1; % JW_bits<3> = RS_VCO_a (each)
    prog_vect(337, k)=0; % JW_bits<4> = sel_divc3_a (each)
    prog_vect(338, k)=0; % JW_bits<5> = sel_divc4_a (each)
    prog_vect(339, k)=0; % JW_bits<6> = sel_divc1_a (each)
    prog_vect(340, k)=0; % JW_bits<7> = sel_divc2_a (each)
    prog_vect(341, k)=0; % JW_bits<8> = sel_divc6_a (each)
    prog_vect(342, k)=0; % JW_bits<9> = sel_divc5_a (each)
    prog_vect(343, k)=1; % JW_bits<10> = sel_afn_a (each)
    prog_vect(344, k)=0; % JW_bits<11> = sel_divc0 (each)
    prog_vect(345, k)=0; % JW_bits<12> = sel_updn_a (each)
    prog_vect(346, k)=0; % JW_bits<13> = sel_fhl_a (each)
    prog_vect(347, k)=0; % JW_bits<14> = sel_fll_a (each)
    prog_vect(348, k)=0; % JW_bits<15> = cpout_init_a (each)
    prog_vect(349, k)=0; % JW_bits<16> = sel_ngen0 (each)
    prog_vect(350, k)=0; % JW_bits<17> = sel_ngen1 (each)    
end

display_params(prog_vect, ADCpoints);
DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
DNAChip_reset_sram_aug15(prog_vect,hsdio_lib,hsdio_gen_session);

% sram_data = ones(64,12);
% DNAChip_program_chip_FPGA(FPGA_lib,FPGA_xptr,prog_vect);
% DNAChip_program_chip_FPGA_sram(FPGA_lib,FPGA_xptr,sram_data);

disp('Initialize complete')

end

function prog_vect=change_input(prog_vect,hsdio_lib,hsdio_gen_session)

fprintf(['What to change? (Block 1: 1.IAtot 2.IBtot 3.IKDfw 4.Ikr1 5.Ikr2 6.IDfree 7.IKDrv 8.IratC \n' ...
         '                 Block 2: 9.IAtot 10.IBtot 11.IKDfw 12.Ikr1 13.Ikr2 14.IDfree 15.IKDrv 16.IratC \n' ...
         '                 Block 3: 17.IAtot 18.IBtot 19.IKDfw 20.Ikr1 21.Ikr2 22.IDfree 23.IKDrv 24.IratC \n' ...
         '                 Block 4: 25.IAtot 26.IBtot 27.IKDfw 28.Ikr1 29.Ikr2 30.IDfree 31.IKDrv 32.IratC \n' ...
         '                 Block 5: 33.IAtot 34.IBtot 35.IKDfw 36.Ikr1 37.Ikr2 38.IDfree 39.IKDrv 40.IratC \n' ...
         '                 41.IOne)\n']);
sel=input('<> ');

inputarray = {'Block 1:IAtot';'Block 1:IBtot';'Block 1:IKDfw';'Block 1:Ikr1';'Block 1:Ikr2';'Block 1:IDfree';'Block 1:IKDrv';'Block 1:IratC';...
             'Block 2:IAtot';'Block 2:IBtot';'Block 2:IKDfw';'Block 2:Ikr1';'Block 2:Ikr2';'Block 2:IDfree';'Block 2:IKDrv';'Block 2:IratC';...
             'Block 3:IAtot';'Block 3:IBtot';'Block 3:IKDfw';'Block 3:Ikr1';'Block 3:Ikr2';'Block 3:IDfree';'Block 3:IKDrv';'Block 3:IratC';...
             'Block 4:IAtot';'Block 4:IBtot';'Block 4:IKDfw';'Block 4:Ikr1';'Block 4:Ikr2';'Block 4:IDfree';'Block 4:IKDrv';'Block 4:IratC';...
             'Block 5:IAtot';'Block 5:IBtot';'Block 5:IKDfw';'Block 5:Ikr1';'Block 5:Ikr2';'Block 5:IDfree';'Block 5:IKDrv';'Block 5:IratC';...
             'IOne'};

if sel >= 1 && sel <= 41
    inputname = char(inputarray(sel));
else
    disp('Invalid value!');
    return;
end

fprintf(['Select range of ' inputname ': 1. 76.3pA-1.14nA / 2. 305pA-4.58nA / 3. 1.22nA-18.3nA / 4. 4.88nA-73.2nA\n' ...
                                      '5. 19.5nA-293nA / 6. 78.1nA-1.17uA / 7. 313nA-4.69uA / 8. 1.25uA-18.8uA\n']);
range=input('<> ');
LSBcurrents = [10000/2^17 10000/2^15 10000/2^13 10000/2^11 10000/2^9 10000/2^7 10000/2^5 10000/2^3];

if range >= 1 && range <= 8
    inputname = char(inputarray(sel));
    fprintf('Select current: ');
    for i = 1:15
        weightedCurrent = LSBcurrents(range) * i;
        fprintf([num2str(i) ')']);
        if weightedCurrent < 1 % smaller than 1nA
            fprintf([num2str(weightedCurrent*10^3,3) 'p ']);
        elseif weightedCurrent < 1000 % smaller than 1uA
            fprintf([num2str(weightedCurrent,3) 'n ']);
        else
            fprintf([num2str(weightedCurrent/10^3,3) 'u ']);
        end
    end
else
    disp('Invalid value!');
    return;
end

current=input('\n<> ');

if current >= 0 && current <= 15
    ItoBits=convert_current_to_bits(range,current);
else
    disp('Invalid value!');
    return;
end

for k = 1:4
    prog_vect((sel-1)*7+1:(sel-1)*7+7, k)=ItoBits;
end

DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
disp([inputname ' changed'])

end

function ItoBits=convert_current_to_bits(range,current)

ItoBits = zeros(1,7); % bits to store the value of current

ItoBits(1:4)=de2bi(current,4);
ItoBits(5:7)=de2bi(range-1,3);

end

function [ADCpoints,readArrayPtr]=change_ADCpoints(hsdio_lib,hsdio_acq_session,ADCpoints,readArrayPtr)

disp(['Current number of points averaging: ' num2str(ADCpoints)]);
points=input('Type number of ADC points to average (1 to 1000000) [1000]: ');

if isempty(points)
    points=1000;
else
    points=round(points);
end

if (points<1) || (points>1000000)
    disp('Invalid value!');
    return;
else
    ADCpoints=points;
end

% Configure the number of samples to acquire to device
SAMPLES_TO_READ = int32(ADCpoints);
numberOfRecords = int32(1);
errCode = calllib(hsdio_lib,'niHSDIO_ConfigureAcquisitionSize',hsdio_acq_session,SAMPLES_TO_READ,numberOfRecords);

% Change the size of the read array
readArrayPtr = libpointer('voidPtr',[uint32(blanks(ADCpoints)) 0]);

disp(['Now averaging ' num2str(ADCpoints) ' points.'])

end

function [ADCpoints,readArrayPtr]=change_ADCpointsNoPrompt(hsdio_lib,hsdio_acq_session,ADCpoints,readArrayPtr)

points=ADCpoints;

if isempty(points)
    points=1000;
else
    points=round(points);
end

if (points<1) || (points>1000000)
    disp('Invalid value!');
    return;
else
    ADCpoints=points;
end

% Configure the number of samples to acquire to device
SAMPLES_TO_READ = int32(ADCpoints);
numberOfRecords = int32(1);
errCode = calllib(hsdio_lib,'niHSDIO_ConfigureAcquisitionSize',hsdio_acq_session,SAMPLES_TO_READ,numberOfRecords);

% Change the size of the read array
readArrayPtr = libpointer('voidPtr',[uint32(blanks(ADCpoints)) 0]);

disp(['Now averaging ' num2str(ADCpoints) ' points.'])

end

function set_connection_ADC(prog_vect,hsdio_lib,hsdio_gen_session) % old!!!

prog_vect(320, 1)=1; % JW_bits0<1> - enable sram programming mode
DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
disp('Entering programming mode'); 

DNAnum=input('Select DNA number [0-3]: ');

if DNAnum >= 0 && DNAnum <= 3
    add = zeros(1,6);
    add(1,5:6) = de2bi(DNAnum,2);
else
    disp('Invalid value!');
    return;
end

fprintf(['Which variable? (1.TFtot_A 2.TFfree_A 3.TFbnd_A 4.DNAbnd1_A 5.DNAbnd2_A \n' ...
         '6.TFtot_B 7.TFfree_B 8.TFbnd_B 9.DNAbnd1_B 10.DNAbnd2_B 11.mRNA \n']);
sel=input('<> ');

inputarray = {'TFtot_A';'TFfree_A';'TFbnd_A';'DNAbnd1_A';'DNAbnd2_A';...
             'TFtot_B';'TFfree_B';'TFbnd_B';'DNAbnd1_B';'DNAbnd2_B';'mRNA'};

loc_vect = [de2bi(1,4); de2bi(2,4); de2bi(3,4); de2bi(4,4); de2bi(5,4);...
            de2bi(9,4); de2bi(10,4); de2bi(11,4); de2bi(12,4); de2bi(13,4); de2bi(14,4)];

if sel >= 1 && sel <= 11
    inputname = char(inputarray(sel));
    add(1,1:4) = loc_vect(sel,:);
else
    disp('Invalid value!');
    return;
end
       
ADCnum=input('Select ADC number [0-11] (12-nowhere): ');

if ADCnum >= 0 && ADCnum <= 11
    in = ones(1,12);
    in(1,ADCnum+1) = 0;
elseif ADCnum == 12
    in = ones(1,12);
else
    disp('Invalid value!');
    return;
end

fprintf(['* ' inputname ' of DNA #' num2str(DNAnum) ' is now sent to ADC #' num2str(ADCnum) '\n']);

prog_vect_sram = make_sram_vector(add,in);
DNAChip_program_chip_hsdio_sram(hsdio_lib,hsdio_gen_session,prog_vect_sram);

prog_vect(320, 1)=0; % JW_bits0<1> - disable sram programming mode
DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
disp('Quitting from programming mode');

end

function set_connection_Itest(prog_vect,hsdio_lib,hsdio_gen_session) % old!!

fprintf(['Select testing variable: 1.One_test<0> 2.One_test<1> 3.One_test<2> 4.One_test<3> \n' ...
         '5.Itest_20u 6.Itest_1n 7.Itest_ADC \n']);
sel=input('<> ');

add = [1 1 1 1 1 0];

if sel == 1
    in = [0 1 1 1 1 1 1 0 1 1 1 1]; 
elseif sel == 2
    in = [1 0 1 1 1 1 1 0 1 1 1 1]; 
elseif sel == 3
    in = [1 1 0 1 1 1 1 0 1 1 1 1]; 
elseif sel == 4
    in = [1 1 1 0 1 1 1 0 1 1 1 1]; 
elseif sel == 5
    in = [1 1 1 1 1 1 0 1 1 1 1 1]; 
elseif sel == 6
    in = [1 1 1 1 1 0 1 1 1 1 1 1];    
elseif sel == 7
    in = [1 1 1 1 0 1 1 1 1 1 1 1];
else
    disp('Invalid value!');
    return;
end

prog_vect(320, 1)=1; % JW_bits0<1> - enable sram programming mode
DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
disp('Entering programming mode'); 

prog_vect_sram = make_sram_vector(add,in);
DNAChip_program_chip_hsdio_sram(hsdio_lib,hsdio_gen_session,prog_vect_sram);

prog_vect(320, 1)=0; % JW_bits0<1> - disable sram programming mode
DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
disp('Quitting from programming mode');

if sel == 7
    add = [1 1 1 1 1 1];
    ADCnum=input('Select ADC number [0-11] (12-nowhere): ');
    if ADCnum >= 0 && ADCnum <= 11
        in = ones(1,12);
        in(1,ADCnum+1) = 0;
    elseif ADCNum == 12
        in = ones(1,12);
    else
        disp('Invalid value!');
        return;
    end
end

prog_vect(320, 1)=1; % JW_bits0<1> - enable sram programming mode
DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
disp('Entering programming mode'); 

prog_vect_sram = make_sram_vector(add,in);
DNAChip_program_chip_hsdio_sram(hsdio_lib,hsdio_gen_session,prog_vect_sram);

prog_vect(320, 1)=0; % JW_bits0<1> - disable sram programming mode
DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
disp('Quitting from programming mode');

end

function prog_vect=select_clkpss(prog_vect,hsdio_lib,hsdio_gen_session)

sel=input('Select clkpss # [0-3]: ');

if sel == 0
    prog_vect(334, 1)=0; % JW_bits0<1> = sel_clkpass4<0>
    prog_vect(334, 2)=0; % JW_bits1<1> = sel_clkpass4<1>
elseif sel == 1
    prog_vect(334, 1)=1; % JW_bits0<1> = sel_clkpass4<0>
    prog_vect(334, 2)=0; % JW_bits1<1> = sel_clkpass4<1>
elseif sel == 2
    prog_vect(334, 1)=0; % JW_bits0<1> = sel_clkpass4<0>
    prog_vect(334, 2)=1; % JW_bits1<1> = sel_clkpass4<1>
elseif sel == 3
    prog_vect(334, 1)=1; % JW_bits0<1> = sel_clkpass4<0>
    prog_vect(334, 2)=1; % JW_bits1<1> = sel_clkpass4<1>
else
    disp('Invalid value!');
    return;
end

DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
disp(['Now sending clkpss<' num2str(sel) '> to clkpss pin'])

end

function prog_vect_sram = make_sram_vector(add,in) % old!!
    % add<5:0> -> Q<9,7,6,4,2,0>
    % in<11:0> -> Q<30,28,27,25,23,21,20,18,16,14,13,11>
   
    prog_vect_sram = zeros(1,31);
    
    prog_vect_sram(1,1) = add(1);
    prog_vect_sram(1,3) = add(2);
    prog_vect_sram(1,5) = add(3);
    prog_vect_sram(1,7) = add(4);
    prog_vect_sram(1,8) = add(5);
    prog_vect_sram(1,10) = add(6);
    prog_vect_sram(1,12) = in(1);
    prog_vect_sram(1,14) = in(2);
    prog_vect_sram(1,15) = in(3);
    prog_vect_sram(1,17) = in(4);
    prog_vect_sram(1,19) = in(5);
    prog_vect_sram(1,21) = in(6);
    prog_vect_sram(1,22) = in(7);
    prog_vect_sram(1,24) = in(8);
    prog_vect_sram(1,26) = in(9);
    prog_vect_sram(1,28) = in(10);
    prog_vect_sram(1,29) = in(11);
    prog_vect_sram(1,31) = in(12);
end

function display_params(prog_vect, ADCpoints)

disp('Displaying current parameters:')
fprintf(['@ Block 1: IAtot = ' num2str(convert_bits_to_current(prog_vect(1:7, 1)),3) 'nA, ' ...
        'IBtot = ' num2str(convert_bits_to_current(prog_vect(8:14, 1)),3) 'nA, ' ...
        'IKDfw = ' num2str(convert_bits_to_current(prog_vect(15:21, 1)),3) 'nA, ' ...
        'Ikr1 = ' num2str(convert_bits_to_current(prog_vect(22:28, 1)),3) 'nA, ' ...
        'Ikr2 = ' num2str(convert_bits_to_current(prog_vect(29:35, 1)),3) 'nA, ' ...
        'IDfree= ' num2str(convert_bits_to_current(prog_vect(36:42, 1)),3) 'nA, ' ...
        'IKDrv = ' num2str(convert_bits_to_current(prog_vect(43:49, 1)),3) 'nA, ' ...
        'IratC = ' num2str(convert_bits_to_current(prog_vect(50:56, 1)),3) 'nA\n' ...
        '  Block 2: IAtot = ' num2str(convert_bits_to_current(prog_vect(57:63, 1)),3) 'nA, ' ...
        'IBtot = ' num2str(convert_bits_to_current(prog_vect(64:70, 1)),3) 'nA, ' ...
        'IKDfw = ' num2str(convert_bits_to_current(prog_vect(71:77, 1)),3) 'nA, ' ...
        'Ikr1 = ' num2str(convert_bits_to_current(prog_vect(78:84, 1)),3) 'nA, ' ...
        'Ikr2 = ' num2str(convert_bits_to_current(prog_vect(85:91, 1)),3) 'nA, ' ...
        'IDfree = ' num2str(convert_bits_to_current(prog_vect(92:98, 1)),3) 'nA, ' ...
        'IKDrv = ' num2str(convert_bits_to_current(prog_vect(99:105, 1)),3) 'nA, ' ...
        'IratC = ' num2str(convert_bits_to_current(prog_vect(106:112, 1)),3) 'nA\n' ...
        '  Block 3: IAtot = ' num2str(convert_bits_to_current(prog_vect(113:119, 1)),3) 'nA, ' ...
        'IBtot = ' num2str(convert_bits_to_current(prog_vect(120:126, 1)),3) 'nA, ' ...
        'IKDfw = ' num2str(convert_bits_to_current(prog_vect(127:133, 1)),3) 'nA, ' ...
        'Ikr1 = ' num2str(convert_bits_to_current(prog_vect(134:140, 1)),3) 'nA, ' ...
        'Ikr2 = ' num2str(convert_bits_to_current(prog_vect(141:147, 1)),3) 'nA, ' ...
        'IDfree = ' num2str(convert_bits_to_current(prog_vect(148:154, 1)),3) 'nA, ' ...
        'IKDrv = ' num2str(convert_bits_to_current(prog_vect(155:161, 1)),3) 'nA, ' ...
        'IratC = ' num2str(convert_bits_to_current(prog_vect(162:168, 1)),3) 'nA\n' ...
        '  Block 4: IAtot = ' num2str(convert_bits_to_current(prog_vect(169:175, 1)),3) 'nA, ' ...
        'IBtot = ' num2str(convert_bits_to_current(prog_vect(176:182, 1)),3) 'nA, ' ...
        'IKDfw = ' num2str(convert_bits_to_current(prog_vect(183:189, 1)),3) 'nA, ' ...
        'Ikr1 = ' num2str(convert_bits_to_current(prog_vect(190:196, 1)),3) 'nA, ' ...
        'Ikr2 = ' num2str(convert_bits_to_current(prog_vect(197:203, 1)),3) 'nA, ' ...
        'IDfree = ' num2str(convert_bits_to_current(prog_vect(204:210, 1)),3) 'nA, ' ...
        'IKDrv = ' num2str(convert_bits_to_current(prog_vect(211:217, 1)),3) 'nA, ' ...
        'IratC = ' num2str(convert_bits_to_current(prog_vect(218:224, 1)),3) 'nA\n' ...
        '  Block 5: IAtot = ' num2str(convert_bits_to_current(prog_vect(225:231, 1)),3) 'nA, ' ...
        'IBtot = ' num2str(convert_bits_to_current(prog_vect(232:238, 1)),3) 'nA, ' ...
        'IKDfw = ' num2str(convert_bits_to_current(prog_vect(239:245, 1)),3) 'nA, ' ...
        'Ikr1 = ' num2str(convert_bits_to_current(prog_vect(246:252, 1)),3) 'nA, ' ...
        'Ikr2 = ' num2str(convert_bits_to_current(prog_vect(253:259, 1)),3) 'nA, ' ...
        'IDfree = ' num2str(convert_bits_to_current(prog_vect(260:266, 1)),3) 'nA, ' ...
        'IKDrv = ' num2str(convert_bits_to_current(prog_vect(267:273, 1)),3) 'nA, ' ...
        'IratC = ' num2str(convert_bits_to_current(prog_vect(274:280, 1)),3) 'nA\n' ...
        '  IOne = ' num2str(convert_bits_to_current(prog_vect(281:287, 1)),3) 'nA\n']);
    
disp(' ')

disp(['@ Number of ADC outputs averaged: ' num2str(ADCpoints)])

end

function BitstoI=convert_bits_to_current(bits)

bits = transpose(bits); %%% important!! convert to a single row for bi2de
BitstoI = bi2de(bits(1:4));
power = bi2de(bits(5:7));

LSBcurrents = [10/2^17 10/2^15 10/2^13 10/2^11 10/2^9 10/2^7 10/2^5 10/2^3];

BitstoI = BitstoI * LSBcurrents(power+1) * 1000;

end