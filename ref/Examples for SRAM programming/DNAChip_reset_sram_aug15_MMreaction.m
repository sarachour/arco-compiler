function DNAChip_reset_sram_aug15(prog_vect,hsdio_lib,hsdio_gen_session)

tstart=tic; % setting the start point for elapsed time measurement

in_all = ones(1024,100);

%%%%%%%%% Change connection here %%%%%%%%%
% Group Selection: among group 0~3
% Block Selection: among block 0~4
% Variable selection: among variables 0~27, 31 (see below)
% 0-IAtot, 1-IBtot, 2-ICfree, 3-IDfree, 4-ICprod, 5-ICdeg, 6-ICtot_in,
% 7-ICtot_copyN1, 8-ICtot_copyN2, 9-ICtot_copyP1, 10-ICtot_copyP2, 11-ICtot_copyP3,
% 12-IAfree_copy1, 13-IAfree_copy2, 14-IBfree_copy1, 15-IBfree_copy2,
% 16-Irate_fw, 17-Irate_rv, 18-Irate_fw_tot, 19-Irate_rv_tot, 20-Irate_fw_up1, 21-Irate_fw_up2, 22-Irate_rv_up1, 23-Irate_rv_up2,
% 24-ICfree_copy, 25-IDfree_copy, 26-IOne, 27-rate_toNoise, 31-ADC_in/Itest1/Itest2
% Wire Selection: among SRAM wire 0~99
% ADC switch open: wireSel = 76~99 (ADC_IN<0~23>)

%%% MM reaction test (E+S<->ES->E+P)
% ICtot_copyP1 -> IBtot (S init condition)
in_all = connect_SRAM(in_all,0,0,9,0); % groupSel, blockSel, variableSel, wireSel
in_all = connect_SRAM(in_all,0,1,1,0); % groupSel, blockSel, variableSel, wireSel
% IAfree_copy1 -> ICfree
in_all = connect_SRAM(in_all,0,2,12,1); % groupSel, blockSel, variableSel, wireSel
in_all = connect_SRAM(in_all,0,1,2,1); % groupSel, blockSel, variableSel, wireSel
% ICtot_copyP2 -> IAtot
in_all = connect_SRAM(in_all,0,1,10,2); % groupSel, blockSel, variableSel, wireSel
in_all = connect_SRAM(in_all,0,2,0,2); % groupSel, blockSel, variableSel, wireSel
% ICtot_copyP1 -> IAtot
in_all = connect_SRAM(in_all,0,2,9,3); % groupSel, blockSel, variableSel, wireSel
in_all = connect_SRAM(in_all,0,1,0,3); % groupSel, blockSel, variableSel, wireSel

%%% deg
% Irate_rv_up1 -> ICdeg
% in_all = connect_SRAM(in_all,0,4,22,9); % groupSel, blockSel, variableSel, wireSel
% in_all = connect_SRAM(in_all,0,3,5,9); % groupSel, blockSel, variableSel, wireSel
% in_all = connect_SRAM(in_all,0,3,22,10); % groupSel, blockSel, variableSel, wireSel
% in_all = connect_SRAM(in_all,0,2,5,10); % groupSel, blockSel, variableSel, wireSel
% in_all = connect_SRAM(in_all,0,2,22,11); % groupSel, blockSel, variableSel, wireSel
% in_all = connect_SRAM(in_all,0,1,5,11); % groupSel, blockSel, variableSel, wireSel
% in_all = connect_SRAM(in_all,0,1,22,12); % groupSel, blockSel, variableSel, wireSel
% in_all = connect_SRAM(in_all,0,0,5,12); % groupSel, blockSel, variableSel, wireSel

% % connect ICtot_copyP2 to SRAM wire 76
% in_all = connect_SRAM(in_all,0,0,10,76); % groupSel, blockSel, variableSel, wireSel
% % connect IAfree_copy1 to SRAM wire 77
% in_all = connect_SRAM(in_all,0,1,12,77); % groupSel, blockSel, variableSel, wireSel
% connect IBfree_copy1 to SRAM wire 78
in_all = connect_SRAM(in_all,0,1,14,76); % groupSel, blockSel, variableSel, wireSel
% % connect ICtot_copyP3 to SRAM wire 79
% in_all = connect_SRAM(in_all,0,1,11,79); % groupSel, blockSel, variableSel, wireSel
% connect IAfree_copy2 to SRAM wire 80
in_all = connect_SRAM(in_all,0,2,13,77); % groupSel, blockSel, variableSel, wireSel
% connect ICtot_copyP2 to SRAM wire 81
in_all = connect_SRAM(in_all,0,2,10,78); % groupSel, blockSel, variableSel, wireSel
% % connect IAfree_copy2 to SRAM wire 82
% in_all = connect_SRAM(in_all,1,1,13,82); % groupSel, blockSel, variableSel, wireSel
% % connect ICtot_copyP2 to SRAM wire 83
% in_all = connect_SRAM(in_all,1,1,10,83); % groupSel, blockSel, variableSel, wireSel

% use ADC 0~7
for i=76:83
in_all = connect_SRAM(in_all,0,0,31,i); % groupSel, blockSel, variableSel, wireSel
end

% % connect IAtot to SRAM wire 0
% in_all = connect_SRAM(in_all,0,0,0,1); % groupSel, blockSel, variableSel, wireSel
% 
% % connect SRAM wire 0 to Itest1
% in_all = connect_SRAM(in_all,1,0,31,1); % groupSel, blockSel, variableSel, wireSel
% 
% % connect SRAM wire 1 to Itest2
% in_all = connect_SRAM(in_all,3,0,31,0); % groupSel, blockSel, variableSel, wireSel

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Resetting connection SRAM...')
pause(1);

prog_vect(333, 1)=1; % JW_bits0<0> - enable sram programming mode
prog_vect(333, 3)=1; % JW_bits2<0> - enable sram programming mode
DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
disp('Entering programming mode'); 

for k=0:1023
    add = de2bi(k,10);
    prog_vect_sram = make_sram_vector_aug15(add,in_all(k+1,:));
    DNAChip_program_chip_hsdio_sram_aug15(hsdio_lib,hsdio_gen_session,prog_vect_sram);
end

prog_vect(333, 1)=0; % JW_bits0<0> - disable sram programming mode
prog_vect(333, 3)=0; % JW_bits2<0> - disable sram programming mode
DNAChip_program_chip_hsdio(hsdio_lib,hsdio_gen_session,prog_vect);
disp('Quitting from programming mode');

disp('SRAM Resetting Done');

elapsedtime=toc(tstart); % read elapsed time
disp(['SRAM reset took ' num2str(elapsedtime) ' seconds to run.'])

end

function in_all=connect_SRAM(in_all,groupSel,blockSel,variableSel,wireSel)
    
add = [de2bi(variableSel,5) de2bi(blockSel,3) de2bi(groupSel,2)];
in_all(bi2de(add)+1,wireSel+1) = 0;   

end