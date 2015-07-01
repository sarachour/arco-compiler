
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

   wire h1;
   wire h2;
   wire h3;

   elem add0: vadd2;
   elem mul0: vmul2;

   join add0.A v1
   join add0.B v2
   join add0.C v3

   join mul0.A v4
   join mul0.B v5
   join mul0.C v6

   join h1 v1
   join h1 v2
   join h1 v3
   join h1 v4
   join h1 v5
   join h1 v6
   
   

   
}