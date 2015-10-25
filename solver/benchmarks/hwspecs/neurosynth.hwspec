% neuro synth
% synthetic neurological circuits: A Library of Analog Operators Based on the
% Hodgkin-Huxley Formalism for the design of Tunable, Real-time silicon neurons
type V
type mV
type ms
type uA

prop V : mV,V
prop I : uA
prop t : ms

param Vcc : V = 5
param Vbias : V = 2.5

%thermal voltage at room temperature
param Ut : mV = 26




% consumes 2.3 mW
comp sigmoid
  input offset where V:mV
  input slope where V:mV

  input bias where V:mV
  input vcc where V:mV

  local sig where V:mV

  output ACT where V:mV
  output INACT where V:mV

  param Isig : uA = 20
  param r : kohm = 100
  param R : kohm = 0.01

  ensure mag V(offset) in (-100,100)
  ensure mag V(slope) in (2,20)
  ensure mag V(ACT) in (2,3): V
  ensure mag V(INACT) in (2,3) : V
  ensure mag V(M) in (2,3) : V

  rel V(SIG) = -(r/R)*(Vbias/V(slope))*(V(M) - V(offset))

  rel I(ACT) = Isig/(1 + exp(V(sig) / Ut) )
  rel I(INACT) = Isig/(1 + exp(-V(sig) / Ut) )
end

% consumes 1.4 mW
comp integ1
  input Ia

  % controlled gain
  param AVt =

  assume time 1 t = 1 ms
  ensure time in (0.2,10) : ms 


end
