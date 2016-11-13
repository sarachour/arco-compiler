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
; >=  {((sc.input.I[2].X*25.232)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_0 25.232) of_0) 10.))
; 
; <=  {((sc.input.I[2].X*25.232)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_0 25.232) of_0) 0.))
; 
; >=  {((sc.input.I[2].O*25.232)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_1 25.232) of_1) 10.))
; 
; <=  {((sc.input.I[2].O*25.232)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_1 25.232) of_1) 0.))
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
; >=  {((sc.input.I[0].X*4.63)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_2 4.63) of_2) 10.))
; 
; <=  {((sc.input.I[0].X*4.63)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_2 4.63) of_2) 0.))
; 
; >=  {((sc.input.I[0].O*4.63)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_3 4.63) of_3) 10.))
; 
; <=  {((sc.input.I[0].O*4.63)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_3 4.63) of_3) 0.))
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
; >=  {((sc.input.I[3].X*0.42)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_4 0.42) of_4) 10.))
; 
; <=  {((sc.input.I[3].X*0.42)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_4 0.42) of_4) 0.))
; 
; >=  {((sc.input.I[3].O*0.42)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_5 0.42) of_5) 10.))
; 
; <=  {((sc.input.I[3].O*0.42)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_5 0.42) of_5) 0.))
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
; >=  {((sc.input.I[1].X*5.05)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_6 5.05) of_6) 10.))
; 
; <=  {((sc.input.I[1].X*5.05)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_6 5.05) of_6) 0.))
; 
; >=  {((sc.input.I[1].O*5.05)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_7 5.05) of_7) 10.))
; 
; <=  {((sc.input.I[1].O*5.05)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_7 5.05) of_7) 0.))
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_9 sc_8))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_9 of_8))
(declare-fun slbot_8_1 () Real)
(assert (<= slbot_8_1 1e-08))
(declare-fun sltop_8_1 () Real)
(assert (>= sltop_8_1 1e-08))
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X.1)} {0.}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8_1) 0.))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_8 1.) of_8) sltop_8_1) 3300.))
(declare-fun slbot_9_1 () Real)
(assert (<= slbot_9_1 1e-08))
(declare-fun sltop_9_1 () Real)
(assert (>= sltop_9_1 1e-08))
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O.1)} {0.}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9_1) 0.))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_9 1.) of_9) sltop_9_1) 3300.))
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_11 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_12 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_14 0.))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].B)}
(assert (= sc_13 (* 1. sc_14)))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].C)} {(1.*sc.vadd[7].D)}
(assert (and (= sc_13 (* 1. sc_12)) (= sc_13 (* 1. sc_11))))
; no offset
(assert (= (- (+ of_13 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT} {(sc.vadd[7].A*1.)}
(assert (= sc_15 (* sc_13 1.)))
; 
; =  {of.vadd[7].OUT} {0.}
(assert (= of_15 0.))
; no scale
(assert (= sc_11 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_11 0.))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_12 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_14 0.))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].B)}
(assert (= sc_13 (* 1. sc_14)))
; no offset
(assert (= (+ of_13 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[7].A*1.)} {(1.*sc.vadd[7].C)} {(1.*sc.vadd[7].D*sc.vadd[7].OUT2)}
(assert (and (= (* sc_13 1.) (* 1. sc_12)) (= (* sc_13 1.) (* (* 1. sc_11) sc_16))))
; 
; =  {sc.vadd[7].OUT2} {(sc.vadd[7].A*1.)}
(assert (= sc_16 (* sc_13 1.)))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT2_0} {(sc.vadd[7].A*1.)}
(assert (= sc_10 (* sc_13 1.)))
; 
; =  {of.vadd[7].OUT2_0} {(0.-0.-0.)}
(assert (= of_10 0.))
; 
; >=  {((sc.vadd[7].OUT2_0*0.)+of.vadd[7].OUT2_0)} {3300.}
(assert (<= (+ (* sc_10 0.) of_10) 3300.))
; 
; <=  {((sc.vadd[7].OUT2_0*0.)+of.vadd[7].OUT2_0)} {0.}
(assert (>= (+ (* sc_10 0.) of_10) 0.))
; 
; >=  {((sc.vadd[7].D*2.525)+of.vadd[7].D)} {3300.}
(assert (<= (+ (* sc_11 2.525) of_11) 3300.))
; 
; <=  {((sc.vadd[7].D*2.525)+of.vadd[7].D)} {0.}
(assert (>= (+ (* sc_11 2.525) of_11) 0.))
; 
; >=  {((sc.vadd[7].C*0.)+of.vadd[7].C)} {3300.}
(assert (<= (+ (* sc_12 0.) of_12) 3300.))
; 
; <=  {((sc.vadd[7].C*0.)+of.vadd[7].C)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
; 
; >=  {((sc.vadd[7].A*0.)+of.vadd[7].A)} {3300.}
(assert (<= (+ (* sc_13 0.) of_13) 3300.))
; 
; <=  {((sc.vadd[7].A*0.)+of.vadd[7].A)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
(declare-fun slbot_16_1 () Real)
(assert (<= slbot_16_1 1e-08))
(declare-fun sltop_16_1 () Real)
(assert (>= sltop_16_1 1e-08))
; 
; =  {(((sc.vadd[7].OUT2*0.)+of.vadd[7].OUT2)+sl.min.vadd[7].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16_1) 0.))
; 
; =  {(((sc.vadd[7].OUT2*1.)+of.vadd[7].OUT2)+sl.max.vadd[7].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_16 1.) of_16) sltop_16_1) 3300.))
(declare-fun slbot_14_1 () Real)
(assert (<= slbot_14_1 1e-08))
(declare-fun sltop_14_1 () Real)
(assert (>= sltop_14_1 1e-08))
; 
; =  {(((sc.vadd[7].B*0.)+of.vadd[7].B)+sl.min.vadd[7].B.1)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14_1) 0.))
; 
; =  {(((sc.vadd[7].B*6.308)+of.vadd[7].B)+sl.max.vadd[7].B.1)} {3300.}
(assert (= (+ (+ (* sc_14 6.308) of_14) sltop_14_1) 3300.))
(declare-fun slbot_15_1 () Real)
(assert (<= slbot_15_1 1e-08))
(declare-fun sltop_15_1 () Real)
(assert (>= sltop_15_1 1e-08))
; 
; =  {(((sc.vadd[7].OUT*0.)+of.vadd[7].OUT)+sl.min.vadd[7].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15_1) -1650.))
; 
; =  {(((sc.vadd[7].OUT*6.308)+of.vadd[7].OUT)+sl.max.vadd[7].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_15 6.308) of_15) sltop_15_1) 1650.))
(declare-fun slbot_16_1 () Real)
(assert (<= slbot_16_1 1e-08))
(declare-fun sltop_16_1 () Real)
(assert (>= sltop_16_1 1e-08))
; 
; =  {(((sc.vadd[7].OUT2*0.)+of.vadd[7].OUT2)+sl.min.vadd[7].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16_1) 0.))
; 
; =  {(((sc.vadd[7].OUT2*1.)+of.vadd[7].OUT2)+sl.max.vadd[7].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_16 1.) of_16) sltop_16_1) 3300.))
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_21 0.))
; 
; =  {sc.vadd[9].A} {(1.*sc.vadd[9].B)}
(assert (= sc_20 (* 1. sc_21)))
; 
; =  {sc.vadd[9].A} {(1.*sc.vadd[9].C)} {(1.*sc.vadd[9].D)}
(assert (and (= sc_20 (* 1. sc_19)) (= sc_20 (* 1. sc_18))))
; no offset
(assert (= (- (+ of_20 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[9].OUT} {(sc.vadd[9].A*1.)}
(assert (= sc_22 (* sc_20 1.)))
; 
; =  {of.vadd[9].OUT} {0.}
(assert (= of_22 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_21 0.))
; 
; =  {sc.vadd[9].A} {(1.*sc.vadd[9].B)}
(assert (= sc_20 (* 1. sc_21)))
; no offset
(assert (= (+ of_20 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[9].A*1.)} {(1.*sc.vadd[9].C)} {(1.*sc.vadd[9].D*sc.vadd[9].OUT2)}
(assert (and (= (* sc_20 1.) (* 1. sc_19)) (= (* sc_20 1.) (* (* 1. sc_18) sc_23))))
; 
; =  {sc.vadd[9].OUT2} {(sc.vadd[9].A*1.)}
(assert (= sc_23 (* sc_20 1.)))
; no offset
(assert (= of_23 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[9].OUT2_0} {(sc.vadd[9].A*1.)}
(assert (= sc_17 (* sc_20 1.)))
; 
; =  {of.vadd[9].OUT2_0} {(0.-0.-0.)}
(assert (= of_17 0.))
(declare-fun slbot_22_1 () Real)
(assert (<= slbot_22_1 1e-08))
(declare-fun sltop_22_1 () Real)
(assert (>= sltop_22_1 1e-08))
; 
; =  {(((sc.vadd[9].OUT*0.)+of.vadd[9].OUT)+sl.min.vadd[9].OUT.1)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22_1) 0.))
; 
; =  {(((sc.vadd[9].OUT*6.308)+of.vadd[9].OUT)+sl.max.vadd[9].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_22 6.308) of_22) sltop_22_1) 1650.))
(declare-fun slbot_20_1 () Real)
(assert (<= slbot_20_1 1e-08))
(declare-fun sltop_20_1 () Real)
(assert (>= sltop_20_1 1e-08))
; 
; =  {(((sc.vadd[9].A*0.)+of.vadd[9].A)+sl.min.vadd[9].A.1)} {0.}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20_1) 0.))
; 
; =  {(((sc.vadd[9].A*25.232)+of.vadd[9].A)+sl.max.vadd[9].A.1)} {3300.}
(assert (= (+ (+ (* sc_20 25.232) of_20) sltop_20_1) 3300.))
; 
; >=  {((sc.vadd[9].B*0.)+of.vadd[9].B)} {3300.}
(assert (<= (+ (* sc_21 0.) of_21) 3300.))
; 
; <=  {((sc.vadd[9].B*0.)+of.vadd[9].B)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
(declare-fun slbot_22_1 () Real)
(assert (<= slbot_22_1 1e-08))
(declare-fun sltop_22_1 () Real)
(assert (>= sltop_22_1 1e-08))
; 
; =  {(((sc.vadd[9].OUT*0.)+of.vadd[9].OUT)+sl.min.vadd[9].OUT.1)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22_1) 0.))
; 
; =  {(((sc.vadd[9].OUT*6.308)+of.vadd[9].OUT)+sl.max.vadd[9].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_22 6.308) of_22) sltop_22_1) 1650.))
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_25 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_26 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_28 0.))
; 
; =  {sc.vadd[11].A} {(1.*sc.vadd[11].B)}
(assert (= sc_27 (* 1. sc_28)))
; 
; =  {sc.vadd[11].A} {(1.*sc.vadd[11].C)} {(1.*sc.vadd[11].D)}
(assert (and (= sc_27 (* 1. sc_26)) (= sc_27 (* 1. sc_25))))
; no offset
(assert (= (- (+ of_27 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[11].OUT} {(sc.vadd[11].A*1.)}
(assert (= sc_29 (* sc_27 1.)))
; 
; =  {of.vadd[11].OUT} {0.}
(assert (= of_29 0.))
; no scale
(assert (= sc_25 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_25 0.))
; no offset
(assert (= of_30 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_26 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_28 0.))
; 
; =  {sc.vadd[11].A} {(1.*sc.vadd[11].B)}
(assert (= sc_27 (* 1. sc_28)))
; no offset
(assert (= (+ of_27 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[11].A*1.)} {(1.*sc.vadd[11].C)} {(1.*sc.vadd[11].D*sc.vadd[11].OUT2)}
(assert (and (= (* sc_27 1.) (* 1. sc_26)) (= (* sc_27 1.) (* (* 1. sc_25) sc_30))))
; 
; =  {sc.vadd[11].OUT2} {(sc.vadd[11].A*1.)}
(assert (= sc_30 (* sc_27 1.)))
; no offset
(assert (= of_30 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[11].OUT2_0} {(sc.vadd[11].A*1.)}
(assert (= sc_24 (* sc_27 1.)))
; 
; =  {of.vadd[11].OUT2_0} {(0.-0.-0.)}
(assert (= of_24 0.))
; 
; >=  {((sc.vadd[11].OUT2_0*0.)+of.vadd[11].OUT2_0)} {3300.}
(assert (<= (+ (* sc_24 0.) of_24) 3300.))
; 
; <=  {((sc.vadd[11].OUT2_0*0.)+of.vadd[11].OUT2_0)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.vadd[11].D*0.)+of.vadd[11].D)} {3300.}
(assert (<= (+ (* sc_25 0.) of_25) 3300.))
; 
; <=  {((sc.vadd[11].D*0.)+of.vadd[11].D)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
; 
; >=  {((sc.vadd[11].C*0.)+of.vadd[11].C)} {3300.}
(assert (<= (+ (* sc_26 0.) of_26) 3300.))
; 
; <=  {((sc.vadd[11].C*0.)+of.vadd[11].C)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
; 
; >=  {((sc.vadd[11].A*0.)+of.vadd[11].A)} {3300.}
(assert (<= (+ (* sc_27 0.) of_27) 3300.))
; 
; <=  {((sc.vadd[11].A*0.)+of.vadd[11].A)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
(declare-fun slbot_30_1 () Real)
(assert (<= slbot_30_1 1e-08))
(declare-fun sltop_30_1 () Real)
(assert (>= sltop_30_1 1e-08))
; 
; =  {(((sc.vadd[11].OUT2*0.)+of.vadd[11].OUT2)+sl.min.vadd[11].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30_1) 0.))
; 
; =  {(((sc.vadd[11].OUT2*1.)+of.vadd[11].OUT2)+sl.max.vadd[11].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_30 1.) of_30) sltop_30_1) 3300.))
(declare-fun slbot_28_1 () Real)
(assert (<= slbot_28_1 1e-08))
(declare-fun sltop_28_1 () Real)
(assert (>= sltop_28_1 1e-08))
; 
; =  {(((sc.vadd[11].B*0.)+of.vadd[11].B)+sl.min.vadd[11].B.1)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28_1) 0.))
; 
; =  {(((sc.vadd[11].B*0.42)+of.vadd[11].B)+sl.max.vadd[11].B.1)} {3300.}
(assert (= (+ (+ (* sc_28 0.42) of_28) sltop_28_1) 3300.))
(declare-fun slbot_29_1 () Real)
(assert (<= slbot_29_1 1e-08))
(declare-fun sltop_29_1 () Real)
(assert (>= sltop_29_1 1e-08))
; 
; =  {(((sc.vadd[11].OUT*0.)+of.vadd[11].OUT)+sl.min.vadd[11].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29_1) -1650.))
; 
; =  {(((sc.vadd[11].OUT*0.42)+of.vadd[11].OUT)+sl.max.vadd[11].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_29 0.42) of_29) sltop_29_1) 1650.))
(declare-fun slbot_30_1 () Real)
(assert (<= slbot_30_1 1e-08))
(declare-fun sltop_30_1 () Real)
(assert (>= sltop_30_1 1e-08))
; 
; =  {(((sc.vadd[11].OUT2*0.)+of.vadd[11].OUT2)+sl.min.vadd[11].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30_1) 0.))
; 
; =  {(((sc.vadd[11].OUT2*1.)+of.vadd[11].OUT2)+sl.max.vadd[11].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_30 1.) of_30) sltop_30_1) 3300.))
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
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_32 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_33 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_35 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_34 (* 1. sc_35)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D)}
(assert (and (= sc_34 (* 1. sc_33)) (= sc_34 (* 1. sc_32))))
; no offset
(assert (= (- (+ of_34 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1.)}
(assert (= sc_36 (* sc_34 1.)))
; 
; =  {of.vadd[4].OUT} {0.}
(assert (= of_36 0.))
; no scale
(assert (= sc_32 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_32 0.))
; no offset
(assert (= of_37 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_33 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_35 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_34 (* 1. sc_35)))
; no offset
(assert (= (+ of_34 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[4].A*1.)} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D*sc.vadd[4].OUT2)}
(assert (and (= (* sc_34 1.) (* 1. sc_33)) (= (* sc_34 1.) (* (* 1. sc_32) sc_37))))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1.)}
(assert (= sc_37 (* sc_34 1.)))
; no offset
(assert (= of_37 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1.)}
(assert (= sc_31 (* sc_34 1.)))
; 
; =  {of.vadd[4].OUT2_0} {(0.-0.-0.)}
(assert (= of_31 0.))
; 
; >=  {((sc.vadd[4].OUT2_0*0.256)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_31 0.256) of_31) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.256)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_31 0.256) of_31) 0.))
(declare-fun slbot_32_1 () Real)
(assert (<= slbot_32_1 1e-08))
(declare-fun sltop_32_1 () Real)
(assert (>= sltop_32_1 1e-08))
; 
; =  {(((sc.vadd[4].D*0.)+of.vadd[4].D)+sl.min.vadd[4].D.1)} {0.}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32_1) 0.))
; 
; =  {(((sc.vadd[4].D*3.154)+of.vadd[4].D)+sl.max.vadd[4].D.1)} {3300.}
(assert (= (+ (+ (* sc_32 3.154) of_32) sltop_32_1) 3300.))
; 
; >=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_34 0.) of_34) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
(declare-fun slbot_37_1 () Real)
(assert (<= slbot_37_1 1e-08))
(declare-fun sltop_37_1 () Real)
(assert (>= sltop_37_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37_1) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_37 1.) of_37) sltop_37_1) 3300.))
(declare-fun slbot_35_1 () Real)
(assert (<= slbot_35_1 1e-08))
(declare-fun sltop_35_1 () Real)
(assert (>= sltop_35_1 1e-08))
; 
; =  {(((sc.vadd[4].B*0.)+of.vadd[4].B)+sl.min.vadd[4].B.1)} {0.}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35_1) 0.))
; 
; =  {(((sc.vadd[4].B*4.63)+of.vadd[4].B)+sl.max.vadd[4].B.1)} {3300.}
(assert (= (+ (+ (* sc_35 4.63) of_35) sltop_35_1) 3300.))
(declare-fun slbot_36_1 () Real)
(assert (<= slbot_36_1 1e-08))
(declare-fun sltop_36_1 () Real)
(assert (>= sltop_36_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36_1) -1650.))
; 
; =  {(((sc.vadd[4].OUT*3.154)+of.vadd[4].OUT)+sl.max.vadd[4].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_36 3.154) of_36) sltop_36_1) 1650.))
(declare-fun slbot_37_1 () Real)
(assert (<= slbot_37_1 1e-08))
(declare-fun sltop_37_1 () Real)
(assert (>= sltop_37_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37_1) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_37 1.) of_37) sltop_37_1) 3300.))
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
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_39 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_40 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_42 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_41 (* 1. sc_42)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_41 (* 1. sc_40)) (= sc_41 (* 1. sc_39))))
; no offset
(assert (= (- (+ of_41 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_43 (* sc_41 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_43 0.))
; no scale
(assert (= sc_39 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_39 0.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_40 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_42 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_41 (* 1. sc_42)))
; no offset
(assert (= (+ of_41 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[1].A*1.)} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= (* sc_41 1.) (* 1. sc_40)) (= (* sc_41 1.) (* (* 1. sc_39) sc_44))))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_44 (* sc_41 1.)))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_38 (* sc_41 1.)))
; 
; =  {of.vadd[1].OUT2_0} {(0.-0.-0.)}
(assert (= of_38 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_38 0.124) of_38) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_38 0.124) of_38) 0.))
(declare-fun slbot_39_1 () Real)
(assert (<= slbot_39_1 1e-08))
(declare-fun sltop_39_1 () Real)
(assert (>= sltop_39_1 1e-08))
; 
; =  {(((sc.vadd[1].D*0.)+of.vadd[1].D)+sl.min.vadd[1].D.1)} {0.}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39_1) 0.))
; 
; =  {(((sc.vadd[1].D*3.154)+of.vadd[1].D)+sl.max.vadd[1].D.1)} {3300.}
(assert (= (+ (+ (* sc_39 3.154) of_39) sltop_39_1) 3300.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_40 0.) of_40) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_41 0.) of_41) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun slbot_44_1 () Real)
(assert (<= slbot_44_1 1e-08))
(declare-fun sltop_44_1 () Real)
(assert (>= sltop_44_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_44 1.) of_44) sltop_44_1) 3300.))
(declare-fun slbot_42_1 () Real)
(assert (<= slbot_42_1 1e-08))
(declare-fun sltop_42_1 () Real)
(assert (>= sltop_42_1 1e-08))
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B.1)} {0.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42_1) 0.))
; 
; =  {(((sc.vadd[1].B*5.05)+of.vadd[1].B)+sl.max.vadd[1].B.1)} {3300.}
(assert (= (+ (+ (* sc_42 5.05) of_42) sltop_42_1) 3300.))
(declare-fun slbot_43_1 () Real)
(assert (<= slbot_43_1 1e-08))
(declare-fun sltop_43_1 () Real)
(assert (>= sltop_43_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43_1) -1650.))
; 
; =  {(((sc.vadd[1].OUT*3.154)+of.vadd[1].OUT)+sl.max.vadd[1].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_43 3.154) of_43) sltop_43_1) 1650.))
(declare-fun slbot_44_1 () Real)
(assert (<= slbot_44_1 1e-08))
(declare-fun sltop_44_1 () Real)
(assert (>= sltop_44_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_44 1.) of_44) sltop_44_1) 3300.))
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_46 of_45))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_45 0.) of_45) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_46 0.) of_46) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_48 of_47))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_47 0.) of_47) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_48 0.) of_48) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_50 sc_49))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_50 of_49))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_49 0.) of_49) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_50 0.) of_50) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_52 sc_51))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_52 of_51))
; 
; >=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_51 0.) of_51) 3300.))
; 
; <=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
; 
; >=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_52 0.) of_52) 3300.))
; 
; <=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_54 sc_53))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_54 of_53))
; 
; >=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_53 0.) of_53) 3300.))
; 
; <=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
; 
; >=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_54 0.) of_54) 3300.))
; 
; <=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_56 sc_55))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_56 of_55))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_55 0.) of_55) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_56 0.) of_56) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_58 sc_57))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_58 of_57))
; 
; >=  {((sc.input.V[0].X*3.154)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_57 3.154) of_57) 3300.))
; 
; <=  {((sc.input.V[0].X*3.154)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_57 3.154) of_57) 0.))
; 
; >=  {((sc.input.V[0].O*3.154)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_58 3.154) of_58) 3300.))
; 
; <=  {((sc.input.V[0].O*3.154)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_58 3.154) of_58) 0.))
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_60 sc_59))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_60 of_59))
; 
; >=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_59 0.) of_59) 3300.))
; 
; <=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
; 
; >=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_62 sc_61))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_62 of_61))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_61 0.) of_61) 3300.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_62 0.) of_62) 3300.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.V[15].X*0.124)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_63 0.124) of_63) 3300.))
; 
; <=  {((sc.input.V[15].X*0.124)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_63 0.124) of_63) 0.))
; 
; >=  {((sc.input.V[15].O*0.124)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_64 0.124) of_64) 3300.))
; 
; <=  {((sc.input.V[15].O*0.124)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_64 0.124) of_64) 0.))
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_65 0.) of_65) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_66 0.) of_66) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_68 of_67))
; 
; >=  {((sc.input.V[14].X*0.256)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_67 0.256) of_67) 3300.))
; 
; <=  {((sc.input.V[14].X*0.256)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_67 0.256) of_67) 0.))
; 
; >=  {((sc.input.V[14].O*0.256)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_68 0.256) of_68) 3300.))
; 
; <=  {((sc.input.V[14].O*0.256)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_68 0.256) of_68) 0.))
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_70 of_69))
; 
; >=  {((sc.input.V[16].X*2.525)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_69 2.525) of_69) 3300.))
; 
; <=  {((sc.input.V[16].X*2.525)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_69 2.525) of_69) 0.))
; 
; >=  {((sc.input.V[16].O*2.525)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_70 2.525) of_70) 3300.))
; 
; <=  {((sc.input.V[16].O*2.525)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_70 2.525) of_70) 0.))
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_71 0.) of_71) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_71 0.) of_71) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_72 0.) of_72) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_72 0.) of_72) 0.))
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_73 0.) of_73) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_74 0.) of_74) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_75 0.) of_75) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_76 0.) of_76) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.V[1].X*3.154)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_77 3.154) of_77) 3300.))
; 
; <=  {((sc.input.V[1].X*3.154)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_77 3.154) of_77) 0.))
; 
; >=  {((sc.input.V[1].O*3.154)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_78 3.154) of_78) 3300.))
; 
; <=  {((sc.input.V[1].O*3.154)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_78 3.154) of_78) 0.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
; no offset
(assert (= of_80 0.))
; no offset
(assert (= of_79 0.))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_81 (* sc_80 sc_79)))
; 
; =  {of.itov[2].Y} {0.}
(assert (= of_81 0.))
(declare-fun slbot_79_1 () Real)
(assert (<= slbot_79_1 1e-08))
(declare-fun sltop_79_1 () Real)
(assert (>= sltop_79_1 1e-08))
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X.1)} {0.0001}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79_1) 0.0001))
; 
; =  {(((sc.itov[2].X*1.)+of.itov[2].X)+sl.max.itov[2].X.1)} {10.}
(assert (= (+ (+ (* sc_79 1.) of_79) sltop_79_1) 10.))
(declare-fun slbot_81_1 () Real)
(assert (<= slbot_81_1 1e-08))
(declare-fun sltop_81_1 () Real)
(assert (>= sltop_81_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_81 0.) of_81) slbot_81_1) 0.0001))
; 
; =  {(((sc.itov[2].Y*3.154)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_81 3.154) of_81) sltop_81_1) 3300.))
; 
; >=  {((sc.itov[2].K*3.154)+of.itov[2].K)} {330.}
(assert (<= (+ (* sc_80 3.154) of_80) 330.))
; 
; <=  {((sc.itov[2].K*3.154)+of.itov[2].K)} {1.}
(assert (>= (+ (* sc_80 3.154) of_80) 1.))
(declare-fun slbot_81_1 () Real)
(assert (<= slbot_81_1 1e-08))
(declare-fun sltop_81_1 () Real)
(assert (>= sltop_81_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_81 0.) of_81) slbot_81_1) 0.0001))
; 
; =  {(((sc.itov[2].Y*3.154)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_81 3.154) of_81) sltop_81_1) 3300.))
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
; no offset
(assert (= of_83 0.))
; no offset
(assert (= of_82 0.))
; 
; =  {sc.itov[8].Y} {(sc.itov[8].K*sc.itov[8].X)}
(assert (= sc_84 (* sc_83 sc_82)))
; 
; =  {of.itov[8].Y} {0.}
(assert (= of_84 0.))
(declare-fun slbot_82_1 () Real)
(assert (<= slbot_82_1 1e-08))
(declare-fun sltop_82_1 () Real)
(assert (>= sltop_82_1 1e-08))
; 
; =  {(((sc.itov[8].X*0.)+of.itov[8].X)+sl.min.itov[8].X.1)} {0.0001}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82_1) 0.0001))
; 
; =  {(((sc.itov[8].X*1.)+of.itov[8].X)+sl.max.itov[8].X.1)} {10.}
(assert (= (+ (+ (* sc_82 1.) of_82) sltop_82_1) 10.))
(declare-fun slbot_84_1 () Real)
(assert (<= slbot_84_1 1e-08))
(declare-fun sltop_84_1 () Real)
(assert (>= sltop_84_1 1e-08))
; 
; =  {(((sc.itov[8].Y*0.)+of.itov[8].Y)+sl.min.itov[8].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84_1) 0.0001))
; 
; =  {(((sc.itov[8].Y*6.308)+of.itov[8].Y)+sl.max.itov[8].Y.1)} {3300.}
(assert (= (+ (+ (* sc_84 6.308) of_84) sltop_84_1) 3300.))
(declare-fun slbot_83_1 () Real)
(assert (<= slbot_83_1 1e-08))
(declare-fun sltop_83_1 () Real)
(assert (>= sltop_83_1 1e-08))
; 
; =  {(((sc.itov[8].K*0.)+of.itov[8].K)+sl.min.itov[8].K.1)} {1.}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83_1) 1.))
; 
; =  {(((sc.itov[8].K*6.308)+of.itov[8].K)+sl.max.itov[8].K.1)} {330.}
(assert (= (+ (+ (* sc_83 6.308) of_83) sltop_83_1) 330.))
(declare-fun slbot_84_1 () Real)
(assert (<= slbot_84_1 1e-08))
(declare-fun sltop_84_1 () Real)
(assert (>= sltop_84_1 1e-08))
; 
; =  {(((sc.itov[8].Y*0.)+of.itov[8].Y)+sl.min.itov[8].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84_1) 0.0001))
; 
; =  {(((sc.itov[8].Y*6.308)+of.itov[8].Y)+sl.max.itov[8].Y.1)} {3300.}
(assert (= (+ (+ (* sc_84 6.308) of_84) sltop_84_1) 3300.))
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
; no offset
(assert (= of_86 0.))
; no offset
(assert (= of_85 0.))
; 
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_87 (* sc_86 sc_85)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_87 0.))
; 
; >=  {((sc.itov[0].X*5.05)+of.itov[0].X)} {10.}
(assert (<= (+ (* sc_85 5.05) of_85) 10.))
; 
; <=  {((sc.itov[0].X*5.05)+of.itov[0].X)} {0.0001}
(assert (>= (+ (* sc_85 5.05) of_85) 0.0001))
(declare-fun slbot_87_1 () Real)
(assert (<= slbot_87_1 1e-08))
(declare-fun sltop_87_1 () Real)
(assert (>= sltop_87_1 1e-08))
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87_1) 0.0001))
; 
; =  {(((sc.itov[0].Y*5.05)+of.itov[0].Y)+sl.max.itov[0].Y.1)} {3300.}
(assert (= (+ (+ (* sc_87 5.05) of_87) sltop_87_1) 3300.))
(declare-fun slbot_86_1 () Real)
(assert (<= slbot_86_1 1e-08))
(declare-fun sltop_86_1 () Real)
(assert (>= sltop_86_1 1e-08))
; 
; =  {(((sc.itov[0].K*0.)+of.itov[0].K)+sl.min.itov[0].K.1)} {1.}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86_1) 1.))
; 
; =  {(((sc.itov[0].K*1.)+of.itov[0].K)+sl.max.itov[0].K.1)} {330.}
(assert (= (+ (+ (* sc_86 1.) of_86) sltop_86_1) 330.))
(declare-fun slbot_87_1 () Real)
(assert (<= slbot_87_1 1e-08))
(declare-fun sltop_87_1 () Real)
(assert (>= sltop_87_1 1e-08))
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87_1) 0.0001))
; 
; =  {(((sc.itov[0].Y*5.05)+of.itov[0].Y)+sl.max.itov[0].Y.1)} {3300.}
(assert (= (+ (+ (* sc_87 5.05) of_87) sltop_87_1) 3300.))
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
; =  {sc.itov[10].Y} {(sc.itov[10].K*sc.itov[10].X)}
(assert (= sc_90 (* sc_89 sc_88)))
; 
; =  {of.itov[10].Y} {0.}
(assert (= of_90 0.))
; 
; >=  {((sc.itov[10].X*0.42)+of.itov[10].X)} {10.}
(assert (<= (+ (* sc_88 0.42) of_88) 10.))
; 
; <=  {((sc.itov[10].X*0.42)+of.itov[10].X)} {0.0001}
(assert (>= (+ (* sc_88 0.42) of_88) 0.0001))
(declare-fun slbot_90_1 () Real)
(assert (<= slbot_90_1 1e-08))
(declare-fun sltop_90_1 () Real)
(assert (>= sltop_90_1 1e-08))
; 
; =  {(((sc.itov[10].Y*0.)+of.itov[10].Y)+sl.min.itov[10].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90_1) 0.0001))
; 
; =  {(((sc.itov[10].Y*0.42)+of.itov[10].Y)+sl.max.itov[10].Y.1)} {3300.}
(assert (= (+ (+ (* sc_90 0.42) of_90) sltop_90_1) 3300.))
(declare-fun slbot_89_1 () Real)
(assert (<= slbot_89_1 1e-08))
(declare-fun sltop_89_1 () Real)
(assert (>= sltop_89_1 1e-08))
; 
; =  {(((sc.itov[10].K*0.)+of.itov[10].K)+sl.min.itov[10].K.1)} {1.}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89_1) 1.))
; 
; =  {(((sc.itov[10].K*1.)+of.itov[10].K)+sl.max.itov[10].K.1)} {330.}
(assert (= (+ (+ (* sc_89 1.) of_89) sltop_89_1) 330.))
(declare-fun slbot_90_1 () Real)
(assert (<= slbot_90_1 1e-08))
(declare-fun sltop_90_1 () Real)
(assert (>= sltop_90_1 1e-08))
; 
; =  {(((sc.itov[10].Y*0.)+of.itov[10].Y)+sl.min.itov[10].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90_1) 0.0001))
; 
; =  {(((sc.itov[10].Y*0.42)+of.itov[10].Y)+sl.max.itov[10].Y.1)} {3300.}
(assert (= (+ (+ (* sc_90 0.42) of_90) sltop_90_1) 3300.))
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
; =  {sc.itov[6].Y} {(sc.itov[6].K*sc.itov[6].X)}
(assert (= sc_93 (* sc_92 sc_91)))
; 
; =  {of.itov[6].Y} {0.}
(assert (= of_93 0.))
; 
; >=  {((sc.itov[6].X*25.232)+of.itov[6].X)} {10.}
(assert (<= (+ (* sc_91 25.232) of_91) 10.))
; 
; <=  {((sc.itov[6].X*25.232)+of.itov[6].X)} {0.0001}
(assert (>= (+ (* sc_91 25.232) of_91) 0.0001))
(declare-fun slbot_93_1 () Real)
(assert (<= slbot_93_1 1e-08))
(declare-fun sltop_93_1 () Real)
(assert (>= sltop_93_1 1e-08))
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93_1) 0.0001))
; 
; =  {(((sc.itov[6].Y*25.232)+of.itov[6].Y)+sl.max.itov[6].Y.1)} {3300.}
(assert (= (+ (+ (* sc_93 25.232) of_93) sltop_93_1) 3300.))
(declare-fun slbot_92_1 () Real)
(assert (<= slbot_92_1 1e-08))
(declare-fun sltop_92_1 () Real)
(assert (>= sltop_92_1 1e-08))
; 
; =  {(((sc.itov[6].K*0.)+of.itov[6].K)+sl.min.itov[6].K.1)} {1.}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92_1) 1.))
; 
; =  {(((sc.itov[6].K*1.)+of.itov[6].K)+sl.max.itov[6].K.1)} {330.}
(assert (= (+ (+ (* sc_92 1.) of_92) sltop_92_1) 330.))
(declare-fun slbot_93_1 () Real)
(assert (<= slbot_93_1 1e-08))
(declare-fun sltop_93_1 () Real)
(assert (>= sltop_93_1 1e-08))
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93_1) 0.0001))
; 
; =  {(((sc.itov[6].Y*25.232)+of.itov[6].Y)+sl.max.itov[6].Y.1)} {3300.}
(assert (= (+ (+ (* sc_93 25.232) of_93) sltop_93_1) 3300.))
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
; 
; >=  {((sc.itov[3].X*4.63)+of.itov[3].X)} {10.}
(assert (<= (+ (* sc_94 4.63) of_94) 10.))
; 
; <=  {((sc.itov[3].X*4.63)+of.itov[3].X)} {0.0001}
(assert (>= (+ (* sc_94 4.63) of_94) 0.0001))
(declare-fun slbot_96_1 () Real)
(assert (<= slbot_96_1 1e-08))
(declare-fun sltop_96_1 () Real)
(assert (>= sltop_96_1 1e-08))
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96_1) 0.0001))
; 
; =  {(((sc.itov[3].Y*4.63)+of.itov[3].Y)+sl.max.itov[3].Y.1)} {3300.}
(assert (= (+ (+ (* sc_96 4.63) of_96) sltop_96_1) 3300.))
(declare-fun slbot_95_1 () Real)
(assert (<= slbot_95_1 1e-08))
(declare-fun sltop_95_1 () Real)
(assert (>= sltop_95_1 1e-08))
; 
; =  {(((sc.itov[3].K*0.)+of.itov[3].K)+sl.min.itov[3].K.1)} {1.}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95_1) 1.))
; 
; =  {(((sc.itov[3].K*1.)+of.itov[3].K)+sl.max.itov[3].K.1)} {330.}
(assert (= (+ (+ (* sc_95 1.) of_95) sltop_95_1) 330.))
(declare-fun slbot_96_1 () Real)
(assert (<= slbot_96_1 1e-08))
(declare-fun sltop_96_1 () Real)
(assert (>= sltop_96_1 1e-08))
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96_1) 0.0001))
; 
; =  {(((sc.itov[3].Y*4.63)+of.itov[3].Y)+sl.max.itov[3].Y.1)} {3300.}
(assert (= (+ (+ (* sc_96 4.63) of_96) sltop_96_1) 3300.))
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
; =  {(((sc.itov[5].X*0.)+of.itov[5].X)+sl.min.itov[5].X.1)} {0.0001}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97_1) 0.0001))
; 
; =  {(((sc.itov[5].X*1.)+of.itov[5].X)+sl.max.itov[5].X.1)} {10.}
(assert (= (+ (+ (* sc_97 1.) of_97) sltop_97_1) 10.))
(declare-fun slbot_99_1 () Real)
(assert (<= slbot_99_1 1e-08))
(declare-fun sltop_99_1 () Real)
(assert (>= sltop_99_1 1e-08))
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99_1) 0.0001))
; 
; =  {(((sc.itov[5].Y*3.154)+of.itov[5].Y)+sl.max.itov[5].Y.1)} {3300.}
(assert (= (+ (+ (* sc_99 3.154) of_99) sltop_99_1) 3300.))
; 
; >=  {((sc.itov[5].K*3.154)+of.itov[5].K)} {330.}
(assert (<= (+ (* sc_98 3.154) of_98) 330.))
; 
; <=  {((sc.itov[5].K*3.154)+of.itov[5].K)} {1.}
(assert (>= (+ (* sc_98 3.154) of_98) 1.))
(declare-fun slbot_99_1 () Real)
(assert (<= slbot_99_1 1e-08))
(declare-fun sltop_99_1 () Real)
(assert (>= sltop_99_1 1e-08))
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99_1) 0.0001))
; 
; =  {(((sc.itov[5].Y*3.154)+of.itov[5].Y)+sl.max.itov[5].Y.1)} {3300.}
(assert (= (+ (+ (* sc_99 3.154) of_99) sltop_99_1) 3300.))
; 
; =  {sc.vadd[7].OUT2} {sc.itov[3].K}
(assert (= sc_16 sc_95))
; 
; =  {of.vadd[7].OUT2} {of.itov[3].K}
(assert (= of_16 of_95))
; 
; =  {sc.vadd[7].OUT2} {sc.itov[10].K}
(assert (= sc_16 sc_89))
; 
; =  {of.vadd[7].OUT2} {of.itov[10].K}
(assert (= of_16 of_89))
; 
; =  {sc.vadd[7].OUT2} {sc.itov[0].K}
(assert (= sc_16 sc_86))
; 
; =  {of.vadd[7].OUT2} {of.itov[0].K}
(assert (= of_16 of_86))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].D}
(assert (= sc_81 sc_39))
; 
; =  {of.itov[2].Y} {of.vadd[1].D}
(assert (= of_81 of_39))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[2].X}
(assert (= sc_37 sc_79))
; 
; =  {of.vadd[4].OUT2} {of.itov[2].X}
(assert (= of_37 of_79))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[8].X}
(assert (= sc_37 sc_82))
; 
; =  {of.vadd[4].OUT2} {of.itov[8].X}
(assert (= of_37 of_82))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[6].K}
(assert (= sc_44 sc_92))
; 
; =  {of.vadd[1].OUT2} {of.itov[6].K}
(assert (= of_44 of_92))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[5].X}
(assert (= sc_44 sc_97))
; 
; =  {of.vadd[1].OUT2} {of.itov[5].X}
(assert (= of_44 of_97))
; 
; =  {sc.input.I[0].O} {sc.itov[3].X}
(assert (= sc_3 sc_94))
; 
; =  {of.input.I[0].O} {of.itov[3].X}
(assert (= of_3 of_94))
; 
; =  {sc.input.V[9].O} {sc.vadd[9].B}
(assert (= sc_56 sc_21))
; 
; =  {of.input.V[9].O} {of.vadd[9].B}
(assert (= of_56 of_21))
; 
; =  {sc.input.V[15].O} {sc.vadd[1].OUT2_0}
(assert (= sc_64 sc_38))
; 
; =  {of.input.V[15].O} {of.vadd[1].OUT2_0}
(assert (= of_64 of_38))
; 
; =  {sc.input.I[3].O} {sc.itov[10].X}
(assert (= sc_5 sc_88))
; 
; =  {of.input.I[3].O} {of.itov[10].X}
(assert (= of_5 of_88))
; 
; =  {sc.input.V[13].O} {sc.vadd[11].C}
(assert (= sc_52 sc_26))
; 
; =  {of.input.V[13].O} {of.vadd[11].C}
(assert (= of_52 of_26))
; 
; =  {sc.input.V[14].O} {sc.vadd[4].OUT2_0}
(assert (= sc_68 sc_31))
; 
; =  {of.input.V[14].O} {of.vadd[4].OUT2_0}
(assert (= of_68 of_31))
; 
; =  {sc.input.V[11].O} {sc.vadd[11].A}
(assert (= sc_60 sc_27))
; 
; =  {of.input.V[11].O} {of.vadd[11].A}
(assert (= of_60 of_27))
; 
; =  {sc.itov[5].Y} {sc.vadd[4].D}
(assert (= sc_99 sc_32))
; 
; =  {of.itov[5].Y} {of.vadd[4].D}
(assert (= of_99 of_32))
; 
; =  {sc.itov[8].Y} {sc.vadd[7].B}
(assert (= sc_84 sc_14))
; 
; =  {of.itov[8].Y} {of.vadd[7].B}
(assert (= of_84 of_14))
; 
; =  {sc.input.V[12].O} {sc.vadd[11].D}
(assert (= sc_54 sc_25))
; 
; =  {of.input.V[12].O} {of.vadd[11].D}
(assert (= of_54 of_25))
; 
; =  {sc.input.V[8].O} {sc.vadd[7].A}
(assert (= sc_48 sc_13))
; 
; =  {of.input.V[8].O} {of.vadd[7].A}
(assert (= of_48 of_13))
; 
; =  {sc.input.I[2].O} {sc.itov[6].X}
(assert (= sc_1 sc_91))
; 
; =  {of.input.I[2].O} {of.itov[6].X}
(assert (= of_1 of_91))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].C}
(assert (= sc_72 sc_40))
; 
; =  {of.input.V[3].O} {of.vadd[1].C}
(assert (= of_72 of_40))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].A}
(assert (= sc_46 sc_41))
; 
; =  {of.input.V[2].O} {of.vadd[1].A}
(assert (= of_46 of_41))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_87 sc_42))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_87 of_42))
; 
; =  {sc.vadd[9].OUT} {sc.itov[8].K}
(assert (= sc_22 sc_83))
; 
; =  {of.vadd[9].OUT} {of.itov[8].K}
(assert (= of_22 of_83))
; 
; =  {sc.input.I[1].O} {sc.itov[0].X}
(assert (= sc_7 sc_85))
; 
; =  {of.input.I[1].O} {of.itov[0].X}
(assert (= of_7 of_85))
; 
; =  {sc.vadd[11].OUT2} {sc.output.V[0].X}
(assert (= sc_30 sc_8))
; 
; =  {of.vadd[11].OUT2} {of.output.V[0].X}
(assert (= of_30 of_8))
; 
; =  {sc.input.V[1].O} {sc.itov[2].K}
(assert (= sc_78 sc_80))
; 
; =  {of.input.V[1].O} {of.itov[2].K}
(assert (= of_78 of_80))
; 
; =  {sc.input.V[7].O} {sc.vadd[7].C}
(assert (= sc_50 sc_12))
; 
; =  {of.input.V[7].O} {of.vadd[7].C}
(assert (= of_50 of_12))
; 
; =  {sc.itov[3].Y} {sc.vadd[4].B}
(assert (= sc_96 sc_35))
; 
; =  {of.itov[3].Y} {of.vadd[4].B}
(assert (= of_96 of_35))
; 
; =  {sc.itov[6].Y} {sc.vadd[9].A}
(assert (= sc_93 sc_20))
; 
; =  {of.itov[6].Y} {of.vadd[9].A}
(assert (= of_93 of_20))
; 
; =  {sc.input.V[10].O} {sc.vadd[11].OUT2_0}
(assert (= sc_62 sc_24))
; 
; =  {of.input.V[10].O} {of.vadd[11].OUT2_0}
(assert (= of_62 of_24))
; 
; =  {sc.input.V[0].O} {sc.itov[5].K}
(assert (= sc_58 sc_98))
; 
; =  {of.input.V[0].O} {of.itov[5].K}
(assert (= of_58 of_98))
; 
; =  {sc.itov[10].Y} {sc.vadd[11].B}
(assert (= sc_90 sc_28))
; 
; =  {of.itov[10].Y} {of.vadd[11].B}
(assert (= of_90 of_28))
; 
; =  {sc.input.V[16].O} {sc.vadd[7].D}
(assert (= sc_70 sc_11))
; 
; =  {of.input.V[16].O} {of.vadd[7].D}
(assert (= of_70 of_11))
; 
; =  {sc.input.V[5].O} {sc.vadd[4].C}
(assert (= sc_76 sc_33))
; 
; =  {of.input.V[5].O} {of.vadd[4].C}
(assert (= of_76 of_33))
; 
; =  {sc.input.V[4].O} {sc.vadd[4].A}
(assert (= sc_74 sc_34))
; 
; =  {of.input.V[4].O} {of.vadd[4].A}
(assert (= of_74 of_34))
; 
; =  {sc.input.V[6].O} {sc.vadd[7].OUT2_0}
(assert (= sc_66 sc_10))
; 
; =  {of.input.V[6].O} {of.vadd[7].OUT2_0}
(assert (= of_66 of_10))
(assert (<= (* (/ 1. sc_9) 0.001) 0.1))
; 
; =  {sc.vadd[11].OUT2} {sc.output.V[0].O} {sc.vadd[4].OUT2} {sc.vadd[1].OUT2} {sc.vadd[7].OUT2}
(assert (and (and (and (= sc_30 sc_9) (= sc_30 sc_37)) (= sc_30 sc_44)) (= sc_30 sc_16)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_28_1 0.) slbot_28_1 (- slbot_28_1)) (ite (>= slbot_84_1 0.) slbot_84_1 (- slbot_84_1))) (ite (>= slbot_37_1 0.) slbot_37_1 (- slbot_37_1))) (ite (>= sltop_93_1 0.) sltop_93_1 (- sltop_93_1))) (ite (>= sltop_37_1 0.) sltop_37_1 (- sltop_37_1))) (ite (>= slbot_22_1 0.) slbot_22_1 (- slbot_22_1))) (ite (>= sltop_95_1 0.) sltop_95_1 (- sltop_95_1))) (ite (>= slbot_35_1 0.) slbot_35_1 (- slbot_35_1))) (ite (>= sltop_28_1 0.) sltop_28_1 (- sltop_28_1))) (ite (>= slbot_92_1 0.) slbot_92_1 (- slbot_92_1))) (ite (>= sltop_87_1 0.) sltop_87_1 (- sltop_87_1))) (ite (>= sltop_92_1 0.) sltop_92_1 (- sltop_92_1))) (ite (>= slbot_95_1 0.) slbot_95_1 (- slbot_95_1))) (ite (>= slbot_99_1 0.) slbot_99_1 (- slbot_99_1))) (ite (>= sltop_8_1 0.) sltop_8_1 (- sltop_8_1))) (ite (>= slbot_16_1 0.) slbot_16_1 (- slbot_16_1))) (ite (>= slbot_96_1 0.) slbot_96_1 (- slbot_96_1))) (ite (>= slbot_14_1 0.) slbot_14_1 (- slbot_14_1))) (ite (>= sltop_43_1 0.) sltop_43_1 (- sltop_43_1))) (ite (>= slbot_97_1 0.) slbot_97_1 (- slbot_97_1))) (ite (>= sltop_39_1 0.) sltop_39_1 (- sltop_39_1))) (ite (>= slbot_9_1 0.) slbot_9_1 (- slbot_9_1))) (ite (>= slbot_36_1 0.) slbot_36_1 (- slbot_36_1))) (ite (>= sltop_79_1 0.) sltop_79_1 (- sltop_79_1))) (ite (>= sltop_84_1 0.) sltop_84_1 (- sltop_84_1))) (ite (>= sltop_9_1 0.) sltop_9_1 (- sltop_9_1))) (ite (>= slbot_44_1 0.) slbot_44_1 (- slbot_44_1))) (ite (>= sltop_35_1 0.) sltop_35_1 (- sltop_35_1))) (ite (>= sltop_83_1 0.) sltop_83_1 (- sltop_83_1))) (ite (>= slbot_90_1 0.) slbot_90_1 (- slbot_90_1))) (ite (>= sltop_32_1 0.) sltop_32_1 (- sltop_32_1))) (ite (>= sltop_81_1 0.) sltop_81_1 (- sltop_81_1))) (ite (>= sltop_86_1 0.) sltop_86_1 (- sltop_86_1))) (ite (>= sltop_29_1 0.) sltop_29_1 (- sltop_29_1))) (ite (>= slbot_89_1 0.) slbot_89_1 (- slbot_89_1))) (ite (>= sltop_99_1 0.) sltop_99_1 (- sltop_99_1))) (ite (>= slbot_20_1 0.) slbot_20_1 (- slbot_20_1))) (ite (>= slbot_15_1 0.) slbot_15_1 (- slbot_15_1))) (ite (>= slbot_32_1 0.) slbot_32_1 (- slbot_32_1))) (ite (>= slbot_87_1 0.) slbot_87_1 (- slbot_87_1))) (ite (>= sltop_36_1 0.) sltop_36_1 (- sltop_36_1))) (ite (>= slbot_86_1 0.) slbot_86_1 (- slbot_86_1))) (ite (>= slbot_39_1 0.) slbot_39_1 (- slbot_39_1))) (ite (>= slbot_42_1 0.) slbot_42_1 (- slbot_42_1))) (ite (>= sltop_90_1 0.) sltop_90_1 (- sltop_90_1))) (ite (>= sltop_15_1 0.) sltop_15_1 (- sltop_15_1))) (ite (>= sltop_30_1 0.) sltop_30_1 (- sltop_30_1))) (ite (>= slbot_79_1 0.) slbot_79_1 (- slbot_79_1))) (ite (>= slbot_93_1 0.) slbot_93_1 (- slbot_93_1))) (ite (>= sltop_97_1 0.) sltop_97_1 (- sltop_97_1))) (ite (>= sltop_22_1 0.) sltop_22_1 (- sltop_22_1))) (ite (>= sltop_96_1 0.) sltop_96_1 (- sltop_96_1))) (ite (>= sltop_14_1 0.) sltop_14_1 (- sltop_14_1))) (ite (>= sltop_44_1 0.) sltop_44_1 (- sltop_44_1))) (ite (>= sltop_16_1 0.) sltop_16_1 (- sltop_16_1))) (ite (>= slbot_8_1 0.) slbot_8_1 (- slbot_8_1))) (ite (>= sltop_89_1 0.) sltop_89_1 (- sltop_89_1))) (ite (>= sltop_20_1 0.) sltop_20_1 (- sltop_20_1))) (ite (>= slbot_30_1 0.) slbot_30_1 (- slbot_30_1))) (ite (>= sltop_42_1 0.) sltop_42_1 (- sltop_42_1))) (ite (>= slbot_83_1 0.) slbot_83_1 (- slbot_83_1))) (ite (>= sltop_82_1 0.) sltop_82_1 (- sltop_82_1))) (ite (>= slbot_82_1 0.) slbot_82_1 (- slbot_82_1))) (ite (>= slbot_29_1 0.) slbot_29_1 (- slbot_29_1))) (ite (>= slbot_43_1 0.) slbot_43_1 (- slbot_43_1))) (ite (>= slbot_81_1 0.) slbot_81_1 (- slbot_81_1)))))
(check-sat)
