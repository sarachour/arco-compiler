
type s
type ms
type us

type A
type mA
type uA
type nA
type pA

type bits

%let 1 s = 1000 ms
%let 1 ms = 1000 us

%let 1 A = 1000 mA
%let 1 mA = 1000 uA
%let 1 uA = 1000 nA
%let 1 nA = 1000 pA

prop I : mA, nA, A
prop D : bits

time t: us

digital input I
  input X {D:bits}
  output O {I:nA}
  def I(O) mag = [0,1] nA
  
  sim iin X O
  rel I(O) = D(X)
end

digital output I
  input X {I:nA}
  def I(X) mag = [0,1] nA
  
  output O {D:bits}
  rel D(O) = I(X)
  sim iout X O
end

% p53 in simulink
comp emb

  % inputs
  input Atot {I:nA}
  input Btot {I:nA}

  input Cfree {I:nA}
  input Cprod {I:nA}
  input Cdeg {I:nA}
  input Ctotin {I:nA}

  input Dfree {I:nA}


  def I(Atot) mag = [0,1] nA
  def I(Btot) mag = [0,1] nA
  def I(Cfree) mag = [0,1] nA
  def I(Cprod) mag = [0,1] nA
  def I(Cdeg) mag = [0,1] nA
  def I(Ctotin) mag = [0,1] nA
  def I(Dfree) mag = [0,1] nA
  
% rates and parameters
  input Ctot_0 {I:nA}
  def I(Ctot_0) mag = [0,1] nA
  

  param n : ? = {1,1.5,2,0}
  input KDfw {I:nA}
  input KDrv {I:nA}
  input ratC {I:nA}
  input kr1 {I:nA}
  input kr2 {I:nA}

  def I(KDfw) mag = [0.00001,0.1] nA
  def I(KDrv) mag = [0.00001,0.1] nA
  def I(ratC) mag = [0,0.1] nA
  def I(kr1) mag = [0,0.1] nA
  def I(kr2) mag = [0,0.1] nA

  % 2 copiers each
  output Afree {I:nA}
  % output Afree1 {I:nA}
  output Bfree {I:nA}
  % output Bfree1 {I:nA}

  % 3 + copiers, 3 - copiers
  output Ctot {I:nA}
  %output Ctot2 {I:nA}
  %output Ctot3 {I:nA}
  %output Ctotn1 {I:nA}
  %output Ctotn2 {I:nA}

  output rateFW {I:nA}
  output rateFWUp {I:nA}
  output rateFWTot {I:nA}

  output rateRV {I:nA}
  output rateRVTot {I:nA}
  output rateRVUp {I:nA}

  %output DfreeCopy {I:nA}
  %output CfreeCopy {I:nA}

  param A_SW : ? = {0,1}
  param B_SW : ? = {0,1}
  param FF_SW1 : ? = {0,1}
  param FF_SW2 : ? = {0,1}
  param FF_SW3 : ? = {0,1}
  param FF_SW4 : ? = {0,1}


  rel I(Afree) = I(Atot) - A_SW*I(Ctot)
  rel I(Bfree) = I(Btot) - B_SW*I(Ctot)
  rel I(rateFW) = I(Afree)*((I(Bfree)/I(KDfw))^n)

  rel I(rateFWUp) = I(Cprod) - FF_SW1*I(rateFW)
  rel I(rateFWTot) = I(Cprod) + FF_SW2*I(rateFW)
  rel I(rateRV) = I(Cfree)*(I(Dfree)/I(KDrv))
  rel I(rateRVTot) = I(Cdeg) + I(ratC)*I(Cfree) + FF_SW3*I(rateRV)
  rel I(rateRVUp) = I(Cdeg) + (I(ratC)*I(Cfree) - FF_SW4*I(rateRV))

  %rel I(DfreeCopy) = I(Dfree)
  %rel I(CfreeCopy) = I(Cfree)

  rel ddt I(Ctot) = I(kr1)*(I(Cprod) + \
	FF_SW3*( \ 
		(  I(Atot) - A_SW*I(Ctot) )*(( \
		( I(Btot) - B_SW*I(Ctot) ) \ 
		/I(KDfw))^n) \
	)) - \
	I(kr2)*(I(Cdeg) + \
	I(Cfree)*I(ratC)) \
	init I(Ctot_0)

  def I(Ctot) mag = [0,1] nA
  

  % copiers
  %rel I(Ctot2) = I(Ctot)
  %rel I(Ctot3) = I(Ctot)
  %rel I(Ctotn1) = -I(Ctot)
  %rel I(Ctotn2) = -I(Ctot)

  %rel I(Afree1) = I(Afree)
  %rel I(Bfree1) = I(Bfree)

end

comp addi
  input A {I:nA}
  input B {I:nA}
  input C {I:nA}
  output O {I:nA}
  
  def I(A) mag = [0,10] nA
  def I(B) mag = [0,10] nA
  def I(C) mag = [0,10] nA


  rel I(O) = I(A) + I(B) + I(C)

end

comp gnd
  output O {I:nA}

  rel I(O) = 0
end

schematic
  inst emb : 20
  inst gnd: 1
  inst addi: 50

  % 1-160 are normal, 160-180 are for ics
  inst input I : 180
  inst output I : 24

  conn gnd -> emb
  conn gnd -> addi

  conn input(I)[160:180] -> emb.Atot
  conn input(I)[160:180] -> emb.Btot
  conn input(I)[160:180] -> emb.Dfree


  conn input(I)[1:160] -> emb.Ctot_0
  conn input(I)[1:160] -> emb.KDfw
  conn input(I)[1:160]  -> emb.KDrv
  conn input(I)[1:160]  -> emb.ratC
  conn input(I)[1:160]  -> emb.kr1
  conn input(I)[1:160]  -> emb.kr2

  conn emb.Ctot -> addi
  conn addi -> output(I)
  conn emb.Ctot -> output(I)

  conn addi.O -> emb.Cfree
  conn addi.O -> emb.Cprod
  conn addi.O -> emb.Cdeg
  conn addi.O -> emb.Ctot_in


end
