component res3 {
   in X;
   out O;
   param R=3;
   enforce | X.V - O.V = R*X.I;
   enforce | X.I = O.I;
}

component gnd {
   in X;
   enforce | X.V = 0;
}

component volt {
   in X;
   out O;
   enforce | Q.V := 5*X.V
}

component curr2volt {
   in X;
   out O;
   enforce | O.I := X.V
}
schematic main {
   in in1;
   in in2;
   out out0;

   elem vgen: volt;
   elem ground: gnd;
   elem resistor: res3;
   elem conv: curr2volt;
}