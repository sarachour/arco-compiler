(set-logic QF_NRA)
(declare-fun __minima__ () Real)
(declare-fun sc_0 () Real)
(declare-fun of_0 () Real)
(declare-fun sc_1 () Real)
(declare-fun of_1 () Real)
(assert (= sc_1 1))
(assert (= of_1 0))
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_1 sc_0))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_1 of_0))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_0 0.) of_0) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_0 0.) of_0) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_1 0.) of_1) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_1 0.) of_1) 0.))
(declare-fun sc_2 () Real)
(declare-fun of_2 () Real)
(declare-fun sc_3 () Real)
(declare-fun of_3 () Real)
(assert (= sc_3 1))
(assert (= of_3 0))
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_3 sc_2))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_3 of_2))
; 
; >=  {((sc.input.I[7].X*1.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_2 1.) of_2) 10.))
; 
; <=  {((sc.input.I[7].X*1.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_2 1.) of_2) 0.))
; 
; >=  {((sc.input.I[7].O*1.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_3 1.) of_3) 10.))
; 
; <=  {((sc.input.I[7].O*1.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_3 1.) of_3) 0.))
(declare-fun sc_4 () Real)
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(declare-fun of_5 () Real)
(assert (= sc_5 1))
(assert (= of_5 0))
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_5 sc_4))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_5 of_4))
; 
; >=  {((sc.input.I[0].X*0.11)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_4 0.11) of_4) 10.))
; 
; <=  {((sc.input.I[0].X*0.11)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_4 0.11) of_4) 0.))
; 
; >=  {((sc.input.I[0].O*0.11)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_5 0.11) of_5) 10.))
; 
; <=  {((sc.input.I[0].O*0.11)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_5 0.11) of_5) 0.))
(declare-fun sc_6 () Real)
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(declare-fun of_7 () Real)
(assert (= sc_7 1))
(assert (= of_7 0))
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_7 sc_6))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_7 of_6))
; 
; >=  {((sc.input.I[6].X*1.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_6 1.) of_6) 10.))
; 
; <=  {((sc.input.I[6].X*1.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_6 1.) of_6) 0.))
; 
; >=  {((sc.input.I[6].O*1.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_7 1.) of_7) 10.))
; 
; <=  {((sc.input.I[6].O*1.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_7 1.) of_7) 0.))
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
(assert (= sc_9 1))
(assert (= of_9 0))
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_9 sc_8))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_9 of_8))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_8 0.) of_8) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_8 0.) of_8) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_9 0.) of_9) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_9 0.) of_9) 0.))
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
(assert (= sc_11 1))
(assert (= of_11 0))
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_11 sc_10))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_11 of_10))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_10 0.) of_10) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_10 0.) of_10) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_11 0.) of_11) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
(assert (= sc_13 1))
(assert (= of_13 0))
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_13 sc_12))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_13 of_12))
; 
; >=  {((sc.input.I[5].X*0.15)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_12 0.15) of_12) 10.))
; 
; <=  {((sc.input.I[5].X*0.15)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_12 0.15) of_12) 0.))
; 
; >=  {((sc.input.I[5].O*0.15)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_13 0.15) of_13) 10.))
; 
; <=  {((sc.input.I[5].O*0.15)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_13 0.15) of_13) 0.))
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
(assert (= sc_15 1))
(assert (= of_15 0))
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_15 sc_14))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_15 of_14))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
(declare-fun sc_16 () Real)
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(declare-fun of_17 () Real)
(assert (= sc_17 1))
(assert (= of_17 0))
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_17 sc_16))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_17 of_16))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X)} {0.0001}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) 0.0001))
; 
; =  {(((sc.output.V[2].X*1.)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_16 1.) of_16) sltop_16) 3300.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 0.0001))
; 
; =  {(((sc.output.V[2].O*1.)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_17 1.) of_17) sltop_17) 3300.))
(declare-fun sc_18 () Real)
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(declare-fun of_19 () Real)
(assert (= sc_19 1))
(assert (= of_19 0))
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_19 sc_18))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_19 of_18))
(declare-fun slbot_18 () Real)
(declare-fun sltop_18 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_18 0.) of_18) slbot_18) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_18 1.) of_18) sltop_18) 3300.))
(declare-fun slbot_19 () Real)
(declare-fun sltop_19 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_19 1.) of_19) sltop_19) 3300.))
(declare-fun sc_20 () Real)
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(declare-fun of_21 () Real)
(assert (= sc_21 1))
(assert (= of_21 0))
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_21 sc_20))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_21 of_20))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.0001))
; 
; =  {(((sc.output.V[1].X*1.)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_20 1.) of_20) sltop_20) 3300.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) 0.0001))
; 
; =  {(((sc.output.V[1].O*1.)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_21 1.) of_21) sltop_21) 3300.))
(declare-fun sc_22 () Real)
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(declare-fun of_29 () Real)
(assert (= sc_27 1))
(assert (= of_27 0))
; 
; =  {sc.mm[0].X} {sc.mm[0].Xtot}
(assert (= sc_27 sc_26))
; 
; =  {of.mm[0].X} {(of.mm[0].Xtot-of.mm[0].XY)}
(assert (= of_27 (- of_26 of_28)))
(assert (= sc_28 1))
(assert (= of_28 0))
; 
; =  {sc.mm[0].XY} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_28 (* (* sc_25 sc_27) sc_29)))
(assert (= of_28 0))
(assert (= 0. 0))
; 
; =  {sc.mm[0].XY0} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_23 (* (* sc_25 sc_27) sc_29)))
; 
; =  {of.mm[0].XY0} {(0-0)}
(assert (= of_23 0.))
(assert (= sc_29 1))
(assert (= of_29 0))
; 
; =  {sc.mm[0].Y} {sc.mm[0].Ytot}
(assert (= sc_29 sc_24))
; 
; =  {of.mm[0].Y} {(of.mm[0].Ytot-of.mm[0].XY)}
(assert (= of_29 (- of_24 of_28)))
; 
; >=  {((sc.mm[0].kr*1.)+of.mm[0].kr)} {10.}
(assert (<= (+ (* sc_22 1.) of_22) 10.))
; 
; <=  {((sc.mm[0].kr*1.)+of.mm[0].kr)} {0.0001}
(assert (>= (+ (* sc_22 1.) of_22) 0.0001))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.mm[0].X*0.)+of.mm[0].X)+sl.min.mm[0].X)} {-0.9999}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) -0.9999))
; 
; =  {(((sc.mm[0].X*1.)+of.mm[0].X)+sl.max.mm[0].X)} {3300.}
(assert (= (+ (+ (* sc_27 1.) of_27) sltop_27) 3300.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.mm[0].XY*0.)+of.mm[0].XY)+sl.min.mm[0].XY)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.))
; 
; =  {(((sc.mm[0].XY*1.)+of.mm[0].XY)+sl.max.mm[0].XY)} {1.}
(assert (= (+ (+ (* sc_28 1.) of_28) sltop_28) 1.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.mm[0].Y*0.)+of.mm[0].Y)+sl.min.mm[0].Y)} {-0.9999}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) -0.9999))
; 
; =  {(((sc.mm[0].Y*1.)+of.mm[0].Y)+sl.max.mm[0].Y)} {3300.}
(assert (= (+ (+ (* sc_29 1.) of_29) sltop_29) 3300.))
; 
; >=  {((sc.mm[0].XY0*0.)+of.mm[0].XY0)} {3300.}
(assert (<= (+ (* sc_23 0.) of_23) 3300.))
; 
; <=  {((sc.mm[0].XY0*0.)+of.mm[0].XY0)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
; 
; >=  {((sc.mm[0].Ytot*0.11)+of.mm[0].Ytot)} {3300.}
(assert (<= (+ (* sc_24 0.11) of_24) 3300.))
; 
; <=  {((sc.mm[0].Ytot*0.11)+of.mm[0].Ytot)} {0.0001}
(assert (>= (+ (* sc_24 0.11) of_24) 0.0001))
; 
; >=  {((sc.mm[0].Xtot*0.15)+of.mm[0].Xtot)} {3300.}
(assert (<= (+ (* sc_26 0.15) of_26) 3300.))
; 
; <=  {((sc.mm[0].Xtot*0.15)+of.mm[0].Xtot)} {0.0001}
(assert (>= (+ (* sc_26 0.15) of_26) 0.0001))
; 
; >=  {((sc.mm[0].kf*1.)+of.mm[0].kf)} {10.}
(assert (<= (+ (* sc_25 1.) of_25) 10.))
; 
; <=  {((sc.mm[0].kf*1.)+of.mm[0].kf)} {0.0001}
(assert (>= (+ (* sc_25 1.) of_25) 0.0001))
(declare-fun sc_30 () Real)
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(declare-fun of_31 () Real)
(assert (= sc_31 1))
(assert (= of_31 0))
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_31 sc_30))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_31 of_30))
; 
; >=  {((sc.input.V[2].X*0.15)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_30 0.15) of_30) 5.))
; 
; <=  {((sc.input.V[2].X*0.15)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_30 0.15) of_30) 0.))
; 
; >=  {((sc.input.V[2].O*0.15)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_31 0.15) of_31) 5.))
; 
; <=  {((sc.input.V[2].O*0.15)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_31 0.15) of_31) 0.))
(declare-fun sc_32 () Real)
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(declare-fun of_33 () Real)
(assert (= sc_33 1))
(assert (= of_33 0))
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_33 sc_32))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_33 of_32))
; 
; >=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_32 0.11) of_32) 5.))
; 
; <=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_32 0.11) of_32) 0.))
; 
; >=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_33 0.11) of_33) 5.))
; 
; <=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_33 0.11) of_33) 0.))
(declare-fun sc_34 () Real)
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(declare-fun of_35 () Real)
(assert (= sc_35 1))
(assert (= of_35 0))
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_35 sc_34))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_35 of_34))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_34 0.) of_34) 5.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_35 0.) of_35) 5.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun sc_36 () Real)
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(declare-fun of_40 () Real)
(assert (= sc_40 1))
(assert (= of_40 0))
; 
; =  {sc.iadd[2].OUT} {sc.iadd[2].A}
(assert (= sc_40 sc_38))
; 
; =  {of.iadd[2].OUT} {((of.iadd[2].A+of.iadd[2].B)-of.iadd[2].C-of.iadd[2].D)}
(assert (= of_40 (- (+ of_38 of_39) (+ of_37 of_36))))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.iadd[2].D*0.)+of.iadd[2].D)+sl.min.iadd[2].D)} {0.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.))
; 
; =  {(((sc.iadd[2].D*1.)+of.iadd[2].D)+sl.max.iadd[2].D)} {5.}
(assert (= (+ (+ (* sc_36 1.) of_36) sltop_36) 5.))
; 
; >=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {5.}
(assert (<= (+ (* sc_37 0.) of_37) 5.))
; 
; <=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) -10.))
; 
; =  {(((sc.iadd[2].OUT*1.)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_40 1.) of_40) sltop_40) 10.))
; 
; >=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {5.}
(assert (<= (+ (* sc_38 0.) of_38) 5.))
; 
; <=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.iadd[2].B*0.15)+of.iadd[2].B)} {5.}
(assert (<= (+ (* sc_39 0.15) of_39) 5.))
; 
; <=  {((sc.iadd[2].B*0.15)+of.iadd[2].B)} {0.}
(assert (>= (+ (* sc_39 0.15) of_39) 0.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) -10.))
; 
; =  {(((sc.iadd[2].OUT*1.)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_40 1.) of_40) sltop_40) 10.))
(declare-fun sc_41 () Real)
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(assert (= sc_45 1))
(assert (= of_45 0))
; 
; =  {sc.iadd[1].OUT} {sc.iadd[1].A}
(assert (= sc_45 sc_43))
; 
; =  {of.iadd[1].OUT} {((of.iadd[1].A+of.iadd[1].B)-of.iadd[1].C-of.iadd[1].D)}
(assert (= of_45 (- (+ of_43 of_44) (+ of_42 of_41))))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.iadd[1].D*0.)+of.iadd[1].D)+sl.min.iadd[1].D)} {0.}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) 0.))
; 
; =  {(((sc.iadd[1].D*1.)+of.iadd[1].D)+sl.max.iadd[1].D)} {5.}
(assert (= (+ (+ (* sc_41 1.) of_41) sltop_41) 5.))
; 
; >=  {((sc.iadd[1].C*0.)+of.iadd[1].C)} {5.}
(assert (<= (+ (* sc_42 0.) of_42) 5.))
; 
; <=  {((sc.iadd[1].C*0.)+of.iadd[1].C)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) -10.))
; 
; =  {(((sc.iadd[1].OUT*1.)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_45 1.) of_45) sltop_45) 10.))
; 
; >=  {((sc.iadd[1].A*0.11)+of.iadd[1].A)} {5.}
(assert (<= (+ (* sc_43 0.11) of_43) 5.))
; 
; <=  {((sc.iadd[1].A*0.11)+of.iadd[1].A)} {0.}
(assert (>= (+ (* sc_43 0.11) of_43) 0.))
; 
; >=  {((sc.iadd[1].B*0.)+of.iadd[1].B)} {5.}
(assert (<= (+ (* sc_44 0.) of_44) 5.))
; 
; <=  {((sc.iadd[1].B*0.)+of.iadd[1].B)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) -10.))
; 
; =  {(((sc.iadd[1].OUT*1.)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_45 1.) of_45) sltop_45) 10.))
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(assert (= sc_47 1))
(assert (= of_47 0))
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_47 sc_46))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_47 of_46))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 0.))
; 
; =  {(((sc.output.I[0].X*1.)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_46 1.) of_46) sltop_46) 10.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47) 0.))
; 
; =  {(((sc.output.I[0].O*1.)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_47 1.) of_47) sltop_47) 10.))
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
(assert (= sc_49 1))
(assert (= of_49 0))
; 
; =  {sc.output.I[1].O} {sc.output.I[1].X}
(assert (= sc_49 sc_48))
; 
; =  {of.output.I[1].O} {of.output.I[1].X}
(assert (= of_49 of_48))
(declare-fun slbot_48 () Real)
(declare-fun sltop_48 () Real)
; 
; =  {(((sc.output.I[1].X*0.)+of.output.I[1].X)+sl.min.output.I[1].X)} {0.}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48) 0.))
; 
; =  {(((sc.output.I[1].X*1.)+of.output.I[1].X)+sl.max.output.I[1].X)} {10.}
(assert (= (+ (+ (* sc_48 1.) of_48) sltop_48) 10.))
(declare-fun slbot_49 () Real)
(declare-fun sltop_49 () Real)
; 
; =  {(((sc.output.I[1].O*0.)+of.output.I[1].O)+sl.min.output.I[1].O)} {0.}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49) 0.))
; 
; =  {(((sc.output.I[1].O*1.)+of.output.I[1].O)+sl.max.output.I[1].O)} {10.}
(assert (= (+ (+ (* sc_49 1.) of_49) sltop_49) 10.))
; 
; =  {sc.input.I[6].O} {sc.mm[0].kr}
(assert (= sc_7 sc_22))
; 
; =  {of.input.I[6].O} {of.mm[0].kr}
(assert (= of_7 of_22))
; 
; =  {sc.input.I[0].O} {sc.iadd[1].A}
(assert (= sc_5 sc_43))
; 
; =  {of.input.I[0].O} {of.iadd[1].A}
(assert (= of_5 of_43))
; 
; =  {sc.input.I[3].O} {sc.iadd[2].C}
(assert (= sc_9 sc_37))
; 
; =  {of.input.I[3].O} {of.iadd[2].C}
(assert (= of_9 of_37))
; 
; =  {sc.input.I[4].O} {sc.iadd[2].A}
(assert (= sc_11 sc_38))
; 
; =  {of.input.I[4].O} {of.iadd[2].A}
(assert (= of_11 of_38))
; 
; =  {sc.input.I[5].O} {sc.iadd[2].B}
(assert (= sc_13 sc_39))
; 
; =  {of.input.I[5].O} {of.iadd[2].B}
(assert (= of_13 of_39))
; 
; =  {sc.mm[0].X} {sc.output.V[1].X}
(assert (= sc_27 sc_20))
; 
; =  {of.mm[0].X} {of.output.V[1].X}
(assert (= of_27 of_20))
; 
; =  {sc.mm[0].Y} {sc.output.V[0].X}
(assert (= sc_29 sc_18))
; 
; =  {of.mm[0].Y} {of.output.V[0].X}
(assert (= of_29 of_18))
; 
; =  {sc.input.I[2].O} {sc.iadd[1].C}
(assert (= sc_1 sc_42))
; 
; =  {of.input.I[2].O} {of.iadd[1].C}
(assert (= of_1 of_42))
; 
; =  {sc.input.V[2].O} {sc.mm[0].Xtot}
(assert (= sc_31 sc_26))
; 
; =  {of.input.V[2].O} {of.mm[0].Xtot}
(assert (= of_31 of_26))
; 
; =  {sc.iadd[1].OUT} {sc.output.I[0].X}
(assert (= sc_45 sc_46))
; 
; =  {of.iadd[1].OUT} {of.output.I[0].X}
(assert (= of_45 of_46))
; 
; =  {sc.input.I[1].O} {sc.iadd[1].B}
(assert (= sc_15 sc_44))
; 
; =  {of.input.I[1].O} {of.iadd[1].B}
(assert (= of_15 of_44))
; 
; =  {sc.input.I[7].O} {sc.mm[0].kf}
(assert (= sc_3 sc_25))
; 
; =  {of.input.I[7].O} {of.mm[0].kf}
(assert (= of_3 of_25))
; 
; =  {sc.input.V[1].O} {sc.mm[0].XY0}
(assert (= sc_35 sc_23))
; 
; =  {of.input.V[1].O} {of.mm[0].XY0}
(assert (= of_35 of_23))
; 
; =  {sc.iadd[2].OUT} {sc.output.I[1].X}
(assert (= sc_40 sc_48))
; 
; =  {of.iadd[2].OUT} {of.output.I[1].X}
(assert (= of_40 of_48))
; 
; =  {sc.mm[0].XY} {sc.iadd[1].D}
(assert (= sc_28 sc_41))
; 
; =  {of.mm[0].XY} {of.iadd[1].D}
(assert (= of_28 of_41))
; 
; =  {sc.mm[0].XY} {sc.output.V[2].X}
(assert (= sc_28 sc_16))
; 
; =  {of.mm[0].XY} {of.output.V[2].X}
(assert (= of_28 of_16))
; 
; =  {sc.mm[0].XY} {sc.iadd[2].D}
(assert (= sc_28 sc_36))
; 
; =  {of.mm[0].XY} {of.iadd[2].D}
(assert (= of_28 of_36))
; 
; =  {sc.input.V[0].O} {sc.mm[0].Ytot}
(assert (= sc_33 sc_24))
; 
; =  {of.input.V[0].O} {of.mm[0].Ytot}
(assert (= of_33 of_24))
(assert (<= (* sc_17 0.001) 0.001))
; 
; =  {sc.mm[0].XY} {sc.output.V[2].O}
(assert (= sc_28 sc_17))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= sltop_36 0) sltop_36 (- sltop_36)) 1.) (* (ite (>= slbot_29 0) slbot_29 (- slbot_29)) 1.)) (* (ite (>= sltop_18 0) sltop_18 (- sltop_18)) 1.)) (* (ite (>= sltop_41 0) sltop_41 (- sltop_41)) 1.)) (* (ite (>= slbot_16 0) slbot_16 (- slbot_16)) 1.)) (* (ite (>= slbot_49 0) slbot_49 (- slbot_49)) 1.)) (* (ite (>= slbot_20 0) slbot_20 (- slbot_20)) 1.)) (* (ite (>= sltop_27 0) sltop_27 (- sltop_27)) 1.)) (* (ite (>= slbot_19 0) slbot_19 (- slbot_19)) 1.)) (* (ite (>= slbot_46 0) slbot_46 (- slbot_46)) 1.)) (* (ite (>= sltop_28 0) sltop_28 (- sltop_28)) 1.)) (* (ite (>= slbot_17 0) slbot_17 (- slbot_17)) 1.)) (* (ite (>= sltop_29 0) sltop_29 (- sltop_29)) 1.)) (* (ite (>= sltop_49 0) sltop_49 (- sltop_49)) 1.)) (* (ite (>= slbot_36 0) slbot_36 (- slbot_36)) 1.)) (* (ite (>= slbot_18 0) slbot_18 (- slbot_18)) 1.)) (* (ite (>= slbot_41 0) slbot_41 (- slbot_41)) 1.)) (* (ite (>= sltop_20 0) sltop_20 (- sltop_20)) 1.)) (* (ite (>= slbot_28 0) slbot_28 (- slbot_28)) 1.)) (* (ite (>= sltop_16 0) sltop_16 (- sltop_16)) 1.)) (* (ite (>= slbot_21 0) slbot_21 (- slbot_21)) 1.)) (* (ite (>= slbot_45 0) slbot_45 (- slbot_45)) 1.)) (* (ite (>= slbot_48 0) slbot_48 (- slbot_48)) 1.)) (* (ite (>= sltop_47 0) sltop_47 (- sltop_47)) 1.)) (* (ite (>= sltop_19 0) sltop_19 (- sltop_19)) 1.)) (* (ite (>= sltop_45 0) sltop_45 (- sltop_45)) 1.)) (* (ite (>= sltop_48 0) sltop_48 (- sltop_48)) 1.)) (* (ite (>= sltop_46 0) sltop_46 (- sltop_46)) 1.)) (* (ite (>= sltop_17 0) sltop_17 (- sltop_17)) 1.)) (* (ite (>= sltop_40 0) sltop_40 (- sltop_40)) 1.)) (* (ite (>= slbot_47 0) slbot_47 (- slbot_47)) 1.)) (* (ite (>= slbot_27 0) slbot_27 (- slbot_27)) 1.)) (* (ite (>= slbot_40 0) slbot_40 (- slbot_40)) 1.)) (* (ite (>= sltop_21 0) sltop_21 (- sltop_21)) 1.))))
(check-sat)
