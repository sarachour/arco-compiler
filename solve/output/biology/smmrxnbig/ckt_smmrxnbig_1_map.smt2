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
(declare-fun slbot_0 () Real)
(declare-fun sltop_0 () Real)
; 
; =  {(((sc.vgain[0].X*0.)+of.vgain[0].X)+sl.min.vgain[0].X)} {0.0001}
(assert (= (+ (+ (* sc_0 0.) of_0) slbot_0) 0.0001))
; 
; =  {(((sc.vgain[0].X*6800.)+of.vgain[0].X)+sl.max.vgain[0].X)} {3300.}
(assert (= (+ (+ (* sc_0 6800.) of_0) sltop_0) 3300.))
; 
; >=  {((sc.vgain[0].Y*12.5)+of.vgain[0].Y)} {3300.}
(assert (<= (+ (* sc_1 12.5) of_1) 3300.))
; 
; <=  {((sc.vgain[0].Y*12.5)+of.vgain[0].Y)} {1.}
(assert (>= (+ (* sc_1 12.5) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[0].P*0.)+of.vgain[0].P)+sl.min.vgain[0].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[0].P*1196800.)+of.vgain[0].P)+sl.max.vgain[0].P)} {5445000.}
(assert (= (+ (+ (* sc_3 1196800.) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[0].Z*0.)+of.vgain[0].Z)+sl.min.vgain[0].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[0].Z*4400.)+of.vgain[0].Z)+sl.max.vgain[0].Z)} {3300.}
(assert (= (+ (+ (* sc_2 4400.) of_2) sltop_2) 3300.))
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
; >=  {((sc.input.I[0].X*0.01)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_4 0.01) of_4) 10.))
; 
; <=  {((sc.input.I[0].X*0.01)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_4 0.01) of_4) 0.))
; 
; >=  {((sc.input.I[0].O*0.01)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_5 0.01) of_5) 10.))
; 
; <=  {((sc.input.I[0].O*0.01)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_5 0.01) of_5) 0.))
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
; >=  {((sc.input.I[1].X*0.01)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_6 0.01) of_6) 10.))
; 
; <=  {((sc.input.I[1].X*0.01)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_6 0.01) of_6) 0.))
; 
; >=  {((sc.input.I[1].O*0.01)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_7 0.01) of_7) 10.))
; 
; <=  {((sc.input.I[1].O*0.01)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_7 0.01) of_7) 0.))
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
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X)} {0.0001}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 0.0001))
; 
; =  {(((sc.output.V[2].X*4400.)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_8 4400.) of_8) sltop_8) 3300.))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9) 0.0001))
; 
; =  {(((sc.output.V[2].O*4400.)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_9 4400.) of_9) sltop_9) 3300.))
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
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10) 0.0001))
; 
; =  {(((sc.output.V[0].X*4400.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_10 4400.) of_10) sltop_10) 3300.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 0.0001))
; 
; =  {(((sc.output.V[0].O*4400.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_11 4400.) of_11) sltop_11) 3300.))
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
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X)} {0.0001}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.0001))
; 
; =  {(((sc.output.V[3].X*4400.)+of.output.V[3].X)+sl.max.output.V[3].X)} {3300.}
(assert (= (+ (+ (* sc_12 4400.) of_12) sltop_12) 3300.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O)} {0.0001}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 0.0001))
; 
; =  {(((sc.output.V[3].O*4400.)+of.output.V[3].O)+sl.max.output.V[3].O)} {3300.}
(assert (= (+ (+ (* sc_13 4400.) of_13) sltop_13) 3300.))
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
; =  {(((sc.output.V[1].X*6800.)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_14 6800.) of_14) sltop_14) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.0001))
; 
; =  {(((sc.output.V[1].O*6800.)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_15 6800.) of_15) sltop_15) 3300.))
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
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_19 (* 1. sc_18)) (= sc_19 (* (* 1. sc_17) sc_22))))
; no offset
(assert (= (- (+ of_19 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
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
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_16 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_16 0.) of_16) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
; 
; >=  {((sc.vadd[1].D*0.04)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_17 0.04) of_17) 3300.))
; 
; <=  {((sc.vadd[1].D*0.04)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_17 0.04) of_17) 0.))
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
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.vadd[1].OUT2*4400.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_22 4400.) of_22) sltop_22) 3300.))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.))
; 
; =  {(((sc.vadd[1].B*1196800.)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_20 1196800.) of_20) sltop_20) 3300.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) -1650.))
; 
; =  {(((sc.vadd[1].OUT*1196800.)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_21 1196800.) of_21) sltop_21) 1650.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.vadd[1].OUT2*4400.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_22 4400.) of_22) sltop_22) 3300.))
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
; =  {sc.mm[2].Xtot} {sc.mm[2].XY}
(assert (= sc_27 sc_29))
; 
; =  {sc.mm[2].X} {sc.mm[2].Xtot}
(assert (= sc_28 sc_27))
; 
; =  {of.mm[2].X} {(of.mm[2].Xtot-of.mm[2].XY)}
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
; =  {(sc.mm[2].kf*sc.mm[2].X*sc.mm[2].Y)} {(sc.mm[2].kr*sc.mm[2].XY)}
(assert (= (* (* sc_26 sc_28) sc_30) (* sc_23 sc_29)))
; 
; =  {sc.mm[2].XY} {(sc.mm[2].kf*sc.mm[2].X*sc.mm[2].Y)}
(assert (= sc_29 (* (* sc_26 sc_28) sc_30)))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.mm[2].XY0} {(sc.mm[2].kf*sc.mm[2].X*sc.mm[2].Y)}
(assert (= sc_24 (* (* sc_26 sc_28) sc_30)))
; 
; =  {of.mm[2].XY0} {(0.-0.)}
(assert (= of_24 0.))
; 
; =  {sc.mm[2].Ytot} {sc.mm[2].XY}
(assert (= sc_25 sc_29))
; 
; =  {sc.mm[2].Y} {sc.mm[2].Ytot}
(assert (= sc_30 sc_25))
; 
; =  {of.mm[2].Y} {(of.mm[2].Ytot-of.mm[2].XY)}
(assert (= of_30 (- of_25 of_29)))
; 
; >=  {((sc.mm[2].kr*0.01)+of.mm[2].kr)} {10.}
(assert (<= (+ (* sc_23 0.01) of_23) 10.))
; 
; <=  {((sc.mm[2].kr*0.01)+of.mm[2].kr)} {0.0001}
(assert (>= (+ (* sc_23 0.01) of_23) 0.0001))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.mm[2].X*0.)+of.mm[2].X)+sl.min.mm[2].X)} {-3299.9999}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) -3299.9999))
; 
; =  {(((sc.mm[2].X*4400.)+of.mm[2].X)+sl.max.mm[2].X)} {3300.}
(assert (= (+ (+ (* sc_28 4400.) of_28) sltop_28) 3300.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.mm[2].XY*0.)+of.mm[2].XY)+sl.min.mm[2].XY)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.))
; 
; =  {(((sc.mm[2].XY*4400.)+of.mm[2].XY)+sl.max.mm[2].XY)} {3300.}
(assert (= (+ (+ (* sc_29 4400.) of_29) sltop_29) 3300.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.mm[2].Y*0.)+of.mm[2].Y)+sl.min.mm[2].Y)} {-3299.9999}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) -3299.9999))
; 
; =  {(((sc.mm[2].Y*6800.)+of.mm[2].Y)+sl.max.mm[2].Y)} {3300.}
(assert (= (+ (+ (* sc_30 6800.) of_30) sltop_30) 3300.))
; 
; >=  {((sc.mm[2].Ytot*6800.)+of.mm[2].Ytot)} {3300.}
(assert (<= (+ (* sc_25 6800.) of_25) 3300.))
; 
; <=  {((sc.mm[2].Ytot*6800.)+of.mm[2].Ytot)} {0.0001}
(assert (>= (+ (* sc_25 6800.) of_25) 0.0001))
; 
; >=  {((sc.mm[2].Xtot*4400.)+of.mm[2].Xtot)} {3300.}
(assert (<= (+ (* sc_27 4400.) of_27) 3300.))
; 
; <=  {((sc.mm[2].Xtot*4400.)+of.mm[2].Xtot)} {0.0001}
(assert (>= (+ (* sc_27 4400.) of_27) 0.0001))
; 
; >=  {((sc.mm[2].kf*0.01)+of.mm[2].kf)} {10.}
(assert (<= (+ (* sc_26 0.01) of_26) 10.))
; 
; <=  {((sc.mm[2].kf*0.01)+of.mm[2].kf)} {0.0001}
(assert (>= (+ (* sc_26 0.01) of_26) 0.0001))
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
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.V[0].X*4400.)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_33 4400.) of_33) 3300.))
; 
; <=  {((sc.input.V[0].X*4400.)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_33 4400.) of_33) 0.))
; 
; >=  {((sc.input.V[0].O*4400.)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_34 4400.) of_34) 3300.))
; 
; <=  {((sc.input.V[0].O*4400.)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_34 4400.) of_34) 0.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.V[6].X*6800.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_35 6800.) of_35) 3300.))
; 
; <=  {((sc.input.V[6].X*6800.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_35 6800.) of_35) 0.))
; 
; >=  {((sc.input.V[6].O*6800.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_36 6800.) of_36) 3300.))
; 
; <=  {((sc.input.V[6].O*6800.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_36 6800.) of_36) 0.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_37 0.) of_37) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_38 0.) of_38) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_40 of_39))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_39 0.) of_39) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_40 0.) of_40) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_42 of_41))
; 
; >=  {((sc.input.V[5].X*0.04)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_41 0.04) of_41) 3300.))
; 
; <=  {((sc.input.V[5].X*0.04)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_41 0.04) of_41) 0.))
; 
; >=  {((sc.input.V[5].O*0.04)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_42 0.04) of_42) 3300.))
; 
; <=  {((sc.input.V[5].O*0.04)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_42 0.04) of_42) 0.))
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_44 of_43))
; 
; >=  {((sc.input.V[1].X*12.5)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_43 12.5) of_43) 3300.))
; 
; <=  {((sc.input.V[1].X*12.5)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_43 12.5) of_43) 0.))
; 
; >=  {((sc.input.V[1].O*12.5)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_44 12.5) of_44) 3300.))
; 
; <=  {((sc.input.V[1].O*12.5)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_44 12.5) of_44) 0.))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[3].X}
(assert (= sc_22 sc_12))
; 
; =  {of.vadd[1].OUT2} {of.output.V[3].X}
(assert (= of_22 of_12))
; 
; =  {sc.input.I[0].O} {sc.mm[2].kr}
(assert (= sc_5 sc_23))
; 
; =  {of.input.I[0].O} {of.mm[2].kr}
(assert (= of_5 of_23))
; 
; =  {sc.mm[2].XY} {sc.output.V[2].X}
(assert (= sc_29 sc_8))
; 
; =  {of.mm[2].XY} {of.output.V[2].X}
(assert (= of_29 of_8))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].C}
(assert (= sc_38 sc_18))
; 
; =  {of.input.V[3].O} {of.vadd[1].C}
(assert (= of_38 of_18))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].OUT2_0}
(assert (= sc_32 sc_16))
; 
; =  {of.input.V[2].O} {of.vadd[1].OUT2_0}
(assert (= of_32 of_16))
; 
; =  {sc.input.I[1].O} {sc.mm[2].kf}
(assert (= sc_7 sc_26))
; 
; =  {of.input.I[1].O} {of.mm[2].kf}
(assert (= of_7 of_26))
; 
; =  {sc.input.V[1].O} {sc.vgain[0].Y}
(assert (= sc_44 sc_1))
; 
; =  {of.input.V[1].O} {of.vgain[0].Y}
(assert (= of_44 of_1))
; 
; =  {sc.vgain[0].P} {sc.vadd[1].B}
(assert (= sc_3 sc_20))
; 
; =  {of.vgain[0].P} {of.vadd[1].B}
(assert (= of_3 of_20))
; 
; =  {sc.input.V[0].O} {sc.mm[2].Xtot}
(assert (= sc_34 sc_27))
; 
; =  {of.input.V[0].O} {of.mm[2].Xtot}
(assert (= of_34 of_27))
; 
; =  {sc.mm[2].Y} {sc.output.V[1].X}
(assert (= sc_30 sc_14))
; 
; =  {of.mm[2].Y} {of.output.V[1].X}
(assert (= of_30 of_14))
; 
; =  {sc.mm[2].Y} {sc.vgain[0].X}
(assert (= sc_30 sc_0))
; 
; =  {of.mm[2].Y} {of.vgain[0].X}
(assert (= of_30 of_0))
; 
; =  {sc.input.V[5].O} {sc.vadd[1].D}
(assert (= sc_42 sc_17))
; 
; =  {of.input.V[5].O} {of.vadd[1].D}
(assert (= of_42 of_17))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].A}
(assert (= sc_40 sc_19))
; 
; =  {of.input.V[4].O} {of.vadd[1].A}
(assert (= of_40 of_19))
; 
; =  {sc.input.V[6].O} {sc.mm[2].Ytot}
(assert (= sc_36 sc_25))
; 
; =  {of.input.V[6].O} {of.mm[2].Ytot}
(assert (= of_36 of_25))
; 
; =  {sc.mm[2].X} {sc.vgain[0].Z}
(assert (= sc_28 sc_2))
; 
; =  {of.mm[2].X} {of.vgain[0].Z}
(assert (= of_28 of_2))
; 
; =  {sc.mm[2].X} {sc.output.V[0].X}
(assert (= sc_28 sc_10))
; 
; =  {of.mm[2].X} {of.output.V[0].X}
(assert (= of_28 of_10))
(assert (<= (* (/ 1. sc_9) 0.001) 0.1))
(assert (<= (* (/ 1. sc_13) 0.001) 0.1))
; 
; =  {sc.output.V[2].O} {sc.output.V[3].O} {sc.mm[2].XY} {sc.vadd[1].OUT2}
(assert (and (and (= sc_9 sc_13) (= sc_9 sc_29)) (= sc_9 sc_22)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_0 0.) slbot_0 (- slbot_0)) (ite (>= slbot_14 0.) slbot_14 (- slbot_14))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= slbot_29 0.) slbot_29 (- slbot_29))) (ite (>= sltop_14 0.) sltop_14 (- sltop_14))) (ite (>= slbot_22 0.) slbot_22 (- slbot_22))) (ite (>= slbot_10 0.) slbot_10 (- slbot_10))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= sltop_0 0.) sltop_0 (- sltop_0))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= slbot_20 0.) slbot_20 (- slbot_20))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_28 0.) sltop_28 (- sltop_28))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= sltop_10 0.) sltop_10 (- sltop_10))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= sltop_29 0.) sltop_29 (- sltop_29))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= sltop_22 0.) sltop_22 (- sltop_22))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= sltop_20 0.) sltop_20 (- sltop_20))) (ite (>= slbot_28 0.) slbot_28 (- slbot_28))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= slbot_21 0.) slbot_21 (- slbot_21))) (ite (>= slbot_30 0.) slbot_30 (- slbot_30))) (ite (>= sltop_30 0.) sltop_30 (- sltop_30))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= sltop_21 0.) sltop_21 (- sltop_21)))))
(check-sat)
