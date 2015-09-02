
component gain {
	param K;
	in X;
	out O;
	enforce | O.I = K.I*X.I;
}

component sub2 {
	in X;
	in Y;
	out O;
	enforce | O.I = X.I-Y.I;
}
component add2 {
	in X;
	in Y;
	out O;
	enforce | O.I = X.I + Y.I;
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
	enforce | deriv(ETOT.I) = kr3*(EFREE.I*(1/kd2*SFREE.I)^n - ETOT.I)-DEGRADE.I;
	enforce | EFREE.I = ESTART.I - efb_en*ETOT.I;
	enforce | SFREE.I = SSTART.I - sfb_en*ETOT.I;
}
