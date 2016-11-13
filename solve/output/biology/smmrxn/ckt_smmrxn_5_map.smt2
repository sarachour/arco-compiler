(set-logic QF_NRA)
(declare-fun __minima__ () Real)
(declare-fun sc_0 () Real)
(assert (> sc_0 1e-08))
(declare-fun of_0 () Real)
(declare-fun sc_1 () Real)
(assert (> sc_1 1e-08))
(declare-fun of_1 () Real)
(declare-fun sc_2 () Real)
(assert (> sc_2 1e-08))
(declare-fun of_2 () Real)
(declare-fun sc_3 () Real)
(assert (> sc_3 1e-08))
(declare-fun of_3 () Real)
; no offset
(assert (= of_0 0.))
; no offset
(assert (= of_1 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_2 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[0].P} {((sc.vgain[0].X/sc.vgain[0].Y)*sc.vgain[0].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[0].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[0].X*4.)+of.vgain[0].X)} {3300.}
(assert (<= (+ (* sc_0 4.) of_0) 3300.))
; 
; <=  {((sc.vgain[0].X*4.)+of.vgain[0].X)} {0.}
(assert (>= (+ (* sc_0 4.) of_0) 0.))
; 
; >=  {((sc.vgain[0].Y*1.)+of.vgain[0].Y)} {3300.}
(assert (<= (+ (* sc_1 1.) of_1) 3300.))
; 
; <=  {((sc.vgain[0].Y*1.)+of.vgain[0].Y)} {1.}
(assert (>= (+ (* sc_1 1.) of_1) 1.))
(declare-fun slbot_3_1 () Real)
(assert (<= slbot_3_1 1e-08))
(declare-fun sltop_3_1 () Real)
(assert (>= sltop_3_1 1e-08))
; 
; =  {(((sc.vgain[0].P*0.)+of.vgain[0].P)+sl.min.vgain[0].P.1)} {0.}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3_1) 0.))
; 
; =  {(((sc.vgain[0].P*0.3)+of.vgain[0].P)+sl.max.vgain[0].P.1)} {5445000.}
(assert (= (+ (+ (* sc_3 0.3) of_3) sltop_3_1) 5445000.))
(declare-fun slbot_2_1 () Real)
(assert (<= slbot_2_1 1e-08))
(declare-fun sltop_2_1 () Real)
(assert (>= sltop_2_1 1e-08))
; 
; =  {(((sc.vgain[0].Z*0.)+of.vgain[0].Z)+sl.min.vgain[0].Z.1)} {0.}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2_1) 0.))
; 
; =  {(((sc.vgain[0].Z*0.15)+of.vgain[0].Z)+sl.max.vgain[0].Z.1)} {3300.}
(assert (= (+ (+ (* sc_2 0.15) of_2) sltop_2_1) 3300.))
(declare-fun sc_4 () Real)
(assert (> sc_4 1e-08))
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(assert (> sc_5 1e-08))
(declare-fun of_5 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_5 sc_4))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_5 of_4))
; 
; >=  {((sc.input.I[0].X*1.)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_4 1.) of_4) 10.))
; 
; <=  {((sc.input.I[0].X*1.)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_4 1.) of_4) 0.))
; 
; >=  {((sc.input.I[0].O*1.)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_5 1.) of_5) 10.))
; 
; <=  {((sc.input.I[0].O*1.)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_5 1.) of_5) 0.))
(declare-fun sc_6 () Real)
(assert (> sc_6 1e-08))
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_7 sc_6))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_7 of_6))
; 
; >=  {((sc.input.I[1].X*1.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_6 1.) of_6) 10.))
; 
; <=  {((sc.input.I[1].X*1.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_6 1.) of_6) 0.))
; 
; >=  {((sc.input.I[1].O*1.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_7 1.) of_7) 10.))
; 
; <=  {((sc.input.I[1].O*1.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_7 1.) of_7) 0.))
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_9 sc_8))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_9 of_8))
(declare-fun slbot_8_1 () Real)
(assert (<= slbot_8_1 1e-08))
(declare-fun sltop_8_1 () Real)
(assert (>= sltop_8_1 1e-08))
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X.1)} {0.}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8_1) 0.))
; 
; =  {(((sc.output.V[2].X*0.11)+of.output.V[2].X)+sl.max.output.V[2].X.1)} {3300.}
(assert (= (+ (+ (* sc_8 0.11) of_8) sltop_8_1) 3300.))
(declare-fun slbot_9_1 () Real)
(assert (<= slbot_9_1 1e-08))
(declare-fun sltop_9_1 () Real)
(assert (>= sltop_9_1 1e-08))
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O.1)} {0.}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9_1) 0.))
; 
; =  {(((sc.output.V[2].O*0.11)+of.output.V[2].O)+sl.max.output.V[2].O.1)} {3300.}
(assert (= (+ (+ (* sc_9 0.11) of_9) sltop_9_1) 3300.))
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_11 sc_10))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_11 of_10))
(declare-fun slbot_10_1 () Real)
(assert (<= slbot_10_1 1e-08))
(declare-fun sltop_10_1 () Real)
(assert (>= sltop_10_1 1e-08))
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X.1)} {0.}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10_1) 0.))
; 
; =  {(((sc.output.V[0].X*0.11)+of.output.V[0].X)+sl.max.output.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_10 0.11) of_10) sltop_10_1) 3300.))
(declare-fun slbot_11_1 () Real)
(assert (<= slbot_11_1 1e-08))
(declare-fun sltop_11_1 () Real)
(assert (>= sltop_11_1 1e-08))
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O.1)} {0.}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11_1) 0.))
; 
; =  {(((sc.output.V[0].O*0.11)+of.output.V[0].O)+sl.max.output.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_11 0.11) of_11) sltop_11_1) 3300.))
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_13 sc_12))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_13 of_12))
(declare-fun slbot_12_1 () Real)
(assert (<= slbot_12_1 1e-08))
(declare-fun sltop_12_1 () Real)
(assert (>= sltop_12_1 1e-08))
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X.1)} {0.}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12_1) 0.))
; 
; =  {(((sc.output.V[3].X*0.11)+of.output.V[3].X)+sl.max.output.V[3].X.1)} {3300.}
(assert (= (+ (+ (* sc_12 0.11) of_12) sltop_12_1) 3300.))
(declare-fun slbot_13_1 () Real)
(assert (<= slbot_13_1 1e-08))
(declare-fun sltop_13_1 () Real)
(assert (>= sltop_13_1 1e-08))
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O.1)} {0.}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13_1) 0.))
; 
; =  {(((sc.output.V[3].O*0.11)+of.output.V[3].O)+sl.max.output.V[3].O.1)} {3300.}
(assert (= (+ (+ (* sc_13 0.11) of_13) sltop_13_1) 3300.))
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
(declare-fun slbot_14_1 () Real)
(assert (<= slbot_14_1 1e-08))
(declare-fun sltop_14_1 () Real)
(assert (>= sltop_14_1 1e-08))
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X.1)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14_1) 0.))
; 
; =  {(((sc.output.V[1].X*0.15)+of.output.V[1].X)+sl.max.output.V[1].X.1)} {3300.}
(assert (= (+ (+ (* sc_14 0.15) of_14) sltop_14_1) 3300.))
(declare-fun slbot_15_1 () Real)
(assert (<= slbot_15_1 1e-08))
(declare-fun sltop_15_1 () Real)
(assert (>= sltop_15_1 1e-08))
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O.1)} {0.}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15_1) 0.))
; 
; =  {(((sc.output.V[1].O*0.15)+of.output.V[1].O)+sl.max.output.V[1].O.1)} {3300.}
(assert (= (+ (+ (* sc_15 0.15) of_15) sltop_15_1) 3300.))
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_17 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_18 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_20 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_19 (* 1. sc_20)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_19 (* 1. sc_18)) (= sc_19 (* 1. sc_17))))
; no offset
(assert (= (- (+ of_19 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_21 (* sc_19 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_21 0.))
; no scale
(assert (= sc_17 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_17 0.))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_18 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_20 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_19 (* 1. sc_20)))
; no offset
(assert (= (+ of_19 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[1].A*1.)} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= (* sc_19 1.) (* 1. sc_18)) (= (* sc_19 1.) (* (* 1. sc_17) sc_22))))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_22 (* sc_19 1.)))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_16 (* sc_19 1.)))
; 
; =  {of.vadd[1].OUT2_0} {(0.-0.-0.)}
(assert (= of_16 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_16 0.) of_16) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
; 
; >=  {((sc.vadd[1].D*1.)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_17 1.) of_17) 3300.))
; 
; <=  {((sc.vadd[1].D*1.)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_17 1.) of_17) 0.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_18 0.) of_18) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_19 0.) of_19) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
(declare-fun slbot_22_1 () Real)
(assert (<= slbot_22_1 1e-08))
(declare-fun sltop_22_1 () Real)
(assert (>= sltop_22_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.11)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_22 0.11) of_22) sltop_22_1) 3300.))
(declare-fun slbot_20_1 () Real)
(assert (<= slbot_20_1 1e-08))
(declare-fun sltop_20_1 () Real)
(assert (>= sltop_20_1 1e-08))
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B.1)} {0.}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20_1) 0.))
; 
; =  {(((sc.vadd[1].B*0.033)+of.vadd[1].B)+sl.max.vadd[1].B.1)} {3300.}
(assert (= (+ (+ (* sc_20 0.033) of_20) sltop_20_1) 3300.))
(declare-fun slbot_21_1 () Real)
(assert (<= slbot_21_1 1e-08))
(declare-fun sltop_21_1 () Real)
(assert (>= sltop_21_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21_1) -1650.))
; 
; =  {(((sc.vadd[1].OUT*0.033)+of.vadd[1].OUT)+sl.max.vadd[1].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_21 0.033) of_21) sltop_21_1) 1650.))
(declare-fun slbot_22_1 () Real)
(assert (<= slbot_22_1 1e-08))
(declare-fun sltop_22_1 () Real)
(assert (>= sltop_22_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.11)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_22 0.11) of_22) sltop_22_1) 3300.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; 
; =  {sc.mm[3].Xtot} {sc.mm[3].XY}
(assert (= sc_27 sc_29))
; 
; =  {sc.mm[3].X} {sc.mm[3].Xtot}
(assert (= sc_28 sc_27))
; 
; =  {of.mm[3].X} {(of.mm[3].Xtot-of.mm[3].XY)}
(assert (= of_28 (- of_27 of_29)))
; no scale
(assert (= sc_23 1.))
; no offset
(assert (= of_23 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= of_26 0.))
; no offset
(assert (= of_28 0.))
; no offset
(assert (= of_30 0.))
; 
; =  {(sc.mm[3].kf*sc.mm[3].X*sc.mm[3].Y)} {(sc.mm[3].kr*sc.mm[3].XY)}
(assert (= (* (* sc_26 sc_28) sc_30) (* sc_23 sc_29)))
; 
; =  {sc.mm[3].XY} {(sc.mm[3].kf*sc.mm[3].X*sc.mm[3].Y)}
(assert (= sc_29 (* (* sc_26 sc_28) sc_30)))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.mm[3].XY0} {(sc.mm[3].kf*sc.mm[3].X*sc.mm[3].Y)}
(assert (= sc_24 (* (* sc_26 sc_28) sc_30)))
; 
; =  {of.mm[3].XY0} {(0.-0.)}
(assert (= of_24 0.))
; 
; =  {sc.mm[3].Ytot} {sc.mm[3].XY}
(assert (= sc_25 sc_29))
; 
; =  {sc.mm[3].Y} {sc.mm[3].Ytot}
(assert (= sc_30 sc_25))
; 
; =  {of.mm[3].Y} {(of.mm[3].Ytot-of.mm[3].XY)}
(assert (= of_30 (- of_25 of_29)))
; 
; >=  {((sc.mm[3].kr*1.)+of.mm[3].kr)} {10.}
(assert (<= (+ (* sc_23 1.) of_23) 10.))
; 
; <=  {((sc.mm[3].kr*1.)+of.mm[3].kr)} {0.0001}
(assert (>= (+ (* sc_23 1.) of_23) 0.0001))
(declare-fun slbot_28_1 () Real)
(assert (<= slbot_28_1 1e-08))
(declare-fun sltop_28_1 () Real)
(assert (>= sltop_28_1 1e-08))
; 
; =  {(((sc.mm[3].X*0.)+of.mm[3].X)+sl.min.mm[3].X.1)} {-65999.9999}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28_1) -65999.9999))
; 
; =  {(((sc.mm[3].X*0.11)+of.mm[3].X)+sl.max.mm[3].X.1)} {3300.}
(assert (= (+ (+ (* sc_28 0.11) of_28) sltop_28_1) 3300.))
(declare-fun slbot_29_1 () Real)
(assert (<= slbot_29_1 1e-08))
(declare-fun sltop_29_1 () Real)
(assert (>= sltop_29_1 1e-08))
; 
; =  {(((sc.mm[3].XY*0.)+of.mm[3].XY)+sl.min.mm[3].XY.1)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29_1) 0.))
; 
; =  {(((sc.mm[3].XY*0.11)+of.mm[3].XY)+sl.max.mm[3].XY.1)} {66000.}
(assert (= (+ (+ (* sc_29 0.11) of_29) sltop_29_1) 66000.))
(declare-fun slbot_30_1 () Real)
(assert (<= slbot_30_1 1e-08))
(declare-fun sltop_30_1 () Real)
(assert (>= sltop_30_1 1e-08))
; 
; =  {(((sc.mm[3].Y*0.)+of.mm[3].Y)+sl.min.mm[3].Y.1)} {-65999.9999}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30_1) -65999.9999))
; 
; =  {(((sc.mm[3].Y*0.15)+of.mm[3].Y)+sl.max.mm[3].Y.1)} {3300.}
(assert (= (+ (+ (* sc_30 0.15) of_30) sltop_30_1) 3300.))
; 
; >=  {((sc.mm[3].Ytot*0.15)+of.mm[3].Ytot)} {3300.}
(assert (<= (+ (* sc_25 0.15) of_25) 3300.))
; 
; <=  {((sc.mm[3].Ytot*0.15)+of.mm[3].Ytot)} {0.0001}
(assert (>= (+ (* sc_25 0.15) of_25) 0.0001))
; 
; >=  {((sc.mm[3].Xtot*0.11)+of.mm[3].Xtot)} {3300.}
(assert (<= (+ (* sc_27 0.11) of_27) 3300.))
; 
; <=  {((sc.mm[3].Xtot*0.11)+of.mm[3].Xtot)} {0.0001}
(assert (>= (+ (* sc_27 0.11) of_27) 0.0001))
; 
; >=  {((sc.mm[3].kf*1.)+of.mm[3].kf)} {10.}
(assert (<= (+ (* sc_26 1.) of_26) 10.))
; 
; <=  {((sc.mm[3].kf*1.)+of.mm[3].kf)} {0.0001}
(assert (>= (+ (* sc_26 1.) of_26) 0.0001))
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_32 of_31))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_31 0.) of_31) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_32 0.) of_32) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.V[7].X*1.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_33 1.) of_33) 3300.))
; 
; <=  {((sc.input.V[7].X*1.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_33 1.) of_33) 0.))
; 
; >=  {((sc.input.V[7].O*1.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_34 1.) of_34) 3300.))
; 
; <=  {((sc.input.V[7].O*1.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_34 1.) of_34) 0.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_35 0.11) of_35) 3300.))
; 
; <=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_35 0.11) of_35) 0.))
; 
; >=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_36 0.11) of_36) 3300.))
; 
; <=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_36 0.11) of_36) 0.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.V[6].X*1.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_37 1.) of_37) 3300.))
; 
; <=  {((sc.input.V[6].X*1.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_37 1.) of_37) 0.))
; 
; >=  {((sc.input.V[6].O*1.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_38 1.) of_38) 3300.))
; 
; <=  {((sc.input.V[6].O*1.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_38 1.) of_38) 0.))
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_40 of_39))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_39 0.) of_39) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_40 0.) of_40) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_42 of_41))
; 
; >=  {((sc.input.V[4].X*0.15)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_41 0.15) of_41) 3300.))
; 
; <=  {((sc.input.V[4].X*0.15)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_41 0.15) of_41) 0.))
; 
; >=  {((sc.input.V[4].O*0.15)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_42 0.15) of_42) 3300.))
; 
; <=  {((sc.input.V[4].O*0.15)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_42 0.15) of_42) 0.))
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_44 of_43))
; 
; >=  {((sc.input.V[5].X*4.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_43 4.) of_43) 3300.))
; 
; <=  {((sc.input.V[5].X*4.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_43 4.) of_43) 0.))
; 
; >=  {((sc.input.V[5].O*4.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_44 4.) of_44) 3300.))
; 
; <=  {((sc.input.V[5].O*4.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_44 4.) of_44) 0.))
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_46 of_45))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_45 0.) of_45) 3300.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_46 0.) of_46) 3300.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; no offset
(assert (= of_48 0.))
; no offset
(assert (= of_47 0.))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_49 (* sc_48 sc_47)))
; 
; =  {of.itov[2].Y} {0.}
(assert (= of_49 0.))
(declare-fun slbot_47_1 () Real)
(assert (<= slbot_47_1 1e-08))
(declare-fun sltop_47_1 () Real)
(assert (>= sltop_47_1 1e-08))
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X.1)} {0.0001}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47_1) 0.0001))
; 
; =  {(((sc.itov[2].X*0.11)+of.itov[2].X)+sl.max.itov[2].X.1)} {10.}
(assert (= (+ (+ (* sc_47 0.11) of_47) sltop_47_1) 10.))
(declare-fun slbot_49_1 () Real)
(assert (<= slbot_49_1 1e-08))
(declare-fun sltop_49_1 () Real)
(assert (>= sltop_49_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49_1) 0.0001))
; 
; =  {(((sc.itov[2].Y*0.033)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_49 0.033) of_49) sltop_49_1) 3300.))
(declare-fun slbot_48_1 () Real)
(assert (<= slbot_48_1 1e-08))
(declare-fun sltop_48_1 () Real)
(assert (>= sltop_48_1 1e-08))
; 
; =  {(((sc.itov[2].K*0.)+of.itov[2].K)+sl.min.itov[2].K.1)} {1.}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48_1) 1.))
; 
; =  {(((sc.itov[2].K*0.3)+of.itov[2].K)+sl.max.itov[2].K.1)} {330.}
(assert (= (+ (+ (* sc_48 0.3) of_48) sltop_48_1) 330.))
(declare-fun slbot_49_1 () Real)
(assert (<= slbot_49_1 1e-08))
(declare-fun sltop_49_1 () Real)
(assert (>= sltop_49_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49_1) 0.0001))
; 
; =  {(((sc.itov[2].Y*0.033)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_49 0.033) of_49) sltop_49_1) 3300.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].B}
(assert (= sc_49 sc_20))
; 
; =  {of.itov[2].Y} {of.vadd[1].B}
(assert (= of_49 of_20))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[3].X}
(assert (= sc_22 sc_12))
; 
; =  {of.vadd[1].OUT2} {of.output.V[3].X}
(assert (= of_22 of_12))
; 
; =  {sc.input.I[0].O} {sc.mm[3].kr}
(assert (= sc_5 sc_23))
; 
; =  {of.input.I[0].O} {of.mm[3].kr}
(assert (= of_5 of_23))
; 
; =  {sc.mm[3].X} {sc.itov[2].X}
(assert (= sc_28 sc_47))
; 
; =  {of.mm[3].X} {of.itov[2].X}
(assert (= of_28 of_47))
; 
; =  {sc.mm[3].X} {sc.output.V[0].X}
(assert (= sc_28 sc_10))
; 
; =  {of.mm[3].X} {of.output.V[0].X}
(assert (= of_28 of_10))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].C}
(assert (= sc_32 sc_18))
; 
; =  {of.input.V[2].O} {of.vadd[1].C}
(assert (= of_32 of_18))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_40 sc_19))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_40 of_19))
; 
; =  {sc.mm[3].Y} {sc.output.V[1].X}
(assert (= sc_30 sc_14))
; 
; =  {of.mm[3].Y} {of.output.V[1].X}
(assert (= of_30 of_14))
; 
; =  {sc.mm[3].Y} {sc.vgain[0].Z}
(assert (= sc_30 sc_2))
; 
; =  {of.mm[3].Y} {of.vgain[0].Z}
(assert (= of_30 of_2))
; 
; =  {sc.input.I[1].O} {sc.mm[3].kf}
(assert (= sc_7 sc_26))
; 
; =  {of.input.I[1].O} {of.mm[3].kf}
(assert (= of_7 of_26))
; 
; =  {sc.input.V[1].O} {sc.vadd[1].OUT2_0}
(assert (= sc_46 sc_16))
; 
; =  {of.input.V[1].O} {of.vadd[1].OUT2_0}
(assert (= of_46 of_16))
; 
; =  {sc.mm[3].XY} {sc.output.V[2].X}
(assert (= sc_29 sc_8))
; 
; =  {of.mm[3].XY} {of.output.V[2].X}
(assert (= of_29 of_8))
; 
; =  {sc.vgain[0].P} {sc.itov[2].K}
(assert (= sc_3 sc_48))
; 
; =  {of.vgain[0].P} {of.itov[2].K}
(assert (= of_3 of_48))
; 
; =  {sc.input.V[7].O} {sc.vadd[1].D}
(assert (= sc_34 sc_17))
; 
; =  {of.input.V[7].O} {of.vadd[1].D}
(assert (= of_34 of_17))
; 
; =  {sc.input.V[0].O} {sc.mm[3].Xtot}
(assert (= sc_36 sc_27))
; 
; =  {of.input.V[0].O} {of.mm[3].Xtot}
(assert (= of_36 of_27))
; 
; =  {sc.input.V[5].O} {sc.vgain[0].X}
(assert (= sc_44 sc_0))
; 
; =  {of.input.V[5].O} {of.vgain[0].X}
(assert (= of_44 of_0))
; 
; =  {sc.input.V[4].O} {sc.mm[3].Ytot}
(assert (= sc_42 sc_25))
; 
; =  {of.input.V[4].O} {of.mm[3].Ytot}
(assert (= of_42 of_25))
; 
; =  {sc.input.V[6].O} {sc.vgain[0].Y}
(assert (= sc_38 sc_1))
; 
; =  {of.input.V[6].O} {of.vgain[0].Y}
(assert (= of_38 of_1))
(assert (<= (* (/ 1. sc_9) 0.001) 0.1))
(assert (<= (* (/ 1. sc_13) 0.001) 0.1))
; 
; =  {sc.output.V[2].O} {sc.output.V[3].O} {sc.mm[3].XY} {sc.vadd[1].OUT2}
(assert (and (and (= sc_9 sc_13) (= sc_9 sc_29)) (= sc_9 sc_22)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_10_1 0.) sltop_10_1 (- sltop_10_1)) (ite (>= slbot_11_1 0.) slbot_11_1 (- slbot_11_1))) (ite (>= slbot_48_1 0.) slbot_48_1 (- slbot_48_1))) (ite (>= slbot_28_1 0.) slbot_28_1 (- slbot_28_1))) (ite (>= sltop_29_1 0.) sltop_29_1 (- sltop_29_1))) (ite (>= sltop_47_1 0.) sltop_47_1 (- sltop_47_1))) (ite (>= slbot_22_1 0.) slbot_22_1 (- slbot_22_1))) (ite (>= slbot_20_1 0.) slbot_20_1 (- slbot_20_1))) (ite (>= sltop_13_1 0.) sltop_13_1 (- sltop_13_1))) (ite (>= slbot_15_1 0.) slbot_15_1 (- slbot_15_1))) (ite (>= sltop_28_1 0.) sltop_28_1 (- sltop_28_1))) (ite (>= sltop_3_1 0.) sltop_3_1 (- sltop_3_1))) (ite (>= slbot_2_1 0.) slbot_2_1 (- slbot_2_1))) (ite (>= sltop_8_1 0.) sltop_8_1 (- sltop_8_1))) (ite (>= sltop_21_1 0.) sltop_21_1 (- sltop_21_1))) (ite (>= sltop_12_1 0.) sltop_12_1 (- sltop_12_1))) (ite (>= slbot_21_1 0.) slbot_21_1 (- slbot_21_1))) (ite (>= slbot_14_1 0.) slbot_14_1 (- slbot_14_1))) (ite (>= sltop_48_1 0.) sltop_48_1 (- sltop_48_1))) (ite (>= slbot_3_1 0.) slbot_3_1 (- slbot_3_1))) (ite (>= sltop_15_1 0.) sltop_15_1 (- sltop_15_1))) (ite (>= sltop_30_1 0.) sltop_30_1 (- sltop_30_1))) (ite (>= sltop_2_1 0.) sltop_2_1 (- sltop_2_1))) (ite (>= sltop_22_1 0.) sltop_22_1 (- sltop_22_1))) (ite (>= sltop_14_1 0.) sltop_14_1 (- sltop_14_1))) (ite (>= slbot_49_1 0.) slbot_49_1 (- slbot_49_1))) (ite (>= sltop_49_1 0.) sltop_49_1 (- sltop_49_1))) (ite (>= slbot_10_1 0.) slbot_10_1 (- slbot_10_1))) (ite (>= slbot_8_1 0.) slbot_8_1 (- slbot_8_1))) (ite (>= slbot_9_1 0.) slbot_9_1 (- slbot_9_1))) (ite (>= slbot_13_1 0.) slbot_13_1 (- slbot_13_1))) (ite (>= sltop_20_1 0.) sltop_20_1 (- sltop_20_1))) (ite (>= slbot_47_1 0.) slbot_47_1 (- slbot_47_1))) (ite (>= slbot_12_1 0.) slbot_12_1 (- slbot_12_1))) (ite (>= sltop_9_1 0.) sltop_9_1 (- sltop_9_1))) (ite (>= slbot_30_1 0.) slbot_30_1 (- slbot_30_1))) (ite (>= sltop_11_1 0.) sltop_11_1 (- sltop_11_1))) (ite (>= slbot_29_1 0.) slbot_29_1 (- slbot_29_1)))))
(check-sat)
