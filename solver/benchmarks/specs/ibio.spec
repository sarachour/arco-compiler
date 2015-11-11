
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

  input Etot where I:mA
  input Stot where I:mA
  input kf where I:mA
  input kr where I:mA
  input ES0 where I:mA

  output ES where I:mA
  output E where I:mA
  output S where I:mA

  rel I(E) = I(Etot) - I(ES)
  rel I(S) = I(Stot) - I(ES)
  rel deriv(I(ES),t) = I(kf)*I(E)*I(S) - I(kr)*I(ES) initially I(ES0)

  spice mm Etot Stot kf kr ES E S

end


schematic
  inst mm : 1

  inst input V : 10
  inst output V : 3

  conn mm -> *

  conn input(V).O -> *
  conn * -> output(V).X

  ensure mag I in (0,1000) : mA

end
