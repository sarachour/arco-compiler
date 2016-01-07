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

  rel V(C) = V(A) + V(B)

end

comp dummy3
  input A where V : mV, I : mA
  input O0 where V : mV, I : mA
  output O where V : mV, I : mA

  rel deriv(V(O),t) = V(A) initially V(O0)

end
