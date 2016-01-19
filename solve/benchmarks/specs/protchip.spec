

type us
type mA
type mV
type bits

prop I : mA
prop V : mV
prop D : bits

time t: us


digital input I
  input X where D:bits
  output O where I:mA
  spice iin X O
  rel I(O) = D(X)
end

digital output I
  input X where I:mA
  output O where D:bits
  rel D(O) = I(X)
  spice iout X O
end

/*p53 in simulink*/
comp emmblock

end

/*
*** Protein chip
20 emmblocks per chip
40 DACs / 5 blocks (160 total)
24 ADCs
max 100 connections (output->input, output -> adc)
(for gene chip, refer to the paper)

Currents can also be created by DAC
-> Atot, Btot, Dfree (input ports of the block) (may be connected to DAC)
-> KDfw, KDrv, kr1, kr2, ratC (only connected to DAC)
Cfree, Cprod, Cdeg, Ctot_in only come from other blocks

A paramter programmed by digital bits
-> hill coefficient (n)
-> can be programmed between sqrt(1~16)

Switches

# of copies for output variables
-> Ctot: 5 (3 positive and 2 negative)
-> Afree, Bfree, rate_fw_up, rate_rv_up: 2

range of parameters/variables
-> 100pA ~ 10uA
-> for accuracy, better to use 1nA ~ 1uA
-> C: 100pF ~ 1uF

kf:
kr: I(kr)/C*phi_t (1/s)
ex) kr=100nA, C=100nF, phi_t=25.9mV -> 40 (1/s)

** criteria for stability (this limits max speeup)
-> (Atot/KDfw + Btot/KDfw + 1)(kr/C) < 4*(min(Afree,Bfree)/Cpar)
-> Dfree/KDrv is assumed 1, Cpar ~ 1pF
-> min(Afree,Bfree) depends on actually simulation, but minimium of it 100pA.
-> Atot/KDfw, Btot/KDfw is typically less than 10 in biology



*/
