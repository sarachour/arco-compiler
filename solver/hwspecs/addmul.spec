
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

component vinteg {
   in A;
   out O;
   param C;
   enforce | deriv(O.V) = A.V;
}


schematic main {
   in in1;
   in in2;
   out out0;

   elem add0: vadd2;
   elem mul0: vmul2;
   elem integ0: vinteg;
}