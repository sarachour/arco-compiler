
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
component capac {
   in A;
   out B;
   param C;
   enforce | B.I = C*deriv(A.V - B.V);
   enforce | A.I = B.I;
}

schematic toplevel {
   wire v1;
   wire v2;
   wire v3;

   wire v4;
   wire v5;
   wire v6;

   wire v7;
   wire v8;

   wire h1;
   wire h2;
   wire h3;

   elem add0: vadd2;
   elem mul0: vmul2;
   elem cap0: capac;

   join add0.A to v1
   join add0.B to v2
   join add0.C to v3

   join mul0.A to v4
   join mul0.B to v5
   join mul0.C to v6

   join cap0.A to v7
   join cap0.B to v8

   join h1 to v1 v2 v3 v4 v5 v6 v7 v8
   join h2 to v1 v2 v3 v4 v5 v6 v7 v8
   join h3 to v1 v2 v3 v4 v5 v6 v7 v8

   

   
}