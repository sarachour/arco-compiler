% units

unit:
  define:
    usec
    mV
    V
    mA
    A
  map:
    1 V = 1000 mV
    1 A = 1000 mA

% analogous to unit

prop:
    V : mV,V
    I : mA,A

time t : usec


% every property must have a copy constructor
component copy I:
  in:
    A : port
  out:
    B : port

  ensure:
    mag V(*) | 0 to 5 : V
    mag I(*) | 0 to 1 : mA

  assume:
    rel I(B) := I(A)
    rel V(B) := 5V
    error V[B] | 0
    error I[B] | I(A)*0.00001 + 0.00001

% every property must have an input interface
component input I:
  out:
    B : port
  param:
    % samples three times a microsecond
    rate = 3 : 1/usec

  assume:
    rel I(B) := sample(in,rate)
    rel V(B) := 5
    error I(B) | 0.001*I(B)

  ensure:
    mag I(B) | 0 to 1 : mA
    mag V(B) | 0 to 5 : V

% every property must have an output interface
components output I:
   in:
    A : port

   param:
    % samples three times a microsecond
    rate = 3 : 1/usec

   assume:
     rel out := sample(I(A),rate)
     error out | 0.001*out

   ensure:
     I(A) | 0 to 1 : mA
     V(A) | 0 to 5 : V



component imul:
  in:
    A : port
    B : port

  out:
    O : port

  assume:
    rel I(O) := I(A)*I(B)
    rel V(O) := 5V
    error I(O) | E[I(A)]*E[I(B)] + 0.001

  ensure:
    V(*) | 0 to 5 V
    I(*) | 0 to 1 mA

component iadd:
  in:
    A : port
    B : port

  out:
    O : port

  assume:
    rel I(O) := I(A)+I(B)
    rel V(O) := 5V
    error I(O) | E[I(A)]+E[I(B)] - 0.001

  ensure:
    V(*) | 0 to 5 V
    I(*) | 0 to 1 mA

component dderiv:
  in:
    A : port
    Bic : port

  out:
    B : port
    C : port

  assume:
    rel deriv(I(B),t) = I(A) - I(B) with I(B)(0) = I(Bic)
    rel I(C) = I(A)*I(B)
    rel V(B) = 5 : V
    rel V(C) = 5 : V
    error V(B) | 0
    error V(C) | 0
    error I(B) |  E(I(A) - I(B))*0.01 + 0.0001
    error I(C) |  deriv(B,t)*0.01 + 0.0001

  time:
    % the number of seconds that correspond to one time step
    factor: 0.000001
  constrain:
    % the operating ranges for the circuit.
    magnitude V(*) -> 0 to 5
    magnitude I(*) -> 0.0001 to 0.1


constrain circuit:
    count:
      dderiv: 1
      imul: 3
      dac(I): 7
      adc(I): 7
      copy(I): 13

    connect:
      % copy 0:2 must have only dderiv.A as input
      copy(A)[0:2] :: dderiv(A)[0]
      copy(A)[3:5] :: dderiv(B)[0]

      % copy 6:8 must copy the output of one of the imuls
      copy(A)[6:8] :: imul(O)[*]

      % any dderiv input must come from a dac
      dderiv(*)[*] :: dac[I](B)[*]
      imul(*)[*] :: dac[I](B)[*]

      % any dderiv output must go to an adc
      dderiv(*)[*] :: adc[I](A)[*]

    prop:
      % circuit level lower bound for the current
      % this may be a function of the time scale.
      lbound I -> 0.0001*T + 0.0001
      % circuit level upper bound for the current
      ubound I -> 0.01
