
type us
type uA
type mV
type bits

prop I : uA
prop V : mV
prop D : bits

time t: us

digital input I
  input X {D:bits}
  output O {I:uA}
  def I(O) mag = [0.0,10] uA
  def D(X) repr = SEEEEMMM 
  def D(X) sample = 0.00001 us
  def D(X) mag = [0.0,10] uA

  rel I(O) = D(X)
end

digital output I
  input X {I:uA}
  def I(X) mag = [0.0,10] uA

  output O {D:bits}
  def D(O) repr = SEEEEMMM
  def D(O) sample = 0.001 us
  def D(O) mag = [0.0,10] uA

  rel D(O) = I(X)
end

comp copy I
  input X {I:uA}
  def I(X) mag = [0.0,10] uA

  output Y {I:uA}

  rel I(Y) = I(X)
  var I(Y) = I(Y)*0.00001 + 0.0001 shape UNIFORM
end

digital input V
  input X {D:bits}
  output O {V:mV}

  def V(O) mag = [0,3300] mV

  def D(X) sample = 0.00001 us
  def D(X) repr = SEEEMMMM
  def D(X) mag = [0,3300] mV

  rel V(O) = D(X)

end

digital output V
  input X {V:mV}
  output O {D:bits}
  def V(X) mag = [0.0001,3300] mV

  def D(O) sample = 0.001 us
  def D(O) repr = SEEEMMMM 
  def D(O) mag = [0,3300] mV

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
  def V(X) mag = [0.0001,3300] mV

  input Y {V:mV}
  def V(Y) mag = [1,3300] mV
  
  input Z {V:mV}
  def V(Z) mag = [0.0001,3300] mV
  
  output P {V:mV}
  def V(P) mag = [0.0001,3300] mV

  rel V(P) = (V(X)/V(Y))*V(Z)*0.5
  var V(P) = 0.0001*V(P) + 0.01 shape GAUSS

  sim vgain X Y Z P

end
comp iadd
  input A {I:uA}
  input B {I:uA}
  input C {I:uA}
  input D {I:uA}
  output OUT {I:uA}

  def I(A) mag = [0.0,5] uA
  def I(B) mag = [0.0,5] uA 
  def I(C) mag = [0.0,5] uA 
  def I(D) mag = [0.0,5] uA
  def I(OUT) mag = [0.0,10] uA
  rel I(OUT) =  ((I(A) + I(B)) - I(C) - I(D))
  var V(OUT) = 0.00001*V(OUT) + 0.001 shape GAUSS

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
  param BSW : none = {0,1}
  param CSW : none = {0,1}
  param DSW : none = {0,1}

  def V(A) mag = [0,3300] mV
  def V(B) mag = [0,3300] mV 
  def V(C) mag = [0,3300] mV 
  def V(D) mag = [0,3300] mV
  def V(OUT2_0) mag = [0,3300] mV

  % only produces outputs in this range
  rel V(OUT) =  ((V(A) + BSW*V(B)) - CSW*V(C) - DSW*V(D))*0.25
  var V(OUT) = 0.001*V(OUT) + 0.1 shape GAUSS

  rel ddt V(OUT2) = ((V(A) + BSW*V(B)) - CSW*V(C) - DSW*V(D)*V(OUT2))*0.25  init V(OUT2_0)
  def V(OUT2) mag = [0,3300] mV
  var ddt V(OUT2) = 0.001*V(OUT2) + 0.1 shape GAUSS
  

end

comp vtoi
  input X {V:mV}
  input K {V:mV}
  output Y {I:uA}

  %def I(Y) mag = [0.0001,10] uA
  def V(K) mag = [1,3300] mV
  def V(X) mag = [1,3300] mV

  rel I(Y) = (1/V(K))*V(X)
  var I(Y) = 0.001 shape GAUSS

  sim vtoi X K Y

end

comp itov
  input X {I:uA}
  input K {V:mV}
  output Y {V:mV}
  def I(X) mag = [0.0001,10] uA
  def V(K) mag = [1,330] mV

  rel V(Y) = (V(K))*I(X)
  var I(Y) = 0.1 shape GAUSS

  sim itov X K Y
end

% Dynamic Systems Biology Modelling
% page 311
comp ihill
  input Vmax {I:uA}
  input S {I:uA}
  input n {V:mV}
  input Km {I:uA}

  def I(Vmax) mag = [0.0001,10] uA
  def I(S) mag = [1,10] uA
  def I(Km) mag = [1,10] uA
  def V(n) mag = [1,5] uA

  output STIM {I:uA}
  output REP {I:uA}
  
  % s^n/(s^n + k^n)
  rel I(STIM) = I(Vmax)*(  ( (I(S)/I(Km))^V(n) ) / ( ( (I(S)/I(Km))^V(n) ) + 1 ) )
  rel I(REP) = I(Vmax)*( (I(Km)^V(n))/( (I(S)^V(n)) + (I(Km)^V(n)) ) )

  sim ihill Vmax S n Km STM REP
end

comp igenebind
  input TF {I:uA}
  input K {I:uA}
  input Vmax {I:uA}

  def I(TF) mag = [0.0001,10] uA
  def I(K) mag = [0.0001,10] uA
  def I(Vmax) mag = [0.0001,10] uA

  output GE {I:uA}

  rel I(GE) = I(Vmax)*(1/(1+ I(K)*I(TF)))
  sim igenebind TF K Vmax GE
end


comp mm

  input Xtot {V:mV}
  input Ytot {V:mV}
  input kf {I:uA}
  input kr {I:uA}
  input XY0 {V:mV}

  def V(Xtot) mag = [0.0001,3300] mV
  def V(Ytot) mag = [0.0001,3300] mV
  def I(kf) mag = [0.0001,10] uA
  def I(kr) mag = [0.0001,10] uA
  def V(XY0) mag = [0.00,3300] mV


  output XY {V:mV}
  output X {V:mV}
  output Y {V:mV}

  rel V(X) = V(Xtot) - V(XY)
  rel V(Y) = V(Ytot) - V(XY)
  rel ddt V(XY) = I(kf)*V(X)*V(Y) - I(kr)*V(XY) init V(XY0)
  def V(XY) mag = [0,3300] mV
  var ddt V(XY) = 0.001*V(XY) + 0.1 shape GAUSS

end

comp switch
  input SUB {I:uA}
  input Vmax {I:uA}
  input n {V:mV}
  input Kmod {I:uA}

  def I(SUB) mag = [0.0001,10] uA
  def I(Vmax) mag = [0.0001,10] uA
  def V(n) mag = [0.5,3300] mV
  def I(Kmod) mag = [1,10] uA

  output PROD {I:uA}

  rel I(PROD) = I(Vmax)/(( ( I(SUB)/I(Kmod) )+ 1)^(V(n)))
end




schematic

  inst input I : 50
  inst output I : 10
  inst copy I : 10
  %inst mm : 4
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
  conn iadd -> vgain 
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
  conn vadd -> switch 

end
