
type us
type mV


prop V : mV

time t: us


comp vadd2
  input X where V:mV
  input Y where V:mV
  output Z where V:mV

  rel V(Z) = V(X) + V(Y)
  spice vadd2 X Y Z


end

comp vmul2
  input X where V:mV
  input Y where V:mV
  output Z where V:mV

  rel V(Z) = V(X)*V(Y)
  spice vmul2 X Y Z


end

comp vint
  input X where V:mV
  input X0 where V:mV
  output Z where V:mV

  rel deriv(V(Z),t) = V(X) initially V(X0)
  spice vint X X0 Z


end

comp vpow
  input X where V:mV
  input Q where V:mV
  output Z where V:mV

  rel V(Z) = V(X)^(V(Q))
  spice vpow X X0 Z
end

comp vinv
  input X where V:mV
  input R where V:mV
  output Z where V:mV

  rel V(Z) = 1/(1+ (V(X)^V(R)) )
  spice vinv X Z
end

digital input V
  input X
  output O where V:mV
  ensure mag V(O) in (0,5): V
  spice vin X O

end

digital output V
  input X where V:mV
  output O
  ensure mag V(X) in (0,5): V
  spice vout X O
end


schematic
  inst vadd2 : 4
  inst vmul2 : 4
  inst vint : 4
  inst vpow : 5
  inst vinv : 3

  inst input V : 10
  inst output V : 3

  conn vadd2 -> *
  conn vmul2 -> *
  conn vint -> *
  conn vpow -> *
  conn vinv -> *

  conn input(V).O -> vadd2
  conn input(V).O -> vmul2
  conn input(V).O -> vint
  conn input(V).O -> vpow
  conn input(V).O -> vinv

  conn * -> output(V).X

  ensure mag V in (0,5) : mV
  ensure mag I in (0,1) : mA

end
