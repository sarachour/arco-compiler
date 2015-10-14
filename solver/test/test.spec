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

% analogous -> unit

prop:
    V : mV,V
    I : mA,A

time t : usec


% every property must have a copy construc->r
component copy I:
  in:
    A : port
  out:
    B : port

  ensure:
    mag V(*) | 0 -> 5 : V
    mag I(*) | 0 -> 1 : mA

  assume:
    rel I(B) := I(A)
    rel V(B) := 5V
    error V[B] | 0
    error I[B] | I(A)*0.00001 + 0.00001

  spice:
    prefix: X
    args: A B icopy

% every property must have an input interface
% 7 bit digital number, (log (3 bits whether number is 1-10,10-100,100-1000)+ linear (4 bits)) 10 micro ampere - 100 pico ampere
% 0.3 millisecond
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
    mag I(B) | 0 -> 1 : mA
    mag V(B) | 0 -> 5 : V

  spice:
    prefix: V
    args: B 0 DC 5

% every property must have an output interface
% rate, 2 ms
% digital rep -> read 1's and zeroes for fixed amount of time and then you sum then
% entire current range is mapped into 10000, quantization error (sample less points, sample faster)
% convert to dac representation
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
     mag I(A) | 0 -> 1 : mA
     mag V(A) | 0 -> 5 : V

   spice:
     prefix: R
     args: A 0 0

%
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
    V(*) | 0 -> 5 : V
    I(*) | 0 -> 1 : mA

  spice:
    prefix: X
    args: A B O imul

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
    V(*) | 0 -> 5 : V
    I(*) | 0 -> 1 : mA

  spice:
    prefix: X
    args: A B O iadd

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
    time | 1 usec

  ensure:
    % the operating ranges for the circuit.
    magnitude V(*) | 0 -> 5 : V
    magnitude I(*) | 0 -> 0.1 : mA

% time constant is fixed in the chip -> 1 msec (tau)
% maximum speed is 1 msec
constrain circuit:
    count:
      dderiv: 1
      imul: 6
      iadd: 6
      dac(I): 7
      adc(I): 7
      copy(I): 100

    ensure:
      % copy 0:2 must have only dderiv.A as input
      copy.I(A)[0:2] <-> dderiv(A)[0]
      copy.I(A)[3:5] <-> dderiv(B)[0]

      % copy 6:8 must copy the output of one of the imuls
      copy.I(A)[6:8] <-> imul(O)[*]

      % any dderiv input must come from a dac
      dderiv(*)[*] <-> input.I(B)[*]
      imul(*)[*] <-> input.I(B)[*]

      % any dderiv output must go -> an adc
      dderiv(*)[*] <-> output.I(A)[*]

      mag I(*) -> 0.0001*T  + 0.0001 -> 1 : mA
      mag V(*) -> 0 -> 5 : V
