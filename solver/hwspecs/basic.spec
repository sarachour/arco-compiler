
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


schematic toplevel {
   
   elem in1 : input_port;
   elem in2 : input_port;
   elem in3 : input_port;
   elem out1 : output_port;
   
   in IN1 using in1;
   in IN2 using in2;
   in IN3 using in3;
   out OUT using out1;

   wire v1; 
   wire v2;
   wire v3; 
   wire v4;
   wire v5; 
   wire v6;

   wire h1; wire h2;
   wire h3; wire h4;
   wire h5; wire h6;

   elem add0: vadd2;
   elem mul0: vmul2;

   join v1 to add0.A;
   join v2 to add0.B;
   join v3 to add0.C;

   join v4 to mul0.A;
   join v5 to mul0.B;
   join v6 to mul0.C;

   join h1 to in1 v1 v2 v3 v4 v5 v6;
   join h2 to in2 v1 v2 v3 v4 v5 v6;
   join h3 to in3 v1 v2 v3 v4 v5 v6;
   join h4 to out1 v1 v2 v3 v4 v5 v6;
   join h5 to v1 v2 v3 v4 v5 v6;
   join h6 to v1 v2 v3 v4 v5 v6;

   
}