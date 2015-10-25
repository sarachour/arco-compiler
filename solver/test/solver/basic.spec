

type us
type mV
type V


let 1 V = 1000 mV

prop V : V,mV

time t: us

comp vadd2
  input X where V:mV
  input Y where V:mV
  output Z where V:mV

  rel V(Z) = V(X) + V(Y)

  ensure mag V(X) in (0,2.5): V
  ensure mag V(Y) in (0,2.5): V
  ensure mag V(Z) in (0,5) :V
end

comp vmul2
  input X where V:mV
  input Y where V:mV
  output Z where V:mV

  rel V(Z) = (V(X)*V(Y))/5

  ensure mag V(X) in (0,5): V
  ensure mag V(Y) in (0,5): V
  ensure mag V(Z) in (0,5): V

end

comp vexp
  input X where V:mV
  input Y where V:mV
  output O where V:mV

  rel V(O) = V(X)^V(Y)/27

  ensure mag X in (0,3) :V
  ensure mag Y in (1,3) :V
  ensure mag O in (0,5) :V

end

digital input V
  input X
  output O where V:mV

  ensure mag V(O) in (0,5): V
end

digital output V
  input X where V:mV
  output O

  ensure mag V(X) in (0,5): V


end

comp copy V
  input X where V:mV
  output O where V:mV

  rel V(O) = V(X)

  ensure mag V(X) in (0,5): V
  ensure mag V(O) in (0,5): V
end

schematic
  inst vadd2 : 4
  inst vmul2 : 4
  inst vexp : 3
  inst input V : 2
  inst output V : 2
  inst copy V : 16


  conn vadd2 -> vmul2
  conn vmul2 -> vadd2
  conn input(V) -> *
  conn * -> output(V)
  conn vexp -> vadd2

  conn * -> copy(V)
  conn copy(V) -> *

end
