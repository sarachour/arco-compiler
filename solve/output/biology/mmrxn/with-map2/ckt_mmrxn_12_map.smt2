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
; 
; >=  {((sc.vgain[2].X*20.2)+of.vgain[2].X)} {3300.}
(assert (<= (+ (* sc_0 20.2) of_0) 3300.))
; 
; <=  {((sc.vgain[2].X*20.2)+of.vgain[2].X)} {0.0001}
(assert (>= (+ (* sc_0 20.2) of_0) 0.0001))
; 
; >=  {((sc.vgain[2].Y*1.)+of.vgain[2].Y)} {3300.}
(assert (<= (+ (* sc_1 1.) of_1) 3300.))
; 
; <=  {((sc.vgain[2].Y*1.)+of.vgain[2].Y)} {1.}
(assert (>= (+ (* sc_1 1.) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[2].P*0.)+of.vgain[2].P)+sl.min.vgain[2].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[2].P*1.2524)+of.vgain[2].P)+sl.max.vgain[2].P)} {5445000.}
(assert (= (+ (+ (* sc_3 1.2524) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[2].Z*0.)+of.vgain[2].Z)+sl.min.vgain[2].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[2].Z*0.124)+of.vgain[2].Z)+sl.max.vgain[2].Z)} {3300.}
(assert (= (+ (+ (* sc_2 0.124) of_2) sltop_2) 3300.))
(declare-fun sc_4 () Real)
(assert (> sc_4 1e-08))
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(assert (> sc_5 1e-08))
(declare-fun of_5 () Real)
(declare-fun sc_6 () Real)
(assert (> sc_6 1e-08))
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
; no offset
(assert (= of_4 0.))
; no offset
(assert (= of_5 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_6 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[8].P} {((sc.vgain[8].X/sc.vgain[8].Y)*sc.vgain[8].Z*1.)}
(assert (= sc_7 (* (* (/ sc_4 sc_5) sc_6) 1.)))
; 
; =  {of.vgain[8].P} {0.}
(assert (= of_7 0.))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.vgain[8].X*0.)+of.vgain[8].X)+sl.min.vgain[8].X)} {0.0001}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4) 0.0001))
; 
; =  {(((sc.vgain[8].X*0.124)+of.vgain[8].X)+sl.max.vgain[8].X)} {3300.}
(assert (= (+ (+ (* sc_4 0.124) of_4) sltop_4) 3300.))
; 
; >=  {((sc.vgain[8].Y*0.0396322130628)+of.vgain[8].Y)} {3300.}
(assert (<= (+ (* sc_5 0.0396322130628) of_5) 3300.))
; 
; <=  {((sc.vgain[8].Y*0.0396322130628)+of.vgain[8].Y)} {1.}
(assert (>= (+ (* sc_5 0.0396322130628) of_5) 1.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[8].P*0.)+of.vgain[8].P)+sl.min.vgain[8].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[8].P*1.564384)+of.vgain[8].P)+sl.max.vgain[8].P)} {5445000.}
(assert (= (+ (+ (* sc_7 1.564384) of_7) sltop_7) 5445000.))
; 
; >=  {((sc.vgain[8].Z*1.)+of.vgain[8].Z)} {3300.}
(assert (<= (+ (* sc_6 1.) of_6) 3300.))
; 
; <=  {((sc.vgain[8].Z*1.)+of.vgain[8].Z)} {0.0001}
(assert (>= (+ (* sc_6 1.) of_6) 0.0001))
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
; =  {(((sc.output.V[2].X*0.124)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_8 0.124) of_8) sltop_8) 3300.))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9) 0.0001))
; 
; =  {(((sc.output.V[2].O*0.124)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_9 0.124) of_9) sltop_9) 3300.))
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
; =  {(((sc.output.V[0].X*0.256)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_10 0.256) of_10) sltop_10) 3300.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.256)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_11 0.256) of_11) sltop_11) 3300.))
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
; =  {(((sc.output.V[3].X*0.124)+of.output.V[3].X)+sl.max.output.V[3].X)} {3300.}
(assert (= (+ (+ (* sc_12 0.124) of_12) sltop_12) 3300.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O)} {0.0001}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 0.0001))
; 
; =  {(((sc.output.V[3].O*0.124)+of.output.V[3].O)+sl.max.output.V[3].O)} {3300.}
(assert (= (+ (+ (* sc_13 0.124) of_13) sltop_13) 3300.))
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
; =  {(((sc.output.V[1].X*0.124)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_14 0.124) of_14) sltop_14) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.124)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_15 0.124) of_15) sltop_15) 3300.))
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
; =  {sc.vadd[9].A} {(1.*sc.vadd[9].B)}
(assert (= sc_19 (* 1. sc_20)))
; 
; =  {sc.vadd[9].A} {(1.*sc.vadd[9].C)} {(1.*sc.vadd[9].D)}
(assert (and (= sc_19 (* 1. sc_18)) (= sc_19 (* 1. sc_17))))
; no offset
(assert (= (- (+ of_19 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[9].OUT} {(sc.vadd[9].A*1.)}
(assert (= sc_21 (* sc_19 1.)))
; 
; =  {of.vadd[9].OUT} {0.}
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
; =  {sc.vadd[9].A} {(1.*sc.vadd[9].B)}
(assert (= sc_19 (* 1. sc_20)))
; 
; =  {sc.vadd[9].A} {(1.*sc.vadd[9].C)} {(1.*sc.vadd[9].D*sc.vadd[9].OUT2)}
(assert (and (= sc_19 (* 1. sc_18)) (= sc_19 (* (* 1. sc_17) sc_22))))
; no offset
(assert (= (- (+ of_19 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[9].OUT2} {(sc.vadd[9].A*1.)}
(assert (= sc_22 (* sc_19 1.)))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[9].OUT2_0} {(sc.vadd[9].A*1.)}
(assert (= sc_16 (* sc_19 1.)))
; 
; =  {of.vadd[9].OUT2_0} {0.}
(assert (= of_16 0.))
; 
; >=  {((sc.vadd[9].OUT2_0*0.)+of.vadd[9].OUT2_0)} {3300.}
(assert (<= (+ (* sc_16 0.) of_16) 3300.))
; 
; <=  {((sc.vadd[9].OUT2_0*0.)+of.vadd[9].OUT2_0)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
; 
; >=  {((sc.vadd[9].D*10.1)+of.vadd[9].D)} {3300.}
(assert (<= (+ (* sc_17 10.1) of_17) 3300.))
; 
; <=  {((sc.vadd[9].D*10.1)+of.vadd[9].D)} {0.}
(assert (>= (+ (* sc_17 10.1) of_17) 0.))
; 
; >=  {((sc.vadd[9].C*0.)+of.vadd[9].C)} {3300.}
(assert (<= (+ (* sc_18 0.) of_18) 3300.))
; 
; <=  {((sc.vadd[9].C*0.)+of.vadd[9].C)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.vadd[9].A*0.)+of.vadd[9].A)} {3300.}
(assert (<= (+ (* sc_19 0.) of_19) 3300.))
; 
; <=  {((sc.vadd[9].A*0.)+of.vadd[9].A)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[9].OUT2*0.)+of.vadd[9].OUT2)+sl.min.vadd[9].OUT2)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.vadd[9].OUT2*0.124)+of.vadd[9].OUT2)+sl.max.vadd[9].OUT2)} {3300.}
(assert (= (+ (+ (* sc_22 0.124) of_22) sltop_22) 3300.))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.vadd[9].B*0.)+of.vadd[9].B)+sl.min.vadd[9].B)} {0.}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.))
; 
; =  {(((sc.vadd[9].B*0.400482304)+of.vadd[9].B)+sl.max.vadd[9].B)} {3300.}
(assert (= (+ (+ (* sc_20 0.400482304) of_20) sltop_20) 3300.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.vadd[9].OUT*0.)+of.vadd[9].OUT)+sl.min.vadd[9].OUT)} {-1650.}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) -1650.))
; 
; =  {(((sc.vadd[9].OUT*0.400482304)+of.vadd[9].OUT)+sl.max.vadd[9].OUT)} {1650.}
(assert (= (+ (+ (* sc_21 0.400482304) of_21) sltop_21) 1650.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[9].OUT2*0.)+of.vadd[9].OUT2)+sl.min.vadd[9].OUT2)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.vadd[9].OUT2*0.124)+of.vadd[9].OUT2)+sl.max.vadd[9].OUT2)} {3300.}
(assert (= (+ (+ (* sc_22 0.124) of_22) sltop_22) 3300.))
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_25 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_27 0.))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_26 (* 1. sc_27)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D)}
(assert (and (= sc_26 (* 1. sc_25)) (= sc_26 (* 1. sc_24))))
; no offset
(assert (= (- (+ of_26 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1.)}
(assert (= sc_28 (* sc_26 1.)))
; 
; =  {of.vadd[6].OUT} {0.}
(assert (= of_28 0.))
; no scale
(assert (= sc_24 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_25 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_27 0.))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_26 (* 1. sc_27)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D*sc.vadd[6].OUT2)}
(assert (and (= sc_26 (* 1. sc_25)) (= sc_26 (* (* 1. sc_24) sc_29))))
; no offset
(assert (= (- (+ of_26 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1.)}
(assert (= sc_29 (* sc_26 1.)))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1.)}
(assert (= sc_23 (* sc_26 1.)))
; 
; =  {of.vadd[6].OUT2_0} {0.}
(assert (= of_23 0.))
; 
; >=  {((sc.vadd[6].OUT2_0*0.256)+of.vadd[6].OUT2_0)} {3300.}
(assert (<= (+ (* sc_23 0.256) of_23) 3300.))
; 
; <=  {((sc.vadd[6].OUT2_0*0.256)+of.vadd[6].OUT2_0)} {0.}
(assert (>= (+ (* sc_23 0.256) of_23) 0.))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.vadd[6].D*0.)+of.vadd[6].D)+sl.min.vadd[6].D)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.))
; 
; =  {(((sc.vadd[6].D*1.564384)+of.vadd[6].D)+sl.max.vadd[6].D)} {3300.}
(assert (= (+ (+ (* sc_24 1.564384) of_24) sltop_24) 3300.))
; 
; >=  {((sc.vadd[6].C*0.)+of.vadd[6].C)} {3300.}
(assert (<= (+ (* sc_25 0.) of_25) 3300.))
; 
; <=  {((sc.vadd[6].C*0.)+of.vadd[6].C)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
; 
; >=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {3300.}
(assert (<= (+ (* sc_26 0.) of_26) 3300.))
; 
; <=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.))
; 
; =  {(((sc.vadd[6].OUT2*0.256)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {3300.}
(assert (= (+ (+ (* sc_29 0.256) of_29) sltop_29) 3300.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vadd[6].B*0.)+of.vadd[6].B)+sl.min.vadd[6].B)} {0.}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 0.))
; 
; =  {(((sc.vadd[6].B*1.14824)+of.vadd[6].B)+sl.max.vadd[6].B)} {3300.}
(assert (= (+ (+ (* sc_27 1.14824) of_27) sltop_27) 3300.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {-1650.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) -1650.))
; 
; =  {(((sc.vadd[6].OUT*1.564384)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1650.}
(assert (= (+ (+ (* sc_28 1.564384) of_28) sltop_28) 1650.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.))
; 
; =  {(((sc.vadd[6].OUT2*0.256)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {3300.}
(assert (= (+ (+ (* sc_29 0.256) of_29) sltop_29) 3300.))
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
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_32 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_34 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_33 (* 1. sc_34)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D)}
(assert (and (= sc_33 (* 1. sc_32)) (= sc_33 (* 1. sc_31))))
; no offset
(assert (= (- (+ of_33 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT} {(sc.vadd[3].A*1.)}
(assert (= sc_35 (* sc_33 1.)))
; 
; =  {of.vadd[3].OUT} {0.}
(assert (= of_35 0.))
; no scale
(assert (= sc_31 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= of_36 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_32 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_34 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_33 (* 1. sc_34)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D*sc.vadd[3].OUT2)}
(assert (and (= sc_33 (* 1. sc_32)) (= sc_33 (* (* 1. sc_31) sc_36))))
; no offset
(assert (= (- (+ of_33 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2} {(sc.vadd[3].A*1.)}
(assert (= sc_36 (* sc_33 1.)))
; no offset
(assert (= of_36 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2_0} {(sc.vadd[3].A*1.)}
(assert (= sc_30 (* sc_33 1.)))
; 
; =  {of.vadd[3].OUT2_0} {0.}
(assert (= of_30 0.))
; 
; >=  {((sc.vadd[3].OUT2_0*0.124)+of.vadd[3].OUT2_0)} {3300.}
(assert (<= (+ (* sc_30 0.124) of_30) 3300.))
; 
; <=  {((sc.vadd[3].OUT2_0*0.124)+of.vadd[3].OUT2_0)} {0.}
(assert (>= (+ (* sc_30 0.124) of_30) 0.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vadd[3].D*0.)+of.vadd[3].D)+sl.min.vadd[3].D)} {0.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.))
; 
; =  {(((sc.vadd[3].D*3.229696)+of.vadd[3].D)+sl.max.vadd[3].D)} {3300.}
(assert (= (+ (+ (* sc_31 3.229696) of_31) sltop_31) 3300.))
; 
; >=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {3300.}
(assert (<= (+ (* sc_32 0.) of_32) 3300.))
; 
; <=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
; 
; >=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.))
; 
; =  {(((sc.vadd[3].OUT2*0.124)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_36 0.124) of_36) sltop_36) 3300.))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.vadd[3].B*0.)+of.vadd[3].B)+sl.min.vadd[3].B)} {0.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) 0.))
; 
; =  {(((sc.vadd[3].B*1.2524)+of.vadd[3].B)+sl.max.vadd[3].B)} {3300.}
(assert (= (+ (+ (* sc_34 1.2524) of_34) sltop_34) 3300.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.vadd[3].OUT*0.)+of.vadd[3].OUT)+sl.min.vadd[3].OUT)} {-1650.}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35) -1650.))
; 
; =  {(((sc.vadd[3].OUT*3.229696)+of.vadd[3].OUT)+sl.max.vadd[3].OUT)} {1650.}
(assert (= (+ (+ (* sc_35 3.229696) of_35) sltop_35) 1650.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.))
; 
; =  {(((sc.vadd[3].OUT2*0.124)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_36 0.124) of_36) sltop_36) 3300.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_38 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_39 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_40 (* 1. sc_41)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_40 (* 1. sc_39)) (= sc_40 (* 1. sc_38))))
; no offset
(assert (= (- (+ of_40 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_42 (* sc_40 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_42 0.))
; no scale
(assert (= sc_38 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_38 0.))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_39 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_40 (* 1. sc_41)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_40 (* 1. sc_39)) (= sc_40 (* (* 1. sc_38) sc_43))))
; no offset
(assert (= (- (+ of_40 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_43 (* sc_40 1.)))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_37 (* sc_40 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_37 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_37 0.) of_37) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
; 
; >=  {((sc.vadd[1].D*0.)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_38 0.) of_38) 3300.))
; 
; <=  {((sc.vadd[1].D*0.)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_39 0.) of_39) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_40 0.) of_40) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_43 0.124) of_43) sltop_43) 3300.))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) 0.))
; 
; =  {(((sc.vadd[1].B*0.10416)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_41 0.10416) of_41) sltop_41) 3300.))
(declare-fun slbot_42 () Real)
(declare-fun sltop_42 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42) -1650.))
; 
; =  {(((sc.vadd[1].OUT*0.10416)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_42 0.10416) of_42) sltop_42) 1650.))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_43 0.124) of_43) sltop_43) 3300.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_44 0.) of_44) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_45 0.) of_45) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.V[20].O} {sc.input.V[20].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.V[20].O} {of.input.V[20].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.V[20].X*1.)+of.input.V[20].X)} {3300.}
(assert (<= (+ (* sc_46 1.) of_46) 3300.))
; 
; <=  {((sc.input.V[20].X*1.)+of.input.V[20].X)} {0.}
(assert (>= (+ (* sc_46 1.) of_46) 0.))
; 
; >=  {((sc.input.V[20].O*1.)+of.input.V[20].O)} {3300.}
(assert (<= (+ (* sc_47 1.) of_47) 3300.))
; 
; <=  {((sc.input.V[20].O*1.)+of.input.V[20].O)} {0.}
(assert (>= (+ (* sc_47 1.) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_48 0.) of_48) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_49 0.) of_49) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_50 0.) of_50) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_51 0.) of_51) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.V[13].X*12.616)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_52 12.616) of_52) 3300.))
; 
; <=  {((sc.input.V[13].X*12.616)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_52 12.616) of_52) 0.))
; 
; >=  {((sc.input.V[13].O*12.616)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_53 12.616) of_53) 3300.))
; 
; <=  {((sc.input.V[13].O*12.616)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_53 12.616) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_54 0.) of_54) 3300.))
; 
; <=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
; 
; >=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_55 0.) of_55) 3300.))
; 
; <=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_56 0.) of_56) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_57 0.) of_57) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_58 10.1) of_58) 3300.))
; 
; <=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_58 10.1) of_58) 0.))
; 
; >=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_59 10.1) of_59) 3300.))
; 
; <=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_59 10.1) of_59) 0.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
; 
; >=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_61 0.) of_61) 3300.))
; 
; <=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_62 0.) of_62) 3300.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_63 0.) of_63) 3300.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.V[15].X*20.2)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_64 20.2) of_64) 3300.))
; 
; <=  {((sc.input.V[15].X*20.2)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_64 20.2) of_64) 0.))
; 
; >=  {((sc.input.V[15].O*20.2)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_65 20.2) of_65) 3300.))
; 
; <=  {((sc.input.V[15].O*20.2)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_65 20.2) of_65) 0.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_66 0.) of_66) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_67 0.) of_67) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.V[14].X*12.616)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_68 12.616) of_68) 3300.))
; 
; <=  {((sc.input.V[14].X*12.616)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_68 12.616) of_68) 0.))
; 
; >=  {((sc.input.V[14].O*12.616)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_69 12.616) of_69) 3300.))
; 
; <=  {((sc.input.V[14].O*12.616)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_69 12.616) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.V[21].O} {sc.input.V[21].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.V[21].O} {of.input.V[21].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.V[21].X*0.0396322130628)+of.input.V[21].X)} {3300.}
(assert (<= (+ (* sc_70 0.0396322130628) of_70) 3300.))
; 
; <=  {((sc.input.V[21].X*0.0396322130628)+of.input.V[21].X)} {0.}
(assert (>= (+ (* sc_70 0.0396322130628) of_70) 0.))
; 
; >=  {((sc.input.V[21].O*0.0396322130628)+of.input.V[21].O)} {3300.}
(assert (<= (+ (* sc_71 0.0396322130628) of_71) 3300.))
; 
; <=  {((sc.input.V[21].O*0.0396322130628)+of.input.V[21].O)} {0.}
(assert (>= (+ (* sc_71 0.0396322130628) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_73 sc_72))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_73 of_72))
; 
; >=  {((sc.input.V[16].X*0.256)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_72 0.256) of_72) 3300.))
; 
; <=  {((sc.input.V[16].X*0.256)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_72 0.256) of_72) 0.))
; 
; >=  {((sc.input.V[16].O*0.256)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_73 0.256) of_73) 3300.))
; 
; <=  {((sc.input.V[16].O*0.256)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_73 0.256) of_73) 0.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_75 sc_74))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_75 of_74))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_74 0.) of_74) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_75 0.) of_75) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_77 sc_76))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_77 of_76))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_76 0.) of_76) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_77 0.) of_77) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_79 sc_78))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_79 of_78))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_78 0.) of_78) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_81 sc_80))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_81 of_80))
; 
; >=  {((sc.input.V[1].X*9.26)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_80 9.26) of_80) 3300.))
; 
; <=  {((sc.input.V[1].X*9.26)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_80 9.26) of_80) 0.))
; 
; >=  {((sc.input.V[1].O*9.26)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_81 9.26) of_81) 3300.))
; 
; <=  {((sc.input.V[1].O*9.26)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_81 9.26) of_81) 0.))
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_83 sc_82))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_83 of_82))
; 
; >=  {((sc.input.V[17].X*0.124)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_82 0.124) of_82) 3300.))
; 
; <=  {((sc.input.V[17].X*0.124)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_82 0.124) of_82) 0.))
; 
; >=  {((sc.input.V[17].O*0.124)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_83 0.124) of_83) 3300.))
; 
; <=  {((sc.input.V[17].O*0.124)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_83 0.124) of_83) 0.))
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_85 sc_84))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_85 of_84))
; 
; >=  {((sc.input.V[18].X*0.84)+of.input.V[18].X)} {3300.}
(assert (<= (+ (* sc_84 0.84) of_84) 3300.))
; 
; <=  {((sc.input.V[18].X*0.84)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_84 0.84) of_84) 0.))
; 
; >=  {((sc.input.V[18].O*0.84)+of.input.V[18].O)} {3300.}
(assert (<= (+ (* sc_85 0.84) of_85) 3300.))
; 
; <=  {((sc.input.V[18].O*0.84)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_85 0.84) of_85) 0.))
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
; 
; =  {sc.input.V[19].O} {sc.input.V[19].X}
(assert (= sc_87 sc_86))
; 
; =  {of.input.V[19].O} {of.input.V[19].X}
(assert (= of_87 of_86))
; 
; >=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {3300.}
(assert (<= (+ (* sc_86 1.) of_86) 3300.))
; 
; <=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {0.}
(assert (>= (+ (* sc_86 1.) of_86) 0.))
; 
; >=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {3300.}
(assert (<= (+ (* sc_87 1.) of_87) 3300.))
; 
; <=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {0.}
(assert (>= (+ (* sc_87 1.) of_87) 0.))
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; no offset
(assert (= of_89 0.))
; no offset
(assert (= of_88 0.))
; 
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_90 (* sc_89 sc_88)))
; 
; =  {of.itov[7].Y} {0.}
(assert (= of_90 0.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.itov[7].X*0.)+of.itov[7].X)+sl.min.itov[7].X)} {0.0001}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.0001))
; 
; =  {(((sc.itov[7].X*0.124)+of.itov[7].X)+sl.max.itov[7].X)} {10.}
(assert (= (+ (+ (* sc_88 0.124) of_88) sltop_88) 10.))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90) 0.0001))
; 
; =  {(((sc.itov[7].Y*1.564384)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_90 1.564384) of_90) sltop_90) 3300.))
; 
; >=  {((sc.itov[7].K*12.616)+of.itov[7].K)} {330.}
(assert (<= (+ (* sc_89 12.616) of_89) 330.))
; 
; <=  {((sc.itov[7].K*12.616)+of.itov[7].K)} {1.}
(assert (>= (+ (* sc_89 12.616) of_89) 1.))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90) 0.0001))
; 
; =  {(((sc.itov[7].Y*1.564384)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_90 1.564384) of_90) sltop_90) 3300.))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
; no offset
(assert (= of_92 0.))
; no offset
(assert (= of_91 0.))
; 
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_93 (* sc_92 sc_91)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_93 0.))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.itov[0].X*0.)+of.itov[0].X)+sl.min.itov[0].X)} {0.0001}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91) 0.0001))
; 
; =  {(((sc.itov[0].X*0.124)+of.itov[0].X)+sl.max.itov[0].X)} {10.}
(assert (= (+ (+ (* sc_91 0.124) of_91) sltop_91) 10.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 0.0001))
; 
; =  {(((sc.itov[0].Y*0.10416)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_93 0.10416) of_93) sltop_93) 3300.))
; 
; >=  {((sc.itov[0].K*0.84)+of.itov[0].K)} {330.}
(assert (<= (+ (* sc_92 0.84) of_92) 330.))
; 
; <=  {((sc.itov[0].K*0.84)+of.itov[0].K)} {1.}
(assert (>= (+ (* sc_92 0.84) of_92) 1.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 0.0001))
; 
; =  {(((sc.itov[0].Y*0.10416)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_93 0.10416) of_93) sltop_93) 3300.))
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
; no offset
(assert (= of_95 0.))
; no offset
(assert (= of_94 0.))
; 
; =  {sc.itov[10].Y} {(sc.itov[10].K*sc.itov[10].X)}
(assert (= sc_96 (* sc_95 sc_94)))
; 
; =  {of.itov[10].Y} {0.}
(assert (= of_96 0.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.itov[10].X*0.)+of.itov[10].X)+sl.min.itov[10].X)} {0.0001}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94) 0.0001))
; 
; =  {(((sc.itov[10].X*0.256)+of.itov[10].X)+sl.max.itov[10].X)} {10.}
(assert (= (+ (+ (* sc_94 0.256) of_94) sltop_94) 10.))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.itov[10].Y*0.)+of.itov[10].Y)+sl.min.itov[10].Y)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96) 0.0001))
; 
; =  {(((sc.itov[10].Y*0.400482304)+of.itov[10].Y)+sl.max.itov[10].Y)} {3300.}
(assert (= (+ (+ (* sc_96 0.400482304) of_96) sltop_96) 3300.))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.itov[10].K*0.)+of.itov[10].K)+sl.min.itov[10].K)} {1.}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95) 1.))
; 
; =  {(((sc.itov[10].K*1.564384)+of.itov[10].K)+sl.max.itov[10].K)} {330.}
(assert (= (+ (+ (* sc_95 1.564384) of_95) sltop_95) 330.))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.itov[10].Y*0.)+of.itov[10].Y)+sl.min.itov[10].Y)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96) 0.0001))
; 
; =  {(((sc.itov[10].Y*0.400482304)+of.itov[10].Y)+sl.max.itov[10].Y)} {3300.}
(assert (= (+ (+ (* sc_96 0.400482304) of_96) sltop_96) 3300.))
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
; no offset
(assert (= of_98 0.))
; no offset
(assert (= of_97 0.))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_99 (* sc_98 sc_97)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_99 0.))
(declare-fun slbot_97 () Real)
(declare-fun sltop_97 () Real)
; 
; =  {(((sc.itov[4].X*0.)+of.itov[4].X)+sl.min.itov[4].X)} {0.0001}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97) 0.0001))
; 
; =  {(((sc.itov[4].X*0.256)+of.itov[4].X)+sl.max.itov[4].X)} {10.}
(assert (= (+ (+ (* sc_97 0.256) of_97) sltop_97) 10.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.0001))
; 
; =  {(((sc.itov[4].Y*3.229696)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_99 3.229696) of_99) sltop_99) 3300.))
; 
; >=  {((sc.itov[4].K*12.616)+of.itov[4].K)} {330.}
(assert (<= (+ (* sc_98 12.616) of_98) 330.))
; 
; <=  {((sc.itov[4].K*12.616)+of.itov[4].K)} {1.}
(assert (>= (+ (* sc_98 12.616) of_98) 1.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.0001))
; 
; =  {(((sc.itov[4].Y*3.229696)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_99 3.229696) of_99) sltop_99) 3300.))
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; no offset
(assert (= of_101 0.))
; no offset
(assert (= of_100 0.))
; 
; =  {sc.itov[5].Y} {(sc.itov[5].K*sc.itov[5].X)}
(assert (= sc_102 (* sc_101 sc_100)))
; 
; =  {of.itov[5].Y} {0.}
(assert (= of_102 0.))
(declare-fun slbot_100 () Real)
(declare-fun sltop_100 () Real)
; 
; =  {(((sc.itov[5].X*0.)+of.itov[5].X)+sl.min.itov[5].X)} {0.0001}
(assert (= (+ (+ (* sc_100 0.) of_100) slbot_100) 0.0001))
; 
; =  {(((sc.itov[5].X*0.124)+of.itov[5].X)+sl.max.itov[5].X)} {10.}
(assert (= (+ (+ (* sc_100 0.124) of_100) sltop_100) 10.))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_102 0.) of_102) slbot_102) 0.0001))
; 
; =  {(((sc.itov[5].Y*1.14824)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_102 1.14824) of_102) sltop_102) 3300.))
; 
; >=  {((sc.itov[5].K*9.26)+of.itov[5].K)} {330.}
(assert (<= (+ (* sc_101 9.26) of_101) 330.))
; 
; <=  {((sc.itov[5].K*9.26)+of.itov[5].K)} {1.}
(assert (>= (+ (* sc_101 9.26) of_101) 1.))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_102 0.) of_102) slbot_102) 0.0001))
; 
; =  {(((sc.itov[5].Y*1.14824)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_102 1.14824) of_102) sltop_102) 3300.))
; 
; =  {sc.input.V[17].O} {sc.vadd[3].OUT2_0}
(assert (= sc_83 sc_30))
; 
; =  {of.input.V[17].O} {of.vadd[3].OUT2_0}
(assert (= of_83 of_30))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[1].X}
(assert (= sc_43 sc_14))
; 
; =  {of.vadd[1].OUT2} {of.output.V[1].X}
(assert (= of_43 of_14))
; 
; =  {sc.vgain[8].P} {sc.itov[10].K}
(assert (= sc_7 sc_95))
; 
; =  {of.vgain[8].P} {of.itov[10].K}
(assert (= of_7 of_95))
; 
; =  {sc.input.V[9].O} {sc.vadd[6].C}
(assert (= sc_57 sc_25))
; 
; =  {of.input.V[9].O} {of.vadd[6].C}
(assert (= of_57 of_25))
; 
; =  {sc.input.V[15].O} {sc.vgain[2].X}
(assert (= sc_65 sc_0))
; 
; =  {of.input.V[15].O} {of.vgain[2].X}
(assert (= of_65 of_0))
; 
; =  {sc.input.V[13].O} {sc.itov[7].K}
(assert (= sc_53 sc_89))
; 
; =  {of.input.V[13].O} {of.itov[7].K}
(assert (= of_53 of_89))
; 
; =  {sc.input.V[14].O} {sc.itov[4].K}
(assert (= sc_69 sc_98))
; 
; =  {of.input.V[14].O} {of.itov[4].K}
(assert (= of_69 of_98))
; 
; =  {sc.input.V[11].O} {sc.vadd[9].C}
(assert (= sc_61 sc_18))
; 
; =  {of.input.V[11].O} {of.vadd[9].C}
(assert (= of_61 of_18))
; 
; =  {sc.itov[5].Y} {sc.vadd[6].B}
(assert (= sc_102 sc_27))
; 
; =  {of.itov[5].Y} {of.vadd[6].B}
(assert (= of_102 of_27))
; 
; =  {sc.input.V[8].O} {sc.vadd[6].A}
(assert (= sc_49 sc_26))
; 
; =  {of.input.V[8].O} {of.vadd[6].A}
(assert (= of_49 of_26))
; 
; =  {sc.input.V[12].O} {sc.vadd[9].A}
(assert (= sc_55 sc_19))
; 
; =  {of.input.V[12].O} {of.vadd[9].A}
(assert (= of_55 of_19))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_75 sc_40))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_75 of_40))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].OUT2_0}
(assert (= sc_45 sc_37))
; 
; =  {of.input.V[2].O} {of.vadd[1].OUT2_0}
(assert (= of_45 of_37))
; 
; =  {sc.itov[7].Y} {sc.vadd[6].D}
(assert (= sc_90 sc_24))
; 
; =  {of.itov[7].Y} {of.vadd[6].D}
(assert (= of_90 of_24))
; 
; =  {sc.input.V[19].O} {sc.vgain[8].Z}
(assert (= sc_87 sc_6))
; 
; =  {of.input.V[19].O} {of.vgain[8].Z}
(assert (= of_87 of_6))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[2].X}
(assert (= sc_36 sc_8))
; 
; =  {of.vadd[3].OUT2} {of.output.V[2].X}
(assert (= of_36 of_8))
; 
; =  {sc.vadd[3].OUT2} {sc.itov[7].X}
(assert (= sc_36 sc_88))
; 
; =  {of.vadd[3].OUT2} {of.itov[7].X}
(assert (= of_36 of_88))
; 
; =  {sc.vadd[3].OUT2} {sc.vgain[8].X}
(assert (= sc_36 sc_4))
; 
; =  {of.vadd[3].OUT2} {of.vgain[8].X}
(assert (= of_36 of_4))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_93 sc_41))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_93 of_41))
; 
; =  {sc.input.V[21].O} {sc.vgain[8].Y}
(assert (= sc_71 sc_5))
; 
; =  {of.input.V[21].O} {of.vgain[8].Y}
(assert (= of_71 of_5))
; 
; =  {sc.input.V[20].O} {sc.vgain[2].Y}
(assert (= sc_47 sc_1))
; 
; =  {of.input.V[20].O} {of.vgain[2].Y}
(assert (= of_47 of_1))
; 
; =  {sc.input.V[1].O} {sc.itov[5].K}
(assert (= sc_81 sc_101))
; 
; =  {of.input.V[1].O} {of.itov[5].K}
(assert (= of_81 of_101))
; 
; =  {sc.input.V[7].O} {sc.vadd[3].A}
(assert (= sc_51 sc_33))
; 
; =  {of.input.V[7].O} {of.vadd[3].A}
(assert (= of_51 of_33))
; 
; =  {sc.vadd[9].OUT2} {sc.itov[0].X}
(assert (= sc_22 sc_91))
; 
; =  {of.vadd[9].OUT2} {of.itov[0].X}
(assert (= of_22 of_91))
; 
; =  {sc.vadd[9].OUT2} {sc.itov[5].X}
(assert (= sc_22 sc_100))
; 
; =  {of.vadd[9].OUT2} {of.itov[5].X}
(assert (= of_22 of_100))
; 
; =  {sc.vadd[9].OUT2} {sc.vgain[2].Z}
(assert (= sc_22 sc_2))
; 
; =  {of.vadd[9].OUT2} {of.vgain[2].Z}
(assert (= of_22 of_2))
; 
; =  {sc.vadd[9].OUT2} {sc.output.V[3].X}
(assert (= sc_22 sc_12))
; 
; =  {of.vadd[9].OUT2} {of.output.V[3].X}
(assert (= of_22 of_12))
; 
; =  {sc.input.V[0].O} {sc.vadd[9].D}
(assert (= sc_59 sc_17))
; 
; =  {of.input.V[0].O} {of.vadd[9].D}
(assert (= of_59 of_17))
; 
; =  {sc.input.V[10].O} {sc.vadd[9].OUT2_0}
(assert (= sc_63 sc_16))
; 
; =  {of.input.V[10].O} {of.vadd[9].OUT2_0}
(assert (= of_63 of_16))
; 
; =  {sc.itov[10].Y} {sc.vadd[9].B}
(assert (= sc_96 sc_20))
; 
; =  {of.itov[10].Y} {of.vadd[9].B}
(assert (= of_96 of_20))
; 
; =  {sc.input.V[16].O} {sc.vadd[6].OUT2_0}
(assert (= sc_73 sc_23))
; 
; =  {of.input.V[16].O} {of.vadd[6].OUT2_0}
(assert (= of_73 of_23))
; 
; =  {sc.input.V[18].O} {sc.itov[0].K}
(assert (= sc_85 sc_92))
; 
; =  {of.input.V[18].O} {of.itov[0].K}
(assert (= of_85 of_92))
; 
; =  {sc.itov[4].Y} {sc.vadd[3].D}
(assert (= sc_99 sc_31))
; 
; =  {of.itov[4].Y} {of.vadd[3].D}
(assert (= of_99 of_31))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].C}
(assert (= sc_77 sc_39))
; 
; =  {of.input.V[4].O} {of.vadd[1].C}
(assert (= of_77 of_39))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[10].X}
(assert (= sc_29 sc_94))
; 
; =  {of.vadd[6].OUT2} {of.itov[10].X}
(assert (= of_29 of_94))
; 
; =  {sc.vadd[6].OUT2} {sc.output.V[0].X}
(assert (= sc_29 sc_10))
; 
; =  {of.vadd[6].OUT2} {of.output.V[0].X}
(assert (= of_29 of_10))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[4].X}
(assert (= sc_29 sc_97))
; 
; =  {of.vadd[6].OUT2} {of.itov[4].X}
(assert (= of_29 of_97))
; 
; =  {sc.input.V[5].O} {sc.vadd[1].D}
(assert (= sc_79 sc_38))
; 
; =  {of.input.V[5].O} {of.vadd[1].D}
(assert (= of_79 of_38))
; 
; =  {sc.input.V[6].O} {sc.vadd[3].C}
(assert (= sc_67 sc_32))
; 
; =  {of.input.V[6].O} {of.vadd[3].C}
(assert (= of_67 of_32))
; 
; =  {sc.vgain[2].P} {sc.vadd[3].B}
(assert (= sc_3 sc_34))
; 
; =  {of.vgain[2].P} {of.vadd[3].B}
(assert (= of_3 of_34))
(assert (<= (* sc_11 0.001) 0.001))
(assert (<= (* sc_15 0.001) 0.001))
(assert (<= (* sc_9 0.001) 0.001))
(assert (<= (* sc_13 0.001) 0.001))
; 
; =  {sc.vadd[6].OUT2} {sc.output.V[0].O} {sc.vadd[1].OUT2} {sc.output.V[1].O} {sc.vadd[3].OUT2} {sc.output.V[2].O} {sc.vadd[9].OUT2} {sc.output.V[3].O}
(assert (and (and (and (and (and (and (= sc_29 sc_11) (= sc_29 sc_43)) (= sc_29 sc_15)) (= sc_29 sc_36)) (= sc_29 sc_9)) (= sc_29 sc_22)) (= sc_29 sc_13)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_36 0.) sltop_36 (- sltop_36)) (ite (>= slbot_14 0.) slbot_14 (- slbot_14))) (ite (>= sltop_96 0.) sltop_96 (- sltop_96))) (ite (>= sltop_14 0.) sltop_14 (- sltop_14))) (ite (>= sltop_91 0.) sltop_91 (- sltop_91))) (ite (>= slbot_10 0.) slbot_10 (- slbot_10))) (ite (>= slbot_35 0.) slbot_35 (- slbot_35))) (ite (>= sltop_90 0.) sltop_90 (- sltop_90))) (ite (>= sltop_4 0.) sltop_4 (- sltop_4))) (ite (>= slbot_20 0.) slbot_20 (- slbot_20))) (ite (>= sltop_27 0.) sltop_27 (- sltop_27))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_42 0.) sltop_42 (- sltop_42))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= sltop_10 0.) sltop_10 (- sltop_10))) (ite (>= slbot_36 0.) slbot_36 (- slbot_36))) (ite (>= sltop_22 0.) sltop_22 (- sltop_22))) (ite (>= slbot_96 0.) slbot_96 (- slbot_96))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= sltop_24 0.) sltop_24 (- sltop_24))) (ite (>= sltop_31 0.) sltop_31 (- sltop_31))) (ite (>= sltop_94 0.) sltop_94 (- sltop_94))) (ite (>= slbot_95 0.) slbot_95 (- slbot_95))) (ite (>= slbot_28 0.) slbot_28 (- slbot_28))) (ite (>= sltop_100 0.) sltop_100 (- sltop_100))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= slbot_91 0.) slbot_91 (- slbot_91))) (ite (>= sltop_34 0.) sltop_34 (- sltop_34))) (ite (>= slbot_42 0.) slbot_42 (- slbot_42))) (ite (>= slbot_34 0.) slbot_34 (- slbot_34))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_35 0.) sltop_35 (- sltop_35))) (ite (>= slbot_27 0.) slbot_27 (- slbot_27))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= slbot_29 0.) slbot_29 (- slbot_29))) (ite (>= slbot_22 0.) slbot_22 (- slbot_22))) (ite (>= sltop_41 0.) sltop_41 (- sltop_41))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= sltop_28 0.) sltop_28 (- sltop_28))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= sltop_29 0.) sltop_29 (- sltop_29))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_31 0.) slbot_31 (- slbot_31))) (ite (>= slbot_90 0.) slbot_90 (- slbot_90))) (ite (>= slbot_41 0.) slbot_41 (- slbot_41))) (ite (>= sltop_20 0.) sltop_20 (- sltop_20))) (ite (>= slbot_24 0.) slbot_24 (- slbot_24))) (ite (>= slbot_4 0.) slbot_4 (- slbot_4))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= sltop_102 0.) sltop_102 (- sltop_102))) (ite (>= slbot_21 0.) slbot_21 (- slbot_21))) (ite (>= sltop_95 0.) sltop_95 (- sltop_95))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= sltop_97 0.) sltop_97 (- sltop_97))) (ite (>= slbot_43 0.) slbot_43 (- slbot_43))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= slbot_94 0.) slbot_94 (- slbot_94))) (ite (>= slbot_100 0.) slbot_100 (- slbot_100))) (ite (>= sltop_43 0.) sltop_43 (- sltop_43))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_97 0.) slbot_97 (- slbot_97))) (ite (>= slbot_102 0.) slbot_102 (- slbot_102))) (ite (>= sltop_21 0.) sltop_21 (- sltop_21)))))
(check-sat)
