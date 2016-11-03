
type us
type mA
type mV
type bits

prop I : mA
prop V : mV
prop D : bits

time t: us

digital input I
  input X {D:bits}
  output O {I:mA}
  def I(O) mag = [0,1] mA
  def D(X) repr = SEEEEMMM 
  
  rel I(O) = D(X)
  var I(O) = I(O)*0.00001 shape UNIFORM
end

digital output I
  input X {I:mA}
  def I(X) mag = [0,1] mA

  output O {D:bits}
  def D(O) repr = SEEEEMMM
  def D(O) sample = 0.001 us

  rel D(O) = I(X)
end

comp copy I
  input X {I:mA}
  def I(X) mag = [0,1] mA

  output Y {I:mA}

  rel I(Y) = I(X)
  var I(Y) = I(Y)*0.00001 shape UNIFORM
end

digital input V
  input X {D:bits}
  output O {V:mV}

  def V(O) mag = [0,5] mV
  def D(X) sample = 0.00001 us
  def D(X) repr = SEEEMMMM

  rel V(O) = D(X)
end

digital output V
  input X {V:mV}
  output O {D:bits}
  def V(X) mag = [0,5] mV
  def D(O) sample = 0.001 us
  def D(O) repr = SEEEMMMM 
  rel D(O) = V(X)
  sim vout X O
end

comp copy V
  input X {V:mV}
  def V(X) mag = [0,1] mV

  output Y {V:mV}
  rel V(Y) = V(X)

  sim vcopy X Y
end

% voltage add gain block with optional capacitor thingy

comp vgain
  input X {V:mV}
  def I(X) mag = [0,1] mA

  input Y {V:mV}
  def I(Y) mag = [0,1] mA
  
  input Z {V:mV}
  def I(Z) mag = [0,1] mA
  
  output P {V:mV}
  def I(P) mag = [0,1] mA

  rel V(P) = (V(X)/V(Y))*V(Z)*0.04

  sim vgain X Y Z P

end
comp iadd
  input A {I:mA}
  input B {I:mA}
  input C {I:mA}
  input D {I:mA}
  output OUT {I:mA}
  def I(A) mag = [0,1] mA 
  def I(B) mag = [0,1] mA 
  def I(C) mag = [0,1] mA 
  def I(D) mag = [0,1] mA
  def I(OUT) mag = [0,1] mA
  rel I(OUT) =  ((I(A) + I(B)) - I(C) - I(D))

end

comp vadd
  input A {V:mV}
  input B {V:mV}
  input C {V:mV}
  input D {V:mV}
  input OUT2_0 {V:mV}

  output OUT {V:mV}
  output OUT2 {V:mV}

  % does not take inputs outside of this range
  def I(A) mag = [0,5] mV
  def I(B) mag = [0,5] mV 
  def I(C) mag = [0,5] mV 
  def I(D) mag = [0,5] mV
  def I(OUT2_0) mag = [0,5] mV
  % only produces outputs in this range
  %def I(OUT) mag = [0,5] mV

  rel V(OUT) =  ((V(A) + V(B)) - V(C) - V(D))*0.1
  rel ddt V(OUT2) = ((V(A) + V(B)) - V(C) - V(D)*V(OUT2))*0.1  init V(OUT2_0)
  def I(OUT2) mag = [0,5] mV
end

comp vtoi
  input X {V:mV}
  input K {V:mV}
  output Y {I:mA}

  def I(Y) mag = [0,1] mA
  def I(X) mag = [0,1] mV
  def V(K) mag = [1,4] mV

  rel I(Y) = (1/V(K))*V(X)
  
  sim vtoi X K Y

end

comp itov
  input X {I:mA}
  input K {V:mV}
  output Y {V:mV}
  def I(X) mag = [0,1] mA
  def V(K) mag = [0,1] mV

  rel V(Y) = (V(K))*I(X)

  sim itov X K Y
end

% Dynamic Systems Biology Modelling
% page 311
comp ihill
  input Vmax {I:mA}
  input S {I:mA}
  param n : mV = {1,1.5,2,2.5,3,3.5}
  input Km {I:mA}

  def I(Vmax) mag = [0,1] mA
  def I(S) mag = [0,1] mA
  def I(Km) mag = [1,10] mA

  output STIM {I:mA}
  output REP {I:mA}
  
  % s^n/(s^n + k^n)
  rel I(STIM) = I(Vmax)*(((I(S)/I(Km))^n)/( ((I(S)/I(Km))^n) + 1 ) )
  rel I(REP) = I(Vmax)*((I(Km)^n)/( ((I(S))^n) + (I(Km)^n) ) )

  sim ihill Vmax S n Km STM REP
end

comp igenebind
  input TF {I:mA}
  input K {I:mA}
  input Vmax {I:mA}

  def I(TF) mag = [0,1] mA
  def I(K) mag = [0,1] mA
  def I(Vmax) mag = [0,1] mA

  output GE {I:mA}

  rel I(GE) = I(Vmax)*(1/(1+I(K)*I(TF)))
  sim igenebind TF K Vmax GE
end


comp mm

  input Xtot {V:mV}
  input Ytot {V:mV}
  input kf {I:mA}
  input kr {I:mA}
  input XY0 {V:mV}

  def V(Xtot) mag = [0,1] mV
  def V(Ytot) mag = [0,1] mV
  def I(kf) mag = [0,1] mA
  def I(kr) mag = [0,1] mA
  def V(XY0) mag = [0,1] mV


  output XY {V:mV}
  output X {V:mV}
  output Y {V:mV}

  rel V(X) = V(Xtot) - V(XY)
  rel V(Y) = V(Ytot) - V(XY)
  rel ddt V(XY) = I(kf)*V(X)*V(Y) - I(kr)*V(XY) init V(XY0)
  def V(XY) mag = [0,1] mV
end

comp switch
  input SUB {I:mA}
  input Vmax {I:mA}
  input n {V:mV}
  input Kmod {I:mA}

  def I(SUB) mag = [0,1] mA
  def I(Vmax) mag = [0,1] mA
  def V(n) mag = [0,1] mV
  def I(Kmod) mag = [1,10] mA

  output PROD {I:mA}

  rel I(PROD) = I(Vmax)/(( ( I(SUB)/I(Kmod) )+ 1)^(V(n)))
end




schematic

  inst input I : 50
  inst output I : 10
  inst copy I : 10
  inst mm : 2
  inst switch : 15

  inst input V : 125
  inst output V : 75
  inst copy V : 10

  inst vadd : 35
  inst vgain : 40

  inst iadd : 30
  inst igenebind : 8
  inst ihill : 8

  inst itov : 30
  inst vtoi : 30



  % Transcription rate functions
  conn input(I) -> itov
  conn input(I) -> ihill
  conn input(I) -> igenebind
  conn input(I) -> switch
  conn input(I) -> iadd
  conn input(I) -> mm

  conn input(V) -> ihill
  conn input(V) -> vtoi
  conn input(V) -> itov
  conn input(V) -> vadd
  conn input(V) -> vgain
  conn input(V) -> switch
  conn input(V) -> mm

  conn mm -> output(V)
  conn mm -> itov
  conn mm -> iadd
  conn mm -> vgain
  %new
  conn mm -> mm


  conn switch -> itov
  conn switch -> iadd
  conn switch -> output(I)
  conn switch -> itov

  conn ihill -> output(I)
  conn ihill -> itov
  conn ihill -> iadd
  conn ihill -> igenebind

  conn igenebind -> output(I)
  conn igenebind -> itov
  conn igenebind -> ihill
  conn igenebind -> iadd

  conn itov -> output(V)
  conn itov -> vadd
  conn itov -> vgain
  conn itov -> switch

  conn iadd -> output(I)
  conn iadd -> ihill
  conn iadd -> switch
  conn iadd -> igenebind
  conn iadd -> itov

  %new
  conn iadd -> iadd

  conn vtoi -> iadd
  conn vtoi -> ihill
  conn vtoi -> switch
  conn vtoi -> output(I)

  conn vgain -> output(V)
  conn vgain -> vadd
  conn vgain -> vtoi
  conn vgain -> mm
  conn vgain -> itov
  conn vgain -> vgain

  conn vadd -> output(V)
  conn vadd -> vtoi
  conn vadd -> itov
  conn vadd -> vgain
  conn vadd -> vadd

end
