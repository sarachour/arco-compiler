
type s
type bits

prop D : bits

time t : s

comp digiswitch
  output O where D:bits
  output O2 where D:bits
  rel D(O) = 0
  rel D(O2) = 1
  spice dswitch O O2
end


digital output D
  input X where D:bits
  output O where D:bits
  rel D(O) = D(X)
  spice iout X O
end


schematic
  inst digiswitch : 1
  inst output D : 1

  conn digiswitch -> output(D)

end
