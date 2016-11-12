
type s
type ms
type us

type A
type mA
type uA
type nA
type pA

type bits

let 1 s = 1000 ms
let 1 ms = 1000 us

let 1 A = 1000 mA
let 1 mA = 1000 uA
let 1 uA = 1000 nA
let 1 nA = 1000 pA

prop I : mA, nA, A
prop D : bits

time t: us

digital input D
  input X where D:bits
  output O where D:bits
  spice iin X O
  rel D(O) = D(X)
end


digital input I
  input X where D:bits
  output O where I:nA
  spice iin X O
  rel I(O) = D(X)
end

digital output I
  input X where I:nA
  output O where D:bits
  rel D(O) = I(X)
  spice iout X O
end

% p53 in simulink
comp emb

  % inputs
  input Atot where I:nA
  input Btot where I:nA

  input Cfree where I:nA
  input Cprod where I:nA
  input Cdeg where I:nA
  input Ctotin where I:nA

  input Dfree where I:nA


  % rates and parameters
  input Ctot_0 where I:nA

  input n where D:bits
  input KDfw where I:nA
  input KDrv where I:nA
  input ratC where I:nA
  input kr1 where I:nA
  input kr2 where I:nA

  % 2 copiers each
  output Afree where I:nA
  output Afree1 where I:nA
  output Bfree where I:nA
  output Bfree1 where I:nA

  % 3 + copiers, 3 - copiers
  output Ctot where I:nA
  output Ctot2 where I:nA
  output Ctot3 where I:nA
  output Ctotn1 where I:nA
  output Ctotn2 where I:nA

  output rateFW where I:nA
  output rateFWUp where I:nA
  output rateFWTot where I:nA

  output rateRV where I:nA
  output rateRVTot where I:nA
  output rateRVUp where I:nA

  output DfreeCopy where I:nA
  output CfreeCopy where I:nA

  input A_SW where D:bits
  input B_SW where D:bits
  input FF_SW1 where D:bits
  input FF_SW2 where D:bits
  input FF_SW3 where D:bits
  input FF_SW4 where D:bits


  rel I(Afree) = I(Atot) - D(A_SW)*I(Ctot)
  rel I(Bfree) = I(Btot) - D(B_SW)*I(Ctot)
  rel I(rateFW) = I(Afree)*((I(Bfree)/I(KDfw))^D(n))

  rel I(rateFWUp) = I(Cprod) - D(FF_SW1)*I(rateFW)
  rel I(rateFWTot) = I(Cprod) + D(FF_SW2)*I(rateFW)
  rel I(rateRV) = I(Cfree)*(I(Dfree)/I(KDrv))
  rel I(rateRVTot) = I(Cdeg) + I(ratC)*I(Cfree) + D(FF_SW3)*I(rateRV)
  rel I(rateRVUp) = I(Cdeg) + (I(ratC)*I(Cfree) - D(FF_SW4)*I(rateRV))

  %rel I(DfreeCopy) = I(Dfree)
  %rel I(CfreeCopy) = I(Cfree)

  rel deriv(I(Ctot),t) = I(kr1)*(I(Cprod) + \
	D(FF_SW3)*( \ 
		(  I(Atot) - D(A_SW)*I(Ctot) )*(( \
		( I(Btot) - D(B_SW)*I(Ctot) ) \ 
		/I(KDfw))^D(n)) \
	)) - \
	I(kr2)*(I(Cdeg) + \
	I(Cfree)*I(ratC)) \
	initially I(Ctot_0)


  % copiers
  %rel I(Ctot2) = I(Ctot)
  %rel I(Ctot3) = I(Ctot)
  %rel I(Ctotn1) = -I(Ctot)
  %rel I(Ctotn2) = -I(Ctot)

  %rel I(Afree1) = I(Afree)
  %rel I(Bfree1) = I(Bfree)

end


comp digiswitch
  output O where D:bits
  output O2 where D:bits
  rel D(O) = 0
  rel D(O2) = 1
end

comp addi
  input A where I:nA
  input B where I:nA
  input C where I:nA
  output O where I:nA

  rel I(O) = I(A) + I(B) + I(C)

end

comp gnd
  output O where I:nA

  rel I(O) = 0
end

schematic
  inst emb : 20
  inst digiswitch : 1
  inst input D : 20
  inst gnd: 1
  inst addi: 50

  % 1-160 are normal, 160-180 are for ics
  inst input I : 180
  inst output I : 24

  conn gnd -> emb
  conn gnd -> addi

  conn digiswitch -> emb.A_SW
  conn digiswitch -> emb.B_SW
  conn digiswitch -> emb.FF_SW1
  conn digiswitch -> emb.FF_SW2
  conn digiswitch -> emb.FF_SW3
  conn digiswitch -> emb.FF_SW4

  conn input(I)[160:180] -> emb.Atot
  conn input(I)[160:180] -> emb.Btot
  conn input(I)[160:180] -> emb.Dfree


  conn input(I)[1:160] -> emb.Ctot_0
  conn input(I)[1:160] -> emb.KDfw
  conn input(I)[1:160]  -> emb.KDrv
  conn input(I)[1:160]  -> emb.ratC
  conn input(I)[1:160]  -> emb.kr1
  conn input(I)[1:160]  -> emb.kr2
  conn input(D) -> emb.n

  conn emb.Ctot -> addi
  conn addi -> output(I)
  conn emb.Ctot -> output(I)

  conn addi.O -> emb.Cfree
  conn addi.O -> emb.Cprod
  conn addi.O -> emb.Cdeg
  conn addi.O -> emb.Ctot_in


end
