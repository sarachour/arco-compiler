

type us
type mA
type mV
type bits

prop I : mA
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

% p53 in simulink
comp emmblock

  % inputs
  input Atot

  input Cfree
  input Cprod
  input Cdeg
  input Ctotin

  input Dfree


  % rates and parameters
  input n
  input KDfw
  input KDrv
  input ratC
  input kr1
  input kr2

  % 2 copiers each
  output Afree
  output Afree1
  output Bfree
  output Bfree1

  % 3 + copiers, 3 - copiers
  output Ctot
  output Ctot2
  output Ctot3
  output Ctotn1
  output Ctotn2


  input A_SW
  input B_SW
  input FF_SW1
  input FF_SW2
  input FF_SW3
  input FF_SW4


  rel I(Afree) = I(Atot) - D(A_SW)*I(Ctot)
  rel I(Bfree) = I(Atot) - D(B_SW)*I(Ctot)
  rel I(rateFW) = I(Afree)*((I(Bfree)/I(KDfw0))^D(n))
  rel I(rateFWUp) = I(Cprod) - D(FF_SW1)*I(rateFW)
  rel I(rateFWTot) = I(Cprod) + D(FF_SW2)*I(rateFw)
  rel I(rateRV) = I(Cfree)*I(Dfree)/I(KDrv0)
  rel I(rateRVTot) = I(Cdeg) + I(ratC)*I(Cfree) + D(FF_SW3)*I(rateRV)
  rel I(rateRVUp) = I(Cdeg) + I(ratC)*I(Cfree) - D(FF_SW4)*I(rateRV)
  rel I(DfreeCopy) = I(Dfree)
  rel I(CfreeCopy) = I(Cfree)

  rel deriv(I(Ctot),t) = I(kr1)*(I(Cprod + C_FF_EN*I(rateFW) )) - I(kr2)*(I(Cdeg) + I(Cfree)*I(ratC))
  % copiers
  rel I(Ctot2) = I(Ctot)
  rel I(Ctot3) = I(Ctot)
  rel I(Ctotn1) = -I(Ctot)
  rel I(Ctotn2) = -I(Ctot)

  rel I(Afree1) = I(Afree)
  rel I(Bfree1) = I(Bfree)

end


comp digiswitch
  output O
  output O2
  rel D(O) = 0
  rel D(O2) = 1
end

comp addi
  input A
  input B
  input C
  output O

  rel I(O) = I(A) + I(B) + I(C)

end

schematic
  inst emmblock : 20
  inst digiswitch : 1
  inst input(D) : 20
  inst input(I) : 160
  inst output(I) : 24

  conn digiswitch -> emmblock.A_SW
  conn digiswitch -> emmblock.B_SW
  conn digiswitch -> emmblock.FF_SW1
  conn digiswitch -> emmblock.FF_SW2
  conn digiswitch -> emmblock.FF_SW3
  conn digiswitch -> emmblock.FF_SW4

  conn input(I) -> emmblock.Atot
  conn input(I) -> emmblock.Btot
  conn input(I) -> emmblock.Dfree

  conn input(I) -> emmblock.KDfw
  conn input(I) -> emmblock.KDrv
  conn input(I) -> emmblock.ratC
  conn input(I) -> emmblock.k1
  conn input(I) -> emmblock.k2
  conn input(D) -> emmblock.n

  conn emmblock.Ctot -> addi

  conn addi.O -> emmblock.Cfree
  conn addi.O -> emmblock.Cprod
  conn addi.O -> emmblock.Cdeg
  conn addi.O -> emmblock.Ctot_in

  conn addi.O -> output(I)

end
