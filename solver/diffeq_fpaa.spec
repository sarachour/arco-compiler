
component vadd2 {
   in A;
   in B;
   out C;
   enforce | A.V = B;
}

component vmul2 {
   in A;
   in B;
   out C;
   param K;
}

schematic toplevel {
   wire w1_1;
   wire w1_2;
   wire w1_3;

   elem va0: vadd2;
   elem va1: vadd2;

   
}