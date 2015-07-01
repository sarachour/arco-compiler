
component vadd2 {
   in A;
   in B;
   out C;
   enforce | C.V = B.V + A.V;
}

component vmul2 {
   in A;
   in B;
   out C;
   param K;
   enforce | C.V = K*B.V*A.V;
}
component vmul2 {
   in A;
   out B;
   param C;
   enforce | C*deriv(A.V - B.V) = B.I;
   enforce | A.I = B.I;
}

schematic toplevel {
   wire w1_1;
   wire w1_2;
   wire w1_3;

   elem va0: vadd2;
   elem va1: vadd2;

   
}