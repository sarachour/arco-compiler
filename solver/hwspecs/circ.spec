component resistor {
   in X;
   out O;
   param R;
   enforce | X.V - O.V = X.I * R 
   enforce | X.I = O.I
}

component capacitor {
   in X;
   out O;
   param C;
   enforce | O.I = C*deriv(X.V - O.V)
   enforce | X.I = O.I
}

component currentgenerator {
   in X;
   out O;
   param K;
   enforce | O.I := K*X.V
}

switch circelem {
   in X;
   out O;

   comp currentgenerator CG;
   comp capacitor CAP;
   comp resistor R;
   comp parallel2 WP;
   comp serial2 WS;

   join CG.X with X;
   join CG.O with O;
   
   join CAP.X with X;
   join CAP.O with O;

   join R.X with X;
   join R.O with O;

   join WP.X with X;
   join WP.O with O;

   join WS.X with X;
   join WS.O with O;
}

aggregate serial2 {
   in X;
   out O;
   comp circelem A;
   comp circelem B;
   enforce | X.V - O.V = (A.X.V - A.O.V) + (B.X.V - B.O.V)
}

aggregate parallel2 {
   in X;
   out O;
   comp circelem A;
   comp circelem B;

   enforce | X.I = A.X.I + B.X.I
   enforce | O.I = A.X.I + B.O.I
   enforce | X.V - O.V = A.X.V - A.O.V
   enforce | X.V - O.V = B.X.V - B.O.V
}

component ground {
   in X;
   enforce | X.V = 0
}