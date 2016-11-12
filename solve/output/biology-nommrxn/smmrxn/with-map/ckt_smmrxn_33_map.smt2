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
; =  {sc.vgain[2].P} {((sc.vgain[2].X/sc.vgain[2].Y)*sc.vgain[2].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[2].P} {0.}
(assert (= of_3 0.))
(declare-fun slbot_0 () Real)
(declare-fun sltop_0 () Real)
; 
; =  {(((sc.vgain[2].X*0.)+of.vgain[2].X)+sl.min.vgain[2].X)} {0.0001}
(assert (= (+ (+ (* sc_0 0.) of_0) slbot_0) 0.0001))
; 
; =  {(((sc.vgain[2].X*0.15)+of.vgain[2].X)+sl.max.vgain[2].X)} {3300.}
(assert (= (+ (+ (* sc_0 0.15) of_0) sltop_0) 3300.))
; 
; >=  {((sc.vgain[2].Y*0.125)+of.vgain[2].Y)} {3300.}
(assert (<= (+ (* sc_1 0.125) of_1) 3300.))
; 
; <=  {((sc.vgain[2].Y*0.125)+of.vgain[2].Y)} {1.}
(assert (>= (+ (* sc_1 0.125) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[2].P*0.)+of.vgain[2].P)+sl.min.vgain[2].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[2].P*0.066)+of.vgain[2].P)+sl.max.vgain[2].P)} {5445000.}
(assert (= (+ (+ (* sc_3 0.066) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[2].Z*0.)+of.vgain[2].Z)+sl.min.vgain[2].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[2].Z*0.11)+of.vgain[2].Z)+sl.max.vgain[2].Z)} {3300.}
(assert (= (+ (+ (* sc_2 0.11) of_2) sltop_2) 3300.))
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
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_4 0.) of_4) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_4 0.) of_4) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_5 0.) of_5) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_5 0.) of_5) 0.))
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
; >=  {((sc.input.I[0].X*-0.11)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_6 -0.11) of_6) 10.))
; 
; <=  {((sc.input.I[0].X*-0.11)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_6 -0.11) of_6) 0.))
; 
; >=  {((sc.input.I[0].O*-0.11)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_7 -0.11) of_7) 10.))
; 
; <=  {((sc.input.I[0].O*-0.11)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_7 -0.11) of_7) 0.))
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
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
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
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
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
; =  {(((sc.output.V[0].X*0.11)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_16 0.11) of_16) sltop_16) 3300.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.11)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_17 0.11) of_17) sltop_17) 3300.))
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
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_19 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_20 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_22 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_21 (* 1. sc_22)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D)}
(assert (and (= sc_21 (* 1. sc_20)) (= sc_21 (* 1. sc_19))))
; no offset
(assert (= (- (+ of_21 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT} {(sc.vadd[3].A*1.)}
(assert (= sc_23 (* sc_21 1.)))
; 
; =  {of.vadd[3].OUT} {0.}
(assert (= of_23 0.))
; no scale
(assert (= sc_19 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_19 0.))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_20 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_22 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_21 (* 1. sc_22)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D*sc.vadd[3].OUT2)}
(assert (and (= sc_21 (* 1. sc_20)) (= sc_21 (* (* 1. sc_19) sc_24))))
; no offset
(assert (= (- (+ of_21 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2} {(sc.vadd[3].A*1.)}
(assert (= sc_24 (* sc_21 1.)))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2_0} {(sc.vadd[3].A*1.)}
(assert (= sc_18 (* sc_21 1.)))
; 
; =  {of.vadd[3].OUT2_0} {0.}
(assert (= of_18 0.))
; 
; >=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {3300.}
(assert (<= (+ (* sc_18 0.) of_18) 3300.))
; 
; <=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {3300.}
(assert (<= (+ (* sc_19 4.) of_19) 3300.))
; 
; <=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {0.}
(assert (>= (+ (* sc_19 4.) of_19) 0.))
; 
; >=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {3300.}
(assert (<= (+ (* sc_20 0.) of_20) 3300.))
; 
; <=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
; 
; >=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {3300.}
(assert (<= (+ (* sc_21 0.) of_21) 3300.))
; 
; <=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.))
; 
; =  {(((sc.vadd[3].OUT2*0.11)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_24 0.11) of_24) sltop_24) 3300.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[3].B*0.)+of.vadd[3].B)+sl.min.vadd[3].B)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.vadd[3].B*0.066)+of.vadd[3].B)+sl.max.vadd[3].B)} {3300.}
(assert (= (+ (+ (* sc_22 0.066) of_22) sltop_22) 3300.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.vadd[3].OUT*0.)+of.vadd[3].OUT)+sl.min.vadd[3].OUT)} {-1650.}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) -1650.))
; 
; =  {(((sc.vadd[3].OUT*0.066)+of.vadd[3].OUT)+sl.max.vadd[3].OUT)} {1650.}
(assert (= (+ (+ (* sc_23 0.066) of_23) sltop_23) 1650.))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.))
; 
; =  {(((sc.vadd[3].OUT2*0.11)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_24 0.11) of_24) sltop_24) 3300.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_26 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_25 0.))
; 
; =  {sc.vtoi[0].Y} {((1./sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_27 (* (/ 1. sc_26) sc_25)))
; 
; =  {of.vtoi[0].Y} {0.}
(assert (= of_27 0.))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 1.))
; 
; =  {(((sc.vtoi[0].X*0.11)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_25 0.11) of_25) sltop_25) 3300.))
; 
; >=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_26 1.) of_26) 3300.))
; 
; <=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_26 1.) of_26) 1.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*0.11)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_27 0.11) of_27) sltop_27) 3300.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_28 0.))
; 
; =  {sc.vtoi[1].Y} {((1./sc.vtoi[1].K)*sc.vtoi[1].X)}
(assert (= sc_30 (* (/ 1. sc_29) sc_28)))
; 
; =  {of.vtoi[1].Y} {0.}
(assert (= of_30 0.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vtoi[1].X*0.)+of.vtoi[1].X)+sl.min.vtoi[1].X)} {1.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 1.))
; 
; =  {(((sc.vtoi[1].X*0.11)+of.vtoi[1].X)+sl.max.vtoi[1].X)} {3300.}
(assert (= (+ (+ (* sc_28 0.11) of_28) sltop_28) 3300.))
; 
; >=  {((sc.vtoi[1].K*1.)+of.vtoi[1].K)} {3300.}
(assert (<= (+ (* sc_29 1.) of_29) 3300.))
; 
; <=  {((sc.vtoi[1].K*1.)+of.vtoi[1].K)} {1.}
(assert (>= (+ (* sc_29 1.) of_29) 1.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vtoi[1].Y*0.)+of.vtoi[1].Y)+sl.min.vtoi[1].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.00030303030303))
; 
; =  {(((sc.vtoi[1].Y*0.11)+of.vtoi[1].Y)+sl.max.vtoi[1].Y)} {3300.}
(assert (= (+ (+ (* sc_30 0.11) of_30) sltop_30) 3300.))
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
; >=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_33 0.125) of_33) 3300.))
; 
; <=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_33 0.125) of_33) 0.))
; 
; >=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_34 0.125) of_34) 3300.))
; 
; <=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_34 0.125) of_34) 0.))
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
; >=  {((sc.input.V[6].X*1.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_35 1.) of_35) 3300.))
; 
; <=  {((sc.input.V[6].X*1.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_35 1.) of_35) 0.))
; 
; >=  {((sc.input.V[6].O*1.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_36 1.) of_36) 3300.))
; 
; <=  {((sc.input.V[6].O*1.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_36 1.) of_36) 0.))
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
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_40 of_39))
; 
; >=  {((sc.input.V[5].X*1.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_39 1.) of_39) 3300.))
; 
; <=  {((sc.input.V[5].X*1.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_39 1.) of_39) 0.))
; 
; >=  {((sc.input.V[5].O*1.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_40 1.) of_40) 3300.))
; 
; <=  {((sc.input.V[5].O*1.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_40 1.) of_40) 0.))
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
; >=  {((sc.input.V[4].X*4.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_41 4.) of_41) 3300.))
; 
; <=  {((sc.input.V[4].X*4.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_41 4.) of_41) 0.))
; 
; >=  {((sc.input.V[4].O*4.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_42 4.) of_42) 3300.))
; 
; <=  {((sc.input.V[4].O*4.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_42 4.) of_42) 0.))
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
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_43 0.) of_43) 3300.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_44 0.) of_44) 3300.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.iadd[0].A} {sc.iadd[0].B}
(assert (= sc_47 sc_48))
; 
; =  {sc.iadd[0].A} {sc.iadd[0].C} {sc.iadd[0].D}
(assert (and (= sc_47 sc_46) (= sc_47 sc_45)))
; 
; =  {sc.iadd[0].OUT} {sc.iadd[0].A}
(assert (= sc_49 sc_47))
; 
; =  {of.iadd[0].OUT} {((of.iadd[0].A+of.iadd[0].B)-of.iadd[0].C-of.iadd[0].D)}
(assert (= of_49 (- (+ of_47 of_48) (+ of_46 of_45))))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.iadd[0].D*0.)+of.iadd[0].D)+sl.min.iadd[0].D)} {0.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) 0.))
; 
; =  {(((sc.iadd[0].D*0.11)+of.iadd[0].D)+sl.max.iadd[0].D)} {5.}
(assert (= (+ (+ (* sc_45 0.11) of_45) sltop_45) 5.))
; 
; >=  {((sc.iadd[0].C*0.)+of.iadd[0].C)} {5.}
(assert (<= (+ (* sc_46 0.) of_46) 5.))
; 
; <=  {((sc.iadd[0].C*0.)+of.iadd[0].C)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
(declare-fun slbot_49 () Real)
(declare-fun sltop_49 () Real)
; 
; =  {(((sc.iadd[0].OUT*0.)+of.iadd[0].OUT)+sl.min.iadd[0].OUT)} {-10.}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49) -10.))
; 
; =  {(((sc.iadd[0].OUT*0.15)+of.iadd[0].OUT)+sl.max.iadd[0].OUT)} {10.}
(assert (= (+ (+ (* sc_49 0.15) of_49) sltop_49) 10.))
; 
; >=  {((sc.iadd[0].A*0.15)+of.iadd[0].A)} {5.}
(assert (<= (+ (* sc_47 0.15) of_47) 5.))
; 
; <=  {((sc.iadd[0].A*0.15)+of.iadd[0].A)} {0.}
(assert (>= (+ (* sc_47 0.15) of_47) 0.))
; 
; >=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {5.}
(assert (<= (+ (* sc_48 0.) of_48) 5.))
; 
; <=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
(declare-fun slbot_49 () Real)
(declare-fun sltop_49 () Real)
; 
; =  {(((sc.iadd[0].OUT*0.)+of.iadd[0].OUT)+sl.min.iadd[0].OUT)} {-10.}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49) -10.))
; 
; =  {(((sc.iadd[0].OUT*0.15)+of.iadd[0].OUT)+sl.max.iadd[0].OUT)} {10.}
(assert (= (+ (+ (* sc_49 0.15) of_49) sltop_49) 10.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
; 
; =  {sc.iadd[1].A} {sc.iadd[1].B}
(assert (= sc_52 sc_53))
; 
; =  {sc.iadd[1].A} {sc.iadd[1].C} {sc.iadd[1].D}
(assert (and (= sc_52 sc_51) (= sc_52 sc_50)))
; 
; =  {sc.iadd[1].OUT} {sc.iadd[1].A}
(assert (= sc_54 sc_52))
; 
; =  {of.iadd[1].OUT} {((of.iadd[1].A+of.iadd[1].B)-of.iadd[1].C-of.iadd[1].D)}
(assert (= of_54 (- (+ of_52 of_53) (+ of_51 of_50))))
; 
; >=  {((sc.iadd[1].D*-0.11)+of.iadd[1].D)} {5.}
(assert (<= (+ (* sc_50 -0.11) of_50) 5.))
; 
; <=  {((sc.iadd[1].D*-0.11)+of.iadd[1].D)} {0.}
(assert (>= (+ (* sc_50 -0.11) of_50) 0.))
(declare-fun slbot_51 () Real)
(declare-fun sltop_51 () Real)
; 
; =  {(((sc.iadd[1].C*0.)+of.iadd[1].C)+sl.min.iadd[1].C)} {0.}
(assert (= (+ (+ (* sc_51 0.) of_51) slbot_51) 0.))
; 
; =  {(((sc.iadd[1].C*0.11)+of.iadd[1].C)+sl.max.iadd[1].C)} {5.}
(assert (= (+ (+ (* sc_51 0.11) of_51) sltop_51) 5.))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_54 0.) of_54) slbot_54) -10.))
; 
; =  {(((sc.iadd[1].OUT*0.11)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_54 0.11) of_54) sltop_54) 10.))
; 
; >=  {((sc.iadd[1].A*0.)+of.iadd[1].A)} {5.}
(assert (<= (+ (* sc_52 0.) of_52) 5.))
; 
; <=  {((sc.iadd[1].A*0.)+of.iadd[1].A)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.iadd[1].B*0.)+of.iadd[1].B)} {5.}
(assert (<= (+ (* sc_53 0.) of_53) 5.))
; 
; <=  {((sc.iadd[1].B*0.)+of.iadd[1].B)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_54 0.) of_54) slbot_54) -10.))
; 
; =  {(((sc.iadd[1].OUT*0.11)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_54 0.11) of_54) sltop_54) 10.))
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_56 sc_55))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_56 of_55))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55) 0.))
; 
; =  {(((sc.output.I[0].X*0.11)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_55 0.11) of_55) sltop_55) 10.))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) 0.))
; 
; =  {(((sc.output.I[0].O*0.11)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_56 0.11) of_56) sltop_56) 10.))
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
; 
; =  {sc.output.I[1].O} {sc.output.I[1].X}
(assert (= sc_58 sc_57))
; 
; =  {of.output.I[1].O} {of.output.I[1].X}
(assert (= of_58 of_57))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.output.I[1].X*0.)+of.output.I[1].X)+sl.min.output.I[1].X)} {0.}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) 0.))
; 
; =  {(((sc.output.I[1].X*0.15)+of.output.I[1].X)+sl.max.output.I[1].X)} {10.}
(assert (= (+ (+ (* sc_57 0.15) of_57) sltop_57) 10.))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.output.I[1].O*0.)+of.output.I[1].O)+sl.min.output.I[1].O)} {0.}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) 0.))
; 
; =  {(((sc.output.I[1].O*0.15)+of.output.I[1].O)+sl.max.output.I[1].O)} {10.}
(assert (= (+ (+ (* sc_58 0.15) of_58) sltop_58) 10.))
; 
; =  {sc.input.I[0].O} {sc.iadd[1].D}
(assert (= sc_7 sc_50))
; 
; =  {of.input.I[0].O} {of.iadd[1].D}
(assert (= of_7 of_50))
; 
; =  {sc.input.I[3].O} {sc.iadd[1].A}
(assert (= sc_9 sc_52))
; 
; =  {of.input.I[3].O} {of.iadd[1].A}
(assert (= of_9 of_52))
; 
; =  {sc.input.I[4].O} {sc.iadd[1].B}
(assert (= sc_11 sc_53))
; 
; =  {of.input.I[4].O} {of.iadd[1].B}
(assert (= of_11 of_53))
; 
; =  {sc.input.I[5].O} {sc.iadd[0].A}
(assert (= sc_13 sc_47))
; 
; =  {of.input.I[5].O} {of.iadd[0].A}
(assert (= of_13 of_47))
; 
; =  {sc.vtoi[0].Y} {sc.iadd[0].D}
(assert (= sc_27 sc_45))
; 
; =  {of.vtoi[0].Y} {of.iadd[0].D}
(assert (= of_27 of_45))
; 
; =  {sc.vtoi[1].Y} {sc.iadd[1].C}
(assert (= sc_30 sc_51))
; 
; =  {of.vtoi[1].Y} {of.iadd[1].C}
(assert (= of_30 of_51))
; 
; =  {sc.input.I[2].O} {sc.iadd[0].B}
(assert (= sc_5 sc_48))
; 
; =  {of.input.I[2].O} {of.iadd[0].B}
(assert (= of_5 of_48))
; 
; =  {sc.input.V[3].O} {sc.vadd[3].C}
(assert (= sc_38 sc_20))
; 
; =  {of.input.V[3].O} {of.vadd[3].C}
(assert (= of_38 of_20))
; 
; =  {sc.input.V[2].O} {sc.vadd[3].A}
(assert (= sc_32 sc_21))
; 
; =  {of.input.V[2].O} {of.vadd[3].A}
(assert (= of_32 of_21))
; 
; =  {sc.iadd[0].OUT} {sc.vgain[2].X}
(assert (= sc_49 sc_0))
; 
; =  {of.iadd[0].OUT} {of.vgain[2].X}
(assert (= of_49 of_0))
; 
; =  {sc.iadd[0].OUT} {sc.output.I[1].X}
(assert (= sc_49 sc_57))
; 
; =  {of.iadd[0].OUT} {of.output.I[1].X}
(assert (= of_49 of_57))
; 
; =  {sc.vadd[3].OUT2} {sc.vtoi[1].X}
(assert (= sc_24 sc_28))
; 
; =  {of.vadd[3].OUT2} {of.vtoi[1].X}
(assert (= of_24 of_28))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].X}
(assert (= sc_24 sc_16))
; 
; =  {of.vadd[3].OUT2} {of.output.V[0].X}
(assert (= of_24 of_16))
; 
; =  {sc.vadd[3].OUT2} {sc.vtoi[0].X}
(assert (= sc_24 sc_25))
; 
; =  {of.vadd[3].OUT2} {of.vtoi[0].X}
(assert (= of_24 of_25))
; 
; =  {sc.iadd[1].OUT} {sc.output.I[0].X}
(assert (= sc_54 sc_55))
; 
; =  {of.iadd[1].OUT} {of.output.I[0].X}
(assert (= of_54 of_55))
; 
; =  {sc.iadd[1].OUT} {sc.vgain[2].Z}
(assert (= sc_54 sc_2))
; 
; =  {of.iadd[1].OUT} {of.vgain[2].Z}
(assert (= of_54 of_2))
; 
; =  {sc.input.I[1].O} {sc.iadd[0].C}
(assert (= sc_15 sc_46))
; 
; =  {of.input.I[1].O} {of.iadd[0].C}
(assert (= of_15 of_46))
; 
; =  {sc.input.V[1].O} {sc.vadd[3].OUT2_0}
(assert (= sc_44 sc_18))
; 
; =  {of.input.V[1].O} {of.vadd[3].OUT2_0}
(assert (= of_44 of_18))
; 
; =  {sc.input.V[0].O} {sc.vgain[2].Y}
(assert (= sc_34 sc_1))
; 
; =  {of.input.V[0].O} {of.vgain[2].Y}
(assert (= of_34 of_1))
; 
; =  {sc.input.V[5].O} {sc.vtoi[0].K}
(assert (= sc_40 sc_26))
; 
; =  {of.input.V[5].O} {of.vtoi[0].K}
(assert (= of_40 of_26))
; 
; =  {sc.input.V[4].O} {sc.vadd[3].D}
(assert (= sc_42 sc_19))
; 
; =  {of.input.V[4].O} {of.vadd[3].D}
(assert (= of_42 of_19))
; 
; =  {sc.input.V[6].O} {sc.vtoi[1].K}
(assert (= sc_36 sc_29))
; 
; =  {of.input.V[6].O} {of.vtoi[1].K}
(assert (= of_36 of_29))
; 
; =  {sc.vgain[2].P} {sc.vadd[3].B}
(assert (= sc_3 sc_22))
; 
; =  {of.vgain[2].P} {of.vadd[3].B}
(assert (= of_3 of_22))
(assert (<= (* (/ 1. sc_17) 0.001) 0.001))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].O}
(assert (= sc_24 sc_17))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_0 0.) slbot_0 (- slbot_0)) (ite (>= slbot_22 0.) slbot_22 (- slbot_22))) (ite (>= sltop_23 0.) sltop_23 (- sltop_23))) (ite (>= slbot_16 0.) slbot_16 (- slbot_16))) (ite (>= sltop_55 0.) sltop_55 (- sltop_55))) (ite (>= slbot_49 0.) slbot_49 (- slbot_49))) (ite (>= sltop_0 0.) sltop_0 (- sltop_0))) (ite (>= sltop_27 0.) sltop_27 (- sltop_27))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_28 0.) sltop_28 (- sltop_28))) (ite (>= sltop_54 0.) sltop_54 (- sltop_54))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_17 0.) slbot_17 (- slbot_17))) (ite (>= sltop_49 0.) sltop_49 (- sltop_49))) (ite (>= sltop_58 0.) sltop_58 (- sltop_58))) (ite (>= sltop_22 0.) sltop_22 (- sltop_22))) (ite (>= slbot_25 0.) slbot_25 (- slbot_25))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_24 0.) sltop_24 (- sltop_24))) (ite (>= slbot_24 0.) slbot_24 (- slbot_24))) (ite (>= slbot_28 0.) slbot_28 (- slbot_28))) (ite (>= sltop_57 0.) sltop_57 (- sltop_57))) (ite (>= slbot_55 0.) slbot_55 (- slbot_55))) (ite (>= slbot_57 0.) slbot_57 (- slbot_57))) (ite (>= sltop_16 0.) sltop_16 (- sltop_16))) (ite (>= slbot_54 0.) slbot_54 (- slbot_54))) (ite (>= slbot_56 0.) slbot_56 (- slbot_56))) (ite (>= sltop_56 0.) sltop_56 (- sltop_56))) (ite (>= slbot_51 0.) slbot_51 (- slbot_51))) (ite (>= sltop_51 0.) sltop_51 (- sltop_51))) (ite (>= slbot_45 0.) slbot_45 (- slbot_45))) (ite (>= slbot_30 0.) slbot_30 (- slbot_30))) (ite (>= sltop_30 0.) sltop_30 (- sltop_30))) (ite (>= sltop_45 0.) sltop_45 (- sltop_45))) (ite (>= slbot_23 0.) slbot_23 (- slbot_23))) (ite (>= sltop_25 0.) sltop_25 (- sltop_25))) (ite (>= sltop_17 0.) sltop_17 (- sltop_17))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_58 0.) slbot_58 (- slbot_58))) (ite (>= slbot_27 0.) slbot_27 (- slbot_27)))))
(check-sat)
