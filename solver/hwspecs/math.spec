
component vadd2 {
   in A;
   in B;
   out O;
   enforce | O.V = B.V + A.V;
}

component vmul2 {
   in A;
   in B;
   out O;
   param K;
   enforce | O.V = K*B.V*A.V;
}

#component vinteg {
#   in A;
#    I: 100pA - 1 uA
#    V: 0 V - 5 V
#   out O;
#   param C;
#   enforce | deriv(O.V) = A.V;
#   spice | Xname A C O vinteg
#   error | \hat O = beta*O + alpha
#}

component vinteg {
    in A;
    out O;
    param C;
    enforce | deriv(O.V) = A.V;
}

component vintegsum {
   in A;
   in B;
   out O;
   enforce | deriv(O.V) = A.V + B.V;
}


schematic main {

   in in1;
   in in2;
   out out0;


   elem add0: vadd2;
   elem mul0: vmul2;
   elem integ0: vinteg;
   elem integsum: vintegsum;



}
