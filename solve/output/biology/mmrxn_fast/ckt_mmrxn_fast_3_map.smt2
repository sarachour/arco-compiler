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
; =  {(((sc.vgain[0].X*0.124)+of.vgain[0].X)+sl.max.vgain[0].X)} {3300.}
(assert (= (+ (+ (* sc_0 0.124) of_0) sltop_0) 3300.))
; 
; >=  {((sc.vgain[0].Y*0.0396322130628)+of.vgain[0].Y)} {3300.}
(assert (<= (+ (* sc_1 0.0396322130628) of_1) 3300.))
; 
; <=  {((sc.vgain[0].Y*0.0396322130628)+of.vgain[0].Y)} {1.}
(assert (>= (+ (* sc_1 0.0396322130628) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[0].P*0.)+of.vgain[0].P)+sl.min.vgain[0].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[0].P*0.400482304)+of.vgain[0].P)+sl.max.vgain[0].P)} {5445000.}
(assert (= (+ (+ (* sc_3 0.400482304) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[0].Z*0.)+of.vgain[0].Z)+sl.min.vgain[0].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[0].Z*0.256)+of.vgain[0].Z)+sl.max.vgain[0].Z)} {3300.}
(assert (= (+ (+ (* sc_2 0.256) of_2) sltop_2) 3300.))
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
; >=  {((sc.input.I[2].X*0.84)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_4 0.84) of_4) 10.))
; 
; <=  {((sc.input.I[2].X*0.84)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_4 0.84) of_4) 0.))
; 
; >=  {((sc.input.I[2].O*0.84)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_5 0.84) of_5) 10.))
; 
; <=  {((sc.input.I[2].O*0.84)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_5 0.84) of_5) 0.))
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
; >=  {((sc.input.I[0].X*10.1)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_6 10.1) of_6) 10.))
; 
; <=  {((sc.input.I[0].X*10.1)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_6 10.1) of_6) 0.))
; 
; >=  {((sc.input.I[0].O*10.1)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_7 10.1) of_7) 10.))
; 
; <=  {((sc.input.I[0].O*10.1)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_7 10.1) of_7) 0.))
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
; >=  {((sc.input.I[1].X*9.26)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_8 9.26) of_8) 10.))
; 
; <=  {((sc.input.I[1].X*9.26)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_8 9.26) of_8) 0.))
; 
; >=  {((sc.input.I[1].O*9.26)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_9 9.26) of_9) 10.))
; 
; <=  {((sc.input.I[1].O*9.26)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_9 9.26) of_9) 0.))
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
; =  {(((sc.output.V[2].X*0.124)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_10 0.124) of_10) sltop_10) 3300.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 0.0001))
; 
; =  {(((sc.output.V[2].O*0.124)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_11 0.124) of_11) sltop_11) 3300.))
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
; =  {(((sc.output.V[0].X*0.256)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_12 0.256) of_12) sltop_12) 3300.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.256)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_13 0.256) of_13) sltop_13) 3300.))
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_15 sc_14))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_15 of_14))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X)} {0.0001}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14) 0.0001))
; 
; =  {(((sc.output.V[3].X*0.124)+of.output.V[3].X)+sl.max.output.V[3].X)} {3300.}
(assert (= (+ (+ (* sc_14 0.124) of_14) sltop_14) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.0001))
; 
; =  {(((sc.output.V[3].O*0.124)+of.output.V[3].O)+sl.max.output.V[3].O)} {3300.}
(assert (= (+ (+ (* sc_15 0.124) of_15) sltop_15) 3300.))
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_17 sc_16))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_17 of_16))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) 0.0001))
; 
; =  {(((sc.output.V[1].X*0.124)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_16 0.124) of_16) sltop_16) 3300.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.124)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_17 0.124) of_17) sltop_17) 3300.))
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
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_21 (* 1. sc_22)))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D)}
(assert (and (= sc_21 (* 1. sc_20)) (= sc_21 (* 1. sc_19))))
; no offset
(assert (= (- (+ of_21 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT} {(sc.vadd[8].A*1.)}
(assert (= sc_23 (* sc_21 1.)))
; 
; =  {of.vadd[8].OUT} {0.}
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
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_21 (* 1. sc_22)))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D*sc.vadd[8].OUT2)}
(assert (and (= sc_21 (* 1. sc_20)) (= sc_21 (* (* 1. sc_19) sc_24))))
; no offset
(assert (= (- (+ of_21 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT2} {(sc.vadd[8].A*1.)}
(assert (= sc_24 (* sc_21 1.)))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT2_0} {(sc.vadd[8].A*1.)}
(assert (= sc_18 (* sc_21 1.)))
; 
; =  {of.vadd[8].OUT2_0} {0.}
(assert (= of_18 0.))
; 
; >=  {((sc.vadd[8].OUT2_0*0.256)+of.vadd[8].OUT2_0)} {3300.}
(assert (<= (+ (* sc_18 0.256) of_18) 3300.))
; 
; <=  {((sc.vadd[8].OUT2_0*0.256)+of.vadd[8].OUT2_0)} {0.}
(assert (>= (+ (* sc_18 0.256) of_18) 0.))
(declare-fun slbot_19 () Real)
(declare-fun sltop_19 () Real)
; 
; =  {(((sc.vadd[8].D*0.)+of.vadd[8].D)+sl.min.vadd[8].D)} {0.}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19) 0.))
; 
; =  {(((sc.vadd[8].D*1.564384)+of.vadd[8].D)+sl.max.vadd[8].D)} {3300.}
(assert (= (+ (+ (* sc_19 1.564384) of_19) sltop_19) 3300.))
; 
; >=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {3300.}
(assert (<= (+ (* sc_20 0.) of_20) 3300.))
; 
; <=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
; 
; >=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {3300.}
(assert (<= (+ (* sc_21 0.) of_21) 3300.))
; 
; <=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.))
; 
; =  {(((sc.vadd[8].OUT2*0.256)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2)} {3300.}
(assert (= (+ (+ (* sc_24 0.256) of_24) sltop_24) 3300.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[8].B*0.)+of.vadd[8].B)+sl.min.vadd[8].B)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.vadd[8].B*1.14824)+of.vadd[8].B)+sl.max.vadd[8].B)} {3300.}
(assert (= (+ (+ (* sc_22 1.14824) of_22) sltop_22) 3300.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.vadd[8].OUT*0.)+of.vadd[8].OUT)+sl.min.vadd[8].OUT)} {-1650.}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) -1650.))
; 
; =  {(((sc.vadd[8].OUT*1.564384)+of.vadd[8].OUT)+sl.max.vadd[8].OUT)} {1650.}
(assert (= (+ (+ (* sc_23 1.564384) of_23) sltop_23) 1650.))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.))
; 
; =  {(((sc.vadd[8].OUT2*0.256)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2)} {3300.}
(assert (= (+ (+ (* sc_24 0.256) of_24) sltop_24) 3300.))
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
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_26 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_27 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_29 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_28 (* 1. sc_29)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D)}
(assert (and (= sc_28 (* 1. sc_27)) (= sc_28 (* 1. sc_26))))
; no offset
(assert (= (- (+ of_28 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT} {(sc.vadd[3].A*1.)}
(assert (= sc_30 (* sc_28 1.)))
; 
; =  {of.vadd[3].OUT} {0.}
(assert (= of_30 0.))
; no scale
(assert (= sc_26 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_26 0.))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_27 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_29 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_28 (* 1. sc_29)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D*sc.vadd[3].OUT2)}
(assert (and (= sc_28 (* 1. sc_27)) (= sc_28 (* (* 1. sc_26) sc_31))))
; no offset
(assert (= (- (+ of_28 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2} {(sc.vadd[3].A*1.)}
(assert (= sc_31 (* sc_28 1.)))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2_0} {(sc.vadd[3].A*1.)}
(assert (= sc_25 (* sc_28 1.)))
; 
; =  {of.vadd[3].OUT2_0} {0.}
(assert (= of_25 0.))
; 
; >=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {3300.}
(assert (<= (+ (* sc_25 0.) of_25) 3300.))
; 
; <=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
; 
; >=  {((sc.vadd[3].D*0.)+of.vadd[3].D)} {3300.}
(assert (<= (+ (* sc_26 0.) of_26) 3300.))
; 
; <=  {((sc.vadd[3].D*0.)+of.vadd[3].D)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
; 
; >=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {3300.}
(assert (<= (+ (* sc_27 0.) of_27) 3300.))
; 
; <=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {3300.}
(assert (<= (+ (* sc_28 0.) of_28) 3300.))
; 
; <=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.))
; 
; =  {(((sc.vadd[3].OUT2*0.124)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_31 0.124) of_31) sltop_31) 3300.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[3].B*0.)+of.vadd[3].B)+sl.min.vadd[3].B)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.))
; 
; =  {(((sc.vadd[3].B*0.10416)+of.vadd[3].B)+sl.max.vadd[3].B)} {3300.}
(assert (= (+ (+ (* sc_29 0.10416) of_29) sltop_29) 3300.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vadd[3].OUT*0.)+of.vadd[3].OUT)+sl.min.vadd[3].OUT)} {-1650.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) -1650.))
; 
; =  {(((sc.vadd[3].OUT*0.10416)+of.vadd[3].OUT)+sl.max.vadd[3].OUT)} {1650.}
(assert (= (+ (+ (* sc_30 0.10416) of_30) sltop_30) 1650.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.))
; 
; =  {(((sc.vadd[3].OUT2*0.124)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_31 0.124) of_31) sltop_31) 3300.))
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_33 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_34 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_36 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_35 (* 1. sc_36)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_35 (* 1. sc_34)) (= sc_35 (* 1. sc_33))))
; no offset
(assert (= (- (+ of_35 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_37 (* sc_35 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
(assert (= of_37 0.))
; no scale
(assert (= sc_33 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_33 0.))
; no offset
(assert (= of_38 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_34 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_36 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_35 (* 1. sc_36)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_35 (* 1. sc_34)) (= sc_35 (* (* 1. sc_33) sc_38))))
; no offset
(assert (= (- (+ of_35 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_38 (* sc_35 1.)))
; no offset
(assert (= of_38 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_32 (* sc_35 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_32 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.124)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_32 0.124) of_32) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.124)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_32 0.124) of_32) 0.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[5].D*0.)+of.vadd[5].D)+sl.min.vadd[5].D)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[5].D*3.229696)+of.vadd[5].D)+sl.max.vadd[5].D)} {3300.}
(assert (= (+ (+ (* sc_33 3.229696) of_33) sltop_33) 3300.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_34 0.) of_34) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_35 0.) of_35) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 0.))
; 
; =  {(((sc.vadd[5].OUT2*0.124)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_38 0.124) of_38) sltop_38) 3300.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vadd[5].B*0.)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.))
; 
; =  {(((sc.vadd[5].B*1.2524)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_36 1.2524) of_36) sltop_36) 3300.))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.vadd[5].OUT*0.)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) -1650.))
; 
; =  {(((sc.vadd[5].OUT*3.229696)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_37 3.229696) of_37) sltop_37) 1650.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 0.))
; 
; =  {(((sc.vadd[5].OUT2*0.124)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_38 0.124) of_38) sltop_38) 3300.))
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
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_40 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_42 (* 1. sc_43)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_42 (* 1. sc_41)) (= sc_42 (* 1. sc_40))))
; no offset
(assert (= (- (+ of_42 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_44 (* sc_42 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_44 0.))
; no scale
(assert (= sc_40 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_40 0.))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_42 (* 1. sc_43)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_42 (* 1. sc_41)) (= sc_42 (* (* 1. sc_40) sc_45))))
; no offset
(assert (= (- (+ of_42 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_45 (* sc_42 1.)))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_39 (* sc_42 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_39 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_39 0.) of_39) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
; 
; >=  {((sc.vadd[1].D*10.1)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_40 10.1) of_40) 3300.))
; 
; <=  {((sc.vadd[1].D*10.1)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_40 10.1) of_40) 0.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_41 0.) of_41) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_42 0.) of_42) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_45 0.124) of_45) sltop_45) 3300.))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43) 0.))
; 
; =  {(((sc.vadd[1].B*0.400482304)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_43 0.400482304) of_43) sltop_43) 3300.))
(declare-fun slbot_44 () Real)
(declare-fun sltop_44 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44) -1650.))
; 
; =  {(((sc.vadd[1].OUT*0.400482304)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_44 0.400482304) of_44) sltop_44) 1650.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_45 0.124) of_45) sltop_45) 3300.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_46 0.) of_46) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_47 0.) of_47) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
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
; >=  {((sc.input.V[12].X*12.616)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_54 12.616) of_54) 3300.))
; 
; <=  {((sc.input.V[12].X*12.616)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_54 12.616) of_54) 0.))
; 
; >=  {((sc.input.V[12].O*12.616)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_55 12.616) of_55) 3300.))
; 
; <=  {((sc.input.V[12].O*12.616)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_55 12.616) of_55) 0.))
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
; >=  {((sc.input.V[15].X*0.124)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_64 0.124) of_64) 3300.))
; 
; <=  {((sc.input.V[15].X*0.124)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_64 0.124) of_64) 0.))
; 
; >=  {((sc.input.V[15].O*0.124)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_65 0.124) of_65) 3300.))
; 
; <=  {((sc.input.V[15].O*0.124)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_65 0.124) of_65) 0.))
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
; >=  {((sc.input.V[14].X*0.256)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_68 0.256) of_68) 3300.))
; 
; <=  {((sc.input.V[14].X*0.256)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_68 0.256) of_68) 0.))
; 
; >=  {((sc.input.V[14].O*0.256)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_69 0.256) of_69) 3300.))
; 
; <=  {((sc.input.V[14].O*0.256)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_69 0.256) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.V[16].X*0.0396322130628)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_70 0.0396322130628) of_70) 3300.))
; 
; <=  {((sc.input.V[16].X*0.0396322130628)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_70 0.0396322130628) of_70) 0.))
; 
; >=  {((sc.input.V[16].O*0.0396322130628)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_71 0.0396322130628) of_71) 3300.))
; 
; <=  {((sc.input.V[16].O*0.0396322130628)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_71 0.0396322130628) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_73 sc_72))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_73 of_72))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_72 0.) of_72) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_72 0.) of_72) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_73 0.) of_73) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_75 sc_74))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_75 of_74))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_74 0.) of_74) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_75 0.) of_75) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_77 sc_76))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_77 of_76))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_76 0.) of_76) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_77 0.) of_77) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_79 sc_78))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_79 of_78))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_78 0.) of_78) 3300.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
; no offset
(assert (= of_81 0.))
; no offset
(assert (= of_80 0.))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_82 (* sc_81 sc_80)))
; 
; =  {of.itov[2].Y} {0.}
(assert (= of_82 0.))
; 
; >=  {((sc.itov[2].X*0.84)+of.itov[2].X)} {10.}
(assert (<= (+ (* sc_80 0.84) of_80) 10.))
; 
; <=  {((sc.itov[2].X*0.84)+of.itov[2].X)} {0.0001}
(assert (>= (+ (* sc_80 0.84) of_80) 0.0001))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) 0.0001))
; 
; =  {(((sc.itov[2].Y*0.10416)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_82 0.10416) of_82) sltop_82) 3300.))
(declare-fun slbot_81 () Real)
(declare-fun sltop_81 () Real)
; 
; =  {(((sc.itov[2].K*0.)+of.itov[2].K)+sl.min.itov[2].K)} {1.}
(assert (= (+ (+ (* sc_81 0.) of_81) slbot_81) 1.))
; 
; =  {(((sc.itov[2].K*0.124)+of.itov[2].K)+sl.max.itov[2].K)} {330.}
(assert (= (+ (+ (* sc_81 0.124) of_81) sltop_81) 330.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) 0.0001))
; 
; =  {(((sc.itov[2].Y*0.10416)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_82 0.10416) of_82) sltop_82) 3300.))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
; no offset
(assert (= of_84 0.))
; no offset
(assert (= of_83 0.))
; 
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_85 (* sc_84 sc_83)))
; 
; =  {of.itov[7].Y} {0.}
(assert (= of_85 0.))
; 
; >=  {((sc.itov[7].X*9.26)+of.itov[7].X)} {10.}
(assert (<= (+ (* sc_83 9.26) of_83) 10.))
; 
; <=  {((sc.itov[7].X*9.26)+of.itov[7].X)} {0.0001}
(assert (>= (+ (* sc_83 9.26) of_83) 0.0001))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 0.0001))
; 
; =  {(((sc.itov[7].Y*1.14824)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_85 1.14824) of_85) sltop_85) 3300.))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.itov[7].K*0.)+of.itov[7].K)+sl.min.itov[7].K)} {1.}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84) 1.))
; 
; =  {(((sc.itov[7].K*0.124)+of.itov[7].K)+sl.max.itov[7].K)} {330.}
(assert (= (+ (+ (* sc_84 0.124) of_84) sltop_84) 330.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 0.0001))
; 
; =  {(((sc.itov[7].Y*1.14824)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_85 1.14824) of_85) sltop_85) 3300.))
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; no offset
(assert (= of_87 0.))
; no offset
(assert (= of_86 0.))
; 
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_88 (* sc_87 sc_86)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_88 0.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.itov[9].X*0.)+of.itov[9].X)+sl.min.itov[9].X)} {0.0001}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 0.0001))
; 
; =  {(((sc.itov[9].X*0.124)+of.itov[9].X)+sl.max.itov[9].X)} {10.}
(assert (= (+ (+ (* sc_86 0.124) of_86) sltop_86) 10.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.0001))
; 
; =  {(((sc.itov[9].Y*1.564384)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_88 1.564384) of_88) sltop_88) 3300.))
; 
; >=  {((sc.itov[9].K*12.616)+of.itov[9].K)} {330.}
(assert (<= (+ (* sc_87 12.616) of_87) 330.))
; 
; <=  {((sc.itov[9].K*12.616)+of.itov[9].K)} {1.}
(assert (>= (+ (* sc_87 12.616) of_87) 1.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.0001))
; 
; =  {(((sc.itov[9].Y*1.564384)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_88 1.564384) of_88) sltop_88) 3300.))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
; no offset
(assert (= of_90 0.))
; no offset
(assert (= of_89 0.))
; 
; =  {sc.itov[6].Y} {(sc.itov[6].K*sc.itov[6].X)}
(assert (= sc_91 (* sc_90 sc_89)))
; 
; =  {of.itov[6].Y} {0.}
(assert (= of_91 0.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.itov[6].X*0.)+of.itov[6].X)+sl.min.itov[6].X)} {0.0001}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 0.0001))
; 
; =  {(((sc.itov[6].X*0.256)+of.itov[6].X)+sl.max.itov[6].X)} {10.}
(assert (= (+ (+ (* sc_89 0.256) of_89) sltop_89) 10.))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91) 0.0001))
; 
; =  {(((sc.itov[6].Y*3.229696)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_91 3.229696) of_91) sltop_91) 3300.))
; 
; >=  {((sc.itov[6].K*12.616)+of.itov[6].K)} {330.}
(assert (<= (+ (* sc_90 12.616) of_90) 330.))
; 
; <=  {((sc.itov[6].K*12.616)+of.itov[6].K)} {1.}
(assert (>= (+ (* sc_90 12.616) of_90) 1.))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91) 0.0001))
; 
; =  {(((sc.itov[6].Y*3.229696)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_91 3.229696) of_91) sltop_91) 3300.))
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; no offset
(assert (= of_93 0.))
; no offset
(assert (= of_92 0.))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_94 (* sc_93 sc_92)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_94 0.))
; 
; >=  {((sc.itov[4].X*10.1)+of.itov[4].X)} {10.}
(assert (<= (+ (* sc_92 10.1) of_92) 10.))
; 
; <=  {((sc.itov[4].X*10.1)+of.itov[4].X)} {0.0001}
(assert (>= (+ (* sc_92 10.1) of_92) 0.0001))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94) 0.0001))
; 
; =  {(((sc.itov[4].Y*1.2524)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_94 1.2524) of_94) sltop_94) 3300.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.itov[4].K*0.)+of.itov[4].K)+sl.min.itov[4].K)} {1.}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 1.))
; 
; =  {(((sc.itov[4].K*0.124)+of.itov[4].K)+sl.max.itov[4].K)} {330.}
(assert (= (+ (+ (* sc_93 0.124) of_93) sltop_93) 330.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94) 0.0001))
; 
; =  {(((sc.itov[4].Y*1.2524)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_94 1.2524) of_94) sltop_94) 3300.))
; 
; =  {sc.itov[2].Y} {sc.vadd[3].B}
(assert (= sc_82 sc_29))
; 
; =  {of.itov[2].Y} {of.vadd[3].B}
(assert (= of_82 of_29))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[4].K}
(assert (= sc_45 sc_93))
; 
; =  {of.vadd[1].OUT2} {of.itov[4].K}
(assert (= of_45 of_93))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[2].K}
(assert (= sc_45 sc_81))
; 
; =  {of.vadd[1].OUT2} {of.itov[2].K}
(assert (= of_45 of_81))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[7].K}
(assert (= sc_45 sc_84))
; 
; =  {of.vadd[1].OUT2} {of.itov[7].K}
(assert (= of_45 of_84))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[3].X}
(assert (= sc_45 sc_14))
; 
; =  {of.vadd[1].OUT2} {of.output.V[3].X}
(assert (= of_45 of_14))
; 
; =  {sc.input.I[0].O} {sc.itov[4].X}
(assert (= sc_7 sc_92))
; 
; =  {of.input.I[0].O} {of.itov[4].X}
(assert (= of_7 of_92))
; 
; =  {sc.input.V[9].O} {sc.vadd[5].A}
(assert (= sc_57 sc_35))
; 
; =  {of.input.V[9].O} {of.vadd[5].A}
(assert (= of_57 of_35))
; 
; =  {sc.input.V[15].O} {sc.vadd[5].OUT2_0}
(assert (= sc_65 sc_32))
; 
; =  {of.input.V[15].O} {of.vadd[5].OUT2_0}
(assert (= of_65 of_32))
; 
; =  {sc.input.V[13].O} {sc.itov[6].K}
(assert (= sc_53 sc_90))
; 
; =  {of.input.V[13].O} {of.itov[6].K}
(assert (= of_53 of_90))
; 
; =  {sc.input.V[14].O} {sc.vadd[8].OUT2_0}
(assert (= sc_69 sc_18))
; 
; =  {of.input.V[14].O} {of.vadd[8].OUT2_0}
(assert (= of_69 of_18))
; 
; =  {sc.input.V[11].O} {sc.vadd[8].A}
(assert (= sc_61 sc_21))
; 
; =  {of.input.V[11].O} {of.vadd[8].A}
(assert (= of_61 of_21))
; 
; =  {sc.input.V[12].O} {sc.itov[9].K}
(assert (= sc_55 sc_87))
; 
; =  {of.input.V[12].O} {of.itov[9].K}
(assert (= of_55 of_87))
; 
; =  {sc.input.I[2].O} {sc.itov[2].X}
(assert (= sc_5 sc_80))
; 
; =  {of.input.I[2].O} {of.itov[2].X}
(assert (= of_5 of_80))
; 
; =  {sc.input.V[8].O} {sc.vadd[5].C}
(assert (= sc_49 sc_34))
; 
; =  {of.input.V[8].O} {of.vadd[5].C}
(assert (= of_49 of_34))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[2].X}
(assert (= sc_38 sc_10))
; 
; =  {of.vadd[5].OUT2} {of.output.V[2].X}
(assert (= of_38 of_10))
; 
; =  {sc.vadd[5].OUT2} {sc.vgain[0].X}
(assert (= sc_38 sc_0))
; 
; =  {of.vadd[5].OUT2} {of.vgain[0].X}
(assert (= of_38 of_0))
; 
; =  {sc.vadd[5].OUT2} {sc.itov[9].X}
(assert (= sc_38 sc_86))
; 
; =  {of.vadd[5].OUT2} {of.itov[9].X}
(assert (= of_38 of_86))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].A}
(assert (= sc_47 sc_42))
; 
; =  {of.input.V[2].O} {of.vadd[1].A}
(assert (= of_47 of_42))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].C}
(assert (= sc_73 sc_41))
; 
; =  {of.input.V[3].O} {of.vadd[1].C}
(assert (= of_73 of_41))
; 
; =  {sc.itov[7].Y} {sc.vadd[8].B}
(assert (= sc_85 sc_22))
; 
; =  {of.itov[7].Y} {of.vadd[8].B}
(assert (= of_85 of_22))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[1].X}
(assert (= sc_31 sc_16))
; 
; =  {of.vadd[3].OUT2} {of.output.V[1].X}
(assert (= of_31 of_16))
; 
; =  {sc.input.I[1].O} {sc.itov[7].X}
(assert (= sc_9 sc_83))
; 
; =  {of.input.I[1].O} {of.itov[7].X}
(assert (= of_9 of_83))
; 
; =  {sc.input.V[1].O} {sc.vadd[1].OUT2_0}
(assert (= sc_79 sc_39))
; 
; =  {of.input.V[1].O} {of.vadd[1].OUT2_0}
(assert (= of_79 of_39))
; 
; =  {sc.vgain[0].P} {sc.vadd[1].B}
(assert (= sc_3 sc_43))
; 
; =  {of.vgain[0].P} {of.vadd[1].B}
(assert (= of_3 of_43))
; 
; =  {sc.input.V[7].O} {sc.vadd[3].D}
(assert (= sc_51 sc_26))
; 
; =  {of.input.V[7].O} {of.vadd[3].D}
(assert (= of_51 of_26))
; 
; =  {sc.vadd[8].OUT2} {sc.vgain[0].Z}
(assert (= sc_24 sc_2))
; 
; =  {of.vadd[8].OUT2} {of.vgain[0].Z}
(assert (= of_24 of_2))
; 
; =  {sc.vadd[8].OUT2} {sc.output.V[0].X}
(assert (= sc_24 sc_12))
; 
; =  {of.vadd[8].OUT2} {of.output.V[0].X}
(assert (= of_24 of_12))
; 
; =  {sc.vadd[8].OUT2} {sc.itov[6].X}
(assert (= sc_24 sc_89))
; 
; =  {of.vadd[8].OUT2} {of.itov[6].X}
(assert (= of_24 of_89))
; 
; =  {sc.itov[6].Y} {sc.vadd[5].D}
(assert (= sc_91 sc_33))
; 
; =  {of.itov[6].Y} {of.vadd[5].D}
(assert (= of_91 of_33))
; 
; =  {sc.input.V[0].O} {sc.vadd[1].D}
(assert (= sc_59 sc_40))
; 
; =  {of.input.V[0].O} {of.vadd[1].D}
(assert (= of_59 of_40))
; 
; =  {sc.input.V[10].O} {sc.vadd[8].C}
(assert (= sc_63 sc_20))
; 
; =  {of.input.V[10].O} {of.vadd[8].C}
(assert (= of_63 of_20))
; 
; =  {sc.input.V[16].O} {sc.vgain[0].Y}
(assert (= sc_71 sc_1))
; 
; =  {of.input.V[16].O} {of.vgain[0].Y}
(assert (= of_71 of_1))
; 
; =  {sc.itov[4].Y} {sc.vadd[5].B}
(assert (= sc_94 sc_36))
; 
; =  {of.itov[4].Y} {of.vadd[5].B}
(assert (= of_94 of_36))
; 
; =  {sc.itov[9].Y} {sc.vadd[8].D}
(assert (= sc_88 sc_19))
; 
; =  {of.itov[9].Y} {of.vadd[8].D}
(assert (= of_88 of_19))
; 
; =  {sc.input.V[5].O} {sc.vadd[3].A}
(assert (= sc_77 sc_28))
; 
; =  {of.input.V[5].O} {of.vadd[3].A}
(assert (= of_77 of_28))
; 
; =  {sc.input.V[4].O} {sc.vadd[3].OUT2_0}
(assert (= sc_75 sc_25))
; 
; =  {of.input.V[4].O} {of.vadd[3].OUT2_0}
(assert (= of_75 of_25))
; 
; =  {sc.input.V[6].O} {sc.vadd[3].C}
(assert (= sc_67 sc_27))
; 
; =  {of.input.V[6].O} {of.vadd[3].C}
(assert (= of_67 of_27))
(assert (<= (* sc_13 0.001) 0.001))
(assert (<= (* sc_17 0.001) 0.001))
(assert (<= (* sc_11 0.001) 0.001))
(assert (<= (* sc_15 0.001) 0.001))
; 
; =  {sc.vadd[8].OUT2} {sc.output.V[0].O} {sc.vadd[3].OUT2} {sc.output.V[1].O} {sc.vadd[5].OUT2} {sc.output.V[2].O} {sc.vadd[1].OUT2} {sc.output.V[3].O}
(assert (and (and (and (and (and (and (= sc_24 sc_13) (= sc_24 sc_31)) (= sc_24 sc_17)) (= sc_24 sc_38)) (= sc_24 sc_11)) (= sc_24 sc_45)) (= sc_24 sc_15)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_36 0.) sltop_36 (- sltop_36)) (ite (>= slbot_0 0.) slbot_0 (- slbot_0))) (ite (>= slbot_14 0.) slbot_14 (- slbot_14))) (ite (>= sltop_14 0.) sltop_14 (- sltop_14))) (ite (>= slbot_44 0.) slbot_44 (- slbot_44))) (ite (>= slbot_16 0.) slbot_16 (- slbot_16))) (ite (>= sltop_91 0.) sltop_91 (- sltop_91))) (ite (>= slbot_10 0.) slbot_10 (- slbot_10))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_84 0.) slbot_84 (- slbot_84))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= sltop_10 0.) sltop_10 (- sltop_10))) (ite (>= slbot_36 0.) slbot_36 (- slbot_36))) (ite (>= sltop_82 0.) sltop_82 (- sltop_82))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= sltop_22 0.) sltop_22 (- sltop_22))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= sltop_24 0.) sltop_24 (- sltop_24))) (ite (>= sltop_31 0.) sltop_31 (- sltop_31))) (ite (>= sltop_94 0.) sltop_94 (- sltop_94))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= slbot_81 0.) slbot_81 (- slbot_81))) (ite (>= slbot_91 0.) slbot_91 (- slbot_91))) (ite (>= slbot_45 0.) slbot_45 (- slbot_45))) (ite (>= sltop_19 0.) sltop_19 (- sltop_19))) (ite (>= slbot_38 0.) slbot_38 (- slbot_38))) (ite (>= sltop_45 0.) sltop_45 (- sltop_45))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= slbot_23 0.) slbot_23 (- slbot_23))) (ite (>= sltop_17 0.) sltop_17 (- sltop_17))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_84 0.) sltop_84 (- sltop_84))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= slbot_89 0.) slbot_89 (- slbot_89))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= slbot_29 0.) slbot_29 (- slbot_29))) (ite (>= slbot_22 0.) slbot_22 (- slbot_22))) (ite (>= sltop_23 0.) sltop_23 (- sltop_23))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= sltop_0 0.) sltop_0 (- sltop_0))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= sltop_81 0.) sltop_81 (- sltop_81))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= slbot_19 0.) slbot_19 (- slbot_19))) (ite (>= slbot_37 0.) slbot_37 (- slbot_37))) (ite (>= sltop_38 0.) sltop_38 (- sltop_38))) (ite (>= sltop_44 0.) sltop_44 (- sltop_44))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= slbot_17 0.) slbot_17 (- slbot_17))) (ite (>= sltop_29 0.) sltop_29 (- sltop_29))) (ite (>= sltop_89 0.) sltop_89 (- sltop_89))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_31 0.) slbot_31 (- slbot_31))) (ite (>= slbot_82 0.) slbot_82 (- slbot_82))) (ite (>= slbot_24 0.) slbot_24 (- slbot_24))) (ite (>= sltop_16 0.) sltop_16 (- sltop_16))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= slbot_30 0.) slbot_30 (- slbot_30))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= slbot_43 0.) slbot_43 (- slbot_43))) (ite (>= slbot_94 0.) slbot_94 (- slbot_94))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= sltop_30 0.) sltop_30 (- sltop_30))) (ite (>= sltop_37 0.) sltop_37 (- sltop_37))) (ite (>= sltop_43 0.) sltop_43 (- sltop_43))) (ite (>= slbot_33 0.) slbot_33 (- slbot_33))) (ite (>= sltop_33 0.) sltop_33 (- sltop_33)))))
(check-sat)
