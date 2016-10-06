type us
type mA
type bits

prop I : mA
prop D : bits
time t: us

digital input I
    input X where D:bits
    repr D(X) in FLOAT(1,4,3)
    sample D(X) at 0.0001 us


    output O where I:mA
    mag I(O) in [0,1] mA
    rel I(O) = D(X)

    var I(O) = I(O)*0.00001 shape UNIFORM
end

digital output I
    input X where I:mA
    mag I(X) in [0,1] mA
    scale I(X) with linear A B

    output O where D:bits
    repr D(O) in FLOAT(1,4,3)
    sample D(O) at 0.001 us

    rel D(O) = I(X)
end

comp iadd
    define-var A
    define-var B1
    define-var B2

    input X {I:mA}
    prop I(X) mag=[0,1] mA
    prop I(X) linear {scale=A, offset=B1}

    input Y {I:mA}
    prop I(X) mag=[0,1] mA
    prop I(X) linear {scale=A, offset=B2}

    output Z{I:mA}
    prop I(Z) mag=[?] mA
    prop I(Z) linear {scale=1/A, offset=(B1+B2)/A}

    rel I(Z) = I(X) + I(Y)
    var I(Z) = I(Z)*0.00001 shape GAUSS
end


comp imul
    define-var A1 A2 A3

    input X {I:mA}
    prop I(X) mag=[0,1] mA
    prop I(X) scaling {scale=A1}

    input Y {I:mA}
    prop I(Y) mag=[0,1] mA
    prop I(Y) scaling {scale=A2}

    input Z {I:mA}
    prop I(Z) mag=[0,1] mA
    prop I(Z) scaling {scale=A3}

    input W {I:mA}
    prop I(W) mag=[?] mA
    prop I(W) scaling {scale=A3/(A1+A2)}

    rel I(W) = I(X)*I(Y)/I(Z)
    var I(W) = I(W)*0.000001 shape GAUSS
end 


comp deriv_iadd
    define-var A B
    input X {I:mA}
    prop I(X) mag=[0,1] mA
    prop I(X) linear {scale=A,offset=B}

    prop I(P) mag = [0,0.0001] mA
    prop I(P) scaling {scale=A}

    input Z {I:mA}
    prop I(Z) mag = [0,1] mA
    prop I(Z) linear {scale=1/A,offset=B/A}
    prop deriv(I(Z),t) linear {scale=1/A,offset=B/A}
    prop deriv(I(Z),t) mag= [?] mA
    
    rel deriv(I(Z),t) = I(X) - I(P)*I(Z) init Z0
    var deriv(I(Z),t) = I(Z)*0.00001 shape GAUSS
end


schematic
   inst input I : 50
   inst output I : 10
   inst iadd  : 2
   inst imul : 4
   int deriv_iadd: 1

   conn * <-> *





end
