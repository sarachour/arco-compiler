type us
type mA
type bits

prop I : mA
prop D : bits
time t: us

digital input I
    def map-var A B

    input X {D:bits}
    def D(X) repr=SEEEMMMM
    def D(X) sample=0.0001 us


    output O {I:mA}
    def I(O) mag=[0,1] mA
    %def I(O) map linear {scale=(A),offset=(B)}
    
    rel I(O) = D(X)
    var I(O) = I(O)*0.00001 shape UNIFORM
end

digital output I
    input X {I:mA}
    def I(X) mag=[0,1] mA
    def I(X) map linear scale=A offset=B

    output O {D:bits}
    def D(O) repr=SEEEMMMM
    def D(O) sample=0.001 us

    rel D(O) = I(X)
end

comp iadd
    map-var A B1 B2

    input X {I:mA}
    def I(X) mag=[0,1] mA
    def I(X) map linear scale=A offset=B1

    input Y {I:mA}
    def I(Y) mag=[0,1] mA
    def I(Y) map linear scale=A offset=B2

    output Z{I:mA}
    %def I(Z) mag=[?] mA
    %hardware to symbolic 
    def I(Z) imap linear scale=1/A offset=-(B1+B2)/A
    %symbolic to hardware 
    def I(Z) map linear scale=A offset=(B1+B2)
    
    rel I(Z) = I(X) + I(Y)
    var I(Z) = I(Z)*0.00001 shape GAUSS
end


comp imul
    map-var A1 A2 A3

    input X {I:mA}
    def I(X) mag=[0,1] mA
    def I(X) map scale A1

    input Y {I:mA}
    def I(Y) mag=[0,1] mA
    def I(Y) map scale A2

    input Z {I:mA}
    def I(Z) mag=[0.0001,1] mA
    def I(Z) map scale A3

    output W {I:mA}
    def I(W) imap scale A3/(A1+A2)
    def I(W) map scale (A1+A2)/A3

    rel I(W) = ((I(X)*I(Y))/I(Z))
    var I(W) = (I(W)*0.000001) shape GAUSS

end 


comp deriv_iadd
    map-var A B
    input X {I:mA}
    def I(X) mag=[0,1] mA
    def I(X) map linear scale=A offset=B

    input P {I:mA}
    def I(P) mag = [0,0.0001] mA
    def I(P) map scale A

    input Z0 {I:mA}
    def I(Z0) mag = [0,1] mA
    
    output Z {I:mA}
   
    rel ddt I(Z) = I(X) - I(P)*I(Z) init I(Z0)
    var ddt I(Z) = I(Z)*0.00001 shape GAUSS

    def I(Z) mag = [0,1] mA
    def I(Z) map linear scale=1/A offset=B/A
    
    def ddt I(Z) map linear scale=1/A offset=B/A
   
end


schematic
   inst imul : 4
   inst iadd  : 2
   inst deriv_iadd: 1
   inst output I : 10
   inst input I : 50

   conn input(I) -> iadd
   conn input(I) -> imul 
   conn input(I) -> deriv_iadd
   conn deriv_iadd -> output(I)

end
