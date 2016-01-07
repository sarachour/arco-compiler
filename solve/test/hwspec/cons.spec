type us
type s
type mV
type V
type mA
type A

let 1 A = 1000 mA
let 1 V = 1000 mV

prop V : mV, V
prop I : mA, A

time t : us,s


comp dummy


end

comp dummy2
  input A where V : mV, I : mA
  input B where V : mV, I : mA

  output C where V : mV, I : mA
  output E where V : mV, I : mA

  param DP : mV = 0.123
  param EP : 1/mV = 1

  rel V(C) = (1/10)*(V(A) + V(B))

  ensure mag V(A) in (0,5): mV
  ensure mag V(B) in (0,5): mV
  ensure mag V(C) in (0,5): mV
  ensure mag V(E) in (0,5): mV

  % basically given an error relation
  assume err V(E(C)) = V(E(A))+V(E(B))/10 + 0.001*V(C) : mV

end

comp dummy3
  input A where V : mV, I : mA
  input O0 where V : mV, I : mA
  output O where V : mV, I : mA

  rel deriv(V(O),t) = V(A) initially V(O0)

  assume err deriv(V(E(O)),t) = V(E(A)) + 0.0001 : mV

  ensure mag V(A) in (0,5): mV
  ensure mag V(O) in (0,5): mV

  assume time 1 t = 1 us
  ensure time in (0.0001, 5): us

end

comp copy V
  input A where V : mV, I : mA
  output O where V : mV, I : mA

  rel V(O) = V(A)

  ensure mag V(A) in (0,5): mV
  ensure mag V(O) in (0,1): mA

  assume err deriv(V(E(O)),t) = V(E(A)) + 0.0001 : mV

end

digital input V
  % assume floating point value is converted to voltage.
  input X
  output O where V : mV, I : mA
  assume sample V(O) every 0.01 ms

  % rel V(O) = X essnentially
end

digital output V
  % assume floating point value is converted from voltage
  input I where V: mV, I : mA
  output Y
  assume sample V(I) every 1 ms

  % rel V(O) = Y essentially
end

schematic
   inst input V : 3
   inst output V : 4
   inst dummy : 3
   inst dummy2 : 2
   inst dummy3 : 5
   inst copy V : 25


   conn dummy2 -> dummy3
   conn dummy2[0:1].O -> dummy3
   conn dummy3 -> *

   conn dummy2[2:3].O -> dummy2[0:2]
   conn dummy2.A -> input(V)

   ensure mag V in (0,5) : mV
   ensure mag I in (0,1) : mA



end
