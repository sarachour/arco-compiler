(set-logic QF_NRA)
(declare-fun __minima__ () Real)
(declare-fun sc_0 () Real)
(assert (> sc_0 1e-08))
(declare-fun of_0 () Real)
(declare-fun sc_1 () Real)
(assert (> sc_1 1e-08))
(declare-fun of_1 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_1 sc_0))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_1 of_0))
; 
; >=  {((sc.input.I[2].X*0.15)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_0 0.15) of_0) 10.))
; 
; <=  {((sc.input.I[2].X*0.15)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_0 0.15) of_0) 0.))
; 
; >=  {((sc.input.I[2].O*0.15)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_1 0.15) of_1) 10.))
; 
; <=  {((sc.input.I[2].O*0.15)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_1 0.15) of_1) 0.))
(declare-fun sc_2 () Real)
(assert (> sc_2 1e-08))
(declare-fun of_2 () Real)
(declare-fun sc_3 () Real)
(assert (> sc_3 1e-08))
(declare-fun of_3 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_3 sc_2))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_3 of_2))
; 
; >=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_2 0.) of_2) 10.))
; 
; <=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_2 0.) of_2) 0.))
; 
; >=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_3 0.) of_3) 10.))
; 
; <=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_3 0.) of_3) 0.))
(declare-fun sc_4 () Real)
(assert (> sc_4 1e-08))
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(assert (> sc_5 1e-08))
(declare-fun of_5 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_5 sc_4))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_5 of_4))
; 
; >=  {((sc.input.I[3].X*1.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_4 1.) of_4) 10.))
; 
; <=  {((sc.input.I[3].X*1.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_4 1.) of_4) 0.))
; 
; >=  {((sc.input.I[3].O*1.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_5 1.) of_5) 10.))
; 
; <=  {((sc.input.I[3].O*1.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_5 1.) of_5) 0.))
(declare-fun sc_6 () Real)
(assert (> sc_6 1e-08))
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_7 sc_6))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_7 of_6))
; 
; >=  {((sc.input.I[4].X*1.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_6 1.) of_6) 10.))
; 
; <=  {((sc.input.I[4].X*1.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_6 1.) of_6) 0.))
; 
; >=  {((sc.input.I[4].O*1.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_7 1.) of_7) 10.))
; 
; <=  {((sc.input.I[4].O*1.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_7 1.) of_7) 0.))
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_9 sc_8))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_9 of_8))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_8 0.) of_8) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_8 0.) of_8) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_9 0.) of_9) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_9 0.) of_9) 0.))
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_11 sc_10))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_11 of_10))
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X)} {0.0001}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10) 0.0001))
; 
; =  {(((sc.output.V[2].X*0.11)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_10 0.11) of_10) sltop_10) 3300.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 0.0001))
; 
; =  {(((sc.output.V[2].O*0.11)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_11 0.11) of_11) sltop_11) 3300.))
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_13 sc_12))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_13 of_12))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.0001))
; 
; =  {(((sc.output.V[0].X*0.11)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_12 0.11) of_12) sltop_12) 3300.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.11)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_13 0.11) of_13) sltop_13) 3300.))
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_15 sc_14))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_15 of_14))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14) 0.0001))
; 
; =  {(((sc.output.V[1].X*0.15)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_14 0.15) of_14) sltop_14) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.15)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_15 0.15) of_15) sltop_15) 3300.))
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
; 
; =  {sc.mm[0].Xtot} {sc.mm[0].XY}
(assert (= sc_20 sc_22))
; 
; =  {sc.mm[0].X} {sc.mm[0].Xtot}
(assert (= sc_21 sc_20))
; 
; =  {of.mm[0].X} {(of.mm[0].Xtot-of.mm[0].XY)}
(assert (= of_21 (- of_20 of_22)))
; no scale
(assert (= sc_16 1.))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= of_19 0.))
; no offset
(assert (= of_21 0.))
; no offset
(assert (= of_23 0.))
; 
; =  {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)} {(sc.mm[0].kr*sc.mm[0].XY)}
(assert (= (* (* sc_19 sc_21) sc_23) (* sc_16 sc_22)))
; 
; =  {sc.mm[0].XY} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_22 (* (* sc_19 sc_21) sc_23)))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.mm[0].XY0} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_17 (* (* sc_19 sc_21) sc_23)))
; 
; =  {of.mm[0].XY0} {(0.-0.)}
(assert (= of_17 0.))
; 
; =  {sc.mm[0].Ytot} {sc.mm[0].XY}
(assert (= sc_18 sc_22))
; 
; =  {sc.mm[0].Y} {sc.mm[0].Ytot}
(assert (= sc_23 sc_18))
; 
; =  {of.mm[0].Y} {(of.mm[0].Ytot-of.mm[0].XY)}
(assert (= of_23 (- of_18 of_22)))
; 
; >=  {((sc.mm[0].kr*1.)+of.mm[0].kr)} {10.}
(assert (<= (+ (* sc_16 1.) of_16) 10.))
; 
; <=  {((sc.mm[0].kr*1.)+of.mm[0].kr)} {0.0001}
(assert (>= (+ (* sc_16 1.) of_16) 0.0001))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.mm[0].X*0.)+of.mm[0].X)+sl.min.mm[0].X)} {-3299.9999}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) -3299.9999))
; 
; =  {(((sc.mm[0].X*0.15)+of.mm[0].X)+sl.max.mm[0].X)} {3300.}
(assert (= (+ (+ (* sc_21 0.15) of_21) sltop_21) 3300.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.mm[0].XY*0.)+of.mm[0].XY)+sl.min.mm[0].XY)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.mm[0].XY*0.11)+of.mm[0].XY)+sl.max.mm[0].XY)} {3300.}
(assert (= (+ (+ (* sc_22 0.11) of_22) sltop_22) 3300.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.mm[0].Y*0.)+of.mm[0].Y)+sl.min.mm[0].Y)} {-3299.9999}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) -3299.9999))
; 
; =  {(((sc.mm[0].Y*0.11)+of.mm[0].Y)+sl.max.mm[0].Y)} {3300.}
(assert (= (+ (+ (* sc_23 0.11) of_23) sltop_23) 3300.))
; 
; >=  {((sc.mm[0].XY0*0.)+of.mm[0].XY0)} {3300.}
(assert (<= (+ (* sc_17 0.) of_17) 3300.))
; 
; <=  {((sc.mm[0].XY0*0.)+of.mm[0].XY0)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
; 
; >=  {((sc.mm[0].Ytot*0.11)+of.mm[0].Ytot)} {3300.}
(assert (<= (+ (* sc_18 0.11) of_18) 3300.))
; 
; <=  {((sc.mm[0].Ytot*0.11)+of.mm[0].Ytot)} {0.0001}
(assert (>= (+ (* sc_18 0.11) of_18) 0.0001))
; 
; >=  {((sc.mm[0].Xtot*0.15)+of.mm[0].Xtot)} {3300.}
(assert (<= (+ (* sc_20 0.15) of_20) 3300.))
; 
; <=  {((sc.mm[0].Xtot*0.15)+of.mm[0].Xtot)} {0.0001}
(assert (>= (+ (* sc_20 0.15) of_20) 0.0001))
; 
; >=  {((sc.mm[0].kf*1.)+of.mm[0].kf)} {10.}
(assert (<= (+ (* sc_19 1.) of_19) 10.))
; 
; <=  {((sc.mm[0].kf*1.)+of.mm[0].kf)} {0.0001}
(assert (>= (+ (* sc_19 1.) of_19) 0.0001))
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_25 sc_24))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_25 of_24))
; 
; >=  {((sc.input.V[2].X*0.15)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_24 0.15) of_24) 3300.))
; 
; <=  {((sc.input.V[2].X*0.15)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_24 0.15) of_24) 0.))
; 
; >=  {((sc.input.V[2].O*0.15)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_25 0.15) of_25) 3300.))
; 
; <=  {((sc.input.V[2].O*0.15)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_25 0.15) of_25) 0.))
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_27 sc_26))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_27 of_26))
; 
; >=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_26 0.11) of_26) 3300.))
; 
; <=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_26 0.11) of_26) 0.))
; 
; >=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_27 0.11) of_27) 3300.))
; 
; <=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_27 0.11) of_27) 0.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_29 sc_28))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_29 of_28))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_28 0.) of_28) 3300.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_29 0.) of_29) 3300.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; 
; =  {sc.iadd[1].A} {sc.iadd[1].B}
(assert (= sc_32 sc_33))
; 
; =  {sc.iadd[1].A} {sc.iadd[1].C} {sc.iadd[1].D}
(assert (and (= sc_32 sc_31) (= sc_32 sc_30)))
; 
; =  {sc.iadd[1].OUT} {sc.iadd[1].A}
(assert (= sc_34 sc_32))
; 
; =  {of.iadd[1].OUT} {((of.iadd[1].A+of.iadd[1].B)-of.iadd[1].C-of.iadd[1].D)}
(assert (= of_34 (- (+ of_32 of_33) (+ of_31 of_30))))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.iadd[1].D*0.)+of.iadd[1].D)+sl.min.iadd[1].D)} {0.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.))
; 
; =  {(((sc.iadd[1].D*0.11)+of.iadd[1].D)+sl.max.iadd[1].D)} {5.}
(assert (= (+ (+ (* sc_30 0.11) of_30) sltop_30) 5.))
; 
; >=  {((sc.iadd[1].C*0.)+of.iadd[1].C)} {5.}
(assert (<= (+ (* sc_31 0.) of_31) 5.))
; 
; <=  {((sc.iadd[1].C*0.)+of.iadd[1].C)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) -10.))
; 
; =  {(((sc.iadd[1].OUT*0.15)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_34 0.15) of_34) sltop_34) 10.))
; 
; >=  {((sc.iadd[1].A*0.)+of.iadd[1].A)} {5.}
(assert (<= (+ (* sc_32 0.) of_32) 5.))
; 
; <=  {((sc.iadd[1].A*0.)+of.iadd[1].A)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
; 
; >=  {((sc.iadd[1].B*0.15)+of.iadd[1].B)} {5.}
(assert (<= (+ (* sc_33 0.15) of_33) 5.))
; 
; <=  {((sc.iadd[1].B*0.15)+of.iadd[1].B)} {0.}
(assert (>= (+ (* sc_33 0.15) of_33) 0.))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) -10.))
; 
; =  {(((sc.iadd[1].OUT*0.15)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_34 0.15) of_34) sltop_34) 10.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_36 sc_35))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_36 of_35))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35) 0.))
; 
; =  {(((sc.output.I[0].X*0.15)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_35 0.15) of_35) sltop_35) 10.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.))
; 
; =  {(((sc.output.I[0].O*0.15)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_36 0.15) of_36) sltop_36) 10.))
; 
; =  {sc.input.I[0].O} {sc.iadd[1].C}
(assert (= sc_3 sc_31))
; 
; =  {of.input.I[0].O} {of.iadd[1].C}
(assert (= of_3 of_31))
; 
; =  {sc.input.I[4].O} {sc.mm[0].kf}
(assert (= sc_7 sc_19))
; 
; =  {of.input.I[4].O} {of.mm[0].kf}
(assert (= of_7 of_19))
; 
; =  {sc.input.I[3].O} {sc.mm[0].kr}
(assert (= sc_5 sc_16))
; 
; =  {of.input.I[3].O} {of.mm[0].kr}
(assert (= of_5 of_16))
; 
; =  {sc.mm[0].X} {sc.output.V[1].X}
(assert (= sc_21 sc_14))
; 
; =  {of.mm[0].X} {of.output.V[1].X}
(assert (= of_21 of_14))
; 
; =  {sc.mm[0].Y} {sc.output.V[0].X}
(assert (= sc_23 sc_12))
; 
; =  {of.mm[0].Y} {of.output.V[0].X}
(assert (= of_23 of_12))
; 
; =  {sc.input.I[2].O} {sc.iadd[1].B}
(assert (= sc_1 sc_33))
; 
; =  {of.input.I[2].O} {of.iadd[1].B}
(assert (= of_1 of_33))
; 
; =  {sc.input.V[2].O} {sc.mm[0].Xtot}
(assert (= sc_25 sc_20))
; 
; =  {of.input.V[2].O} {of.mm[0].Xtot}
(assert (= of_25 of_20))
; 
; =  {sc.input.I[1].O} {sc.iadd[1].A}
(assert (= sc_9 sc_32))
; 
; =  {of.input.I[1].O} {of.iadd[1].A}
(assert (= of_9 of_32))
; 
; =  {sc.iadd[1].OUT} {sc.output.I[0].X}
(assert (= sc_34 sc_35))
; 
; =  {of.iadd[1].OUT} {of.output.I[0].X}
(assert (= of_34 of_35))
; 
; =  {sc.input.V[1].O} {sc.mm[0].XY0}
(assert (= sc_29 sc_17))
; 
; =  {of.input.V[1].O} {of.mm[0].XY0}
(assert (= of_29 of_17))
; 
; =  {sc.mm[0].XY} {sc.iadd[1].D}
(assert (= sc_22 sc_30))
; 
; =  {of.mm[0].XY} {of.iadd[1].D}
(assert (= of_22 of_30))
; 
; =  {sc.mm[0].XY} {sc.output.V[2].X}
(assert (= sc_22 sc_10))
; 
; =  {of.mm[0].XY} {of.output.V[2].X}
(assert (= of_22 of_10))
; 
; =  {sc.input.V[0].O} {sc.mm[0].Ytot}
(assert (= sc_27 sc_18))
; 
; =  {of.input.V[0].O} {of.mm[0].Ytot}
(assert (= of_27 of_18))
(assert (<= (* sc_11 0.001) 0.1))
; 
; =  {sc.mm[0].XY} {sc.output.V[2].O}
(assert (= sc_22 sc_11))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_36 0.) sltop_36 (- sltop_36)) (ite (>= slbot_14 0.) slbot_14 (- slbot_14))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= sltop_14 0.) sltop_14 (- sltop_14))) (ite (>= slbot_22 0.) slbot_22 (- slbot_22))) (ite (>= sltop_23 0.) sltop_23 (- sltop_23))) (ite (>= slbot_10 0.) slbot_10 (- slbot_10))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= slbot_35 0.) slbot_35 (- slbot_35))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= sltop_10 0.) sltop_10 (- sltop_10))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_36 0.) slbot_36 (- slbot_36))) (ite (>= sltop_22 0.) sltop_22 (- sltop_22))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= slbot_21 0.) slbot_21 (- slbot_21))) (ite (>= sltop_34 0.) sltop_34 (- sltop_34))) (ite (>= slbot_30 0.) slbot_30 (- slbot_30))) (ite (>= sltop_30 0.) sltop_30 (- sltop_30))) (ite (>= slbot_23 0.) slbot_23 (- slbot_23))) (ite (>= slbot_34 0.) slbot_34 (- slbot_34))) (ite (>= sltop_35 0.) sltop_35 (- sltop_35))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= sltop_21 0.) sltop_21 (- sltop_21)))))
(check-sat)
