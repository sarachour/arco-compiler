
component vadd2 {
   in A;
   in B;
   out O;
   relation: O.V = B.V + A.V;
   spice: "X$name $A $B $O vadd2";
}

component vmul2 {
   in A;
   in B;
   out O;
   relation: O.V = B.V*A.V;
   spice: "X$name $A $B $O vmul2";
}

#component vinteg {
#   in A;
#    I: 100pA - 1 uA
#    V: 0 V - 5 V
#   out O;
#   param C;
#   relation: deriv(O.V) = A.V;
#   spice: Xname A C O vinteg
#   error: \hat O = beta*O + alpha
#}

component vinteg {
    in A;
    out O;
    relation: deriv(O.V) = A.V;
    spice: "X$name $A $O vadd2";
}

component vintegsum {
   in A;
   in B;
   out O;
   relation: deriv(O.V) = A.V + B.V;
   spice: "X$name $A $B $O vadd2";
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
