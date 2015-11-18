
type us
type mA
type mV


prop I : mA
prop V : mV

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

digital input V
  input X
  output O where V:mV
  spice vin X O

end

digital output V
  input X where V:mV
  output O

  spice vout X O
end

comp copy V
  input X where V:mV
  output Y where V:mV

  spice vcopy X Y
end

% voltage add gain block with optional capacitor thingy

comp vgain
  input X where V:mV
  input Y where V:mV
  input Z where V:mV
  output P where V:mV

  rel V(P) = (V(X)/V(Y))*V(Z)*0.04

  spice vgain X Y Z P

end
comp iadd
  input A where I:mA
  input B where I:mA
  input C where I:mA
  input D where I:mA

  output OUT where I:mA

  rel I(OUT) =  ((I(A) + I(B)) - I(C) - I(D))

   spice iadd A B C D OUT
end

comp vadd
  input A where V:mV
  input B where V:mV
  input C where V:mV
  input D where V:mV
  input OUT2_0 where V:mV

  output OUT where V:mV
  output OUT2 where V:mV

  rel V(OUT) =  ((V(A) + V(B)) - V(C) - V(D))*0.1
  rel deriv(V(OUT2),t) = ((V(A) + V(B)) - V(C) - V(D)*V(OUT2))*0.1  initially V(OUT2_0)

  spice vadd A B C D OUT OUT2 OUT2_0

end

comp vtoi
  input X where V:mV
  input K where V:mV
  output Y where I:mA

  rel I(Y) = V(K)*V(X)

  spice vtoi X K Y

end

comp itov
  input X where I:mA
  input K where V:mV
  output Y where V:mV

  rel V(Y) = (1/V(K))*I(X)

  spice itov X K Y
end

% Dynamic Systems Biology Modelling
% page 311
comp ihill
  input Vmax where I:mA
  input S where I:mA
  input n where V : mV
  input Km where I:mA
  output STIM where I:mA
  output REP where I:mA

  % s^n/(s^n + k^n)
  rel I(STIM) = I(Vmax)*(((I(S)/I(Km))^V(n))/( ((I(S)/I(Km))^V(n)) + 1 ) )
  rel I(REP) = I(Vmax)*((I(Km)^V(n))/( ((I(S))^V(n)) + (I(Km)^V(n)) ) )

  spice ihill Vmax S n Km STM REP
end

comp igenebind
  input TF where I:mA
  input K where I:mA
  input Vmax where I : mA
  output GE where I: mA

  rel I(GE) = I(Vmax)*(1/(1+I(K)*I(TF)))
  spice igenebind TF K Vmax GE
end


comp mm

  input Xtot where V:mV
  input Ytot where V:mV
  input kf where I:mA
  input kr where I:mA
  input XY0 where V:mV

  output XY where V:mV
  output X where V:mV
  output Y where V:mV

  rel V(X) = V(Xtot) - V(XY)
  rel V(Y) = V(Ytot) - V(XY)
  rel deriv(V(XY),t) = I(kf)*V(X)*V(Y) - I(kr)*V(XY) initially V(XY0)

  spice mm Xtot Ytot kf kr XY X Y XY0

end

comp switch
  input SUB where I:mA
  input Vmax where I:mA
  input n where V:mV
  input Kmod where I:mA
  output PROD where I:mA

  rel I(PROD) = I(Vmax)/(( ( I(SUB)/I(Kmod) )+ 1)^(V(n)))

  spice switch SUB n Kmod PROD
end




schematic

  inst input I : 25
  inst output I : 10
  inst copy I : 10
  inst mm : 2
  inst switch : 5

  inst input V : 75
  inst output V : 50
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

  conn switch -> itov
  conn switch -> iadd
  conn switch -> output(I)

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

  conn iadd -> output(I)
  conn iadd -> ihill
  conn iadd -> switch
  conn iadd -> igenebind

  conn vtoi -> iadd
  conn vtoi -> ihill
  conn vtoi -> switch
  conn vtoi -> output(I)

  conn vgain -> output(V)
  conn vgain -> vadd
  conn vgain -> vtoi
  conn vgain -> vgain

  conn vadd -> output(V)
  conn vadd -> vtoi
  conn vadd -> vgain
  conn vadd -> vadd

end
