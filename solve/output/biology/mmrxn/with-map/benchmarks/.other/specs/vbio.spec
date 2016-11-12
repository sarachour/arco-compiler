

type us
type mV


prop V : mV

time t: us


digital input V
  input X
  output O where V:mV
  spice iin X O

end

digital output V
  input X where V:mV
  output O

  spice iout X O
end

comp copy V
  input X where V:mV
  output Y where V:mV

  spice icopy X Y
end

comp mm

  input Xtot where V:mV
  input Ytot where V:mV
  input kf where V:mV
  input kr where V:mV
  input XY0 where V:mV

  output XY where V:mV
  output X where V:mV
  output Y where V:mV

  rel V(X) = V(Xtot) - V(XY)
  rel V(Y) = V(Ytot) - V(XY)
  rel deriv(V(XY),t) = V(kf)*V(X)*V(Y) - V(kr)*V(XY) initially V(XY0)

  spice mm Xtot Ytot kf kr XY X Y XY0

end



schematic
  inst mm : 1

  inst input V : 10
  inst output V : 3

  conn mm -> *
  conn * -> mm

  conn input(V).O -> *
  conn * -> output(V).X

  ensure mag V in (0,5000) : mV

end
