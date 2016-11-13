(set-logic QF_NRA)
(declare-fun __minima__ () Real)
(declare-fun sc_0 () Real)
(assert (> sc_0 1e-08))
(declare-fun of_0 () Real)
(declare-fun sc_1 () Real)
(assert (> sc_1 1e-08))
(declare-fun of_1 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_1 sc_0))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_1 of_0))
; 
; >=  {((sc.input.I[0].X*0.01)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_0 0.01) of_0) 10.))
; 
; <=  {((sc.input.I[0].X*0.01)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_0 0.01) of_0) 0.))
; 
; >=  {((sc.input.I[0].O*0.01)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_1 0.01) of_1) 10.))
; 
; <=  {((sc.input.I[0].O*0.01)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_1 0.01) of_1) 0.))
(declare-fun sc_2 () Real)
(assert (> sc_2 1e-08))
(declare-fun of_2 () Real)
(declare-fun sc_3 () Real)
(assert (> sc_3 1e-08))
(declare-fun of_3 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_3 sc_2))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_3 of_2))
; 
; >=  {((sc.input.I[1].X*0.01)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_2 0.01) of_2) 10.))
; 
; <=  {((sc.input.I[1].X*0.01)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_2 0.01) of_2) 0.))
; 
; >=  {((sc.input.I[1].O*0.01)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_3 0.01) of_3) 10.))
; 
; <=  {((sc.input.I[1].O*0.01)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_3 0.01) of_3) 0.))
(declare-fun sc_4 () Real)
(assert (> sc_4 1e-08))
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(assert (> sc_5 1e-08))
(declare-fun of_5 () Real)
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_5 sc_4))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_5 of_4))
(declare-fun slbot_4_1 () Real)
(assert (<= slbot_4_1 1e-08))
(declare-fun sltop_4_1 () Real)
(assert (>= sltop_4_1 1e-08))
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X.1)} {0.}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4_1) 0.))
; 
; =  {(((sc.output.V[2].X*4400.)+of.output.V[2].X)+sl.max.output.V[2].X.1)} {3300.}
(assert (= (+ (+ (* sc_4 4400.) of_4) sltop_4_1) 3300.))
(declare-fun slbot_5_1 () Real)
(assert (<= slbot_5_1 1e-08))
(declare-fun sltop_5_1 () Real)
(assert (>= sltop_5_1 1e-08))
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O.1)} {0.}
(assert (= (+ (+ (* sc_5 0.) of_5) slbot_5_1) 0.))
; 
; =  {(((sc.output.V[2].O*4400.)+of.output.V[2].O)+sl.max.output.V[2].O.1)} {3300.}
(assert (= (+ (+ (* sc_5 4400.) of_5) sltop_5_1) 3300.))
(declare-fun sc_6 () Real)
(assert (> sc_6 1e-08))
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_7 sc_6))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_7 of_6))
(declare-fun slbot_6_1 () Real)
(assert (<= slbot_6_1 1e-08))
(declare-fun sltop_6_1 () Real)
(assert (>= sltop_6_1 1e-08))
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X.1)} {0.}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6_1) 0.))
; 
; =  {(((sc.output.V[0].X*4400.)+of.output.V[0].X)+sl.max.output.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_6 4400.) of_6) sltop_6_1) 3300.))
(declare-fun slbot_7_1 () Real)
(assert (<= slbot_7_1 1e-08))
(declare-fun sltop_7_1 () Real)
(assert (>= sltop_7_1 1e-08))
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O.1)} {0.}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7_1) 0.))
; 
; =  {(((sc.output.V[0].O*4400.)+of.output.V[0].O)+sl.max.output.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_7 4400.) of_7) sltop_7_1) 3300.))
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_9 sc_8))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_9 of_8))
(declare-fun slbot_8_1 () Real)
(assert (<= slbot_8_1 1e-08))
(declare-fun sltop_8_1 () Real)
(assert (>= sltop_8_1 1e-08))
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X.1)} {0.}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8_1) 0.))
; 
; =  {(((sc.output.V[3].X*4400.)+of.output.V[3].X)+sl.max.output.V[3].X.1)} {3300.}
(assert (= (+ (+ (* sc_8 4400.) of_8) sltop_8_1) 3300.))
(declare-fun slbot_9_1 () Real)
(assert (<= slbot_9_1 1e-08))
(declare-fun sltop_9_1 () Real)
(assert (>= sltop_9_1 1e-08))
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O.1)} {0.}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9_1) 0.))
; 
; =  {(((sc.output.V[3].O*4400.)+of.output.V[3].O)+sl.max.output.V[3].O.1)} {3300.}
(assert (= (+ (+ (* sc_9 4400.) of_9) sltop_9_1) 3300.))
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_11 sc_10))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_11 of_10))
(declare-fun slbot_10_1 () Real)
(assert (<= slbot_10_1 1e-08))
(declare-fun sltop_10_1 () Real)
(assert (>= sltop_10_1 1e-08))
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X.1)} {0.}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10_1) 0.))
; 
; =  {(((sc.output.V[1].X*6800.)+of.output.V[1].X)+sl.max.output.V[1].X.1)} {3300.}
(assert (= (+ (+ (* sc_10 6800.) of_10) sltop_10_1) 3300.))
(declare-fun slbot_11_1 () Real)
(assert (<= slbot_11_1 1e-08))
(declare-fun sltop_11_1 () Real)
(assert (>= sltop_11_1 1e-08))
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O.1)} {0.}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11_1) 0.))
; 
; =  {(((sc.output.V[1].O*6800.)+of.output.V[1].O)+sl.max.output.V[1].O.1)} {3300.}
(assert (= (+ (+ (* sc_11 6800.) of_11) sltop_11_1) 3300.))
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
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_13 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_16 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_15 (* 1. sc_16)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D)}
(assert (and (= sc_15 (* 1. sc_14)) (= sc_15 (* 1. sc_13))))
; no offset
(assert (= (- (+ of_15 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1.)}
(assert (= sc_17 (* sc_15 1.)))
; 
; =  {of.vadd[2].OUT} {0.}
(assert (= of_17 0.))
; no scale
(assert (= sc_13 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_13 0.))
; no offset
(assert (= of_18 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_16 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_15 (* 1. sc_16)))
; no offset
(assert (= (+ of_15 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[2].A*1.)} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D*sc.vadd[2].OUT2)}
(assert (and (= (* sc_15 1.) (* 1. sc_14)) (= (* sc_15 1.) (* (* 1. sc_13) sc_18))))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1.)}
(assert (= sc_18 (* sc_15 1.)))
; no offset
(assert (= of_18 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1.)}
(assert (= sc_12 (* sc_15 1.)))
; 
; =  {of.vadd[2].OUT2_0} {(0.-0.-0.)}
(assert (= of_12 0.))
; 
; >=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {3300.}
(assert (<= (+ (* sc_12 0.) of_12) 3300.))
; 
; <=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
; 
; >=  {((sc.vadd[2].D*0.01)+of.vadd[2].D)} {3300.}
(assert (<= (+ (* sc_13 0.01) of_13) 3300.))
; 
; <=  {((sc.vadd[2].D*0.01)+of.vadd[2].D)} {0.}
(assert (>= (+ (* sc_13 0.01) of_13) 0.))
; 
; >=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {3300.}
(assert (<= (+ (* sc_14 0.) of_14) 3300.))
; 
; <=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {3300.}
(assert (<= (+ (* sc_15 0.) of_15) 3300.))
; 
; <=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
(declare-fun slbot_18_1 () Real)
(assert (<= slbot_18_1 1e-08))
(declare-fun sltop_18_1 () Real)
(assert (>= sltop_18_1 1e-08))
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_18 0.) of_18) slbot_18_1) 0.))
; 
; =  {(((sc.vadd[2].OUT2*4400.)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_18 4400.) of_18) sltop_18_1) 3300.))
(declare-fun slbot_16_1 () Real)
(assert (<= slbot_16_1 1e-08))
(declare-fun sltop_16_1 () Real)
(assert (>= sltop_16_1 1e-08))
; 
; =  {(((sc.vadd[2].B*0.)+of.vadd[2].B)+sl.min.vadd[2].B.1)} {0.}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16_1) 0.))
; 
; =  {(((sc.vadd[2].B*598400.)+of.vadd[2].B)+sl.max.vadd[2].B.1)} {3300.}
(assert (= (+ (+ (* sc_16 598400.) of_16) sltop_16_1) 3300.))
(declare-fun slbot_17_1 () Real)
(assert (<= slbot_17_1 1e-08))
(declare-fun sltop_17_1 () Real)
(assert (>= sltop_17_1 1e-08))
; 
; =  {(((sc.vadd[2].OUT*0.)+of.vadd[2].OUT)+sl.min.vadd[2].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17_1) -1650.))
; 
; =  {(((sc.vadd[2].OUT*598400.)+of.vadd[2].OUT)+sl.max.vadd[2].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_17 598400.) of_17) sltop_17_1) 1650.))
(declare-fun slbot_18_1 () Real)
(assert (<= slbot_18_1 1e-08))
(declare-fun sltop_18_1 () Real)
(assert (>= sltop_18_1 1e-08))
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_18 0.) of_18) slbot_18_1) 0.))
; 
; =  {(((sc.vadd[2].OUT2*4400.)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_18 4400.) of_18) sltop_18_1) 3300.))
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
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_23 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_22 (* 1. sc_23)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D)}
(assert (and (= sc_22 (* 1. sc_21)) (= sc_22 (* 1. sc_20))))
; no offset
(assert (= (- (+ of_22 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1.)}
(assert (= sc_24 (* sc_22 1.)))
; 
; =  {of.vadd[4].OUT} {0.}
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_23 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_22 (* 1. sc_23)))
; no offset
(assert (= (+ of_22 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[4].A*1.)} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D*sc.vadd[4].OUT2)}
(assert (and (= (* sc_22 1.) (* 1. sc_21)) (= (* sc_22 1.) (* (* 1. sc_20) sc_25))))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1.)}
(assert (= sc_25 (* sc_22 1.)))
; no offset
(assert (= of_25 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1.)}
(assert (= sc_19 (* sc_22 1.)))
; 
; =  {of.vadd[4].OUT2_0} {(0.-0.-0.)}
(assert (= of_19 0.))
(declare-fun slbot_24_1 () Real)
(assert (<= slbot_24_1 1e-08))
(declare-fun sltop_24_1 () Real)
(assert (>= sltop_24_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT.1)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24_1) 0.))
; 
; =  {(((sc.vadd[4].OUT*136.)+of.vadd[4].OUT)+sl.max.vadd[4].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_24 136.) of_24) sltop_24_1) 1650.))
(declare-fun slbot_22_1 () Real)
(assert (<= slbot_22_1 1e-08))
(declare-fun sltop_22_1 () Real)
(assert (>= sltop_22_1 1e-08))
; 
; =  {(((sc.vadd[4].A*0.)+of.vadd[4].A)+sl.min.vadd[4].A.1)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22_1) 0.))
; 
; =  {(((sc.vadd[4].A*544.)+of.vadd[4].A)+sl.max.vadd[4].A.1)} {3300.}
(assert (= (+ (+ (* sc_22 544.) of_22) sltop_22_1) 3300.))
; 
; >=  {((sc.vadd[4].B*0.)+of.vadd[4].B)} {3300.}
(assert (<= (+ (* sc_23 0.) of_23) 3300.))
; 
; <=  {((sc.vadd[4].B*0.)+of.vadd[4].B)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
(declare-fun slbot_24_1 () Real)
(assert (<= slbot_24_1 1e-08))
(declare-fun sltop_24_1 () Real)
(assert (>= sltop_24_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT.1)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24_1) 0.))
; 
; =  {(((sc.vadd[4].OUT*136.)+of.vadd[4].OUT)+sl.max.vadd[4].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_24 136.) of_24) sltop_24_1) 1650.))
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
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; 
; =  {sc.mm[0].Xtot} {sc.mm[0].XY}
(assert (= sc_30 sc_32))
; 
; =  {sc.mm[0].X} {sc.mm[0].Xtot}
(assert (= sc_31 sc_30))
; 
; =  {of.mm[0].X} {(of.mm[0].Xtot-of.mm[0].XY)}
(assert (= of_31 (- of_30 of_32)))
; no scale
(assert (= sc_26 1.))
; no offset
(assert (= of_26 0.))
; no offset
(assert (= of_32 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= of_33 0.))
; 
; =  {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)} {(sc.mm[0].kr*sc.mm[0].XY)}
(assert (= (* (* sc_29 sc_31) sc_33) (* sc_26 sc_32)))
; 
; =  {sc.mm[0].XY} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_32 (* (* sc_29 sc_31) sc_33)))
; no offset
(assert (= of_32 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.mm[0].XY0} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_27 (* (* sc_29 sc_31) sc_33)))
; 
; =  {of.mm[0].XY0} {(0.-0.)}
(assert (= of_27 0.))
; 
; =  {sc.mm[0].Ytot} {sc.mm[0].XY}
(assert (= sc_28 sc_32))
; 
; =  {sc.mm[0].Y} {sc.mm[0].Ytot}
(assert (= sc_33 sc_28))
; 
; =  {of.mm[0].Y} {(of.mm[0].Ytot-of.mm[0].XY)}
(assert (= of_33 (- of_28 of_32)))
; 
; >=  {((sc.mm[0].kr*0.01)+of.mm[0].kr)} {10.}
(assert (<= (+ (* sc_26 0.01) of_26) 10.))
; 
; <=  {((sc.mm[0].kr*0.01)+of.mm[0].kr)} {0.0001}
(assert (>= (+ (* sc_26 0.01) of_26) 0.0001))
(declare-fun slbot_31_1 () Real)
(assert (<= slbot_31_1 1e-08))
(declare-fun sltop_31_1 () Real)
(assert (>= sltop_31_1 1e-08))
; 
; =  {(((sc.mm[0].X*0.)+of.mm[0].X)+sl.min.mm[0].X.1)} {-65999.9999}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31_1) -65999.9999))
; 
; =  {(((sc.mm[0].X*6800.)+of.mm[0].X)+sl.max.mm[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_31 6800.) of_31) sltop_31_1) 3300.))
(declare-fun slbot_32_1 () Real)
(assert (<= slbot_32_1 1e-08))
(declare-fun sltop_32_1 () Real)
(assert (>= sltop_32_1 1e-08))
; 
; =  {(((sc.mm[0].XY*0.)+of.mm[0].XY)+sl.min.mm[0].XY.1)} {0.}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32_1) 0.))
; 
; =  {(((sc.mm[0].XY*4400.)+of.mm[0].XY)+sl.max.mm[0].XY.1)} {66000.}
(assert (= (+ (+ (* sc_32 4400.) of_32) sltop_32_1) 66000.))
(declare-fun slbot_33_1 () Real)
(assert (<= slbot_33_1 1e-08))
(declare-fun sltop_33_1 () Real)
(assert (>= sltop_33_1 1e-08))
; 
; =  {(((sc.mm[0].Y*0.)+of.mm[0].Y)+sl.min.mm[0].Y.1)} {-65999.9999}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33_1) -65999.9999))
; 
; =  {(((sc.mm[0].Y*4400.)+of.mm[0].Y)+sl.max.mm[0].Y.1)} {3300.}
(assert (= (+ (+ (* sc_33 4400.) of_33) sltop_33_1) 3300.))
; 
; >=  {((sc.mm[0].Ytot*4400.)+of.mm[0].Ytot)} {3300.}
(assert (<= (+ (* sc_28 4400.) of_28) 3300.))
; 
; <=  {((sc.mm[0].Ytot*4400.)+of.mm[0].Ytot)} {0.0001}
(assert (>= (+ (* sc_28 4400.) of_28) 0.0001))
; 
; >=  {((sc.mm[0].kf*0.01)+of.mm[0].kf)} {10.}
(assert (<= (+ (* sc_29 0.01) of_29) 10.))
; 
; <=  {((sc.mm[0].kf*0.01)+of.mm[0].kf)} {0.0001}
(assert (>= (+ (* sc_29 0.01) of_29) 0.0001))
; 
; >=  {((sc.mm[0].Xtot*6800.)+of.mm[0].Xtot)} {3300.}
(assert (<= (+ (* sc_30 6800.) of_30) 3300.))
; 
; <=  {((sc.mm[0].Xtot*6800.)+of.mm[0].Xtot)} {0.0001}
(assert (>= (+ (* sc_30 6800.) of_30) 0.0001))
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_35 sc_34))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_35 of_34))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_34 0.) of_34) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_35 0.) of_35) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.V[7].X*6800.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_36 6800.) of_36) 3300.))
; 
; <=  {((sc.input.V[7].X*6800.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_36 6800.) of_36) 0.))
; 
; >=  {((sc.input.V[7].O*6800.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_37 6800.) of_37) 3300.))
; 
; <=  {((sc.input.V[7].O*6800.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_37 6800.) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.V[0].X*4400.)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_38 4400.) of_38) 3300.))
; 
; <=  {((sc.input.V[0].X*4400.)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_38 4400.) of_38) 0.))
; 
; >=  {((sc.input.V[0].O*4400.)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_39 4400.) of_39) 3300.))
; 
; <=  {((sc.input.V[0].O*4400.)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_39 4400.) of_39) 0.))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.V[6].X*0.01)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_40 0.01) of_40) 3300.))
; 
; <=  {((sc.input.V[6].X*0.01)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_40 0.01) of_40) 0.))
; 
; >=  {((sc.input.V[6].O*0.01)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_41 0.01) of_41) 3300.))
; 
; <=  {((sc.input.V[6].O*0.01)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_41 0.01) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_42 0.) of_42) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_43 0.) of_43) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_44 0.) of_44) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_45 0.) of_45) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.V[5].X*0.08)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_46 0.08) of_46) 3300.))
; 
; <=  {((sc.input.V[5].X*0.08)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_46 0.08) of_46) 0.))
; 
; >=  {((sc.input.V[5].O*0.08)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_47 0.08) of_47) 3300.))
; 
; <=  {((sc.input.V[5].O*0.08)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_47 0.08) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_48 0.) of_48) 3300.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_49 0.) of_49) 3300.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
; no offset
(assert (= of_51 0.))
; no offset
(assert (= of_50 0.))
; 
; =  {sc.itov[3].Y} {(sc.itov[3].K*sc.itov[3].X)}
(assert (= sc_52 (* sc_51 sc_50)))
; 
; =  {of.itov[3].Y} {0.}
(assert (= of_52 0.))
(declare-fun slbot_50_1 () Real)
(assert (<= slbot_50_1 1e-08))
(declare-fun sltop_50_1 () Real)
(assert (>= sltop_50_1 1e-08))
; 
; =  {(((sc.itov[3].X*0.)+of.itov[3].X)+sl.min.itov[3].X.1)} {0.0001}
(assert (= (+ (+ (* sc_50 0.) of_50) slbot_50_1) 0.0001))
; 
; =  {(((sc.itov[3].X*4400.)+of.itov[3].X)+sl.max.itov[3].X.1)} {10.}
(assert (= (+ (+ (* sc_50 4400.) of_50) sltop_50_1) 10.))
(declare-fun slbot_52_1 () Real)
(assert (<= slbot_52_1 1e-08))
(declare-fun sltop_52_1 () Real)
(assert (>= sltop_52_1 1e-08))
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52_1) 0.0001))
; 
; =  {(((sc.itov[3].Y*598400.)+of.itov[3].Y)+sl.max.itov[3].Y.1)} {3300.}
(assert (= (+ (+ (* sc_52 598400.) of_52) sltop_52_1) 3300.))
(declare-fun slbot_51_1 () Real)
(assert (<= slbot_51_1 1e-08))
(declare-fun sltop_51_1 () Real)
(assert (>= sltop_51_1 1e-08))
; 
; =  {(((sc.itov[3].K*0.)+of.itov[3].K)+sl.min.itov[3].K.1)} {1.}
(assert (= (+ (+ (* sc_51 0.) of_51) slbot_51_1) 1.))
; 
; =  {(((sc.itov[3].K*136.)+of.itov[3].K)+sl.max.itov[3].K.1)} {330.}
(assert (= (+ (+ (* sc_51 136.) of_51) sltop_51_1) 330.))
(declare-fun slbot_52_1 () Real)
(assert (<= slbot_52_1 1e-08))
(declare-fun sltop_52_1 () Real)
(assert (>= sltop_52_1 1e-08))
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52_1) 0.0001))
; 
; =  {(((sc.itov[3].Y*598400.)+of.itov[3].Y)+sl.max.itov[3].Y.1)} {3300.}
(assert (= (+ (+ (* sc_52 598400.) of_52) sltop_52_1) 3300.))
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; no offset
(assert (= of_54 0.))
; no offset
(assert (= of_53 0.))
; 
; =  {sc.itov[1].Y} {(sc.itov[1].K*sc.itov[1].X)}
(assert (= sc_55 (* sc_54 sc_53)))
; 
; =  {of.itov[1].Y} {0.}
(assert (= of_55 0.))
(declare-fun slbot_53_1 () Real)
(assert (<= slbot_53_1 1e-08))
(declare-fun sltop_53_1 () Real)
(assert (>= sltop_53_1 1e-08))
; 
; =  {(((sc.itov[1].X*0.)+of.itov[1].X)+sl.min.itov[1].X.1)} {0.0001}
(assert (= (+ (+ (* sc_53 0.) of_53) slbot_53_1) 0.0001))
; 
; =  {(((sc.itov[1].X*6800.)+of.itov[1].X)+sl.max.itov[1].X.1)} {10.}
(assert (= (+ (+ (* sc_53 6800.) of_53) sltop_53_1) 10.))
(declare-fun slbot_55_1 () Real)
(assert (<= slbot_55_1 1e-08))
(declare-fun sltop_55_1 () Real)
(assert (>= sltop_55_1 1e-08))
; 
; =  {(((sc.itov[1].Y*0.)+of.itov[1].Y)+sl.min.itov[1].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55_1) 0.0001))
; 
; =  {(((sc.itov[1].Y*544.)+of.itov[1].Y)+sl.max.itov[1].Y.1)} {3300.}
(assert (= (+ (+ (* sc_55 544.) of_55) sltop_55_1) 3300.))
; 
; >=  {((sc.itov[1].K*0.08)+of.itov[1].K)} {330.}
(assert (<= (+ (* sc_54 0.08) of_54) 330.))
; 
; <=  {((sc.itov[1].K*0.08)+of.itov[1].K)} {1.}
(assert (>= (+ (* sc_54 0.08) of_54) 1.))
(declare-fun slbot_55_1 () Real)
(assert (<= slbot_55_1 1e-08))
(declare-fun sltop_55_1 () Real)
(assert (>= sltop_55_1 1e-08))
; 
; =  {(((sc.itov[1].Y*0.)+of.itov[1].Y)+sl.min.itov[1].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55_1) 0.0001))
; 
; =  {(((sc.itov[1].Y*544.)+of.itov[1].Y)+sl.max.itov[1].Y.1)} {3300.}
(assert (= (+ (+ (* sc_55 544.) of_55) sltop_55_1) 3300.))
; 
; =  {sc.input.I[0].O} {sc.mm[0].kf}
(assert (= sc_1 sc_29))
; 
; =  {of.input.I[0].O} {of.mm[0].kf}
(assert (= of_1 of_29))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[2].X}
(assert (= sc_18 sc_4))
; 
; =  {of.vadd[2].OUT2} {of.output.V[2].X}
(assert (= of_18 of_4))
; 
; =  {sc.vadd[4].OUT} {sc.itov[3].K}
(assert (= sc_24 sc_51))
; 
; =  {of.vadd[4].OUT} {of.itov[3].K}
(assert (= of_24 of_51))
; 
; =  {sc.itov[1].Y} {sc.vadd[4].A}
(assert (= sc_55 sc_22))
; 
; =  {of.itov[1].Y} {of.vadd[4].A}
(assert (= of_55 of_22))
; 
; =  {sc.mm[0].Y} {sc.itov[3].X}
(assert (= sc_33 sc_50))
; 
; =  {of.mm[0].Y} {of.itov[3].X}
(assert (= of_33 of_50))
; 
; =  {sc.mm[0].Y} {sc.output.V[0].X}
(assert (= sc_33 sc_6))
; 
; =  {of.mm[0].Y} {of.output.V[0].X}
(assert (= of_33 of_6))
; 
; =  {sc.mm[0].X} {sc.output.V[1].X}
(assert (= sc_31 sc_10))
; 
; =  {of.mm[0].X} {of.output.V[1].X}
(assert (= of_31 of_10))
; 
; =  {sc.mm[0].X} {sc.itov[1].X}
(assert (= sc_31 sc_53))
; 
; =  {of.mm[0].X} {of.itov[1].X}
(assert (= of_31 of_53))
; 
; =  {sc.input.V[2].O} {sc.vadd[2].A}
(assert (= sc_35 sc_15))
; 
; =  {of.input.V[2].O} {of.vadd[2].A}
(assert (= of_35 of_15))
; 
; =  {sc.input.V[3].O} {sc.vadd[4].B}
(assert (= sc_43 sc_23))
; 
; =  {of.input.V[3].O} {of.vadd[4].B}
(assert (= of_43 of_23))
; 
; =  {sc.input.I[1].O} {sc.mm[0].kr}
(assert (= sc_3 sc_26))
; 
; =  {of.input.I[1].O} {of.mm[0].kr}
(assert (= of_3 of_26))
; 
; =  {sc.input.V[1].O} {sc.vadd[2].OUT2_0}
(assert (= sc_49 sc_12))
; 
; =  {of.input.V[1].O} {of.vadd[2].OUT2_0}
(assert (= of_49 of_12))
; 
; =  {sc.mm[0].XY} {sc.output.V[3].X}
(assert (= sc_32 sc_8))
; 
; =  {of.mm[0].XY} {of.output.V[3].X}
(assert (= of_32 of_8))
; 
; =  {sc.input.V[7].O} {sc.mm[0].Xtot}
(assert (= sc_37 sc_30))
; 
; =  {of.input.V[7].O} {of.mm[0].Xtot}
(assert (= of_37 of_30))
; 
; =  {sc.itov[3].Y} {sc.vadd[2].B}
(assert (= sc_52 sc_16))
; 
; =  {of.itov[3].Y} {of.vadd[2].B}
(assert (= of_52 of_16))
; 
; =  {sc.input.V[0].O} {sc.mm[0].Ytot}
(assert (= sc_39 sc_28))
; 
; =  {of.input.V[0].O} {of.mm[0].Ytot}
(assert (= of_39 of_28))
; 
; =  {sc.input.V[5].O} {sc.itov[1].K}
(assert (= sc_47 sc_54))
; 
; =  {of.input.V[5].O} {of.itov[1].K}
(assert (= of_47 of_54))
; 
; =  {sc.input.V[4].O} {sc.vadd[2].C}
(assert (= sc_45 sc_14))
; 
; =  {of.input.V[4].O} {of.vadd[2].C}
(assert (= of_45 of_14))
; 
; =  {sc.input.V[6].O} {sc.vadd[2].D}
(assert (= sc_41 sc_13))
; 
; =  {of.input.V[6].O} {of.vadd[2].D}
(assert (= of_41 of_13))
(assert (<= (* (/ 1. sc_5) 0.001) 0.1))
(assert (<= (* (/ 1. sc_9) 0.001) 0.1))
; 
; =  {sc.output.V[2].O} {sc.output.V[3].O} {sc.vadd[2].OUT2} {sc.mm[0].XY}
(assert (and (and (= sc_5 sc_9) (= sc_5 sc_18)) (= sc_5 sc_32)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_10_1 0.) sltop_10_1 (- sltop_10_1)) (ite (>= slbot_11_1 0.) slbot_11_1 (- slbot_11_1))) (ite (>= sltop_33_1 0.) sltop_33_1 (- sltop_33_1))) (ite (>= sltop_17_1 0.) sltop_17_1 (- sltop_17_1))) (ite (>= slbot_52_1 0.) slbot_52_1 (- slbot_52_1))) (ite (>= slbot_7_1 0.) slbot_7_1 (- slbot_7_1))) (ite (>= slbot_53_1 0.) slbot_53_1 (- slbot_53_1))) (ite (>= slbot_6_1 0.) slbot_6_1 (- slbot_6_1))) (ite (>= slbot_22_1 0.) slbot_22_1 (- slbot_22_1))) (ite (>= sltop_18_1 0.) sltop_18_1 (- sltop_18_1))) (ite (>= sltop_31_1 0.) sltop_31_1 (- sltop_31_1))) (ite (>= sltop_53_1 0.) sltop_53_1 (- sltop_53_1))) (ite (>= slbot_17_1 0.) slbot_17_1 (- slbot_17_1))) (ite (>= sltop_52_1 0.) sltop_52_1 (- sltop_52_1))) (ite (>= slbot_32_1 0.) slbot_32_1 (- slbot_32_1))) (ite (>= slbot_4_1 0.) slbot_4_1 (- slbot_4_1))) (ite (>= slbot_18_1 0.) slbot_18_1 (- slbot_18_1))) (ite (>= sltop_6_1 0.) sltop_6_1 (- sltop_6_1))) (ite (>= slbot_24_1 0.) slbot_24_1 (- slbot_24_1))) (ite (>= slbot_50_1 0.) slbot_50_1 (- slbot_50_1))) (ite (>= sltop_51_1 0.) sltop_51_1 (- sltop_51_1))) (ite (>= sltop_8_1 0.) sltop_8_1 (- sltop_8_1))) (ite (>= slbot_16_1 0.) slbot_16_1 (- slbot_16_1))) (ite (>= sltop_22_1 0.) sltop_22_1 (- sltop_22_1))) (ite (>= slbot_51_1 0.) slbot_51_1 (- slbot_51_1))) (ite (>= sltop_55_1 0.) sltop_55_1 (- sltop_55_1))) (ite (>= sltop_4_1 0.) sltop_4_1 (- sltop_4_1))) (ite (>= sltop_16_1 0.) sltop_16_1 (- sltop_16_1))) (ite (>= slbot_10_1 0.) slbot_10_1 (- slbot_10_1))) (ite (>= slbot_8_1 0.) slbot_8_1 (- slbot_8_1))) (ite (>= slbot_9_1 0.) slbot_9_1 (- slbot_9_1))) (ite (>= slbot_33_1 0.) slbot_33_1 (- slbot_33_1))) (ite (>= sltop_7_1 0.) sltop_7_1 (- sltop_7_1))) (ite (>= sltop_50_1 0.) sltop_50_1 (- sltop_50_1))) (ite (>= slbot_31_1 0.) slbot_31_1 (- slbot_31_1))) (ite (>= slbot_5_1 0.) slbot_5_1 (- slbot_5_1))) (ite (>= sltop_9_1 0.) sltop_9_1 (- sltop_9_1))) (ite (>= sltop_5_1 0.) sltop_5_1 (- sltop_5_1))) (ite (>= slbot_55_1 0.) slbot_55_1 (- slbot_55_1))) (ite (>= sltop_11_1 0.) sltop_11_1 (- sltop_11_1))) (ite (>= sltop_24_1 0.) sltop_24_1 (- sltop_24_1))) (ite (>= sltop_32_1 0.) sltop_32_1 (- sltop_32_1)))))
(check-sat)
