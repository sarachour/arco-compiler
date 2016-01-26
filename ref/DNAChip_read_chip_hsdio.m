function DNAChip_read_chip_hsdio(Lib,hsdio_acq_session,ADCpoints,patternReadU32)

% Initiate acquisition to device
errCode = calllib(Lib,'niHSDIO_Initiate',hsdio_acq_session);

% Wait for acquisition to complete
timeout2 = int32(10000); % milliseconds
errCode = calllib(Lib,'niHSDIO_WaitUntilDone',hsdio_acq_session,timeout2);

% Read Waveform data from device
SAMPLES_TO_READ = int32(ADCpoints);
numSamplesRead = libpointer('int32Ptr',0);
[errCode,ptr1,ptr2] = calllib(Lib,'niHSDIO_FetchWaveformU32',hsdio_acq_session,SAMPLES_TO_READ,timeout2,numSamplesRead,patternReadU32);

% % Read Waveform data from device (includes initiate, wait, and fetch)
% timeout2 = int32(10000); % milliseconds
% SAMPLES_TO_READ = int32(ADCpoints);
% numSamplesRead = libpointer('int32Ptr',0);
% [errCode,ptr1,ptr2] = calllib(Lib,'niHSDIO_ReadWaveformU32',hsdio_acq_session,SAMPLES_TO_READ,timeout2,numSamplesRead,patternReadU32);
