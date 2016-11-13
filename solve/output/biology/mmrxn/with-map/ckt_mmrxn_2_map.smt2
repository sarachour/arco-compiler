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
; =  {sc.vgain[7].P} {((sc.vgain[7].X/sc.vgain[7].Y)*sc.vgain[7].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[7].P} {0.}
(assert (= of_3 0.))
(declare-fun slbot_0_1 () Real)
(declare-fun sltop_0_1 () Real)
; 
; =  {(((sc.vgain[7].X*0.)+of.vgain[7].X)+sl.min.vgain[7].X.1)} {0.0001}
(assert (= (+ (+ (* sc_0 0.) of_0) slbot_0_1) 0.0001))
; 
; =  {(((sc.vgain[7].X*0.124)+of.vgain[7].X)+sl.max.vgain[7].X.1)} {3300.}
(assert (= (+ (+ (* sc_0 0.124) of_0) sltop_0_1) 3300.))
; 
; >=  {((sc.vgain[7].Y*0.107991360691)+of.vgain[7].Y)} {3300.}
(assert (<= (+ (* sc_1 0.107991360691) of_1) 3300.))
; 
; <=  {((sc.vgain[7].Y*0.107991360691)+of.vgain[7].Y)} {1.}
(assert (>= (+ (* sc_1 0.107991360691) of_1) 1.))
(declare-fun slbot_3_1 () Real)
(declare-fun sltop_3_1 () Real)
; 
; =  {(((sc.vgain[7].P*0.)+of.vgain[7].P)+sl.min.vgain[7].P.1)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3_1) 1.51515151515e-12))
; 
; =  {(((sc.vgain[7].P*0.57412)+of.vgain[7].P)+sl.max.vgain[7].P.1)} {5445000.}
(assert (= (+ (+ (* sc_3 0.57412) of_3) sltop_3_1) 5445000.))
; 
; >=  {((sc.vgain[7].Z*1.)+of.vgain[7].Z)} {3300.}
(assert (<= (+ (* sc_2 1.) of_2) 3300.))
; 
; <=  {((sc.vgain[7].Z*1.)+of.vgain[7].Z)} {0.0001}
(assert (>= (+ (* sc_2 1.) of_2) 0.0001))
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
; =  {sc.vgain[5].P} {((sc.vgain[5].X/sc.vgain[5].Y)*sc.vgain[5].Z*1.)}
(assert (= sc_7 (* (* (/ sc_4 sc_5) sc_6) 1.)))
; 
; =  {of.vgain[5].P} {0.}
(assert (= of_7 0.))
(declare-fun slbot_4_1 () Real)
(declare-fun sltop_4_1 () Real)
; 
; =  {(((sc.vgain[5].X*0.)+of.vgain[5].X)+sl.min.vgain[5].X.1)} {0.0001}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4_1) 0.0001))
; 
; =  {(((sc.vgain[5].X*0.124)+of.vgain[5].X)+sl.max.vgain[5].X.1)} {3300.}
(assert (= (+ (+ (* sc_4 0.124) of_4) sltop_4_1) 3300.))
; 
; >=  {((sc.vgain[5].Y*0.0792644261256)+of.vgain[5].Y)} {3300.}
(assert (<= (+ (* sc_5 0.0792644261256) of_5) 3300.))
; 
; <=  {((sc.vgain[5].Y*0.0792644261256)+of.vgain[5].Y)} {1.}
(assert (>= (+ (* sc_5 0.0792644261256) of_5) 1.))
(declare-fun slbot_7_1 () Real)
(declare-fun sltop_7_1 () Real)
; 
; =  {(((sc.vgain[5].P*0.)+of.vgain[5].P)+sl.min.vgain[5].P.1)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7_1) 1.51515151515e-12))
; 
; =  {(((sc.vgain[5].P*0.200241152)+of.vgain[5].P)+sl.max.vgain[5].P.1)} {5445000.}
(assert (= (+ (+ (* sc_7 0.200241152) of_7) sltop_7_1) 5445000.))
(declare-fun slbot_6_1 () Real)
(declare-fun sltop_6_1 () Real)
; 
; =  {(((sc.vgain[5].Z*0.)+of.vgain[5].Z)+sl.min.vgain[5].Z.1)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6_1) 0.0001))
; 
; =  {(((sc.vgain[5].Z*0.256)+of.vgain[5].Z)+sl.max.vgain[5].Z.1)} {3300.}
(assert (= (+ (+ (* sc_6 0.256) of_6) sltop_6_1) 3300.))
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_9 sc_8))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_9 of_8))
; 
; >=  {((sc.input.I[0].X*3.154)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_8 3.154) of_8) 10.))
; 
; <=  {((sc.input.I[0].X*3.154)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_8 3.154) of_8) 0.))
; 
; >=  {((sc.input.I[0].O*3.154)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_9 3.154) of_9) 10.))
; 
; <=  {((sc.input.I[0].O*3.154)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_9 3.154) of_9) 0.))
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
(declare-fun slbot_10_1 () Real)
(declare-fun sltop_10_1 () Real)
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X.1)} {0.0001}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10_1) 0.0001))
; 
; =  {(((sc.output.V[2].X*0.124)+of.output.V[2].X)+sl.max.output.V[2].X.1)} {3300.}
(assert (= (+ (+ (* sc_10 0.124) of_10) sltop_10_1) 3300.))
(declare-fun slbot_11_1 () Real)
(declare-fun sltop_11_1 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O.1)} {0.0001}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11_1) 0.0001))
; 
; =  {(((sc.output.V[2].O*0.124)+of.output.V[2].O)+sl.max.output.V[2].O.1)} {3300.}
(assert (= (+ (+ (* sc_11 0.124) of_11) sltop_11_1) 3300.))
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
(declare-fun slbot_12_1 () Real)
(declare-fun sltop_12_1 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X.1)} {0.0001}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12_1) 0.0001))
; 
; =  {(((sc.output.V[0].X*0.256)+of.output.V[0].X)+sl.max.output.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_12 0.256) of_12) sltop_12_1) 3300.))
(declare-fun slbot_13_1 () Real)
(declare-fun sltop_13_1 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O.1)} {0.0001}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13_1) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.256)+of.output.V[0].O)+sl.max.output.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_13 0.256) of_13) sltop_13_1) 3300.))
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
(declare-fun slbot_14_1 () Real)
(declare-fun sltop_14_1 () Real)
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X.1)} {0.0001}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14_1) 0.0001))
; 
; =  {(((sc.output.V[3].X*0.124)+of.output.V[3].X)+sl.max.output.V[3].X.1)} {3300.}
(assert (= (+ (+ (* sc_14 0.124) of_14) sltop_14_1) 3300.))
(declare-fun slbot_15_1 () Real)
(declare-fun sltop_15_1 () Real)
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O.1)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15_1) 0.0001))
; 
; =  {(((sc.output.V[3].O*0.124)+of.output.V[3].O)+sl.max.output.V[3].O.1)} {3300.}
(assert (= (+ (+ (* sc_15 0.124) of_15) sltop_15_1) 3300.))
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
(declare-fun slbot_16_1 () Real)
(declare-fun sltop_16_1 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X.1)} {0.0001}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16_1) 0.0001))
; 
; =  {(((sc.output.V[1].X*0.124)+of.output.V[1].X)+sl.max.output.V[1].X.1)} {3300.}
(assert (= (+ (+ (* sc_16 0.124) of_16) sltop_16_1) 3300.))
(declare-fun slbot_17_1 () Real)
(declare-fun sltop_17_1 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O.1)} {0.0001}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17_1) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.124)+of.output.V[1].O)+sl.max.output.V[1].O.1)} {3300.}
(assert (= (+ (+ (* sc_17 0.124) of_17) sltop_17_1) 3300.))
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
; no offset
(assert (= (+ of_21 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[8].A*1.)} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D*sc.vadd[8].OUT2)}
(assert (and (= (* sc_21 1.) (* 1. sc_20)) (= (* sc_21 1.) (* (* 1. sc_19) sc_24))))
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
; =  {of.vadd[8].OUT2_0} {(0.-0.-0.)}
(assert (= of_18 0.))
; 
; >=  {((sc.vadd[8].OUT2_0*0.256)+of.vadd[8].OUT2_0)} {3300.}
(assert (<= (+ (* sc_18 0.256) of_18) 3300.))
; 
; <=  {((sc.vadd[8].OUT2_0*0.256)+of.vadd[8].OUT2_0)} {0.}
(assert (>= (+ (* sc_18 0.256) of_18) 0.))
(declare-fun slbot_19_1 () Real)
(declare-fun sltop_19_1 () Real)
; 
; =  {(((sc.vadd[8].D*0.)+of.vadd[8].D)+sl.min.vadd[8].D.1)} {0.}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19_1) 0.))
; 
; =  {(((sc.vadd[8].D*0.391096)+of.vadd[8].D)+sl.max.vadd[8].D.1)} {3300.}
(assert (= (+ (+ (* sc_19 0.391096) of_19) sltop_19_1) 3300.))
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
(declare-fun slbot_24_1 () Real)
(declare-fun sltop_24_1 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24_1) 0.))
; 
; =  {(((sc.vadd[8].OUT2*0.256)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_24 0.256) of_24) sltop_24_1) 3300.))
(declare-fun slbot_24_2 () Real)
(declare-fun sltop_24_2 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2.2)} {-10893300.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24_2) -10893300.))
; 
; =  {(((sc.vadd[8].OUT2*0.256)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2.2)} {3300.}
(assert (= (+ (+ (* sc_24 0.256) of_24) sltop_24_2) 3300.))
(declare-fun slbot_22_1 () Real)
(declare-fun sltop_22_1 () Real)
; 
; =  {(((sc.vadd[8].B*0.)+of.vadd[8].B)+sl.min.vadd[8].B.1)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22_1) 0.))
; 
; =  {(((sc.vadd[8].B*0.57412)+of.vadd[8].B)+sl.max.vadd[8].B.1)} {3300.}
(assert (= (+ (+ (* sc_22 0.57412) of_22) sltop_22_1) 3300.))
(declare-fun slbot_23_1 () Real)
(declare-fun sltop_23_1 () Real)
; 
; =  {(((sc.vadd[8].OUT*0.)+of.vadd[8].OUT)+sl.min.vadd[8].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23_1) -1650.))
; 
; =  {(((sc.vadd[8].OUT*0.391096)+of.vadd[8].OUT)+sl.max.vadd[8].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_23 0.391096) of_23) sltop_23_1) 1650.))
(declare-fun slbot_24_1 () Real)
(declare-fun sltop_24_1 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24_1) 0.))
; 
; =  {(((sc.vadd[8].OUT2*0.256)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_24 0.256) of_24) sltop_24_1) 3300.))
(declare-fun slbot_24_2 () Real)
(declare-fun sltop_24_2 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2.2)} {-10893300.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24_2) -10893300.))
; 
; =  {(((sc.vadd[8].OUT2*0.256)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2.2)} {3300.}
(assert (= (+ (+ (* sc_24 0.256) of_24) sltop_24_2) 3300.))
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
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_28 (* 1. sc_29)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D)}
(assert (and (= sc_28 (* 1. sc_27)) (= sc_28 (* 1. sc_26))))
; no offset
(assert (= (- (+ of_28 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1.)}
(assert (= sc_30 (* sc_28 1.)))
; 
; =  {of.vadd[6].OUT} {0.}
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
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_28 (* 1. sc_29)))
; no offset
(assert (= (+ of_28 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[6].A*1.)} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D*sc.vadd[6].OUT2)}
(assert (and (= (* sc_28 1.) (* 1. sc_27)) (= (* sc_28 1.) (* (* 1. sc_26) sc_31))))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1.)}
(assert (= sc_31 (* sc_28 1.)))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1.)}
(assert (= sc_25 (* sc_28 1.)))
; 
; =  {of.vadd[6].OUT2_0} {(0.-0.-0.)}
(assert (= of_25 0.))
; 
; >=  {((sc.vadd[6].OUT2_0*0.)+of.vadd[6].OUT2_0)} {3300.}
(assert (<= (+ (* sc_25 0.) of_25) 3300.))
; 
; <=  {((sc.vadd[6].OUT2_0*0.)+of.vadd[6].OUT2_0)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
; 
; >=  {((sc.vadd[6].D*2.525)+of.vadd[6].D)} {3300.}
(assert (<= (+ (* sc_26 2.525) of_26) 3300.))
; 
; <=  {((sc.vadd[6].D*2.525)+of.vadd[6].D)} {0.}
(assert (>= (+ (* sc_26 2.525) of_26) 0.))
; 
; >=  {((sc.vadd[6].C*0.)+of.vadd[6].C)} {3300.}
(assert (<= (+ (* sc_27 0.) of_27) 3300.))
; 
; <=  {((sc.vadd[6].C*0.)+of.vadd[6].C)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {3300.}
(assert (<= (+ (* sc_28 0.) of_28) 3300.))
; 
; <=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
(declare-fun slbot_31_1 () Real)
(declare-fun sltop_31_1 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31_1) 0.))
; 
; =  {(((sc.vadd[6].OUT2*0.124)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_31 0.124) of_31) sltop_31_1) 3300.))
(declare-fun slbot_31_2 () Real)
(declare-fun sltop_31_2 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2.2)} {-10893300.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31_2) -10893300.))
; 
; =  {(((sc.vadd[6].OUT2*0.124)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2.2)} {3300.}
(assert (= (+ (+ (* sc_31 0.124) of_31) sltop_31_2) 3300.))
(declare-fun slbot_29_1 () Real)
(declare-fun sltop_29_1 () Real)
; 
; =  {(((sc.vadd[6].B*0.)+of.vadd[6].B)+sl.min.vadd[6].B.1)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29_1) 0.))
; 
; =  {(((sc.vadd[6].B*0.200241152)+of.vadd[6].B)+sl.max.vadd[6].B.1)} {3300.}
(assert (= (+ (+ (* sc_29 0.200241152) of_29) sltop_29_1) 3300.))
(declare-fun slbot_30_1 () Real)
(declare-fun sltop_30_1 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30_1) -1650.))
; 
; =  {(((sc.vadd[6].OUT*0.200241152)+of.vadd[6].OUT)+sl.max.vadd[6].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_30 0.200241152) of_30) sltop_30_1) 1650.))
(declare-fun slbot_31_1 () Real)
(declare-fun sltop_31_1 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31_1) 0.))
; 
; =  {(((sc.vadd[6].OUT2*0.124)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_31 0.124) of_31) sltop_31_1) 3300.))
(declare-fun slbot_31_2 () Real)
(declare-fun sltop_31_2 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2.2)} {-10893300.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31_2) -10893300.))
; 
; =  {(((sc.vadd[6].OUT2*0.124)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2.2)} {3300.}
(assert (= (+ (+ (* sc_31 0.124) of_31) sltop_31_2) 3300.))
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
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_35 (* 1. sc_36)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D)}
(assert (and (= sc_35 (* 1. sc_34)) (= sc_35 (* 1. sc_33))))
; no offset
(assert (= (- (+ of_35 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1.)}
(assert (= sc_37 (* sc_35 1.)))
; 
; =  {of.vadd[4].OUT} {0.}
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
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_35 (* 1. sc_36)))
; no offset
(assert (= (+ of_35 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[4].A*1.)} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D*sc.vadd[4].OUT2)}
(assert (and (= (* sc_35 1.) (* 1. sc_34)) (= (* sc_35 1.) (* (* 1. sc_33) sc_38))))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1.)}
(assert (= sc_38 (* sc_35 1.)))
; no offset
(assert (= of_38 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1.)}
(assert (= sc_32 (* sc_35 1.)))
; 
; =  {of.vadd[4].OUT2_0} {(0.-0.-0.)}
(assert (= of_32 0.))
; 
; >=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_32 0.) of_32) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
; 
; >=  {((sc.vadd[4].D*0.)+of.vadd[4].D)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.vadd[4].D*0.)+of.vadd[4].D)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {3300.}
(assert (<= (+ (* sc_34 0.) of_34) 3300.))
; 
; <=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_35 0.) of_35) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun slbot_38_1 () Real)
(declare-fun sltop_38_1 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38_1) 0.))
; 
; =  {(((sc.vadd[4].OUT2*0.124)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_38 0.124) of_38) sltop_38_1) 3300.))
(declare-fun slbot_38_2 () Real)
(declare-fun sltop_38_2 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.2)} {-10893300.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38_2) -10893300.))
; 
; =  {(((sc.vadd[4].OUT2*0.124)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.2)} {3300.}
(assert (= (+ (+ (* sc_38 0.124) of_38) sltop_38_2) 3300.))
(declare-fun slbot_36_1 () Real)
(declare-fun sltop_36_1 () Real)
; 
; =  {(((sc.vadd[4].B*0.)+of.vadd[4].B)+sl.min.vadd[4].B.1)} {0.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36_1) 0.))
; 
; =  {(((sc.vadd[4].B*0.05208)+of.vadd[4].B)+sl.max.vadd[4].B.1)} {3300.}
(assert (= (+ (+ (* sc_36 0.05208) of_36) sltop_36_1) 3300.))
(declare-fun slbot_37_1 () Real)
(declare-fun sltop_37_1 () Real)
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37_1) -1650.))
; 
; =  {(((sc.vadd[4].OUT*0.05208)+of.vadd[4].OUT)+sl.max.vadd[4].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_37 0.05208) of_37) sltop_37_1) 1650.))
(declare-fun slbot_38_1 () Real)
(declare-fun sltop_38_1 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38_1) 0.))
; 
; =  {(((sc.vadd[4].OUT2*0.124)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_38 0.124) of_38) sltop_38_1) 3300.))
(declare-fun slbot_38_2 () Real)
(declare-fun sltop_38_2 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.2)} {-10893300.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38_2) -10893300.))
; 
; =  {(((sc.vadd[4].OUT2*0.124)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.2)} {3300.}
(assert (= (+ (+ (* sc_38 0.124) of_38) sltop_38_2) 3300.))
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
; no offset
(assert (= (+ of_42 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[1].A*1.)} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= (* sc_42 1.) (* 1. sc_41)) (= (* sc_42 1.) (* (* 1. sc_40) sc_45))))
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
; =  {of.vadd[1].OUT2_0} {(0.-0.-0.)}
(assert (= of_39 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_39 0.124) of_39) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_39 0.124) of_39) 0.))
(declare-fun slbot_40_1 () Real)
(declare-fun sltop_40_1 () Real)
; 
; =  {(((sc.vadd[1].D*0.)+of.vadd[1].D)+sl.min.vadd[1].D.1)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40_1) 0.))
; 
; =  {(((sc.vadd[1].D*0.807424)+of.vadd[1].D)+sl.max.vadd[1].D.1)} {3300.}
(assert (= (+ (+ (* sc_40 0.807424) of_40) sltop_40_1) 3300.))
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
(declare-fun slbot_45_1 () Real)
(declare-fun sltop_45_1 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_45 0.124) of_45) sltop_45_1) 3300.))
(declare-fun slbot_45_2 () Real)
(declare-fun sltop_45_2 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.2)} {-10893300.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45_2) -10893300.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.2)} {3300.}
(assert (= (+ (+ (* sc_45 0.124) of_45) sltop_45_2) 3300.))
(declare-fun slbot_43_1 () Real)
(declare-fun sltop_43_1 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B.1)} {0.}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43_1) 0.))
; 
; =  {(((sc.vadd[1].B*0.6262)+of.vadd[1].B)+sl.max.vadd[1].B.1)} {3300.}
(assert (= (+ (+ (* sc_43 0.6262) of_43) sltop_43_1) 3300.))
(declare-fun slbot_44_1 () Real)
(declare-fun sltop_44_1 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44_1) -1650.))
; 
; =  {(((sc.vadd[1].OUT*0.6262)+of.vadd[1].OUT)+sl.max.vadd[1].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_44 0.6262) of_44) sltop_44_1) 1650.))
(declare-fun slbot_45_1 () Real)
(declare-fun sltop_45_1 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_45 0.124) of_45) sltop_45_1) 3300.))
(declare-fun slbot_45_2 () Real)
(declare-fun sltop_45_2 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.2)} {-10893300.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45_2) -10893300.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.2)} {3300.}
(assert (= (+ (+ (* sc_45 0.124) of_45) sltop_45_2) 3300.))
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
; >=  {((sc.input.V[13].X*0.0792644261256)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_52 0.0792644261256) of_52) 3300.))
; 
; <=  {((sc.input.V[13].X*0.0792644261256)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_52 0.0792644261256) of_52) 0.))
; 
; >=  {((sc.input.V[13].O*0.0792644261256)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_53 0.0792644261256) of_53) 3300.))
; 
; <=  {((sc.input.V[13].O*0.0792644261256)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_53 0.0792644261256) of_53) 0.))
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
; >=  {((sc.input.V[12].X*0.107991360691)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_54 0.107991360691) of_54) 3300.))
; 
; <=  {((sc.input.V[12].X*0.107991360691)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_54 0.107991360691) of_54) 0.))
; 
; >=  {((sc.input.V[12].O*0.107991360691)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_55 0.107991360691) of_55) 3300.))
; 
; <=  {((sc.input.V[12].O*0.107991360691)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_55 0.107991360691) of_55) 0.))
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
; >=  {((sc.input.V[0].X*3.154)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_58 3.154) of_58) 3300.))
; 
; <=  {((sc.input.V[0].X*3.154)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_58 3.154) of_58) 0.))
; 
; >=  {((sc.input.V[0].O*3.154)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_59 3.154) of_59) 3300.))
; 
; <=  {((sc.input.V[0].O*3.154)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_59 3.154) of_59) 0.))
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
; >=  {((sc.input.V[15].X*0.256)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_64 0.256) of_64) 3300.))
; 
; <=  {((sc.input.V[15].X*0.256)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_64 0.256) of_64) 0.))
; 
; >=  {((sc.input.V[15].O*0.256)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_65 0.256) of_65) 3300.))
; 
; <=  {((sc.input.V[15].O*0.256)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_65 0.256) of_65) 0.))
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
; >=  {((sc.input.V[14].X*5.05)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_68 5.05) of_68) 3300.))
; 
; <=  {((sc.input.V[14].X*5.05)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_68 5.05) of_68) 0.))
; 
; >=  {((sc.input.V[14].O*5.05)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_69 5.05) of_69) 3300.))
; 
; <=  {((sc.input.V[14].O*5.05)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_69 5.05) of_69) 0.))
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
; >=  {((sc.input.V[16].X*0.124)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_70 0.124) of_70) 3300.))
; 
; <=  {((sc.input.V[16].X*0.124)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_70 0.124) of_70) 0.))
; 
; >=  {((sc.input.V[16].O*0.124)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_71 0.124) of_71) 3300.))
; 
; <=  {((sc.input.V[16].O*0.124)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_71 0.124) of_71) 0.))
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
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_81 sc_80))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_81 of_80))
; 
; >=  {((sc.input.V[17].X*0.42)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_80 0.42) of_80) 3300.))
; 
; <=  {((sc.input.V[17].X*0.42)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_80 0.42) of_80) 0.))
; 
; >=  {((sc.input.V[17].O*0.42)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_81 0.42) of_81) 3300.))
; 
; <=  {((sc.input.V[17].O*0.42)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_81 0.42) of_81) 0.))
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_83 sc_82))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_83 of_82))
; 
; >=  {((sc.input.V[18].X*2.525)+of.input.V[18].X)} {3300.}
(assert (<= (+ (* sc_82 2.525) of_82) 3300.))
; 
; <=  {((sc.input.V[18].X*2.525)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_82 2.525) of_82) 0.))
; 
; >=  {((sc.input.V[18].O*2.525)+of.input.V[18].O)} {3300.}
(assert (<= (+ (* sc_83 2.525) of_83) 3300.))
; 
; <=  {((sc.input.V[18].O*2.525)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_83 2.525) of_83) 0.))
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
; 
; =  {sc.input.V[19].O} {sc.input.V[19].X}
(assert (= sc_85 sc_84))
; 
; =  {of.input.V[19].O} {of.input.V[19].X}
(assert (= of_85 of_84))
; 
; >=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {3300.}
(assert (<= (+ (* sc_84 1.) of_84) 3300.))
; 
; <=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {0.}
(assert (>= (+ (* sc_84 1.) of_84) 0.))
; 
; >=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {3300.}
(assert (<= (+ (* sc_85 1.) of_85) 3300.))
; 
; <=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {0.}
(assert (>= (+ (* sc_85 1.) of_85) 0.))
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
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_88 (* sc_87 sc_86)))
; 
; =  {of.itov[2].Y} {0.}
(assert (= of_88 0.))
(declare-fun slbot_86_1 () Real)
(declare-fun sltop_86_1 () Real)
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X.1)} {0.0001}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86_1) 0.0001))
; 
; =  {(((sc.itov[2].X*0.124)+of.itov[2].X)+sl.max.itov[2].X.1)} {10.}
(assert (= (+ (+ (* sc_86 0.124) of_86) sltop_86_1) 10.))
(declare-fun slbot_88_1 () Real)
(declare-fun sltop_88_1 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88_1) 0.0001))
; 
; =  {(((sc.itov[2].Y*0.6262)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_88 0.6262) of_88) sltop_88_1) 3300.))
; 
; >=  {((sc.itov[2].K*5.05)+of.itov[2].K)} {330.}
(assert (<= (+ (* sc_87 5.05) of_87) 330.))
; 
; <=  {((sc.itov[2].K*5.05)+of.itov[2].K)} {1.}
(assert (>= (+ (* sc_87 5.05) of_87) 1.))
(declare-fun slbot_88_1 () Real)
(declare-fun sltop_88_1 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88_1) 0.0001))
; 
; =  {(((sc.itov[2].Y*0.6262)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_88 0.6262) of_88) sltop_88_1) 3300.))
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
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_91 (* sc_90 sc_89)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_91 0.))
(declare-fun slbot_89_1 () Real)
(declare-fun sltop_89_1 () Real)
; 
; =  {(((sc.itov[9].X*0.)+of.itov[9].X)+sl.min.itov[9].X.1)} {0.0001}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89_1) 0.0001))
; 
; =  {(((sc.itov[9].X*0.124)+of.itov[9].X)+sl.max.itov[9].X.1)} {10.}
(assert (= (+ (+ (* sc_89 0.124) of_89) sltop_89_1) 10.))
(declare-fun slbot_91_1 () Real)
(declare-fun sltop_91_1 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91_1) 0.0001))
; 
; =  {(((sc.itov[9].Y*0.391096)+of.itov[9].Y)+sl.max.itov[9].Y.1)} {3300.}
(assert (= (+ (+ (* sc_91 0.391096) of_91) sltop_91_1) 3300.))
; 
; >=  {((sc.itov[9].K*3.154)+of.itov[9].K)} {330.}
(assert (<= (+ (* sc_90 3.154) of_90) 330.))
; 
; <=  {((sc.itov[9].K*3.154)+of.itov[9].K)} {1.}
(assert (>= (+ (* sc_90 3.154) of_90) 1.))
(declare-fun slbot_91_1 () Real)
(declare-fun sltop_91_1 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91_1) 0.0001))
; 
; =  {(((sc.itov[9].Y*0.391096)+of.itov[9].Y)+sl.max.itov[9].Y.1)} {3300.}
(assert (= (+ (+ (* sc_91 0.391096) of_91) sltop_91_1) 3300.))
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
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_94 (* sc_93 sc_92)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_94 0.))
; 
; >=  {((sc.itov[0].X*3.154)+of.itov[0].X)} {10.}
(assert (<= (+ (* sc_92 3.154) of_92) 10.))
; 
; <=  {((sc.itov[0].X*3.154)+of.itov[0].X)} {0.0001}
(assert (>= (+ (* sc_92 3.154) of_92) 0.0001))
(declare-fun slbot_94_1 () Real)
(declare-fun sltop_94_1 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94_1) 0.0001))
; 
; =  {(((sc.itov[0].Y*0.807424)+of.itov[0].Y)+sl.max.itov[0].Y.1)} {3300.}
(assert (= (+ (+ (* sc_94 0.807424) of_94) sltop_94_1) 3300.))
(declare-fun slbot_93_1 () Real)
(declare-fun sltop_93_1 () Real)
; 
; =  {(((sc.itov[0].K*0.)+of.itov[0].K)+sl.min.itov[0].K.1)} {1.}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93_1) 1.))
; 
; =  {(((sc.itov[0].K*0.256)+of.itov[0].K)+sl.max.itov[0].K.1)} {330.}
(assert (= (+ (+ (* sc_93 0.256) of_93) sltop_93_1) 330.))
(declare-fun slbot_94_1 () Real)
(declare-fun sltop_94_1 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94_1) 0.0001))
; 
; =  {(((sc.itov[0].Y*0.807424)+of.itov[0].Y)+sl.max.itov[0].Y.1)} {3300.}
(assert (= (+ (+ (* sc_94 0.807424) of_94) sltop_94_1) 3300.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
; no offset
(assert (= of_96 0.))
; no offset
(assert (= of_95 0.))
; 
; =  {sc.itov[3].Y} {(sc.itov[3].K*sc.itov[3].X)}
(assert (= sc_97 (* sc_96 sc_95)))
; 
; =  {of.itov[3].Y} {0.}
(assert (= of_97 0.))
(declare-fun slbot_95_1 () Real)
(declare-fun sltop_95_1 () Real)
; 
; =  {(((sc.itov[3].X*0.)+of.itov[3].X)+sl.min.itov[3].X.1)} {0.0001}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95_1) 0.0001))
; 
; =  {(((sc.itov[3].X*0.124)+of.itov[3].X)+sl.max.itov[3].X.1)} {10.}
(assert (= (+ (+ (* sc_95 0.124) of_95) sltop_95_1) 10.))
(declare-fun slbot_97_1 () Real)
(declare-fun sltop_97_1 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97_1) 0.0001))
; 
; =  {(((sc.itov[3].Y*0.05208)+of.itov[3].Y)+sl.max.itov[3].Y.1)} {3300.}
(assert (= (+ (+ (* sc_97 0.05208) of_97) sltop_97_1) 3300.))
; 
; >=  {((sc.itov[3].K*0.42)+of.itov[3].K)} {330.}
(assert (<= (+ (* sc_96 0.42) of_96) 330.))
; 
; <=  {((sc.itov[3].K*0.42)+of.itov[3].K)} {1.}
(assert (>= (+ (* sc_96 0.42) of_96) 1.))
(declare-fun slbot_97_1 () Real)
(declare-fun sltop_97_1 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97_1) 0.0001))
; 
; =  {(((sc.itov[3].Y*0.05208)+of.itov[3].Y)+sl.max.itov[3].Y.1)} {3300.}
(assert (= (+ (+ (* sc_97 0.05208) of_97) sltop_97_1) 3300.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].B}
(assert (= sc_88 sc_43))
; 
; =  {of.itov[2].Y} {of.vadd[1].B}
(assert (= of_88 of_43))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[1].X}
(assert (= sc_38 sc_16))
; 
; =  {of.vadd[4].OUT2} {of.output.V[1].X}
(assert (= of_38 of_16))
; 
; =  {sc.input.V[17].O} {sc.itov[3].K}
(assert (= sc_81 sc_96))
; 
; =  {of.input.V[17].O} {of.itov[3].K}
(assert (= of_81 of_96))
; 
; =  {sc.vadd[1].OUT2} {sc.vgain[5].X}
(assert (= sc_45 sc_4))
; 
; =  {of.vadd[1].OUT2} {of.vgain[5].X}
(assert (= of_45 of_4))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[2].X}
(assert (= sc_45 sc_10))
; 
; =  {of.vadd[1].OUT2} {of.output.V[2].X}
(assert (= of_45 of_10))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[9].X}
(assert (= sc_45 sc_89))
; 
; =  {of.vadd[1].OUT2} {of.itov[9].X}
(assert (= of_45 of_89))
; 
; =  {sc.input.I[0].O} {sc.itov[0].X}
(assert (= sc_9 sc_92))
; 
; =  {of.input.I[0].O} {of.itov[0].X}
(assert (= of_9 of_92))
; 
; =  {sc.input.V[9].O} {sc.vadd[6].A}
(assert (= sc_57 sc_28))
; 
; =  {of.input.V[9].O} {of.vadd[6].A}
(assert (= of_57 of_28))
; 
; =  {sc.input.V[15].O} {sc.vadd[8].OUT2_0}
(assert (= sc_65 sc_18))
; 
; =  {of.input.V[15].O} {of.vadd[8].OUT2_0}
(assert (= of_65 of_18))
; 
; =  {sc.input.V[13].O} {sc.vgain[5].Y}
(assert (= sc_53 sc_5))
; 
; =  {of.input.V[13].O} {of.vgain[5].Y}
(assert (= of_53 of_5))
; 
; =  {sc.input.V[14].O} {sc.itov[2].K}
(assert (= sc_69 sc_87))
; 
; =  {of.input.V[14].O} {of.itov[2].K}
(assert (= of_69 of_87))
; 
; =  {sc.input.V[11].O} {sc.vadd[8].A}
(assert (= sc_61 sc_21))
; 
; =  {of.input.V[11].O} {of.vadd[8].A}
(assert (= of_61 of_21))
; 
; =  {sc.input.V[12].O} {sc.vgain[7].Y}
(assert (= sc_55 sc_1))
; 
; =  {of.input.V[12].O} {of.vgain[7].Y}
(assert (= of_55 of_1))
; 
; =  {sc.input.V[8].O} {sc.vadd[6].C}
(assert (= sc_49 sc_27))
; 
; =  {of.input.V[8].O} {of.vadd[6].C}
(assert (= of_49 of_27))
; 
; =  {sc.input.V[3].O} {sc.vadd[4].OUT2_0}
(assert (= sc_73 sc_32))
; 
; =  {of.input.V[3].O} {of.vadd[4].OUT2_0}
(assert (= of_73 of_32))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].C}
(assert (= sc_47 sc_41))
; 
; =  {of.input.V[2].O} {of.vadd[1].C}
(assert (= of_47 of_41))
; 
; =  {sc.input.V[19].O} {sc.vgain[7].Z}
(assert (= sc_85 sc_2))
; 
; =  {of.input.V[19].O} {of.vgain[7].Z}
(assert (= of_85 of_2))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].D}
(assert (= sc_94 sc_40))
; 
; =  {of.itov[0].Y} {of.vadd[1].D}
(assert (= of_94 of_40))
; 
; =  {sc.input.V[1].O} {sc.vadd[1].A}
(assert (= sc_79 sc_42))
; 
; =  {of.input.V[1].O} {of.vadd[1].A}
(assert (= of_79 of_42))
; 
; =  {sc.input.V[7].O} {sc.vadd[6].OUT2_0}
(assert (= sc_51 sc_25))
; 
; =  {of.input.V[7].O} {of.vadd[6].OUT2_0}
(assert (= of_51 of_25))
; 
; =  {sc.vadd[8].OUT2} {sc.vgain[5].Z}
(assert (= sc_24 sc_6))
; 
; =  {of.vadd[8].OUT2} {of.vgain[5].Z}
(assert (= of_24 of_6))
; 
; =  {sc.vadd[8].OUT2} {sc.itov[0].K}
(assert (= sc_24 sc_93))
; 
; =  {of.vadd[8].OUT2} {of.itov[0].K}
(assert (= of_24 of_93))
; 
; =  {sc.vadd[8].OUT2} {sc.output.V[0].X}
(assert (= sc_24 sc_12))
; 
; =  {of.vadd[8].OUT2} {of.output.V[0].X}
(assert (= of_24 of_12))
; 
; =  {sc.itov[3].Y} {sc.vadd[4].B}
(assert (= sc_97 sc_36))
; 
; =  {of.itov[3].Y} {of.vadd[4].B}
(assert (= of_97 of_36))
; 
; =  {sc.input.V[10].O} {sc.vadd[8].C}
(assert (= sc_63 sc_20))
; 
; =  {of.input.V[10].O} {of.vadd[8].C}
(assert (= of_63 of_20))
; 
; =  {sc.input.V[0].O} {sc.itov[9].K}
(assert (= sc_59 sc_90))
; 
; =  {of.input.V[0].O} {of.itov[9].K}
(assert (= of_59 of_90))
; 
; =  {sc.vgain[7].P} {sc.vadd[8].B}
(assert (= sc_3 sc_22))
; 
; =  {of.vgain[7].P} {of.vadd[8].B}
(assert (= of_3 of_22))
; 
; =  {sc.input.V[16].O} {sc.vadd[1].OUT2_0}
(assert (= sc_71 sc_39))
; 
; =  {of.input.V[16].O} {of.vadd[1].OUT2_0}
(assert (= of_71 of_39))
; 
; =  {sc.input.V[18].O} {sc.vadd[6].D}
(assert (= sc_83 sc_26))
; 
; =  {of.input.V[18].O} {of.vadd[6].D}
(assert (= of_83 of_26))
; 
; =  {sc.itov[9].Y} {sc.vadd[8].D}
(assert (= sc_91 sc_19))
; 
; =  {of.itov[9].Y} {of.vadd[8].D}
(assert (= of_91 of_19))
; 
; =  {sc.input.V[4].O} {sc.vadd[4].A}
(assert (= sc_75 sc_35))
; 
; =  {of.input.V[4].O} {of.vadd[4].A}
(assert (= of_75 of_35))
; 
; =  {sc.input.V[5].O} {sc.vadd[4].C}
(assert (= sc_77 sc_34))
; 
; =  {of.input.V[5].O} {of.vadd[4].C}
(assert (= of_77 of_34))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[2].X}
(assert (= sc_31 sc_86))
; 
; =  {of.vadd[6].OUT2} {of.itov[2].X}
(assert (= of_31 of_86))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[3].X}
(assert (= sc_31 sc_95))
; 
; =  {of.vadd[6].OUT2} {of.itov[3].X}
(assert (= of_31 of_95))
; 
; =  {sc.vadd[6].OUT2} {sc.vgain[7].X}
(assert (= sc_31 sc_0))
; 
; =  {of.vadd[6].OUT2} {of.vgain[7].X}
(assert (= of_31 of_0))
; 
; =  {sc.vadd[6].OUT2} {sc.output.V[3].X}
(assert (= sc_31 sc_14))
; 
; =  {of.vadd[6].OUT2} {of.output.V[3].X}
(assert (= of_31 of_14))
; 
; =  {sc.input.V[6].O} {sc.vadd[4].D}
(assert (= sc_67 sc_33))
; 
; =  {of.input.V[6].O} {of.vadd[4].D}
(assert (= of_67 of_33))
; 
; =  {sc.vgain[5].P} {sc.vadd[6].B}
(assert (= sc_7 sc_29))
; 
; =  {of.vgain[5].P} {of.vadd[6].B}
(assert (= of_7 of_29))
(assert (<= (* (/ 1. sc_13) 0.001) 0.001))
(assert (<= (* (/ 1. sc_17) 0.001) 0.001))
(assert (<= (* (/ 1. sc_11) 0.001) 0.001))
(assert (<= (* (/ 1. sc_15) 0.001) 0.001))
; 
; =  {sc.vadd[8].OUT2} {sc.output.V[0].O} {sc.vadd[4].OUT2} {sc.output.V[1].O} {sc.vadd[1].OUT2} {sc.output.V[2].O} {sc.vadd[6].OUT2} {sc.output.V[3].O}
(assert (and (and (and (and (and (and (= sc_24 sc_13) (= sc_24 sc_38)) (= sc_24 sc_17)) (= sc_24 sc_45)) (= sc_24 sc_11)) (= sc_24 sc_31)) (= sc_24 sc_15)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_10_1 0.) sltop_10_1 (- sltop_10_1)) (ite (>= slbot_11_1 0.) slbot_11_1 (- slbot_11_1))) (ite (>= slbot_91_1 0.) slbot_91_1 (- slbot_91_1))) (ite (>= sltop_17_1 0.) sltop_17_1 (- sltop_17_1))) (ite (>= slbot_7_1 0.) slbot_7_1 (- slbot_7_1))) (ite (>= slbot_19_1 0.) slbot_19_1 (- slbot_19_1))) (ite (>= slbot_37_1 0.) slbot_37_1 (- slbot_37_1))) (ite (>= sltop_93_1 0.) sltop_93_1 (- sltop_93_1))) (ite (>= sltop_37_1 0.) sltop_37_1 (- sltop_37_1))) (ite (>= sltop_88_1 0.) sltop_88_1 (- sltop_88_1))) (ite (>= slbot_6_1 0.) slbot_6_1 (- slbot_6_1))) (ite (>= slbot_22_1 0.) slbot_22_1 (- slbot_22_1))) (ite (>= sltop_95_1 0.) sltop_95_1 (- sltop_95_1))) (ite (>= sltop_45_1 0.) sltop_45_1 (- sltop_45_1))) (ite (>= sltop_13_1 0.) sltop_13_1 (- sltop_13_1))) (ite (>= slbot_45_2 0.) slbot_45_2 (- slbot_45_2))) (ite (>= slbot_4_1 0.) slbot_4_1 (- slbot_4_1))) (ite (>= slbot_95_1 0.) slbot_95_1 (- slbot_95_1))) (ite (>= sltop_6_1 0.) sltop_6_1 (- sltop_6_1))) (ite (>= slbot_24_1 0.) slbot_24_1 (- slbot_24_1))) (ite (>= slbot_16_1 0.) slbot_16_1 (- slbot_16_1))) (ite (>= slbot_14_1 0.) slbot_14_1 (- slbot_14_1))) (ite (>= sltop_40_1 0.) sltop_40_1 (- sltop_40_1))) (ite (>= sltop_43_1 0.) sltop_43_1 (- sltop_43_1))) (ite (>= sltop_19_1 0.) sltop_19_1 (- sltop_19_1))) (ite (>= slbot_97_1 0.) slbot_97_1 (- slbot_97_1))) (ite (>= sltop_38_2 0.) sltop_38_2 (- sltop_38_2))) (ite (>= sltop_24_2 0.) sltop_24_2 (- sltop_24_2))) (ite (>= sltop_23_1 0.) sltop_23_1 (- sltop_23_1))) (ite (>= slbot_36_1 0.) slbot_36_1 (- slbot_36_1))) (ite (>= sltop_7_1 0.) sltop_7_1 (- sltop_7_1))) (ite (>= slbot_0_1 0.) slbot_0_1 (- slbot_0_1))) (ite (>= slbot_38_2 0.) slbot_38_2 (- slbot_38_2))) (ite (>= slbot_44_1 0.) slbot_44_1 (- slbot_44_1))) (ite (>= sltop_94_1 0.) sltop_94_1 (- sltop_94_1))) (ite (>= sltop_24_1 0.) sltop_24_1 (- sltop_24_1))) (ite (>= sltop_38_1 0.) sltop_38_1 (- sltop_38_1))) (ite (>= sltop_86_1 0.) sltop_86_1 (- sltop_86_1))) (ite (>= slbot_94_1 0.) slbot_94_1 (- slbot_94_1))) (ite (>= slbot_31_2 0.) slbot_31_2 (- slbot_31_2))) (ite (>= sltop_29_1 0.) sltop_29_1 (- sltop_29_1))) (ite (>= slbot_89_1 0.) slbot_89_1 (- slbot_89_1))) (ite (>= sltop_31_1 0.) sltop_31_1 (- sltop_31_1))) (ite (>= slbot_40_1 0.) slbot_40_1 (- slbot_40_1))) (ite (>= slbot_15_1 0.) slbot_15_1 (- slbot_15_1))) (ite (>= slbot_17_1 0.) slbot_17_1 (- slbot_17_1))) (ite (>= slbot_45_1 0.) slbot_45_1 (- slbot_45_1))) (ite (>= sltop_3_1 0.) sltop_3_1 (- sltop_3_1))) (ite (>= slbot_88_1 0.) slbot_88_1 (- slbot_88_1))) (ite (>= sltop_31_2 0.) sltop_31_2 (- sltop_31_2))) (ite (>= slbot_38_1 0.) slbot_38_1 (- slbot_38_1))) (ite (>= sltop_36_1 0.) sltop_36_1 (- sltop_36_1))) (ite (>= sltop_45_2 0.) sltop_45_2 (- sltop_45_2))) (ite (>= slbot_86_1 0.) slbot_86_1 (- slbot_86_1))) (ite (>= sltop_12_1 0.) sltop_12_1 (- sltop_12_1))) (ite (>= slbot_3_1 0.) slbot_3_1 (- slbot_3_1))) (ite (>= sltop_15_1 0.) sltop_15_1 (- sltop_15_1))) (ite (>= slbot_24_2 0.) slbot_24_2 (- slbot_24_2))) (ite (>= sltop_30_1 0.) sltop_30_1 (- sltop_30_1))) (ite (>= slbot_93_1 0.) slbot_93_1 (- slbot_93_1))) (ite (>= sltop_97_1 0.) sltop_97_1 (- sltop_97_1))) (ite (>= sltop_22_1 0.) sltop_22_1 (- sltop_22_1))) (ite (>= sltop_4_1 0.) sltop_4_1 (- sltop_4_1))) (ite (>= sltop_14_1 0.) sltop_14_1 (- sltop_14_1))) (ite (>= sltop_44_1 0.) sltop_44_1 (- sltop_44_1))) (ite (>= sltop_91_1 0.) sltop_91_1 (- sltop_91_1))) (ite (>= sltop_16_1 0.) sltop_16_1 (- sltop_16_1))) (ite (>= slbot_10_1 0.) slbot_10_1 (- slbot_10_1))) (ite (>= slbot_13_1 0.) slbot_13_1 (- slbot_13_1))) (ite (>= sltop_89_1 0.) sltop_89_1 (- sltop_89_1))) (ite (>= slbot_12_1 0.) slbot_12_1 (- slbot_12_1))) (ite (>= slbot_31_1 0.) slbot_31_1 (- slbot_31_1))) (ite (>= slbot_23_1 0.) slbot_23_1 (- slbot_23_1))) (ite (>= slbot_30_1 0.) slbot_30_1 (- slbot_30_1))) (ite (>= sltop_0_1 0.) sltop_0_1 (- sltop_0_1))) (ite (>= sltop_11_1 0.) sltop_11_1 (- sltop_11_1))) (ite (>= slbot_29_1 0.) slbot_29_1 (- slbot_29_1))) (ite (>= slbot_43_1 0.) slbot_43_1 (- slbot_43_1)))))
(check-sat)
