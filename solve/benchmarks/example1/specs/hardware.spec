
type us
type mV
type bits

prop V : mV
prop D : bits

time t: us

digital input V
  input X where D:bits
  output O where V:mV
  spice vin X O
  rel V(O) = D(X)
end

digital output V
  input X where V:mV
  output O where D:bits
  rel D(O) = V(X)
  spice vout X O
end
% voltage add gain block with optional capacitor thingy

comp vmult
  input X where V:mV
  input Y where V:mV
  output P where V:mV

  rel V(P) = V(X)*V(Y)

  spice vgain X Y P
end

comp vadd
  input X where V:mV
  input Y where V:mV
  output P where V:mV

  rel V(P) = V(X)+V(Y)

  spice vgain X Y P
end


comp vpow
  input X where V:mV
  output P where V:mV

  rel V(P) = V(X)^(2)

  spice vgain X P
end


comp vsqrt
  input X where V:mV
  output P where V:mV

  rel V(P) = V(X)^(0.5)

  spice vgain X P
end

schematic
  inst vsqrt: 1 
  inst vpow: 1
  inst vadd: 1
  inst vmult : 1
  inst input V : 20
  inst output V : 20
  
  conn input(V) -> vadd 
  conn input(V) -> vmult
  conn vadd -> output(V) 
  
  conn vmult -> pow 
  conn vpow -> vsqrt
  conn vsqrt -> vadd

end
