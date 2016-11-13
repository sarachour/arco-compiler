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
(assert (= of_2 0.))
; 
; =  {sc.vgain[8].P} {(sc.vgain[8].X*sc.vgain[8].Z)}
(assert (= sc_3 (* sc_0 sc_2)))
; 
; =  {of.vgain[8].P} {0.}
(assert (= of_3 0.))
(declare-fun slbot_0_1 () Real)
(assert (<= slbot_0_1 1e-08))
(declare-fun sltop_0_1 () Real)
(assert (>= sltop_0_1 1e-08))
; 
; =  {(((sc.vgain[8].X*0.)+of.vgain[8].X)+sl.min.vgain[8].X.1)} {0.}
(assert (= (+ (+ (* sc_0 0.) of_0) slbot_0_1) 0.))
; 
; =  {(((sc.vgain[8].X*0.391096)+of.vgain[8].X)+sl.max.vgain[8].X.1)} {3300.}
(assert (= (+ (+ (* sc_0 0.391096) of_0) sltop_0_1) 3300.))
(declare-fun slbot_3_1 () Real)
(assert (<= slbot_3_1 1e-08))
(declare-fun sltop_3_1 () Real)
(assert (>= sltop_3_1 1e-08))
; 
; =  {(((sc.vgain[8].P*0.)+of.vgain[8].P)+sl.min.vgain[8].P.1)} {0.}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3_1) 0.))
; 
; =  {(((sc.vgain[8].P*0.100120576)+of.vgain[8].P)+sl.max.vgain[8].P.1)} {10890000.}
(assert (= (+ (+ (* sc_3 0.100120576) of_3) sltop_3_1) 10890000.))
(declare-fun slbot_2_1 () Real)
(assert (<= slbot_2_1 1e-08))
(declare-fun sltop_2_1 () Real)
(assert (>= sltop_2_1 1e-08))
; 
; =  {(((sc.vgain[8].Z*0.)+of.vgain[8].Z)+sl.min.vgain[8].Z.1)} {0.}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2_1) 0.))
; 
; =  {(((sc.vgain[8].Z*0.256)+of.vgain[8].Z)+sl.max.vgain[8].Z.1)} {3300.}
(assert (= (+ (+ (* sc_2 0.256) of_2) sltop_2_1) 3300.))
(declare-fun slbot_3_1 () Real)
(assert (<= slbot_3_1 1e-08))
(declare-fun sltop_3_1 () Real)
(assert (>= sltop_3_1 1e-08))
; 
; =  {(((sc.vgain[8].P*0.)+of.vgain[8].P)+sl.min.vgain[8].P.1)} {0.}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3_1) 0.))
; 
; =  {(((sc.vgain[8].P*0.100120576)+of.vgain[8].P)+sl.max.vgain[8].P.1)} {10890000.}
(assert (= (+ (+ (* sc_3 0.100120576) of_3) sltop_3_1) 10890000.))
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
(assert (= of_6 0.))
; 
; =  {sc.vgain[9].P} {(sc.vgain[9].X*sc.vgain[9].Z)}
(assert (= sc_7 (* sc_4 sc_6)))
; 
; =  {of.vgain[9].P} {0.}
(assert (= of_7 0.))
(declare-fun slbot_4_1 () Real)
(assert (<= slbot_4_1 1e-08))
(declare-fun sltop_4_1 () Real)
(assert (>= sltop_4_1 1e-08))
; 
; =  {(((sc.vgain[9].X*0.)+of.vgain[9].X)+sl.min.vgain[9].X.1)} {0.}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4_1) 0.))
; 
; =  {(((sc.vgain[9].X*0.124)+of.vgain[9].X)+sl.max.vgain[9].X.1)} {3300.}
(assert (= (+ (+ (* sc_4 0.124) of_4) sltop_4_1) 3300.))
(declare-fun slbot_7_1 () Real)
(assert (<= slbot_7_1 1e-08))
(declare-fun sltop_7_1 () Real)
(assert (>= sltop_7_1 1e-08))
; 
; =  {(((sc.vgain[9].P*0.)+of.vgain[9].P)+sl.min.vgain[9].P.1)} {0.}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7_1) 0.))
; 
; =  {(((sc.vgain[9].P*0.02604)+of.vgain[9].P)+sl.max.vgain[9].P.1)} {10890000.}
(assert (= (+ (+ (* sc_7 0.02604) of_7) sltop_7_1) 10890000.))
; 
; >=  {((sc.vgain[9].Z*0.21)+of.vgain[9].Z)} {3300.}
(assert (<= (+ (* sc_6 0.21) of_6) 3300.))
; 
; <=  {((sc.vgain[9].Z*0.21)+of.vgain[9].Z)} {0.}
(assert (>= (+ (* sc_6 0.21) of_6) 0.))
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
; no offset
(assert (= of_8 0.))
; no offset
(assert (= of_10 0.))
; 
; =  {sc.vgain[6].P} {(sc.vgain[6].X*sc.vgain[6].Z)}
(assert (= sc_11 (* sc_8 sc_10)))
; 
; =  {of.vgain[6].P} {0.}
(assert (= of_11 0.))
; 
; >=  {((sc.vgain[6].X*3.154)+of.vgain[6].X)} {3300.}
(assert (<= (+ (* sc_8 3.154) of_8) 3300.))
; 
; <=  {((sc.vgain[6].X*3.154)+of.vgain[6].X)} {0.}
(assert (>= (+ (* sc_8 3.154) of_8) 0.))
(declare-fun slbot_11_1 () Real)
(assert (<= slbot_11_1 1e-08))
(declare-fun sltop_11_1 () Real)
(assert (>= sltop_11_1 1e-08))
; 
; =  {(((sc.vgain[6].P*0.)+of.vgain[6].P)+sl.min.vgain[6].P.1)} {0.}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11_1) 0.))
; 
; =  {(((sc.vgain[6].P*0.391096)+of.vgain[6].P)+sl.max.vgain[6].P.1)} {10890000.}
(assert (= (+ (+ (* sc_11 0.391096) of_11) sltop_11_1) 10890000.))
(declare-fun slbot_10_1 () Real)
(assert (<= slbot_10_1 1e-08))
(declare-fun sltop_10_1 () Real)
(assert (>= sltop_10_1 1e-08))
; 
; =  {(((sc.vgain[6].Z*0.)+of.vgain[6].Z)+sl.min.vgain[6].Z.1)} {0.}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10_1) 0.))
; 
; =  {(((sc.vgain[6].Z*0.124)+of.vgain[6].Z)+sl.max.vgain[6].Z.1)} {3300.}
(assert (= (+ (+ (* sc_10 0.124) of_10) sltop_10_1) 3300.))
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_13 sc_12))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_13 of_12))
(declare-fun slbot_12_1 () Real)
(assert (<= slbot_12_1 1e-08))
(declare-fun sltop_12_1 () Real)
(assert (>= sltop_12_1 1e-08))
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X.1)} {0.}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12_1) 0.))
; 
; =  {(((sc.output.V[2].X*0.124)+of.output.V[2].X)+sl.max.output.V[2].X.1)} {3300.}
(assert (= (+ (+ (* sc_12 0.124) of_12) sltop_12_1) 3300.))
(declare-fun slbot_13_1 () Real)
(assert (<= slbot_13_1 1e-08))
(declare-fun sltop_13_1 () Real)
(assert (>= sltop_13_1 1e-08))
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O.1)} {0.}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13_1) 0.))
; 
; =  {(((sc.output.V[2].O*0.124)+of.output.V[2].O)+sl.max.output.V[2].O.1)} {3300.}
(assert (= (+ (+ (* sc_13 0.124) of_13) sltop_13_1) 3300.))
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_15 sc_14))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_15 of_14))
(declare-fun slbot_14_1 () Real)
(assert (<= slbot_14_1 1e-08))
(declare-fun sltop_14_1 () Real)
(assert (>= sltop_14_1 1e-08))
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X.1)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14_1) 0.))
; 
; =  {(((sc.output.V[0].X*0.256)+of.output.V[0].X)+sl.max.output.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_14 0.256) of_14) sltop_14_1) 3300.))
(declare-fun slbot_15_1 () Real)
(assert (<= slbot_15_1 1e-08))
(declare-fun sltop_15_1 () Real)
(assert (>= sltop_15_1 1e-08))
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O.1)} {0.}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15_1) 0.))
; 
; =  {(((sc.output.V[0].O*0.256)+of.output.V[0].O)+sl.max.output.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_15 0.256) of_15) sltop_15_1) 3300.))
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_17 sc_16))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_17 of_16))
(declare-fun slbot_16_1 () Real)
(assert (<= slbot_16_1 1e-08))
(declare-fun sltop_16_1 () Real)
(assert (>= sltop_16_1 1e-08))
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X.1)} {0.}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16_1) 0.))
; 
; =  {(((sc.output.V[3].X*0.124)+of.output.V[3].X)+sl.max.output.V[3].X.1)} {3300.}
(assert (= (+ (+ (* sc_16 0.124) of_16) sltop_16_1) 3300.))
(declare-fun slbot_17_1 () Real)
(assert (<= slbot_17_1 1e-08))
(declare-fun sltop_17_1 () Real)
(assert (>= sltop_17_1 1e-08))
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O.1)} {0.}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17_1) 0.))
; 
; =  {(((sc.output.V[3].O*0.124)+of.output.V[3].O)+sl.max.output.V[3].O.1)} {3300.}
(assert (= (+ (+ (* sc_17 0.124) of_17) sltop_17_1) 3300.))
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_19 sc_18))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_19 of_18))
(declare-fun slbot_18_1 () Real)
(assert (<= slbot_18_1 1e-08))
(declare-fun sltop_18_1 () Real)
(assert (>= sltop_18_1 1e-08))
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X.1)} {0.}
(assert (= (+ (+ (* sc_18 0.) of_18) slbot_18_1) 0.))
; 
; =  {(((sc.output.V[1].X*0.124)+of.output.V[1].X)+sl.max.output.V[1].X.1)} {3300.}
(assert (= (+ (+ (* sc_18 0.124) of_18) sltop_18_1) 3300.))
(declare-fun slbot_19_1 () Real)
(assert (<= slbot_19_1 1e-08))
(declare-fun sltop_19_1 () Real)
(assert (>= sltop_19_1 1e-08))
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O.1)} {0.}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19_1) 0.))
; 
; =  {(((sc.output.V[1].O*0.124)+of.output.V[1].O)+sl.max.output.V[1].O.1)} {3300.}
(assert (= (+ (+ (* sc_19 0.124) of_19) sltop_19_1) 3300.))
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
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_21 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_24 0.))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].B)}
(assert (= sc_23 (* 1. sc_24)))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].C)} {(1.*sc.vadd[7].D)}
(assert (and (= sc_23 (* 1. sc_22)) (= sc_23 (* 1. sc_21))))
; no offset
(assert (= (- (+ of_23 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT} {(sc.vadd[7].A*1.)}
(assert (= sc_25 (* sc_23 1.)))
; 
; =  {of.vadd[7].OUT} {0.}
(assert (= of_25 0.))
; no scale
(assert (= sc_21 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_21 0.))
; no offset
(assert (= of_26 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_24 0.))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].B)}
(assert (= sc_23 (* 1. sc_24)))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].C)} {(1.*sc.vadd[7].D*sc.vadd[7].OUT2)}
(assert (and (= sc_23 (* 1. sc_22)) (= sc_23 (* (* 1. sc_21) sc_26))))
; 
; =  {sc.vadd[7].OUT2} {sc.vadd[7].A}
(assert (= sc_26 sc_23))
; no offset
(assert (= of_26 0.))
; no offset
(assert (= (- (+ of_23 0.) (+ 0. 0.)) 0.))
; 
; =  {sc.vadd[7].OUT2_0} {sc.vadd[7].A}
(assert (= sc_20 sc_23))
; 
; =  {of.vadd[7].OUT2_0} {((of.vadd[7].A+0.)-0.-0.)}
(assert (= of_20 (- (+ of_23 0.) (+ 0. 0.))))
; 
; >=  {((sc.vadd[7].OUT2_0*0.)+of.vadd[7].OUT2_0)} {3300.}
(assert (<= (+ (* sc_20 0.) of_20) 3300.))
; 
; <=  {((sc.vadd[7].OUT2_0*0.)+of.vadd[7].OUT2_0)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
; 
; >=  {((sc.vadd[7].D*2.525)+of.vadd[7].D)} {3300.}
(assert (<= (+ (* sc_21 2.525) of_21) 3300.))
; 
; <=  {((sc.vadd[7].D*2.525)+of.vadd[7].D)} {0.}
(assert (>= (+ (* sc_21 2.525) of_21) 0.))
; 
; >=  {((sc.vadd[7].C*0.)+of.vadd[7].C)} {3300.}
(assert (<= (+ (* sc_22 0.) of_22) 3300.))
; 
; <=  {((sc.vadd[7].C*0.)+of.vadd[7].C)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.vadd[7].A*0.)+of.vadd[7].A)} {3300.}
(assert (<= (+ (* sc_23 0.) of_23) 3300.))
; 
; <=  {((sc.vadd[7].A*0.)+of.vadd[7].A)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
(declare-fun slbot_26_1 () Real)
(assert (<= slbot_26_1 1e-08))
(declare-fun sltop_26_1 () Real)
(assert (>= sltop_26_1 1e-08))
; 
; =  {(((sc.vadd[7].OUT2*0.)+of.vadd[7].OUT2)+sl.min.vadd[7].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26_1) 0.))
; 
; =  {(((sc.vadd[7].OUT2*0.124)+of.vadd[7].OUT2)+sl.max.vadd[7].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_26 0.124) of_26) sltop_26_1) 3300.))
(declare-fun slbot_24_1 () Real)
(assert (<= slbot_24_1 1e-08))
(declare-fun sltop_24_1 () Real)
(assert (>= sltop_24_1 1e-08))
; 
; =  {(((sc.vadd[7].B*0.)+of.vadd[7].B)+sl.min.vadd[7].B.1)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24_1) 0.))
; 
; =  {(((sc.vadd[7].B*0.100120576)+of.vadd[7].B)+sl.max.vadd[7].B.1)} {3300.}
(assert (= (+ (+ (* sc_24 0.100120576) of_24) sltop_24_1) 3300.))
(declare-fun slbot_25_1 () Real)
(assert (<= slbot_25_1 1e-08))
(declare-fun sltop_25_1 () Real)
(assert (>= sltop_25_1 1e-08))
; 
; =  {(((sc.vadd[7].OUT*0.)+of.vadd[7].OUT)+sl.min.vadd[7].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25_1) -1650.))
; 
; =  {(((sc.vadd[7].OUT*0.100120576)+of.vadd[7].OUT)+sl.max.vadd[7].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_25 0.100120576) of_25) sltop_25_1) 1650.))
(declare-fun slbot_26_1 () Real)
(assert (<= slbot_26_1 1e-08))
(declare-fun sltop_26_1 () Real)
(assert (>= sltop_26_1 1e-08))
; 
; =  {(((sc.vadd[7].OUT2*0.)+of.vadd[7].OUT2)+sl.min.vadd[7].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26_1) 0.))
; 
; =  {(((sc.vadd[7].OUT2*0.124)+of.vadd[7].OUT2)+sl.max.vadd[7].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_26 0.124) of_26) sltop_26_1) 3300.))
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
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_28 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_30 (* 1. sc_31)))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D)}
(assert (and (= sc_30 (* 1. sc_29)) (= sc_30 (* 1. sc_28))))
; no offset
(assert (= (- (+ of_30 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT} {(sc.vadd[10].A*1.)}
(assert (= sc_32 (* sc_30 1.)))
; 
; =  {of.vadd[10].OUT} {0.}
(assert (= of_32 0.))
; no scale
(assert (= sc_28 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_28 0.))
; no offset
(assert (= of_33 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_30 (* 1. sc_31)))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D*sc.vadd[10].OUT2)}
(assert (and (= sc_30 (* 1. sc_29)) (= sc_30 (* (* 1. sc_28) sc_33))))
; 
; =  {sc.vadd[10].OUT2} {sc.vadd[10].A}
(assert (= sc_33 sc_30))
; no offset
(assert (= of_33 0.))
; no offset
(assert (= (- (+ of_30 0.) (+ 0. 0.)) 0.))
; 
; =  {sc.vadd[10].OUT2_0} {sc.vadd[10].A}
(assert (= sc_27 sc_30))
; 
; =  {of.vadd[10].OUT2_0} {((of.vadd[10].A+0.)-0.-0.)}
(assert (= of_27 (- (+ of_30 0.) (+ 0. 0.))))
; 
; >=  {((sc.vadd[10].OUT2_0*0.)+of.vadd[10].OUT2_0)} {3300.}
(assert (<= (+ (* sc_27 0.) of_27) 3300.))
; 
; <=  {((sc.vadd[10].OUT2_0*0.)+of.vadd[10].OUT2_0)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.vadd[10].D*0.)+of.vadd[10].D)} {3300.}
(assert (<= (+ (* sc_28 0.) of_28) 3300.))
; 
; <=  {((sc.vadd[10].D*0.)+of.vadd[10].D)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
; 
; >=  {((sc.vadd[10].C*0.)+of.vadd[10].C)} {3300.}
(assert (<= (+ (* sc_29 0.) of_29) 3300.))
; 
; <=  {((sc.vadd[10].C*0.)+of.vadd[10].C)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
; 
; >=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {3300.}
(assert (<= (+ (* sc_30 0.) of_30) 3300.))
; 
; <=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
(declare-fun slbot_33_1 () Real)
(assert (<= slbot_33_1 1e-08))
(declare-fun sltop_33_1 () Real)
(assert (>= sltop_33_1 1e-08))
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33_1) 0.))
; 
; =  {(((sc.vadd[10].OUT2*0.124)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_33 0.124) of_33) sltop_33_1) 3300.))
(declare-fun slbot_31_1 () Real)
(assert (<= slbot_31_1 1e-08))
(declare-fun sltop_31_1 () Real)
(assert (>= sltop_31_1 1e-08))
; 
; =  {(((sc.vadd[10].B*0.)+of.vadd[10].B)+sl.min.vadd[10].B.1)} {0.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31_1) 0.))
; 
; =  {(((sc.vadd[10].B*0.02604)+of.vadd[10].B)+sl.max.vadd[10].B.1)} {3300.}
(assert (= (+ (+ (* sc_31 0.02604) of_31) sltop_31_1) 3300.))
(declare-fun slbot_32_1 () Real)
(assert (<= slbot_32_1 1e-08))
(declare-fun sltop_32_1 () Real)
(assert (>= sltop_32_1 1e-08))
; 
; =  {(((sc.vadd[10].OUT*0.)+of.vadd[10].OUT)+sl.min.vadd[10].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32_1) -1650.))
; 
; =  {(((sc.vadd[10].OUT*0.02604)+of.vadd[10].OUT)+sl.max.vadd[10].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_32 0.02604) of_32) sltop_32_1) 1650.))
(declare-fun slbot_33_1 () Real)
(assert (<= slbot_33_1 1e-08))
(declare-fun sltop_33_1 () Real)
(assert (>= sltop_33_1 1e-08))
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33_1) 0.))
; 
; =  {(((sc.vadd[10].OUT2*0.124)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_33 0.124) of_33) sltop_33_1) 3300.))
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
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_36 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_38 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_37 (* 1. sc_38)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D)}
(assert (and (= sc_37 (* 1. sc_36)) (= sc_37 (* 1. sc_35))))
; no offset
(assert (= (- (+ of_37 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1.)}
(assert (= sc_39 (* sc_37 1.)))
; 
; =  {of.vadd[4].OUT} {0.}
(assert (= of_39 0.))
; no scale
(assert (= sc_35 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= of_40 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_36 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_38 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_37 (* 1. sc_38)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D*sc.vadd[4].OUT2)}
(assert (and (= sc_37 (* 1. sc_36)) (= sc_37 (* (* 1. sc_35) sc_40))))
; 
; =  {sc.vadd[4].OUT2} {sc.vadd[4].A}
(assert (= sc_40 sc_37))
; no offset
(assert (= of_40 0.))
; no offset
(assert (= (- (+ of_37 0.) (+ 0. 0.)) 0.))
; 
; =  {sc.vadd[4].OUT2_0} {sc.vadd[4].A}
(assert (= sc_34 sc_37))
; 
; =  {of.vadd[4].OUT2_0} {((of.vadd[4].A+0.)-0.-0.)}
(assert (= of_34 (- (+ of_37 0.) (+ 0. 0.))))
; 
; >=  {((sc.vadd[4].OUT2_0*0.256)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_34 0.256) of_34) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.256)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_34 0.256) of_34) 0.))
(declare-fun slbot_35_1 () Real)
(assert (<= slbot_35_1 1e-08))
(declare-fun sltop_35_1 () Real)
(assert (>= sltop_35_1 1e-08))
; 
; =  {(((sc.vadd[4].D*0.)+of.vadd[4].D)+sl.min.vadd[4].D.1)} {0.}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35_1) 0.))
; 
; =  {(((sc.vadd[4].D*0.391096)+of.vadd[4].D)+sl.max.vadd[4].D.1)} {3300.}
(assert (= (+ (+ (* sc_35 0.391096) of_35) sltop_35_1) 3300.))
; 
; >=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {3300.}
(assert (<= (+ (* sc_36 0.) of_36) 3300.))
; 
; <=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_37 0.) of_37) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
(declare-fun slbot_40_1 () Real)
(assert (<= slbot_40_1 1e-08))
(declare-fun sltop_40_1 () Real)
(assert (>= sltop_40_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40_1) 0.))
; 
; =  {(((sc.vadd[4].OUT2*0.256)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_40 0.256) of_40) sltop_40_1) 3300.))
(declare-fun slbot_38_1 () Real)
(assert (<= slbot_38_1 1e-08))
(declare-fun sltop_38_1 () Real)
(assert (>= sltop_38_1 1e-08))
; 
; =  {(((sc.vadd[4].B*0.)+of.vadd[4].B)+sl.min.vadd[4].B.1)} {0.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38_1) 0.))
; 
; =  {(((sc.vadd[4].B*0.28706)+of.vadd[4].B)+sl.max.vadd[4].B.1)} {3300.}
(assert (= (+ (+ (* sc_38 0.28706) of_38) sltop_38_1) 3300.))
(declare-fun slbot_39_1 () Real)
(assert (<= slbot_39_1 1e-08))
(declare-fun sltop_39_1 () Real)
(assert (>= sltop_39_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39_1) -1650.))
; 
; =  {(((sc.vadd[4].OUT*0.28706)+of.vadd[4].OUT)+sl.max.vadd[4].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_39 0.28706) of_39) sltop_39_1) 1650.))
(declare-fun slbot_40_1 () Real)
(assert (<= slbot_40_1 1e-08))
(declare-fun sltop_40_1 () Real)
(assert (>= sltop_40_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40_1) 0.))
; 
; =  {(((sc.vadd[4].OUT2*0.256)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_40 0.256) of_40) sltop_40_1) 3300.))
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
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_44 (* 1. sc_45)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_44 (* 1. sc_43)) (= sc_44 (* 1. sc_42))))
; no offset
(assert (= (- (+ of_44 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_46 (* sc_44 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_46 0.))
; no scale
(assert (= sc_42 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_44 (* 1. sc_45)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_44 (* 1. sc_43)) (= sc_44 (* (* 1. sc_42) sc_47))))
; 
; =  {sc.vadd[1].OUT2} {sc.vadd[1].A}
(assert (= sc_47 sc_44))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= (- (+ of_44 0.) (+ 0. 0.)) 0.))
; 
; =  {sc.vadd[1].OUT2_0} {sc.vadd[1].A}
(assert (= sc_41 sc_44))
; 
; =  {of.vadd[1].OUT2_0} {((of.vadd[1].A+0.)-0.-0.)}
(assert (= of_41 (- (+ of_44 0.) (+ 0. 0.))))
; 
; >=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_41 0.124) of_41) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_41 0.124) of_41) 0.))
(declare-fun slbot_42_1 () Real)
(assert (<= slbot_42_1 1e-08))
(declare-fun sltop_42_1 () Real)
(assert (>= sltop_42_1 1e-08))
; 
; =  {(((sc.vadd[1].D*0.)+of.vadd[1].D)+sl.min.vadd[1].D.1)} {0.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42_1) 0.))
; 
; =  {(((sc.vadd[1].D*0.807424)+of.vadd[1].D)+sl.max.vadd[1].D.1)} {3300.}
(assert (= (+ (+ (* sc_42 0.807424) of_42) sltop_42_1) 3300.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_43 0.) of_43) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_44 0.) of_44) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun slbot_47_1 () Real)
(assert (<= slbot_47_1 1e-08))
(declare-fun sltop_47_1 () Real)
(assert (>= sltop_47_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_47 0.124) of_47) sltop_47_1) 3300.))
(declare-fun slbot_45_1 () Real)
(assert (<= slbot_45_1 1e-08))
(declare-fun sltop_45_1 () Real)
(assert (>= sltop_45_1 1e-08))
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B.1)} {0.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45_1) 0.))
; 
; =  {(((sc.vadd[1].B*0.3131)+of.vadd[1].B)+sl.max.vadd[1].B.1)} {3300.}
(assert (= (+ (+ (* sc_45 0.3131) of_45) sltop_45_1) 3300.))
(declare-fun slbot_46_1 () Real)
(assert (<= slbot_46_1 1e-08))
(declare-fun sltop_46_1 () Real)
(assert (>= sltop_46_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46_1) -1650.))
; 
; =  {(((sc.vadd[1].OUT*0.3131)+of.vadd[1].OUT)+sl.max.vadd[1].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_46 0.3131) of_46) sltop_46_1) 1650.))
(declare-fun slbot_47_1 () Real)
(assert (<= slbot_47_1 1e-08))
(declare-fun sltop_47_1 () Real)
(assert (>= sltop_47_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_47 0.124) of_47) sltop_47_1) 3300.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.V[2].X*3.154)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_48 3.154) of_48) 3300.))
; 
; <=  {((sc.input.V[2].X*3.154)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_48 3.154) of_48) 0.))
; 
; >=  {((sc.input.V[2].O*3.154)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_49 3.154) of_49) 3300.))
; 
; <=  {((sc.input.V[2].O*3.154)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_49 3.154) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_50 0.) of_50) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_51 0.) of_51) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_52 0.) of_52) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_53 0.) of_53) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_54 0.) of_54) 3300.))
; 
; <=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
; 
; >=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_55 0.) of_55) 3300.))
; 
; <=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_56 0.) of_56) 3300.))
; 
; <=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
; 
; >=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_57 0.) of_57) 3300.))
; 
; <=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_58 0.) of_58) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_59 0.) of_59) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.V[0].X*3.154)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_60 3.154) of_60) 3300.))
; 
; <=  {((sc.input.V[0].X*3.154)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_60 3.154) of_60) 0.))
; 
; >=  {((sc.input.V[0].O*3.154)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_61 3.154) of_61) 3300.))
; 
; <=  {((sc.input.V[0].O*3.154)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_61 3.154) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_62 0.) of_62) 3300.))
; 
; <=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
; 
; >=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_63 0.) of_63) 3300.))
; 
; <=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_64 0.) of_64) 3300.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_65 0.) of_65) 3300.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.V[15].X*0.124)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_66 0.124) of_66) 3300.))
; 
; <=  {((sc.input.V[15].X*0.124)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_66 0.124) of_66) 0.))
; 
; >=  {((sc.input.V[15].O*0.124)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_67 0.124) of_67) 3300.))
; 
; <=  {((sc.input.V[15].O*0.124)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_67 0.124) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_68 0.) of_68) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_69 0.) of_69) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.V[14].X*0.256)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_70 0.256) of_70) 3300.))
; 
; <=  {((sc.input.V[14].X*0.256)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_70 0.256) of_70) 0.))
; 
; >=  {((sc.input.V[14].O*0.256)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_71 0.256) of_71) 3300.))
; 
; <=  {((sc.input.V[14].O*0.256)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_71 0.256) of_71) 0.))
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
; >=  {((sc.input.V[16].X*0.21)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_72 0.21) of_72) 3300.))
; 
; <=  {((sc.input.V[16].X*0.21)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_72 0.21) of_72) 0.))
; 
; >=  {((sc.input.V[16].O*0.21)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_73 0.21) of_73) 3300.))
; 
; <=  {((sc.input.V[16].O*0.21)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_73 0.21) of_73) 0.))
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
; >=  {((sc.input.V[1].X*3.154)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_80 3.154) of_80) 3300.))
; 
; <=  {((sc.input.V[1].X*3.154)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_80 3.154) of_80) 0.))
; 
; >=  {((sc.input.V[1].O*3.154)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_81 3.154) of_81) 3300.))
; 
; <=  {((sc.input.V[1].O*3.154)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_81 3.154) of_81) 0.))
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
; >=  {((sc.input.V[17].X*2.525)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_82 2.525) of_82) 3300.))
; 
; <=  {((sc.input.V[17].X*2.525)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_82 2.525) of_82) 0.))
; 
; >=  {((sc.input.V[17].O*2.525)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_83 2.525) of_83) 3300.))
; 
; <=  {((sc.input.V[17].O*2.525)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_83 2.525) of_83) 0.))
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
; >=  {((sc.input.V[18].X*2.525)+of.input.V[18].X)} {3300.}
(assert (<= (+ (* sc_84 2.525) of_84) 3300.))
; 
; <=  {((sc.input.V[18].X*2.525)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_84 2.525) of_84) 0.))
; 
; >=  {((sc.input.V[18].O*2.525)+of.input.V[18].O)} {3300.}
(assert (<= (+ (* sc_85 2.525) of_85) 3300.))
; 
; <=  {((sc.input.V[18].O*2.525)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_85 2.525) of_85) 0.))
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
; >=  {((sc.input.V[19].X*2.315)+of.input.V[19].X)} {3300.}
(assert (<= (+ (* sc_86 2.315) of_86) 3300.))
; 
; <=  {((sc.input.V[19].X*2.315)+of.input.V[19].X)} {0.}
(assert (>= (+ (* sc_86 2.315) of_86) 0.))
; 
; >=  {((sc.input.V[19].O*2.315)+of.input.V[19].O)} {3300.}
(assert (<= (+ (* sc_87 2.315) of_87) 3300.))
; 
; <=  {((sc.input.V[19].O*2.315)+of.input.V[19].O)} {0.}
(assert (>= (+ (* sc_87 2.315) of_87) 0.))
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
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_90 (* sc_89 sc_88)))
; 
; =  {of.itov[2].Y} {0.}
(assert (= of_90 0.))
(declare-fun slbot_88_1 () Real)
(assert (<= slbot_88_1 1e-08))
(declare-fun sltop_88_1 () Real)
(assert (>= sltop_88_1 1e-08))
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X.1)} {0.}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88_1) 0.))
; 
; =  {(((sc.itov[2].X*0.124)+of.itov[2].X)+sl.max.itov[2].X.1)} {10.}
(assert (= (+ (+ (* sc_88 0.124) of_88) sltop_88_1) 10.))
(declare-fun slbot_90_1 () Real)
(assert (<= slbot_90_1 1e-08))
(declare-fun sltop_90_1 () Real)
(assert (>= sltop_90_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90_1) 0.))
; 
; =  {(((sc.itov[2].Y*0.3131)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_90 0.3131) of_90) sltop_90_1) 3300.))
; 
; >=  {((sc.itov[2].K*2.525)+of.itov[2].K)} {330.}
(assert (<= (+ (* sc_89 2.525) of_89) 330.))
; 
; <=  {((sc.itov[2].K*2.525)+of.itov[2].K)} {1.}
(assert (>= (+ (* sc_89 2.525) of_89) 1.))
(declare-fun slbot_90_1 () Real)
(assert (<= slbot_90_1 1e-08))
(declare-fun sltop_90_1 () Real)
(assert (>= sltop_90_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90_1) 0.))
; 
; =  {(((sc.itov[2].Y*0.3131)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_90 0.3131) of_90) sltop_90_1) 3300.))
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
(declare-fun slbot_91_1 () Real)
(assert (<= slbot_91_1 1e-08))
(declare-fun sltop_91_1 () Real)
(assert (>= sltop_91_1 1e-08))
; 
; =  {(((sc.itov[0].X*0.)+of.itov[0].X)+sl.min.itov[0].X.1)} {0.}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91_1) 0.))
; 
; =  {(((sc.itov[0].X*0.256)+of.itov[0].X)+sl.max.itov[0].X.1)} {10.}
(assert (= (+ (+ (* sc_91 0.256) of_91) sltop_91_1) 10.))
(declare-fun slbot_93_1 () Real)
(assert (<= slbot_93_1 1e-08))
(declare-fun sltop_93_1 () Real)
(assert (>= sltop_93_1 1e-08))
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y.1)} {0.}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93_1) 0.))
; 
; =  {(((sc.itov[0].Y*0.807424)+of.itov[0].Y)+sl.max.itov[0].Y.1)} {3300.}
(assert (= (+ (+ (* sc_93 0.807424) of_93) sltop_93_1) 3300.))
; 
; >=  {((sc.itov[0].K*3.154)+of.itov[0].K)} {330.}
(assert (<= (+ (* sc_92 3.154) of_92) 330.))
; 
; <=  {((sc.itov[0].K*3.154)+of.itov[0].K)} {1.}
(assert (>= (+ (* sc_92 3.154) of_92) 1.))
(declare-fun slbot_93_1 () Real)
(assert (<= slbot_93_1 1e-08))
(declare-fun sltop_93_1 () Real)
(assert (>= sltop_93_1 1e-08))
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y.1)} {0.}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93_1) 0.))
; 
; =  {(((sc.itov[0].Y*0.807424)+of.itov[0].Y)+sl.max.itov[0].Y.1)} {3300.}
(assert (= (+ (+ (* sc_93 0.807424) of_93) sltop_93_1) 3300.))
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
; =  {sc.itov[3].Y} {(sc.itov[3].K*sc.itov[3].X)}
(assert (= sc_96 (* sc_95 sc_94)))
; 
; =  {of.itov[3].Y} {0.}
(assert (= of_96 0.))
(declare-fun slbot_94_1 () Real)
(assert (<= slbot_94_1 1e-08))
(declare-fun sltop_94_1 () Real)
(assert (>= sltop_94_1 1e-08))
; 
; =  {(((sc.itov[3].X*0.)+of.itov[3].X)+sl.min.itov[3].X.1)} {0.}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94_1) 0.))
; 
; =  {(((sc.itov[3].X*0.124)+of.itov[3].X)+sl.max.itov[3].X.1)} {10.}
(assert (= (+ (+ (* sc_94 0.124) of_94) sltop_94_1) 10.))
(declare-fun slbot_96_1 () Real)
(assert (<= slbot_96_1 1e-08))
(declare-fun sltop_96_1 () Real)
(assert (>= sltop_96_1 1e-08))
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y.1)} {0.}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96_1) 0.))
; 
; =  {(((sc.itov[3].Y*0.391096)+of.itov[3].Y)+sl.max.itov[3].Y.1)} {3300.}
(assert (= (+ (+ (* sc_96 0.391096) of_96) sltop_96_1) 3300.))
; 
; >=  {((sc.itov[3].K*3.154)+of.itov[3].K)} {330.}
(assert (<= (+ (* sc_95 3.154) of_95) 330.))
; 
; <=  {((sc.itov[3].K*3.154)+of.itov[3].K)} {1.}
(assert (>= (+ (* sc_95 3.154) of_95) 1.))
(declare-fun slbot_96_1 () Real)
(assert (<= slbot_96_1 1e-08))
(declare-fun sltop_96_1 () Real)
(assert (>= sltop_96_1 1e-08))
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y.1)} {0.}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96_1) 0.))
; 
; =  {(((sc.itov[3].Y*0.391096)+of.itov[3].Y)+sl.max.itov[3].Y.1)} {3300.}
(assert (= (+ (+ (* sc_96 0.391096) of_96) sltop_96_1) 3300.))
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
; =  {sc.itov[5].Y} {(sc.itov[5].K*sc.itov[5].X)}
(assert (= sc_99 (* sc_98 sc_97)))
; 
; =  {of.itov[5].Y} {0.}
(assert (= of_99 0.))
(declare-fun slbot_97_1 () Real)
(assert (<= slbot_97_1 1e-08))
(declare-fun sltop_97_1 () Real)
(assert (>= sltop_97_1 1e-08))
; 
; =  {(((sc.itov[5].X*0.)+of.itov[5].X)+sl.min.itov[5].X.1)} {0.}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97_1) 0.))
; 
; =  {(((sc.itov[5].X*0.124)+of.itov[5].X)+sl.max.itov[5].X.1)} {10.}
(assert (= (+ (+ (* sc_97 0.124) of_97) sltop_97_1) 10.))
(declare-fun slbot_99_1 () Real)
(assert (<= slbot_99_1 1e-08))
(declare-fun sltop_99_1 () Real)
(assert (>= sltop_99_1 1e-08))
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y.1)} {0.}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99_1) 0.))
; 
; =  {(((sc.itov[5].Y*0.28706)+of.itov[5].Y)+sl.max.itov[5].Y.1)} {3300.}
(assert (= (+ (+ (* sc_99 0.28706) of_99) sltop_99_1) 3300.))
; 
; >=  {((sc.itov[5].K*2.315)+of.itov[5].K)} {330.}
(assert (<= (+ (* sc_98 2.315) of_98) 330.))
; 
; <=  {((sc.itov[5].K*2.315)+of.itov[5].K)} {1.}
(assert (>= (+ (* sc_98 2.315) of_98) 1.))
(declare-fun slbot_99_1 () Real)
(assert (<= slbot_99_1 1e-08))
(declare-fun sltop_99_1 () Real)
(assert (>= sltop_99_1 1e-08))
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y.1)} {0.}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99_1) 0.))
; 
; =  {(((sc.itov[5].Y*0.28706)+of.itov[5].Y)+sl.max.itov[5].Y.1)} {3300.}
(assert (= (+ (+ (* sc_99 0.28706) of_99) sltop_99_1) 3300.))
; 
; =  {sc.vadd[7].OUT2} {sc.itov[2].X}
(assert (= sc_26 sc_88))
; 
; =  {of.vadd[7].OUT2} {of.itov[2].X}
(assert (= of_26 of_88))
; 
; =  {sc.vadd[7].OUT2} {sc.itov[5].X}
(assert (= sc_26 sc_97))
; 
; =  {of.vadd[7].OUT2} {of.itov[5].X}
(assert (= of_26 of_97))
; 
; =  {sc.vadd[7].OUT2} {sc.vgain[9].X}
(assert (= sc_26 sc_4))
; 
; =  {of.vadd[7].OUT2} {of.vgain[9].X}
(assert (= of_26 of_4))
; 
; =  {sc.vadd[7].OUT2} {sc.output.V[3].X}
(assert (= sc_26 sc_16))
; 
; =  {of.vadd[7].OUT2} {of.output.V[3].X}
(assert (= of_26 of_16))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].B}
(assert (= sc_90 sc_45))
; 
; =  {of.itov[2].Y} {of.vadd[1].B}
(assert (= of_90 of_45))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[0].X}
(assert (= sc_40 sc_91))
; 
; =  {of.vadd[4].OUT2} {of.itov[0].X}
(assert (= of_40 of_91))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[0].X}
(assert (= sc_40 sc_14))
; 
; =  {of.vadd[4].OUT2} {of.output.V[0].X}
(assert (= of_40 of_14))
; 
; =  {sc.vadd[4].OUT2} {sc.vgain[8].Z}
(assert (= sc_40 sc_2))
; 
; =  {of.vadd[4].OUT2} {of.vgain[8].Z}
(assert (= of_40 of_2))
; 
; =  {sc.input.V[17].O} {sc.vadd[7].D}
(assert (= sc_83 sc_21))
; 
; =  {of.input.V[17].O} {of.vadd[7].D}
(assert (= of_83 of_21))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[3].X}
(assert (= sc_47 sc_94))
; 
; =  {of.vadd[1].OUT2} {of.itov[3].X}
(assert (= of_47 of_94))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[2].X}
(assert (= sc_47 sc_12))
; 
; =  {of.vadd[1].OUT2} {of.output.V[2].X}
(assert (= of_47 of_12))
; 
; =  {sc.vadd[1].OUT2} {sc.vgain[6].Z}
(assert (= sc_47 sc_10))
; 
; =  {of.vadd[1].OUT2} {of.vgain[6].Z}
(assert (= of_47 of_10))
; 
; =  {sc.vgain[8].P} {sc.vadd[7].B}
(assert (= sc_3 sc_24))
; 
; =  {of.vgain[8].P} {of.vadd[7].B}
(assert (= of_3 of_24))
; 
; =  {sc.input.V[9].O} {sc.vadd[7].A}
(assert (= sc_59 sc_23))
; 
; =  {of.input.V[9].O} {of.vadd[7].A}
(assert (= of_59 of_23))
; 
; =  {sc.input.V[15].O} {sc.vadd[1].OUT2_0}
(assert (= sc_67 sc_41))
; 
; =  {of.input.V[15].O} {of.vadd[1].OUT2_0}
(assert (= of_67 of_41))
; 
; =  {sc.input.V[13].O} {sc.vadd[10].C}
(assert (= sc_55 sc_29))
; 
; =  {of.input.V[13].O} {of.vadd[10].C}
(assert (= of_55 of_29))
; 
; =  {sc.vgain[6].P} {sc.vgain[8].X}
(assert (= sc_11 sc_0))
; 
; =  {of.vgain[6].P} {of.vgain[8].X}
(assert (= of_11 of_0))
; 
; =  {sc.input.V[14].O} {sc.vadd[4].OUT2_0}
(assert (= sc_71 sc_34))
; 
; =  {of.input.V[14].O} {of.vadd[4].OUT2_0}
(assert (= of_71 of_34))
; 
; =  {sc.input.V[11].O} {sc.vadd[10].A}
(assert (= sc_63 sc_30))
; 
; =  {of.input.V[11].O} {of.vadd[10].A}
(assert (= of_63 of_30))
; 
; =  {sc.itov[5].Y} {sc.vadd[4].B}
(assert (= sc_99 sc_38))
; 
; =  {of.itov[5].Y} {of.vadd[4].B}
(assert (= of_99 of_38))
; 
; =  {sc.input.V[12].O} {sc.vadd[10].D}
(assert (= sc_57 sc_28))
; 
; =  {of.input.V[12].O} {of.vadd[10].D}
(assert (= of_57 of_28))
; 
; =  {sc.input.V[8].O} {sc.vadd[7].C}
(assert (= sc_51 sc_22))
; 
; =  {of.input.V[8].O} {of.vadd[7].C}
(assert (= of_51 of_22))
; 
; =  {sc.input.V[2].O} {sc.itov[3].K}
(assert (= sc_49 sc_95))
; 
; =  {of.input.V[2].O} {of.itov[3].K}
(assert (= of_49 of_95))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_75 sc_44))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_75 of_44))
; 
; =  {sc.vgain[9].P} {sc.vadd[10].B}
(assert (= sc_7 sc_31))
; 
; =  {of.vgain[9].P} {of.vadd[10].B}
(assert (= of_7 of_31))
; 
; =  {sc.input.V[19].O} {sc.itov[5].K}
(assert (= sc_87 sc_98))
; 
; =  {of.input.V[19].O} {of.itov[5].K}
(assert (= of_87 of_98))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].D}
(assert (= sc_93 sc_42))
; 
; =  {of.itov[0].Y} {of.vadd[1].D}
(assert (= of_93 of_42))
; 
; =  {sc.vadd[10].OUT2} {sc.output.V[1].X}
(assert (= sc_33 sc_18))
; 
; =  {of.vadd[10].OUT2} {of.output.V[1].X}
(assert (= of_33 of_18))
; 
; =  {sc.input.V[1].O} {sc.vgain[6].X}
(assert (= sc_81 sc_8))
; 
; =  {of.input.V[1].O} {of.vgain[6].X}
(assert (= of_81 of_8))
; 
; =  {sc.input.V[7].O} {sc.vadd[7].OUT2_0}
(assert (= sc_53 sc_20))
; 
; =  {of.input.V[7].O} {of.vadd[7].OUT2_0}
(assert (= of_53 of_20))
; 
; =  {sc.itov[3].Y} {sc.vadd[4].D}
(assert (= sc_96 sc_35))
; 
; =  {of.itov[3].Y} {of.vadd[4].D}
(assert (= of_96 of_35))
; 
; =  {sc.input.V[0].O} {sc.itov[0].K}
(assert (= sc_61 sc_92))
; 
; =  {of.input.V[0].O} {of.itov[0].K}
(assert (= of_61 of_92))
; 
; =  {sc.input.V[10].O} {sc.vadd[10].OUT2_0}
(assert (= sc_65 sc_27))
; 
; =  {of.input.V[10].O} {of.vadd[10].OUT2_0}
(assert (= of_65 of_27))
; 
; =  {sc.input.V[16].O} {sc.vgain[9].Z}
(assert (= sc_73 sc_6))
; 
; =  {of.input.V[16].O} {of.vgain[9].Z}
(assert (= of_73 of_6))
; 
; =  {sc.input.V[18].O} {sc.itov[2].K}
(assert (= sc_85 sc_89))
; 
; =  {of.input.V[18].O} {of.itov[2].K}
(assert (= of_85 of_89))
; 
; =  {sc.input.V[5].O} {sc.vadd[4].A}
(assert (= sc_79 sc_37))
; 
; =  {of.input.V[5].O} {of.vadd[4].A}
(assert (= of_79 of_37))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].C}
(assert (= sc_77 sc_43))
; 
; =  {of.input.V[4].O} {of.vadd[1].C}
(assert (= of_77 of_43))
; 
; =  {sc.input.V[6].O} {sc.vadd[4].C}
(assert (= sc_69 sc_36))
; 
; =  {of.input.V[6].O} {of.vadd[4].C}
(assert (= of_69 of_36))
(assert (<= (* (/ 1. sc_15) 1) 1.))
(assert (<= (* (/ 1. sc_15) 1) 1.))
(assert (<= (* (/ 1. sc_19) 1) 1.))
(assert (<= (* (/ 1. sc_19) 1) 1.))
(assert (<= (* (/ 1. sc_13) 1) 1.))
(assert (<= (* (/ 1. sc_13) 1) 1.))
(assert (<= (* (/ 1. sc_17) 1) 100.))
(assert (<= (* (/ 1. sc_17) 1) 100.))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[0].O} {sc.vadd[10].OUT2} {sc.output.V[1].O} {sc.vadd[1].OUT2} {sc.output.V[2].O} {sc.vadd[7].OUT2} {sc.output.V[3].O}
(assert (and (and (and (and (and (and (= sc_40 sc_15) (= sc_40 sc_33)) (= sc_40 sc_19)) (= sc_40 sc_47)) (= sc_40 sc_13)) (= sc_40 sc_26)) (= sc_40 sc_17)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_11_1 0.) slbot_11_1 (- slbot_11_1)) (ite (>= sltop_10_1 0.) sltop_10_1 (- sltop_10_1))) (ite (>= slbot_91_1 0.) slbot_91_1 (- slbot_91_1))) (ite (>= sltop_33_1 0.) sltop_33_1 (- sltop_33_1))) (ite (>= sltop_17_1 0.) sltop_17_1 (- sltop_17_1))) (ite (>= slbot_7_1 0.) slbot_7_1 (- slbot_7_1))) (ite (>= slbot_19_1 0.) slbot_19_1 (- slbot_19_1))) (ite (>= sltop_93_1 0.) sltop_93_1 (- sltop_93_1))) (ite (>= sltop_88_1 0.) sltop_88_1 (- sltop_88_1))) (ite (>= sltop_18_1 0.) sltop_18_1 (- sltop_18_1))) (ite (>= sltop_45_1 0.) sltop_45_1 (- sltop_45_1))) (ite (>= sltop_13_1 0.) sltop_13_1 (- sltop_13_1))) (ite (>= slbot_35_1 0.) slbot_35_1 (- slbot_35_1))) (ite (>= slbot_2_1 0.) slbot_2_1 (- slbot_2_1))) (ite (>= slbot_4_1 0.) slbot_4_1 (- slbot_4_1))) (ite (>= slbot_18_1 0.) slbot_18_1 (- slbot_18_1))) (ite (>= slbot_99_1 0.) slbot_99_1 (- slbot_99_1))) (ite (>= slbot_24_1 0.) slbot_24_1 (- slbot_24_1))) (ite (>= slbot_16_1 0.) slbot_16_1 (- slbot_16_1))) (ite (>= slbot_96_1 0.) slbot_96_1 (- slbot_96_1))) (ite (>= slbot_25_1 0.) slbot_25_1 (- slbot_25_1))) (ite (>= slbot_14_1 0.) slbot_14_1 (- slbot_14_1))) (ite (>= sltop_40_1 0.) sltop_40_1 (- sltop_40_1))) (ite (>= sltop_19_1 0.) sltop_19_1 (- sltop_19_1))) (ite (>= slbot_97_1 0.) slbot_97_1 (- slbot_97_1))) (ite (>= sltop_39_1 0.) sltop_39_1 (- sltop_39_1))) (ite (>= sltop_7_1 0.) sltop_7_1 (- sltop_7_1))) (ite (>= slbot_47_1 0.) slbot_47_1 (- slbot_47_1))) (ite (>= slbot_0_1 0.) slbot_0_1 (- slbot_0_1))) (ite (>= sltop_26_1 0.) sltop_26_1 (- sltop_26_1))) (ite (>= sltop_35_1 0.) sltop_35_1 (- sltop_35_1))) (ite (>= slbot_90_1 0.) slbot_90_1 (- slbot_90_1))) (ite (>= sltop_94_1 0.) sltop_94_1 (- sltop_94_1))) (ite (>= sltop_24_1 0.) sltop_24_1 (- sltop_24_1))) (ite (>= sltop_32_1 0.) sltop_32_1 (- sltop_32_1))) (ite (>= sltop_38_1 0.) sltop_38_1 (- sltop_38_1))) (ite (>= slbot_46_1 0.) slbot_46_1 (- slbot_46_1))) (ite (>= slbot_94_1 0.) slbot_94_1 (- slbot_94_1))) (ite (>= sltop_47_1 0.) sltop_47_1 (- sltop_47_1))) (ite (>= sltop_99_1 0.) sltop_99_1 (- sltop_99_1))) (ite (>= sltop_31_1 0.) sltop_31_1 (- sltop_31_1))) (ite (>= slbot_40_1 0.) slbot_40_1 (- slbot_40_1))) (ite (>= slbot_15_1 0.) slbot_15_1 (- slbot_15_1))) (ite (>= slbot_17_1 0.) slbot_17_1 (- slbot_17_1))) (ite (>= slbot_45_1 0.) slbot_45_1 (- slbot_45_1))) (ite (>= sltop_3_1 0.) sltop_3_1 (- sltop_3_1))) (ite (>= slbot_32_1 0.) slbot_32_1 (- slbot_32_1))) (ite (>= slbot_88_1 0.) slbot_88_1 (- slbot_88_1))) (ite (>= sltop_25_1 0.) sltop_25_1 (- sltop_25_1))) (ite (>= slbot_38_1 0.) slbot_38_1 (- slbot_38_1))) (ite (>= sltop_12_1 0.) sltop_12_1 (- sltop_12_1))) (ite (>= slbot_39_1 0.) slbot_39_1 (- slbot_39_1))) (ite (>= slbot_42_1 0.) slbot_42_1 (- slbot_42_1))) (ite (>= sltop_90_1 0.) sltop_90_1 (- sltop_90_1))) (ite (>= slbot_3_1 0.) slbot_3_1 (- slbot_3_1))) (ite (>= sltop_15_1 0.) sltop_15_1 (- sltop_15_1))) (ite (>= slbot_93_1 0.) slbot_93_1 (- slbot_93_1))) (ite (>= sltop_97_1 0.) sltop_97_1 (- sltop_97_1))) (ite (>= sltop_2_1 0.) sltop_2_1 (- sltop_2_1))) (ite (>= sltop_96_1 0.) sltop_96_1 (- sltop_96_1))) (ite (>= sltop_4_1 0.) sltop_4_1 (- sltop_4_1))) (ite (>= sltop_14_1 0.) sltop_14_1 (- sltop_14_1))) (ite (>= sltop_91_1 0.) sltop_91_1 (- sltop_91_1))) (ite (>= sltop_16_1 0.) sltop_16_1 (- sltop_16_1))) (ite (>= slbot_10_1 0.) slbot_10_1 (- slbot_10_1))) (ite (>= slbot_13_1 0.) slbot_13_1 (- slbot_13_1))) (ite (>= slbot_33_1 0.) slbot_33_1 (- slbot_33_1))) (ite (>= sltop_46_1 0.) sltop_46_1 (- sltop_46_1))) (ite (>= slbot_12_1 0.) slbot_12_1 (- slbot_12_1))) (ite (>= slbot_26_1 0.) slbot_26_1 (- slbot_26_1))) (ite (>= slbot_31_1 0.) slbot_31_1 (- slbot_31_1))) (ite (>= sltop_42_1 0.) sltop_42_1 (- sltop_42_1))) (ite (>= sltop_0_1 0.) sltop_0_1 (- sltop_0_1))) (ite (>= sltop_11_1 0.) sltop_11_1 (- sltop_11_1)))))
(check-sat)
