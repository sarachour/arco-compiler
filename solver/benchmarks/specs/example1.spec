
type us
type mA
type mV

prop I : mA
prop V : mV
time t: us


digital input I
  input X
  output O where I:mA
  spice iin X O
end

digital input V
  input X
  output O where I:mA
  spice iin X O

end
digital output I
  input X where I:mA
  output O
  spice iout X O
end

digital output V
  input X where I:mA
  output O
  spice iout X O
end

comp iadd
  input X where I:mA
  input Y where I:mA
  output Z where I:mA

  rel I(Z) = I(X)+I(Y)
  spice iadd X Y Z
end

comp mm
  input Xtot where V:mA
  input Ytot where V:mA
  input kf where I:mA
  input kr where I:mA
  input XY0 where V:mA

  output XY where V:mA
  output X where V:mA
  output Y where V:mA

  rel V(X) = V(Xtot) - V(XY)
  rel V(Y) = V(Ytot) - V(XY)
  rel deriv(V(XY),t) = I(kf)*V(X)*V(Y) - I(kr)*V(XY) initially V(XY0)

  spice mm Xtot Ytot kf kr XY X Y XY0
end


schematic
  inst mm : 2
  inst iadd : 4
  inst input I : 5
  inst output I : 3
  inst input V : 5
  inst output V : 3

  conn input(I) -> *
  conn input(V) -> *

  conn * -> output(I)
  conn * -> output(V)
  conn iadd -> mm

  ensure mag I in (0,1000) : mA
  ensure mag V in (0,5000) : mV

end
