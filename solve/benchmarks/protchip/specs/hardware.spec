

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

  input Dprod
  input Ddeg
  input Dfree


  % rates and parameters
  input n
  input KDfw
  input KDrv
  input ratC
  input k1
  input k2

  % 2 copiers each
  output Afree
  output Bfree

  % 3 + copiers, 3 - copiers
  output Ctot
  output Ctot2
  output Ctot3
  output Ctotn1
  output Ctotn2

  output Dtot


  rel I(Afree) = I(Atot) - I(K)*I(Ctot)
  rel I(Bfree) = I(Atot) - I(K)*I(Ctot)
  rel I(rateFW) = I(Afree)*((I(Bfree)/I(KDfw0))^D(n))
  rel I(rateFWUp) = I(Cprod) - I(K)*I(rateFW)
  rel I(rateFWTot) = I(Cprod) + I(K)*I(rateFw)
  rel I(rateRV) = I(Cfree)*I(Dfree)/I(KDrv0)
  rel I(rateRVTot) = I(Cdeg) + I(ratC)*I(Cfree) + I(K)*I(rateRV)
  rel I(rateRVUp) = I(Cdeg) + I(ratC)*I(Cfree) - I(K)*I(rateRV)
  rel I(DfreeCopy) = I(Dfree)
  rel I(CfreeCopy) = I(Cfree)

  rel deriv(I(Ctot),t) = I(k1)*(I(Cprod + I(K)*I(rateFW) )) - I(k2)*(I(Cdeg) + I(Cfree)*I(ratC))
  % copiers
  rel I(Ctot2) = I(Ctot)
  rel I(Ctot3) = I(Ctot)
  rel I(Ctotn1) = -I(Ctot)
  rel I(Ctotn2) = -I(Ctot)

  rel I(Dtot) = I(Dprod)+I(Ddeg)
end


schematic
  inst emmblock : 20
  inst input(D) : 20
  inst input(I) : 160
  inst output(I) : 24

  conn input(I) -> emmblock.Atot
  conn input(I) -> emmblock.Btot
  conn input(I) -> emmblock.Dfree

  conn input(I) -> emmblock.KDfw
  conn input(I) -> emmblock.KDrv
  conn input(I) -> emmblock.ratC
  conn input(I) -> emmblock.k1
  conn input(I) -> emmblock.k2
  conn input(D) -> emmblock.n

end
