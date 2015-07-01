
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


schematic toplevel {
   in IN1;
   in IN2;
   in IN3;
   out OUT1;
   
   wire v1; wire v2;
   wire v3; wire v4;
   wire v5; wire v6;

   wire h1; wire h2;
   wire h3; wire h4;
   wire h5; wire h6;

   elem add0: vadd2;
   elem mul0: vmul2;

   join v1 to add0.A
   join v2 to add0.B
   join v3 to add0.C

   join v4 to mul0.A
   join v5 to mul0.B
   join v6 to mul0.C

   join h1 to IN1 v1 v2 v3 v4 v5 v6
   join h2 to IN2 v1 v2 v3 v4 v5 v6
   join h3 to IN3 v1 v2 v3 v4 v5 v6
   join h4 to OUT1 v1 v2 v3 v4 v5 v6
   join h5 to v1 v2 v3 v4 v5 v6
   join h6 to v1 v2 v3 v4 v5 v6

   
}