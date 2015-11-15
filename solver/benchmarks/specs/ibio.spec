
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

  input Xtot where I:mA
  input Ytot where I:mA
  input kf where I:mA
  input kr where I:mA
  input XY0 where I:mA

  output XY where I:mA
  output X where I:mA
  output Y where I:mA

  rel I(X) = I(Xtot) - I(XY)
  rel I(Y) = I(Ytot) - I(XY)
  rel deriv(I(XY),t) = I(kf)*I(X)*I(Y) - I(kr)*I(XY) initially I(XY0)

  spice mm Xtot Ytot kf kr XY X Y XY0

end



comp itf
  input STOT where I:mA
  input ETOT where I:mA
  input n where I:mA
  input Ks where I:mA
  output S where I:mA
  output Z where I:mA
  output ZFREE where I:mA

  rel I(S) = I(STOT) - I(Z)
  rel I(ZFREE) = (1/( (I(S)/I(Ks))^(I(n)) + 1))*I(ETOT)
  rel I(Z) = (I(S)/I(Ks))^(I(n))*(I(ZFREE))

  spice itf STOT ETOT n Ks S Z ZFREE
end

comp tfdna
  input STOT where I:mA
  output ETOT where I:mA
  output SFREE where I:mA
  output EFREE where I:mA

  spice tfdna STOT ETOT SFREE EFREE
end

comp mult4
  input X where I:mA
  input Y where I:mA
  input Z where I:mA
  input W where I:mA
  output P where I:mA

  rel I(P) = I(X)*I(Y)*I(Z)*I(W)

  spice mult4 X Y Z W P
end

comp add4
  input X where I:mA
  input Y where I:mA
  input Z where I:mA
  input W where I:mA
  output P where I:mA

  rel I(P) = I(X)+I(Y)+I(Z)+I(W)

  spice add4 X Y Z W PS
end


comp switch
  input SUB where I:mA
  input TF where I:mA
  input n where I:mA
  input Kmod where I:mA
  output PROD where I:mA

  rel I(PROD) = 1/(( ( I(SUB)/I(Kmod) )+ 1)^(I(n)))

  spice switch SUB TF n Kmod PROD
end


comp inh_bind
  input INH where I:mA
  input COMP where I:mA
  input n where I:mA
  input Kinh where I:mA
  output PROD where I:mA


  rel I(PROD) = I(COMP)*(1/(  ((I(INH)/(I(Kinh)))^(I(n))) + 1))

  spice inhbind INH COMP n Kinh PROD
end


comp act_bind
  input ACT where I:mA
  input COMP where I:mA
  input n where I:mA
  input Kact where I:mA
  output PROD where I:mA

  rel I(PROD) = I(COMP)*( I(ACT)/I(Kact) )^(I(n))/( ( I(ACT)/I(Kact) )^(I(n)) + 1)

  spice actbind ACT COMP n Kact PROD

end


comp stateful
  input COMP0 where I: mA
  input PROD where I: mA
  input DEG where I:mA
  output COMP where I: mA

  rel deriv(I(COMP),t) = I(PROD) - I(DEG)*I(COMP) initially I(COMP0)
  spice stateful PROD DEG COMP COMP_0
end

schematic
  inst mm : 5
  inst stateful : 15
  inst act_bind: 10
  inst inh_bind: 10
  inst switch: 10
  inst mult4: 20
  inst add4 : 20

  inst input I : 50
  inst output I : 10


  conn input(I).O -> *
  conn * -> output(I).X



  conn act_bind -> inh_bind.COMP

  conn mult4 -> inh_bind.COMP
  conn mult4 -> act_bind.COMP
  conn mult4 -> switch.SUB
  conn mult4 -> stateful
  conn mult4 -> mult4

  conn mult4 -> add4
  conn inh_bind -> add4
  conn act_bind -> add4

  conn switch.PROD -> stateful
  conn switch.PROD -> mult4

  conn inh_bind -> stateful
  conn act_bind -> stateful
  conn * -> inh_bind
  conn * -> act_bind

  conn inh_bind -> mult4
  conn act_bind -> mult4
  conn stateful -> mult4
  conn add4 -> mult4

  conn inh_bind -> mm
  conn act_bind -> mm
  conn mult4 -> mm


  ensure mag I in (0,1000) : mA

end
