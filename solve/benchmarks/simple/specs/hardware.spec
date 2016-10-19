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
    def I(X) map scale=A offset=B

    output O {D:bits}
    def D(O) repr=SEEEMMMM
    def D(O) sample=0.001 us

    rel D(O) = I(X)
end

comp iadd
    map-var A B1 B2

    input X {I:mA}
    def I(X) mag=[0,1] mA
    def I(X) map scale=A offset=B1

    input Y {I:mA}
    def I(Y) mag=[0,1] mA
    def I(Y) map scale=A offset=B2

    output Z{I:mA}
    %hardware to symbolic 
    def I(Z) imap scale=1/A offset=-(B1+B2)/A
    %symbolic to hardware 
    def I(Z) map scale=A offset=(B1+B2)
    
    rel I(Z) = I(X) + I(Y)
    var I(Z) = I(Z)*0.00001 shape GAUSS
end


comp imul
    map-var A1 A2 A3

    input X {I:mA}
    def I(X) mag=[0,1] mA
    def I(X) map scale=A1

    input Y {I:mA}
    def I(Y) mag=[0,1] mA
    def I(Y) map scale=A2

    input Z {I:mA}
    def I(Z) mag=[0.0001,1] mA
    def I(Z) map scale=A3

    output W {I:mA}
    def I(W) imap scale=A3/(A1+A2)
    def I(W) map scale=(A1+A2)/A3

    rel I(W) = ((I(X)*I(Y))/I(Z))
    var I(W) = (I(W)*0.000001) shape GAUSS

end 


comp deriv_iadd
    map-var A B 
    
    param EN_F : ? = {0,1}
    param EN_B: ? = {0,1}
    param K : ? = {0,1}


    input XT {I:mA}
    def I(XT) mag=[0,1] mA
    def I(XT) map scale=A 
    
    input YT {I:mA}
    def I(YT) mag=[0,1] mA
    def I(YT) map scale=B 


    input P {I:mA}
    def I(P) mag = [0,0.0001] mA
    def I(P) map scale=A*B 
    %derive ddt 

    input Z0 {I:mA}
    def I(Z0) mag = [0,1] mA
    % derive ddt

    output Z {I:mA}
    output X {I:mA}
    rel I(X) = I(XT) - K*I(Z)
    def I(X) map scale=1/(A*B)   
 
    output Y {I:mA}
    rel I(Y) =  I(YT) - K*I(Z)
    def I(X) map scale=1/(A*B)

    rel ddt I(Z) = EN_F*I(X)*I(Y) - EN_B*I(P)*I(Z) init I(Z0)
    var ddt I(Z) = I(Z)*0.00001 shape GAUSS

    def I(Z) mag = [0,1] mA
    def I(Z) imap scale=1/(A*B) 
    def ddt I(Z) imap scale=1/(A*B) 
   
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
