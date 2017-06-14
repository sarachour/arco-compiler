
type s
type ms
type us

type uA
type uF 

type bits

%let 1 s = 1000 ms
%let 1 ms = 1000 us

%let 1 uA = 1000 nA

prop I : uA
prop C : uF
prop D : bits

time t: us

digital input I
  input X {D:bits}
  output O {I:nA}
  def D(X) mag = [0,10] bits

  rel I(O) = D(X)
  def I(O) mag = [0,10] uA
end

digital output I
  input X {I:nA}
  def I(X) mag = [0,10] uA
  output O {D:bits}

  rel D(O) = I(X)
  def D(O) mag = [0,10] bits

end

% p53 in simulink
comp emb

  % inputs
  input Atot {I:uA}
  input Btot {I:uA}
  
  input Cfree {I:uA}
  input Cprod {I:uA}
  input Cdeg {I:uA}
  input Ctotin {I:uA}

  input Dfree {I:uA}


    
  input Ctot_0 {I:uA}
  def I(Ctot_0) mag = [0.0001,10] uA

  def I(Atot) mag = [0.0001,10] uA
  def I(Btot) mag = [0.0001,10] uA
  def I(Cprod) mag = [0.0001,10] uA
  def I(Cfree) mag = [0.0001,10] uA
  def I(Dfree) mag = [0.0001,10] uA
  def I(Cdeg) mag = [0.0001,10] uA
  def I(Ctotin) mag = [0.0001,10] uA


  %param n : ? = {1,1.414,1.732,2,2.236,2.449,2.6453,2.8284,3,3.162,3.31662,3.4641,3.6055,3.7416,3.873,4}
  param n : ? = {1,2}
  input KDfw {I:uA}
  input KDrv {I:uA}
  input ratC {I:uA}
  input kr1 {I:uA}
  input kr2 {I:uA}

  def I(KDfw) mag = [0.0001,10] uA
  def I(KDrv) mag = [0.0001,10] uA
  def I(ratC) mag = [0.0001,10] uA
  def I(kr1) mag = [0.0001,10] uA
  def I(kr2) mag = [0.0001,10] uA

  % 2 copiers each
  output Afree {I:uA}
  output Afree1 {I:uA}
  output Bfree {I:uA}
  output Bfree1 {I:uA}

  % 3 + copiers, 3 - copiers
  output Ctot {I:uA}
  output Ctot2 {I:uA}
  output Ctot3 {I:uA}
  output Ctotn1 {I:uA}
  output Ctotn2 {I:uA}

  output rateFW {I:uA}
  output rateFWUp {I:uA}
  output rateFWTot {I:uA}

  output rateRV {I:uA}
  output rateRVTot {I:uA}
  output rateRVUp {I:uA}

  output Dfree2 {I:uA}
  output Cfree2 {I:uA}

  %param A_SW : ? = {0,1}
  %param B_SW : ? = {0,1}
  %param FF_SW1 : ? = {0,1}
  %param FF_SW2 : ? = {0,1}
  %param FF_SW3 : ? = {0,1}
  %param FF_SW4 : ? = {0,1}
  param A_SW : ? = {1}
  param B_SW : ? = {0}
  param FF_SW1 : ? = {0}
  param FF_SW2 : ? = {0}
  param FF_SW3 : ? = {1}
  param FF_SW4 : ? = {0}


  %must be between these two for stability
  %def magcstr = (I(Atot)/I(KDfw) + I(Btot)/I(KDfw) + 1)*(kr1/C) < 400
  %def magcstr = (I(Atot)/I(KDfw) + I(Btot)/I(KDfw) + 1)*(kr2/C) < 400
  %true reverse rate: kr1 = I(kr1)/(C*phi_T)

  rel I(Afree) = I(Atot) - A_SW*I(Ctot)
  rel I(Bfree) = I(Btot) - B_SW*I(Ctot)
  def I(Afree) mag = [0.0001,10] uA 
  def I(Bfree) mag = [0.0001,10] uA 
  
  rel I(rateFW) = I(Afree)*((I(Bfree)/I(KDfw))^n)

  rel I(rateFWUp) = I(Cprod) - FF_SW1*I(rateFW)
  rel I(rateFWTot) = I(Cprod) + FF_SW2*I(rateFW)
  rel I(rateRV) = I(Cfree)*(I(Dfree)/I(KDrv))
  rel I(rateRVTot) = I(Cdeg) + I(ratC)*I(Cfree) + FF_SW3*I(rateRV)
  rel I(rateRVUp) = I(Cdeg) + (I(ratC)*I(Cfree) - FF_SW4*I(rateRV))
  
  rel I(Dfree2) = I(Dfree) + 0
  def I(Dfree2) mag = [0.0001,10] uA

  rel I(Cfree2) = I(Cfree) + 0
  def I(Cfree2) mag = [0.0001,10] uA

  rel ddt I(Ctot) = I(kr1)*(I(Cprod) + \
    	FF_SW3*( I(Afree)*(( I(Bfree) /I(KDfw))^n)) \ 
      ) - I(kr2)*( \
        I(Cdeg) + \
    	  I(Cfree)*I(ratC)) \
    	init I(Ctot_0)

  def I(Ctot) mag = [0.0001,10] uA

  
  rel I(Ctot2) = I(Ctot) + 0
  rel I(Ctot3) = I(Ctot) + 0
  rel I(Ctotn1) = 0 - I(Ctot)
  rel I(Ctotn2) = 0 - I(Ctot)

  
  rel I(Afree1) = I(Afree)

  rel I(Bfree1) = I(Bfree)

  

  
end



comp addi
  input A {I:nA}
  input B {I:nA}
  input C {I:nA}
  output O {I:nA}
  
  def I(A) mag = [0,10] uA
  def I(B) mag = [0,10] uA
  def I(C) mag = [0,10] uA


  rel I(O) = I(A) + I(B) + I(C)

end

comp gnd
  output O {I:nA}
  def I(O) mag = [-1000,1000] uA
  
  rel I(O) = 0
  def I(O) mag = [0,0] uA
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
