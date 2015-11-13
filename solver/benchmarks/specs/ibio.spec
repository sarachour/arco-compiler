
type us
type mA


prop I : mA

time t: us


digital input I
  input X
  output O where I:mA
  spice iin X O

end

digital output I
  input X where I:mA
  output O

  spice iout X O
end

comp copy I
  input X where I:mA
  output Y where I:mA

  spice icopy X Y
end

comp mm

  input Xtot where I:mA
  input Ytot where I:mA
  input kf where I:mA
  input kr where I:mA
  input XY0 where I:mA

  output XY where I:mA
  output X where I:mA
  output Y where I:mA

  rel I(X) = I(Xtot) - I(XY)
  rel I(Y) = I(Ytot) - I(XY)
  rel deriv(I(XY),t) = I(kf)*I(X)*I(Y) - I(kr)*I(XY) initially I(XY0)

  spice mm Xtot Ytot kf kr XY X Y XY0

end



schematic
  inst mm : 1

  inst input I : 10
  inst output I : 3

  conn mm -> *
  conn * -> mm

  conn input(I).O -> *
  conn * -> output(I).X

  ensure mag I in (0,1000) : mA

end
