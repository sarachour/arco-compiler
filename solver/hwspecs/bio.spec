component igain {
	param K;
	in X;
	out O;
	enforce | O.I = K.V*X.I;
}

component isub2 {
	in X;
	in Y;
	out O;
	enforce | O.I = X.I-Y.I;
}
component iadd2 {
	in X;
	in Y;
	out O;
	enforce | O.I = X.I + Y.I;
}

component iintegadd {
    in IP;
    in IM;
    in IM2;
    out O;
    enforce | deriv(O.I) = IP.I - IM.I - IM2.I; 
}

component itf {
	in STOT;
	in ETOT;
	out SFREE;
	out TFREE;
	out TBND;
	param kd;
	param n;
	enforce | SFREE.I =  STOT.I - TBND.I;
	enforce | TFREE.I = 1/( ( (1/kd.V)*SFREE.I)^n.V + 1)*ETOT.I;
	enforce | TBND.I = TFREE.I*((1/kd.V)*SFREE.I)^n.V;
}

component tfdna {
	in SSTART;
	in ESTART;
	in DEGRADE;
	out EFREE;
	out SFREE;
	out ETOT;
	param n;
	param kd2;
	param kr3;
	param efb_en;
	param sfb_en;
	enforce | EFREE.I = ESTART.I - efb_en.V*ETOT.I;
	enforce | SFREE.I = SSTART.I - sfb_en.V*ETOT.I;
	enforce | deriv(ETOT.I) = (kr3.V)*( (EFREE.I)*((1/kd2.V)*SFREE.I)^(n.V) - ETOT.I)-DEGRADE.I;
	
	
}


schematic main {

   elem vadd2: iadd2;
   elem vgain: igain;
   elem vsub2: isub2;
   elem vintegadd: iintegadd;
   elem vitf: itf;
   elem vtfdna: tfdna;
   
}

