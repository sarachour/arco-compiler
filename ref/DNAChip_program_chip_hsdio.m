function DNAChip_program_chip_hsdio(Lib,hsdio_gen_session,bits)

% DIO 0: Prog_in0
% DIO 1: Prog_in1
% DIO 2: Prog_in2
% DIO 3: Prog_in3
% DIO 4: CLK_Prog
% DIO 5: CLK_ProgDone
% DIO 6: en_b

num_bits = length(bits); % length=number of rows
val = zeros(2*num_bits+4,7); % extra 4 bits are for CLK_ProgDone
val(:,7) = 1;

% note that the order becomes reverse!! (added by Sung Sik 12/12/2012)
for i=1:num_bits
    val(2*i-1:2*i,1) = bits(num_bits+1-i,1); % DIO 0
    val(2*i-1:2*i,2) = bits(num_bits+1-i,2); % DIO 1
    val(2*i-1:2*i,3) = bits(num_bits+1-i,3); % DIO 2
    val(2*i-1:2*i,4) = bits(num_bits+1-i,4); % DIO 3
    val(2*i-1:2*i,5) = [0,1]; % DIO 4
end

% Wait for two cycles and generate CLK_ProgDone
val(2*num_bits+3,6) = 1; % DIO 5

myData = uint32(bi2de(val));

% Write waveform to device
waveformName = libpointer('voidPtr',[int8('myWfm') 0]);
samplesToWrite = int32(length(myData)); % Note! # of samples=2*num_bits+4
[errCode,waveformName_out,myData_out] = calllib(Lib,'niHSDIO_WriteNamedWaveformU32',hsdio_gen_session,waveformName,samplesToWrite,myData);

% Initiate generation
errCode = calllib(Lib,'niHSDIO_Initiate',hsdio_gen_session);

% Wait for generation to complete
timeout = int32(10000); % milliseconds
errCode = calllib(Lib,'niHSDIO_WaitUntilDone',hsdio_gen_session,timeout);

% Frees a named waveform space in onboard memory
[errCode,ptr1] = calllib(Lib,'niHSDIO_DeleteNamedWaveform',hsdio_gen_session,waveformName);

disp('Chip programming complete (using HSDIO)')
