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
; =  {(((sc.vgain[0].X*5500.)+of.vgain[0].X)+sl.max.vgain[0].X)} {3300.}
(assert (= (+ (+ (* sc_0 5500.) of_0) sltop_0) 3300.))
; 
; >=  {((sc.vgain[0].Y*0.125)+of.vgain[0].Y)} {3300.}
(assert (<= (+ (* sc_1 0.125) of_1) 3300.))
; 
; <=  {((sc.vgain[0].Y*0.125)+of.vgain[0].Y)} {1.}
(assert (>= (+ (* sc_1 0.125) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[0].P*0.)+of.vgain[0].P)+sl.min.vgain[0].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[0].P*70400000.)+of.vgain[0].P)+sl.max.vgain[0].P)} {5445000.}
(assert (= (+ (+ (* sc_3 70400000.) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[0].Z*0.)+of.vgain[0].Z)+sl.min.vgain[0].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[0].Z*3200.)+of.vgain[0].Z)+sl.max.vgain[0].Z)} {3300.}
(assert (= (+ (+ (* sc_2 3200.) of_2) sltop_2) 3300.))
(declare-fun sc_4 () Real)
(assert (> sc_4 1e-08))
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(assert (> sc_5 1e-08))
(declare-fun of_5 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_5 sc_4))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_5 of_4))
; 
; >=  {((sc.input.I[2].X*1.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_4 1.) of_4) 10.))
; 
; <=  {((sc.input.I[2].X*1.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_4 1.) of_4) 0.))
; 
; >=  {((sc.input.I[2].O*1.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_5 1.) of_5) 10.))
; 
; <=  {((sc.input.I[2].O*1.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_5 1.) of_5) 0.))
(declare-fun sc_6 () Real)
(assert (> sc_6 1e-08))
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_7 sc_6))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_7 of_6))
; 
; >=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_6 0.) of_6) 10.))
; 
; <=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_6 0.) of_6) 0.))
; 
; >=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_7 0.) of_7) 10.))
; 
; <=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_7 0.) of_7) 0.))
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_9 sc_8))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_9 of_8))
; 
; >=  {((sc.input.I[3].X*1.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_8 1.) of_8) 10.))
; 
; <=  {((sc.input.I[3].X*1.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_8 1.) of_8) 0.))
; 
; >=  {((sc.input.I[3].O*1.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_9 1.) of_9) 10.))
; 
; <=  {((sc.input.I[3].O*1.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_9 1.) of_9) 0.))
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_11 sc_10))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_11 of_10))
; 
; >=  {((sc.input.I[4].X*1.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_10 1.) of_10) 10.))
; 
; <=  {((sc.input.I[4].X*1.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_10 1.) of_10) 0.))
; 
; >=  {((sc.input.I[4].O*1.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_11 1.) of_11) 10.))
; 
; <=  {((sc.input.I[4].O*1.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_11 1.) of_11) 0.))
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_13 sc_12))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_13 of_12))
; 
; >=  {((sc.input.I[1].X*5499.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_12 5499.) of_12) 10.))
; 
; <=  {((sc.input.I[1].X*5499.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_12 5499.) of_12) 0.))
; 
; >=  {((sc.input.I[1].O*5499.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_13 5499.) of_13) 10.))
; 
; <=  {((sc.input.I[1].O*5499.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_13 5499.) of_13) 0.))
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_15 sc_14))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_15 of_14))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X)} {0.0001}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14) 0.0001))
; 
; =  {(((sc.output.V[2].X*3200.)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_14 3200.) of_14) sltop_14) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.0001))
; 
; =  {(((sc.output.V[2].O*3200.)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_15 3200.) of_15) sltop_15) 3300.))
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_17 sc_16))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_17 of_16))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) 0.0001))
; 
; =  {(((sc.output.V[0].X*3200.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_16 3200.) of_16) sltop_16) 3300.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 0.0001))
; 
; =  {(((sc.output.V[0].O*3200.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_17 3200.) of_17) sltop_17) 3300.))
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_19 sc_18))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_19 of_18))
(declare-fun slbot_18 () Real)
(declare-fun sltop_18 () Real)
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X)} {0.0001}
(assert (= (+ (+ (* sc_18 0.) of_18) slbot_18) 0.0001))
; 
; =  {(((sc.output.V[3].X*3200.)+of.output.V[3].X)+sl.max.output.V[3].X)} {3300.}
(assert (= (+ (+ (* sc_18 3200.) of_18) sltop_18) 3300.))
(declare-fun slbot_19 () Real)
(declare-fun sltop_19 () Real)
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O)} {0.0001}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19) 0.0001))
; 
; =  {(((sc.output.V[3].O*3200.)+of.output.V[3].O)+sl.max.output.V[3].O)} {3300.}
(assert (= (+ (+ (* sc_19 3200.) of_19) sltop_19) 3300.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
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
; =  {(((sc.output.V[1].X*5500.)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_20 5500.) of_20) sltop_20) 3300.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) 0.0001))
; 
; =  {(((sc.output.V[1].O*5500.)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_21 5500.) of_21) sltop_21) 3300.))
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_23 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_26 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_25 (* 1. sc_26)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_25 (* 1. sc_24)) (= sc_25 (* 1. sc_23))))
; no offset
(assert (= (- (+ of_25 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_27 (* sc_25 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_27 0.))
; no scale
(assert (= sc_23 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_23 0.))
; no offset
(assert (= of_28 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_26 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_25 (* 1. sc_26)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_25 (* 1. sc_24)) (= sc_25 (* (* 1. sc_23) sc_28))))
; no offset
(assert (= (- (+ of_25 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_28 (* sc_25 1.)))
; no offset
(assert (= of_28 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_22 (* sc_25 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_22 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_22 0.) of_22) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_23 4.) of_23) 3300.))
; 
; <=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_23 4.) of_23) 0.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_24 0.) of_24) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_25 0.) of_25) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.))
; 
; =  {(((sc.vadd[1].OUT2*3200.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_28 3200.) of_28) sltop_28) 3300.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.))
; 
; =  {(((sc.vadd[1].B*70400000.)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_26 70400000.) of_26) sltop_26) 3300.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) -1650.))
; 
; =  {(((sc.vadd[1].OUT*70400000.)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_27 70400000.) of_27) sltop_27) 1650.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.))
; 
; =  {(((sc.vadd[1].OUT2*3200.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_28 3200.) of_28) sltop_28) 3300.))
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_30 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_29 0.))
; 
; =  {sc.vtoi[1].Y} {((1./sc.vtoi[1].K)*sc.vtoi[1].X)}
(assert (= sc_31 (* (/ 1. sc_30) sc_29)))
; 
; =  {of.vtoi[1].Y} {0.}
(assert (= of_31 0.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vtoi[1].X*0.)+of.vtoi[1].X)+sl.min.vtoi[1].X)} {1.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 1.))
; 
; =  {(((sc.vtoi[1].X*3200.)+of.vtoi[1].X)+sl.max.vtoi[1].X)} {3300.}
(assert (= (+ (+ (* sc_29 3200.) of_29) sltop_29) 3300.))
; 
; >=  {((sc.vtoi[1].K*1.)+of.vtoi[1].K)} {3300.}
(assert (<= (+ (* sc_30 1.) of_30) 3300.))
; 
; <=  {((sc.vtoi[1].K*1.)+of.vtoi[1].K)} {1.}
(assert (>= (+ (* sc_30 1.) of_30) 1.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vtoi[1].Y*0.)+of.vtoi[1].Y)+sl.min.vtoi[1].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.00030303030303))
; 
; =  {(((sc.vtoi[1].Y*3200.)+of.vtoi[1].Y)+sl.max.vtoi[1].Y)} {3300.}
(assert (= (+ (+ (* sc_31 3200.) of_31) sltop_31) 3300.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.mm[2].Xtot} {sc.mm[2].XY}
(assert (= sc_36 sc_38))
; 
; =  {sc.mm[2].X} {sc.mm[2].Xtot}
(assert (= sc_37 sc_36))
; 
; =  {of.mm[2].X} {(of.mm[2].Xtot-of.mm[2].XY)}
(assert (= of_37 (- of_36 of_38)))
; no scale
(assert (= sc_32 1.))
; no offset
(assert (= of_32 0.))
; no offset
(assert (= of_38 0.))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= of_37 0.))
; no offset
(assert (= of_39 0.))
; 
; =  {(sc.mm[2].kf*sc.mm[2].X*sc.mm[2].Y)} {(sc.mm[2].kr*sc.mm[2].XY)}
(assert (= (* (* sc_35 sc_37) sc_39) (* sc_32 sc_38)))
; 
; =  {sc.mm[2].XY} {(sc.mm[2].kf*sc.mm[2].X*sc.mm[2].Y)}
(assert (= sc_38 (* (* sc_35 sc_37) sc_39)))
; no offset
(assert (= of_38 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.mm[2].XY0} {(sc.mm[2].kf*sc.mm[2].X*sc.mm[2].Y)}
(assert (= sc_33 (* (* sc_35 sc_37) sc_39)))
; 
; =  {of.mm[2].XY0} {(0.-0.)}
(assert (= of_33 0.))
; 
; =  {sc.mm[2].Ytot} {sc.mm[2].XY}
(assert (= sc_34 sc_38))
; 
; =  {sc.mm[2].Y} {sc.mm[2].Ytot}
(assert (= sc_39 sc_34))
; 
; =  {of.mm[2].Y} {(of.mm[2].Ytot-of.mm[2].XY)}
(assert (= of_39 (- of_34 of_38)))
; 
; >=  {((sc.mm[2].kr*1.)+of.mm[2].kr)} {10.}
(assert (<= (+ (* sc_32 1.) of_32) 10.))
; 
; <=  {((sc.mm[2].kr*1.)+of.mm[2].kr)} {0.0001}
(assert (>= (+ (* sc_32 1.) of_32) 0.0001))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.mm[2].X*0.)+of.mm[2].X)+sl.min.mm[2].X)} {-3299.9999}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) -3299.9999))
; 
; =  {(((sc.mm[2].X*5500.)+of.mm[2].X)+sl.max.mm[2].X)} {3300.}
(assert (= (+ (+ (* sc_37 5500.) of_37) sltop_37) 3300.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.mm[2].XY*0.)+of.mm[2].XY)+sl.min.mm[2].XY)} {0.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 0.))
; 
; =  {(((sc.mm[2].XY*3200.)+of.mm[2].XY)+sl.max.mm[2].XY)} {3300.}
(assert (= (+ (+ (* sc_38 3200.) of_38) sltop_38) 3300.))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.mm[2].Y*0.)+of.mm[2].Y)+sl.min.mm[2].Y)} {-3299.9999}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) -3299.9999))
; 
; =  {(((sc.mm[2].Y*3200.)+of.mm[2].Y)+sl.max.mm[2].Y)} {3300.}
(assert (= (+ (+ (* sc_39 3200.) of_39) sltop_39) 3300.))
; 
; >=  {((sc.mm[2].XY0*0.)+of.mm[2].XY0)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.mm[2].XY0*0.)+of.mm[2].XY0)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.mm[2].Ytot*3200.)+of.mm[2].Ytot)} {3300.}
(assert (<= (+ (* sc_34 3200.) of_34) 3300.))
; 
; <=  {((sc.mm[2].Ytot*3200.)+of.mm[2].Ytot)} {0.0001}
(assert (>= (+ (* sc_34 3200.) of_34) 0.0001))
; 
; >=  {((sc.mm[2].Xtot*5500.)+of.mm[2].Xtot)} {3300.}
(assert (<= (+ (* sc_36 5500.) of_36) 3300.))
; 
; <=  {((sc.mm[2].Xtot*5500.)+of.mm[2].Xtot)} {0.0001}
(assert (>= (+ (* sc_36 5500.) of_36) 0.0001))
; 
; >=  {((sc.mm[2].kf*1.)+of.mm[2].kf)} {10.}
(assert (<= (+ (* sc_35 1.) of_35) 10.))
; 
; <=  {((sc.mm[2].kf*1.)+of.mm[2].kf)} {0.0001}
(assert (>= (+ (* sc_35 1.) of_35) 0.0001))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_40 0.) of_40) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_41 0.) of_41) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.V[8].X*1.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_42 1.) of_42) 3300.))
; 
; <=  {((sc.input.V[8].X*1.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_42 1.) of_42) 0.))
; 
; >=  {((sc.input.V[8].O*1.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_43 1.) of_43) 3300.))
; 
; <=  {((sc.input.V[8].O*1.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_43 1.) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.V[7].X*4.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_44 4.) of_44) 3300.))
; 
; <=  {((sc.input.V[7].X*4.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_44 4.) of_44) 0.))
; 
; >=  {((sc.input.V[7].O*4.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_45 4.) of_45) 3300.))
; 
; <=  {((sc.input.V[7].O*4.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_45 4.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.V[0].X*5500.)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_46 5500.) of_46) 3300.))
; 
; <=  {((sc.input.V[0].X*5500.)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_46 5500.) of_46) 0.))
; 
; >=  {((sc.input.V[0].O*5500.)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_47 5500.) of_47) 3300.))
; 
; <=  {((sc.input.V[0].O*5500.)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_47 5500.) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.V[6].X*3200.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_48 3200.) of_48) 3300.))
; 
; <=  {((sc.input.V[6].X*3200.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_48 3200.) of_48) 0.))
; 
; >=  {((sc.input.V[6].O*3200.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_49 3200.) of_49) 3300.))
; 
; <=  {((sc.input.V[6].O*3200.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_49 3200.) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_50 0.) of_50) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_51 0.) of_51) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_52 0.) of_52) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_53 0.) of_53) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_54 0.) of_54) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_55 0.) of_55) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_56 0.125) of_56) 3300.))
; 
; <=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_56 0.125) of_56) 0.))
; 
; >=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_57 0.125) of_57) 3300.))
; 
; <=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_57 0.125) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; 
; =  {sc.iadd[3].A} {sc.iadd[3].B}
(assert (= sc_60 sc_61))
; 
; =  {sc.iadd[3].A} {sc.iadd[3].C} {sc.iadd[3].D}
(assert (and (= sc_60 sc_59) (= sc_60 sc_58)))
; 
; =  {sc.iadd[3].OUT} {sc.iadd[3].A}
(assert (= sc_62 sc_60))
; 
; =  {of.iadd[3].OUT} {((of.iadd[3].A+of.iadd[3].B)-of.iadd[3].C-of.iadd[3].D)}
(assert (= of_62 (- (+ of_60 of_61) (+ of_59 of_58))))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.iadd[3].D*0.)+of.iadd[3].D)+sl.min.iadd[3].D)} {0.}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) 0.))
; 
; =  {(((sc.iadd[3].D*3200.)+of.iadd[3].D)+sl.max.iadd[3].D)} {5.}
(assert (= (+ (+ (* sc_58 3200.) of_58) sltop_58) 5.))
; 
; >=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {5.}
(assert (<= (+ (* sc_59 0.) of_59) 5.))
; 
; <=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_62 0.) of_62) slbot_62) -10.))
; 
; =  {(((sc.iadd[3].OUT*5500.)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_62 5500.) of_62) sltop_62) 10.))
; 
; >=  {((sc.iadd[3].A*1.)+of.iadd[3].A)} {5.}
(assert (<= (+ (* sc_60 1.) of_60) 5.))
; 
; <=  {((sc.iadd[3].A*1.)+of.iadd[3].A)} {0.}
(assert (>= (+ (* sc_60 1.) of_60) 0.))
; 
; >=  {((sc.iadd[3].B*5499.)+of.iadd[3].B)} {5.}
(assert (<= (+ (* sc_61 5499.) of_61) 5.))
; 
; <=  {((sc.iadd[3].B*5499.)+of.iadd[3].B)} {0.}
(assert (>= (+ (* sc_61 5499.) of_61) 0.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_64 sc_63))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_64 of_63))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63) 0.))
; 
; =  {(((sc.output.I[0].X*5500.)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_63 5500.) of_63) sltop_63) 10.))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_64 0.) of_64) slbot_64) 0.))
; 
; =  {(((sc.output.I[0].O*5500.)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_64 5500.) of_64) sltop_64) 10.))
; 
; =  {sc.vadd[1].OUT2} {sc.vtoi[1].X}
(assert (= sc_28 sc_29))
; 
; =  {of.vadd[1].OUT2} {of.vtoi[1].X}
(assert (= of_28 of_29))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[3].X}
(assert (= sc_28 sc_18))
; 
; =  {of.vadd[1].OUT2} {of.output.V[3].X}
(assert (= of_28 of_18))
; 
; =  {sc.input.I[0].O} {sc.iadd[3].C}
(assert (= sc_7 sc_59))
; 
; =  {of.input.I[0].O} {of.iadd[3].C}
(assert (= of_7 of_59))
; 
; =  {sc.input.I[4].O} {sc.mm[2].kr}
(assert (= sc_11 sc_32))
; 
; =  {of.input.I[4].O} {of.mm[2].kr}
(assert (= of_11 of_32))
; 
; =  {sc.input.I[3].O} {sc.iadd[3].A}
(assert (= sc_9 sc_60))
; 
; =  {of.input.I[3].O} {of.iadd[3].A}
(assert (= of_9 of_60))
; 
; =  {sc.vtoi[1].Y} {sc.iadd[3].D}
(assert (= sc_31 sc_58))
; 
; =  {of.vtoi[1].Y} {of.iadd[3].D}
(assert (= of_31 of_58))
; 
; =  {sc.input.V[8].O} {sc.vtoi[1].K}
(assert (= sc_43 sc_30))
; 
; =  {of.input.V[8].O} {of.vtoi[1].K}
(assert (= of_43 of_30))
; 
; =  {sc.mm[2].XY} {sc.output.V[2].X}
(assert (= sc_38 sc_14))
; 
; =  {of.mm[2].XY} {of.output.V[2].X}
(assert (= of_38 of_14))
; 
; =  {sc.input.I[2].O} {sc.mm[2].kf}
(assert (= sc_5 sc_35))
; 
; =  {of.input.I[2].O} {of.mm[2].kf}
(assert (= of_5 of_35))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].C}
(assert (= sc_51 sc_24))
; 
; =  {of.input.V[3].O} {of.vadd[1].C}
(assert (= of_51 of_24))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].OUT2_0}
(assert (= sc_41 sc_22))
; 
; =  {of.input.V[2].O} {of.vadd[1].OUT2_0}
(assert (= of_41 of_22))
; 
; =  {sc.input.I[1].O} {sc.iadd[3].B}
(assert (= sc_13 sc_61))
; 
; =  {of.input.I[1].O} {of.iadd[3].B}
(assert (= of_13 of_61))
; 
; =  {sc.input.V[1].O} {sc.vgain[0].Y}
(assert (= sc_57 sc_1))
; 
; =  {of.input.V[1].O} {of.vgain[0].Y}
(assert (= of_57 of_1))
; 
; =  {sc.iadd[3].OUT} {sc.output.I[0].X}
(assert (= sc_62 sc_63))
; 
; =  {of.iadd[3].OUT} {of.output.I[0].X}
(assert (= of_62 of_63))
; 
; =  {sc.vgain[0].P} {sc.vadd[1].B}
(assert (= sc_3 sc_26))
; 
; =  {of.vgain[0].P} {of.vadd[1].B}
(assert (= of_3 of_26))
; 
; =  {sc.input.V[7].O} {sc.vadd[1].D}
(assert (= sc_45 sc_23))
; 
; =  {of.input.V[7].O} {of.vadd[1].D}
(assert (= of_45 of_23))
; 
; =  {sc.input.V[0].O} {sc.mm[2].Xtot}
(assert (= sc_47 sc_36))
; 
; =  {of.input.V[0].O} {of.mm[2].Xtot}
(assert (= of_47 of_36))
; 
; =  {sc.mm[2].Y} {sc.vgain[0].Z}
(assert (= sc_39 sc_2))
; 
; =  {of.mm[2].Y} {of.vgain[0].Z}
(assert (= of_39 of_2))
; 
; =  {sc.mm[2].Y} {sc.output.V[0].X}
(assert (= sc_39 sc_16))
; 
; =  {of.mm[2].Y} {of.output.V[0].X}
(assert (= of_39 of_16))
; 
; =  {sc.input.V[5].O} {sc.mm[2].XY0}
(assert (= sc_55 sc_33))
; 
; =  {of.input.V[5].O} {of.mm[2].XY0}
(assert (= of_55 of_33))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].A}
(assert (= sc_53 sc_25))
; 
; =  {of.input.V[4].O} {of.vadd[1].A}
(assert (= of_53 of_25))
; 
; =  {sc.input.V[6].O} {sc.mm[2].Ytot}
(assert (= sc_49 sc_34))
; 
; =  {of.input.V[6].O} {of.mm[2].Ytot}
(assert (= of_49 of_34))
; 
; =  {sc.mm[2].X} {sc.output.V[1].X}
(assert (= sc_37 sc_20))
; 
; =  {of.mm[2].X} {of.output.V[1].X}
(assert (= of_37 of_20))
; 
; =  {sc.mm[2].X} {sc.vgain[0].X}
(assert (= sc_37 sc_0))
; 
; =  {of.mm[2].X} {of.vgain[0].X}
(assert (= of_37 of_0))
(assert (<= (* (/ 1. sc_15) 0.001) 0.001))
(assert (<= (* (/ 1. sc_19) 0.001) 0.001))
; 
; =  {sc.output.V[2].O} {sc.output.V[3].O} {sc.mm[2].XY} {sc.vadd[1].OUT2}
(assert (and (and (= sc_15 sc_19) (= sc_15 sc_38)) (= sc_15 sc_28)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_0 0.) slbot_0 (- slbot_0)) (ite (>= slbot_14 0.) slbot_14 (- slbot_14))) (ite (>= slbot_29 0.) slbot_29 (- slbot_29))) (ite (>= sltop_14 0.) sltop_14 (- sltop_14))) (ite (>= sltop_18 0.) sltop_18 (- sltop_18))) (ite (>= slbot_16 0.) slbot_16 (- slbot_16))) (ite (>= sltop_0 0.) sltop_0 (- sltop_0))) (ite (>= slbot_20 0.) slbot_20 (- slbot_20))) (ite (>= sltop_27 0.) sltop_27 (- sltop_27))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_19 0.) slbot_19 (- slbot_19))) (ite (>= slbot_63 0.) slbot_63 (- slbot_63))) (ite (>= sltop_28 0.) sltop_28 (- sltop_28))) (ite (>= slbot_26 0.) slbot_26 (- slbot_26))) (ite (>= slbot_64 0.) slbot_64 (- slbot_64))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_37 0.) slbot_37 (- slbot_37))) (ite (>= sltop_38 0.) sltop_38 (- sltop_38))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= slbot_17 0.) slbot_17 (- slbot_17))) (ite (>= sltop_29 0.) sltop_29 (- sltop_29))) (ite (>= sltop_39 0.) sltop_39 (- sltop_39))) (ite (>= sltop_58 0.) sltop_58 (- sltop_58))) (ite (>= slbot_31 0.) slbot_31 (- slbot_31))) (ite (>= slbot_18 0.) slbot_18 (- slbot_18))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= sltop_20 0.) sltop_20 (- sltop_20))) (ite (>= sltop_31 0.) sltop_31 (- sltop_31))) (ite (>= slbot_28 0.) slbot_28 (- slbot_28))) (ite (>= sltop_62 0.) sltop_62 (- sltop_62))) (ite (>= slbot_62 0.) slbot_62 (- slbot_62))) (ite (>= sltop_16 0.) sltop_16 (- sltop_16))) (ite (>= slbot_21 0.) slbot_21 (- slbot_21))) (ite (>= sltop_19 0.) sltop_19 (- sltop_19))) (ite (>= slbot_38 0.) slbot_38 (- slbot_38))) (ite (>= sltop_64 0.) sltop_64 (- sltop_64))) (ite (>= sltop_37 0.) sltop_37 (- sltop_37))) (ite (>= sltop_17 0.) sltop_17 (- sltop_17))) (ite (>= sltop_63 0.) sltop_63 (- sltop_63))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_26 0.) sltop_26 (- sltop_26))) (ite (>= slbot_39 0.) slbot_39 (- slbot_39))) (ite (>= slbot_58 0.) slbot_58 (- slbot_58))) (ite (>= slbot_27 0.) slbot_27 (- slbot_27))) (ite (>= sltop_21 0.) sltop_21 (- sltop_21)))))
(check-sat)
