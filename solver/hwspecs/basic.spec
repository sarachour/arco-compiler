
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



schematic main {
   wire v1; 
   wire v2;
   wire v3; 
   wire v4;

   in in1;
   in in2;
   out out0;

   wire h1; wire h2;
   wire h3; wire h4;
   wire h5; wire h6;

   elem add0: vadd2;
   elem mul0: vmul2;

   join v1 to add0.A;
   join v2 to add0.B;

   join v3 to mul0.A;
   join v4 to mul0.B;

   join h1 to in1 add0.O v1 v2 mul0.O v3 v4;
   join h2 to in2 add0.O v1 v2 mul0.O v3 v4;
   join h3 to out1 add0.O v1 v2 mul0.O v3 v4;

   
}