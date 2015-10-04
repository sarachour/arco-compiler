
prop V
prop I

time t with scale T


% every property must have a copy constructor
component copy I:
  in:
    A
  out:
    B
  relation:
    I(A) = I(B)
  spice:

% every property must have an input interface
component dac I:
  in:
    A
  out:
    B
  relation:
    I(B) = DAC(A)
  time:
    % the sampling rate in hertz
    sample: 10

% every property must have an output interface
components acd I:
   in:
    A
   out:
    B
   relation:
    ADC(B) = I(A)
   time:
    % the sampling rate in hertz
    sample: 10

component copy V:
  in:
    A
  out:
    B
  param:
    gain = 1
  relation:
    V(B) = gain*V(A)
  error:
    V(B) : V(A)*0.01 + 0.05

  constrain:
    magnitude V(*)-> 0 to 5
    magnitude I(*) -> 0 to 0.1

component imul:
  in:
    A
    B
  out:
    O
  relation:
    I(O) = I(A)*I(B)
  error:
    I(O) = I(

component dderiv:
  in:
    Ain
    Aout

  out:
    A with A(0) = Ain
    B with B(0) = Bin

  relation:
    deriv(I(A),t) = I(B) - T*I(A) with I(A)(0) = I(Ain)
    deriv(I(B),t) = I(A) - T*I(B) with I(B)(0) = I(Bin)

  error:
    I(A): deriv(A,t)*0.01 + 0.0001
    I(B): deriv(B,t)*0.01 + 0.0001

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
      dac[I]: 7
      adc[I]: 7
      copy I: 13

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
