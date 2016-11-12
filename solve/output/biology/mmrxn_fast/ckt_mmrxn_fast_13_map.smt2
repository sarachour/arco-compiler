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
; >=  {((sc.input.I[0].X*50.464)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_0 50.464) of_0) 10.))
; 
; <=  {((sc.input.I[0].X*50.464)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_0 50.464) of_0) 0.))
; 
; >=  {((sc.input.I[0].O*50.464)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_1 50.464) of_1) 10.))
; 
; <=  {((sc.input.I[0].O*50.464)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_1 50.464) of_1) 0.))
(declare-fun sc_2 () Real)
(assert (> sc_2 1e-08))
(declare-fun of_2 () Real)
(declare-fun sc_3 () Real)
(assert (> sc_3 1e-08))
(declare-fun of_3 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_3 sc_2))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_3 of_2))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_2 1.) of_2) sltop_2) 3300.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_3 1.) of_3) sltop_3) 3300.))
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
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_5 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_6 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_8 0.))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_7 (* 1. sc_8)))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D)}
(assert (and (= sc_7 (* 1. sc_6)) (= sc_7 (* 1. sc_5))))
; no offset
(assert (= (- (+ of_7 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT} {(sc.vadd[8].A*1.)}
(assert (= sc_9 (* sc_7 1.)))
; 
; =  {of.vadd[8].OUT} {0.}
(assert (= of_9 0.))
; no scale
(assert (= sc_5 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_5 0.))
; no offset
(assert (= of_10 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_6 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_8 0.))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_7 (* 1. sc_8)))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D*sc.vadd[8].OUT2)}
(assert (and (= sc_7 (* 1. sc_6)) (= sc_7 (* (* 1. sc_5) sc_10))))
; no offset
(assert (= (- (+ of_7 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT2} {(sc.vadd[8].A*1.)}
(assert (= sc_10 (* sc_7 1.)))
; no offset
(assert (= of_10 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT2_0} {(sc.vadd[8].A*1.)}
(assert (= sc_4 (* sc_7 1.)))
; 
; =  {of.vadd[8].OUT2_0} {0.}
(assert (= of_4 0.))
; 
; >=  {((sc.vadd[8].OUT2_0*0.)+of.vadd[8].OUT2_0)} {3300.}
(assert (<= (+ (* sc_4 0.) of_4) 3300.))
; 
; <=  {((sc.vadd[8].OUT2_0*0.)+of.vadd[8].OUT2_0)} {0.}
(assert (>= (+ (* sc_4 0.) of_4) 0.))
; 
; >=  {((sc.vadd[8].D*0.)+of.vadd[8].D)} {3300.}
(assert (<= (+ (* sc_5 0.) of_5) 3300.))
; 
; <=  {((sc.vadd[8].D*0.)+of.vadd[8].D)} {0.}
(assert (>= (+ (* sc_5 0.) of_5) 0.))
; 
; >=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {3300.}
(assert (<= (+ (* sc_6 0.) of_6) 3300.))
; 
; <=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {0.}
(assert (>= (+ (* sc_6 0.) of_6) 0.))
; 
; >=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {3300.}
(assert (<= (+ (* sc_7 0.) of_7) 3300.))
; 
; <=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {0.}
(assert (>= (+ (* sc_7 0.) of_7) 0.))
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2)} {0.}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10) 0.))
; 
; =  {(((sc.vadd[8].OUT2*1.)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2)} {3300.}
(assert (= (+ (+ (* sc_10 1.) of_10) sltop_10) 3300.))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.vadd[8].B*0.)+of.vadd[8].B)+sl.min.vadd[8].B)} {0.}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 0.))
; 
; =  {(((sc.vadd[8].B*0.84)+of.vadd[8].B)+sl.max.vadd[8].B)} {3300.}
(assert (= (+ (+ (* sc_8 0.84) of_8) sltop_8) 3300.))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.vadd[8].OUT*0.)+of.vadd[8].OUT)+sl.min.vadd[8].OUT)} {-1650.}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9) -1650.))
; 
; =  {(((sc.vadd[8].OUT*0.84)+of.vadd[8].OUT)+sl.max.vadd[8].OUT)} {1650.}
(assert (= (+ (+ (* sc_9 0.84) of_9) sltop_9) 1650.))
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2)} {0.}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10) 0.))
; 
; =  {(((sc.vadd[8].OUT2*1.)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2)} {3300.}
(assert (= (+ (+ (* sc_10 1.) of_10) sltop_10) 3300.))
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
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_12 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_13 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_15 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_14 (* 1. sc_15)))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D)}
(assert (and (= sc_14 (* 1. sc_13)) (= sc_14 (* 1. sc_12))))
; no offset
(assert (= (- (+ of_14 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT} {(sc.vadd[10].A*1.)}
(assert (= sc_16 (* sc_14 1.)))
; 
; =  {of.vadd[10].OUT} {0.}
(assert (= of_16 0.))
; no scale
(assert (= sc_12 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_12 0.))
; no offset
(assert (= of_17 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_13 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_15 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_14 (* 1. sc_15)))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D*sc.vadd[10].OUT2)}
(assert (and (= sc_14 (* 1. sc_13)) (= sc_14 (* (* 1. sc_12) sc_17))))
; no offset
(assert (= (- (+ of_14 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT2} {(sc.vadd[10].A*1.)}
(assert (= sc_17 (* sc_14 1.)))
; no offset
(assert (= of_17 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT2_0} {(sc.vadd[10].A*1.)}
(assert (= sc_11 (* sc_14 1.)))
; 
; =  {of.vadd[10].OUT2_0} {0.}
(assert (= of_11 0.))
; 
; >=  {((sc.vadd[10].OUT2_0*0.256)+of.vadd[10].OUT2_0)} {3300.}
(assert (<= (+ (* sc_11 0.256) of_11) 3300.))
; 
; <=  {((sc.vadd[10].OUT2_0*0.256)+of.vadd[10].OUT2_0)} {0.}
(assert (>= (+ (* sc_11 0.256) of_11) 0.))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.vadd[10].D*0.)+of.vadd[10].D)+sl.min.vadd[10].D)} {0.}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.))
; 
; =  {(((sc.vadd[10].D*12.616)+of.vadd[10].D)+sl.max.vadd[10].D)} {3300.}
(assert (= (+ (+ (* sc_12 12.616) of_12) sltop_12) 3300.))
; 
; >=  {((sc.vadd[10].C*0.)+of.vadd[10].C)} {3300.}
(assert (<= (+ (* sc_13 0.) of_13) 3300.))
; 
; <=  {((sc.vadd[10].C*0.)+of.vadd[10].C)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
; 
; >=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {3300.}
(assert (<= (+ (* sc_14 0.) of_14) 3300.))
; 
; <=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2)} {0.}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 0.))
; 
; =  {(((sc.vadd[10].OUT2*1.)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2)} {3300.}
(assert (= (+ (+ (* sc_17 1.) of_17) sltop_17) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.vadd[10].B*0.)+of.vadd[10].B)+sl.min.vadd[10].B)} {0.}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.))
; 
; =  {(((sc.vadd[10].B*9.26)+of.vadd[10].B)+sl.max.vadd[10].B)} {3300.}
(assert (= (+ (+ (* sc_15 9.26) of_15) sltop_15) 3300.))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.vadd[10].OUT*0.)+of.vadd[10].OUT)+sl.min.vadd[10].OUT)} {-1650.}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) -1650.))
; 
; =  {(((sc.vadd[10].OUT*12.616)+of.vadd[10].OUT)+sl.max.vadd[10].OUT)} {1650.}
(assert (= (+ (+ (* sc_16 12.616) of_16) sltop_16) 1650.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2)} {0.}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 0.))
; 
; =  {(((sc.vadd[10].OUT2*1.)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2)} {3300.}
(assert (= (+ (+ (* sc_17 1.) of_17) sltop_17) 3300.))
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
(assert (= of_22 0.))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_21 (* 1. sc_22)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D)}
(assert (and (= sc_21 (* 1. sc_20)) (= sc_21 (* 1. sc_19))))
; no offset
(assert (= (- (+ of_21 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1.)}
(assert (= sc_23 (* sc_21 1.)))
; 
; =  {of.vadd[6].OUT} {0.}
(assert (= of_23 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_22 0.))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_21 (* 1. sc_22)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D*sc.vadd[6].OUT2)}
(assert (and (= sc_21 (* 1. sc_20)) (= sc_21 (* (* 1. sc_19) sc_24))))
; no offset
(assert (= (- (+ of_21 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1.)}
(assert (= sc_24 (* sc_21 1.)))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1.)}
(assert (= sc_18 (* sc_21 1.)))
; 
; =  {of.vadd[6].OUT2_0} {0.}
(assert (= of_18 0.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {0.}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) 0.))
; 
; =  {(((sc.vadd[6].OUT*12.616)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1650.}
(assert (= (+ (+ (* sc_23 12.616) of_23) sltop_23) 1650.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.vadd[6].A*0.)+of.vadd[6].A)+sl.min.vadd[6].A)} {0.}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) 0.))
; 
; =  {(((sc.vadd[6].A*50.464)+of.vadd[6].A)+sl.max.vadd[6].A)} {3300.}
(assert (= (+ (+ (* sc_21 50.464) of_21) sltop_21) 3300.))
; 
; >=  {((sc.vadd[6].B*0.)+of.vadd[6].B)} {3300.}
(assert (<= (+ (* sc_22 0.) of_22) 3300.))
; 
; <=  {((sc.vadd[6].B*0.)+of.vadd[6].B)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {0.}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) 0.))
; 
; =  {(((sc.vadd[6].OUT*12.616)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1650.}
(assert (= (+ (+ (* sc_23 12.616) of_23) sltop_23) 1650.))
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
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_28 (* 1. sc_29)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D)}
(assert (and (= sc_28 (* 1. sc_27)) (= sc_28 (* 1. sc_26))))
; no offset
(assert (= (- (+ of_28 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1.)}
(assert (= sc_30 (* sc_28 1.)))
; 
; =  {of.vadd[4].OUT} {0.}
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
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_28 (* 1. sc_29)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D*sc.vadd[4].OUT2)}
(assert (and (= sc_28 (* 1. sc_27)) (= sc_28 (* (* 1. sc_26) sc_31))))
; no offset
(assert (= (- (+ of_28 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1.)}
(assert (= sc_31 (* sc_28 1.)))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1.)}
(assert (= sc_25 (* sc_28 1.)))
; 
; =  {of.vadd[4].OUT2_0} {0.}
(assert (= of_25 0.))
; 
; >=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_25 0.) of_25) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
; 
; >=  {((sc.vadd[4].D*10.1)+of.vadd[4].D)} {3300.}
(assert (<= (+ (* sc_26 10.1) of_26) 3300.))
; 
; <=  {((sc.vadd[4].D*10.1)+of.vadd[4].D)} {0.}
(assert (>= (+ (* sc_26 10.1) of_26) 0.))
; 
; >=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {3300.}
(assert (<= (+ (* sc_27 0.) of_27) 3300.))
; 
; <=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_28 0.) of_28) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {3300.}
(assert (= (+ (+ (* sc_31 1.) of_31) sltop_31) 3300.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[4].B*0.)+of.vadd[4].B)+sl.min.vadd[4].B)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.))
; 
; =  {(((sc.vadd[4].B*12.616)+of.vadd[4].B)+sl.max.vadd[4].B)} {3300.}
(assert (= (+ (+ (* sc_29 12.616) of_29) sltop_29) 3300.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT)} {-1650.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) -1650.))
; 
; =  {(((sc.vadd[4].OUT*12.616)+of.vadd[4].OUT)+sl.max.vadd[4].OUT)} {1650.}
(assert (= (+ (+ (* sc_30 12.616) of_30) sltop_30) 1650.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {3300.}
(assert (= (+ (+ (* sc_31 1.) of_31) sltop_31) 3300.))
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
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_35 (* 1. sc_36)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_35 (* 1. sc_34)) (= sc_35 (* 1. sc_33))))
; no offset
(assert (= (- (+ of_35 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_37 (* sc_35 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
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
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_35 (* 1. sc_36)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_35 (* 1. sc_34)) (= sc_35 (* (* 1. sc_33) sc_38))))
; no offset
(assert (= (- (+ of_35 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_38 (* sc_35 1.)))
; no offset
(assert (= of_38 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_32 (* sc_35 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_32 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_32 0.124) of_32) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_32 0.124) of_32) 0.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[1].D*0.)+of.vadd[1].D)+sl.min.vadd[1].D)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[1].D*12.616)+of.vadd[1].D)+sl.max.vadd[1].D)} {3300.}
(assert (= (+ (+ (* sc_33 12.616) of_33) sltop_33) 3300.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_34 0.) of_34) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_35 0.) of_35) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_38 1.) of_38) sltop_38) 3300.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.))
; 
; =  {(((sc.vadd[1].B*10.1)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_36 10.1) of_36) sltop_36) 3300.))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) -1650.))
; 
; =  {(((sc.vadd[1].OUT*12.616)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_37 12.616) of_37) sltop_37) 1650.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_38 1.) of_38) sltop_38) 3300.))
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_40 of_39))
; 
; >=  {((sc.input.V[2].X*9.26)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_39 9.26) of_39) 3300.))
; 
; <=  {((sc.input.V[2].X*9.26)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_39 9.26) of_39) 0.))
; 
; >=  {((sc.input.V[2].O*9.26)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_40 9.26) of_40) 3300.))
; 
; <=  {((sc.input.V[2].O*9.26)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_40 9.26) of_40) 0.))
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_42 of_41))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_41 0.) of_41) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_42 0.) of_42) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_44 of_43))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_43 0.) of_43) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_44 0.) of_44) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_46 of_45))
; 
; >=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_45 0.) of_45) 3300.))
; 
; <=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
; 
; >=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_46 0.) of_46) 3300.))
; 
; <=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_48 of_47))
; 
; >=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_47 0.) of_47) 3300.))
; 
; <=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
; 
; >=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_48 0.) of_48) 3300.))
; 
; <=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_50 sc_49))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_50 of_49))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_49 0.) of_49) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_50 0.) of_50) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_52 sc_51))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_52 of_51))
; 
; >=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_51 10.1) of_51) 3300.))
; 
; <=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_51 10.1) of_51) 0.))
; 
; >=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_52 10.1) of_52) 3300.))
; 
; <=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_52 10.1) of_52) 0.))
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_54 sc_53))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_54 of_53))
; 
; >=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_53 0.) of_53) 3300.))
; 
; <=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
; 
; >=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_54 0.) of_54) 3300.))
; 
; <=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_56 sc_55))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_56 of_55))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_55 0.) of_55) 3300.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_56 0.) of_56) 3300.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_58 sc_57))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_58 of_57))
; 
; >=  {((sc.input.V[15].X*12.616)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_57 12.616) of_57) 3300.))
; 
; <=  {((sc.input.V[15].X*12.616)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_57 12.616) of_57) 0.))
; 
; >=  {((sc.input.V[15].O*12.616)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_58 12.616) of_58) 3300.))
; 
; <=  {((sc.input.V[15].O*12.616)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_58 12.616) of_58) 0.))
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_60 sc_59))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_60 of_59))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_59 0.) of_59) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_62 sc_61))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_62 of_61))
; 
; >=  {((sc.input.V[14].X*0.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_61 0.) of_61) 3300.))
; 
; <=  {((sc.input.V[14].X*0.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
; 
; >=  {((sc.input.V[14].O*0.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_62 0.) of_62) 3300.))
; 
; <=  {((sc.input.V[14].O*0.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.V[16].X*12.616)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_63 12.616) of_63) 3300.))
; 
; <=  {((sc.input.V[16].X*12.616)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_63 12.616) of_63) 0.))
; 
; >=  {((sc.input.V[16].O*12.616)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_64 12.616) of_64) 3300.))
; 
; <=  {((sc.input.V[16].O*12.616)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_64 12.616) of_64) 0.))
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_65 0.) of_65) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_66 0.) of_66) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_68 of_67))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_67 0.) of_67) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_68 0.) of_68) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_70 of_69))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_69 0.) of_69) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_70 0.) of_70) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.V[1].X*10.1)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_71 10.1) of_71) 3300.))
; 
; <=  {((sc.input.V[1].X*10.1)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_71 10.1) of_71) 0.))
; 
; >=  {((sc.input.V[1].O*10.1)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_72 10.1) of_72) 3300.))
; 
; <=  {((sc.input.V[1].O*10.1)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_72 10.1) of_72) 0.))
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.V[17].X*0.256)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_73 0.256) of_73) 3300.))
; 
; <=  {((sc.input.V[17].X*0.256)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_73 0.256) of_73) 0.))
; 
; >=  {((sc.input.V[17].O*0.256)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_74 0.256) of_74) 3300.))
; 
; <=  {((sc.input.V[17].O*0.256)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_74 0.256) of_74) 0.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.V[18].X*0.124)+of.input.V[18].X)} {3300.}
(assert (<= (+ (* sc_75 0.124) of_75) 3300.))
; 
; <=  {((sc.input.V[18].X*0.124)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_75 0.124) of_75) 0.))
; 
; >=  {((sc.input.V[18].O*0.124)+of.input.V[18].O)} {3300.}
(assert (<= (+ (* sc_76 0.124) of_76) 3300.))
; 
; <=  {((sc.input.V[18].O*0.124)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_76 0.124) of_76) 0.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; 
; =  {sc.input.V[19].O} {sc.input.V[19].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.V[19].O} {of.input.V[19].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.V[19].X*0.84)+of.input.V[19].X)} {3300.}
(assert (<= (+ (* sc_77 0.84) of_77) 3300.))
; 
; <=  {((sc.input.V[19].X*0.84)+of.input.V[19].X)} {0.}
(assert (>= (+ (* sc_77 0.84) of_77) 0.))
; 
; >=  {((sc.input.V[19].O*0.84)+of.input.V[19].O)} {3300.}
(assert (<= (+ (* sc_78 0.84) of_78) 3300.))
; 
; <=  {((sc.input.V[19].O*0.84)+of.input.V[19].O)} {0.}
(assert (>= (+ (* sc_78 0.84) of_78) 0.))
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
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X)} {0.0001}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79) 0.0001))
; 
; =  {(((sc.itov[2].X*1.)+of.itov[2].X)+sl.max.itov[2].X)} {10.}
(assert (= (+ (+ (* sc_79 1.) of_79) sltop_79) 10.))
(declare-fun slbot_81 () Real)
(declare-fun sltop_81 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_81 0.) of_81) slbot_81) 0.0001))
; 
; =  {(((sc.itov[2].Y*12.616)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_81 12.616) of_81) sltop_81) 3300.))
; 
; >=  {((sc.itov[2].K*12.616)+of.itov[2].K)} {330.}
(assert (<= (+ (* sc_80 12.616) of_80) 330.))
; 
; <=  {((sc.itov[2].K*12.616)+of.itov[2].K)} {1.}
(assert (>= (+ (* sc_80 12.616) of_80) 1.))
(declare-fun slbot_81 () Real)
(declare-fun sltop_81 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_81 0.) of_81) slbot_81) 0.0001))
; 
; =  {(((sc.itov[2].Y*12.616)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_81 12.616) of_81) sltop_81) 3300.))
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
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_84 (* sc_83 sc_82)))
; 
; =  {of.itov[7].Y} {0.}
(assert (= of_84 0.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.itov[7].X*0.)+of.itov[7].X)+sl.min.itov[7].X)} {0.0001}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) 0.0001))
; 
; =  {(((sc.itov[7].X*1.)+of.itov[7].X)+sl.max.itov[7].X)} {10.}
(assert (= (+ (+ (* sc_82 1.) of_82) sltop_82) 10.))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84) 0.0001))
; 
; =  {(((sc.itov[7].Y*0.84)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_84 0.84) of_84) sltop_84) 3300.))
; 
; >=  {((sc.itov[7].K*0.84)+of.itov[7].K)} {330.}
(assert (<= (+ (* sc_83 0.84) of_83) 330.))
; 
; <=  {((sc.itov[7].K*0.84)+of.itov[7].K)} {1.}
(assert (>= (+ (* sc_83 0.84) of_83) 1.))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84) 0.0001))
; 
; =  {(((sc.itov[7].Y*0.84)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_84 0.84) of_84) sltop_84) 3300.))
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
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_87 (* sc_86 sc_85)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_87 0.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.itov[9].X*0.)+of.itov[9].X)+sl.min.itov[9].X)} {0.0001}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 0.0001))
; 
; =  {(((sc.itov[9].X*1.)+of.itov[9].X)+sl.max.itov[9].X)} {10.}
(assert (= (+ (+ (* sc_85 1.) of_85) sltop_85) 10.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 0.0001))
; 
; =  {(((sc.itov[9].Y*9.26)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_87 9.26) of_87) sltop_87) 3300.))
; 
; >=  {((sc.itov[9].K*9.26)+of.itov[9].K)} {330.}
(assert (<= (+ (* sc_86 9.26) of_86) 330.))
; 
; <=  {((sc.itov[9].K*9.26)+of.itov[9].K)} {1.}
(assert (>= (+ (* sc_86 9.26) of_86) 1.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 0.0001))
; 
; =  {(((sc.itov[9].Y*9.26)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_87 9.26) of_87) sltop_87) 3300.))
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
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_90 (* sc_89 sc_88)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_90 0.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.itov[0].X*0.)+of.itov[0].X)+sl.min.itov[0].X)} {0.0001}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.0001))
; 
; =  {(((sc.itov[0].X*1.)+of.itov[0].X)+sl.max.itov[0].X)} {10.}
(assert (= (+ (+ (* sc_88 1.) of_88) sltop_88) 10.))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90) 0.0001))
; 
; =  {(((sc.itov[0].Y*10.1)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_90 10.1) of_90) sltop_90) 3300.))
; 
; >=  {((sc.itov[0].K*10.1)+of.itov[0].K)} {330.}
(assert (<= (+ (* sc_89 10.1) of_89) 330.))
; 
; <=  {((sc.itov[0].K*10.1)+of.itov[0].K)} {1.}
(assert (>= (+ (* sc_89 10.1) of_89) 1.))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90) 0.0001))
; 
; =  {(((sc.itov[0].Y*10.1)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_90 10.1) of_90) sltop_90) 3300.))
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
; =  {sc.itov[11].Y} {(sc.itov[11].K*sc.itov[11].X)}
(assert (= sc_93 (* sc_92 sc_91)))
; 
; =  {of.itov[11].Y} {0.}
(assert (= of_93 0.))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.itov[11].X*0.)+of.itov[11].X)+sl.min.itov[11].X)} {0.0001}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91) 0.0001))
; 
; =  {(((sc.itov[11].X*1.)+of.itov[11].X)+sl.max.itov[11].X)} {10.}
(assert (= (+ (+ (* sc_91 1.) of_91) sltop_91) 10.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 0.0001))
; 
; =  {(((sc.itov[11].Y*12.616)+of.itov[11].Y)+sl.max.itov[11].Y)} {3300.}
(assert (= (+ (+ (* sc_93 12.616) of_93) sltop_93) 3300.))
; 
; >=  {((sc.itov[11].K*12.616)+of.itov[11].K)} {330.}
(assert (<= (+ (* sc_92 12.616) of_92) 330.))
; 
; <=  {((sc.itov[11].K*12.616)+of.itov[11].K)} {1.}
(assert (>= (+ (* sc_92 12.616) of_92) 1.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 0.0001))
; 
; =  {(((sc.itov[11].Y*12.616)+of.itov[11].Y)+sl.max.itov[11].Y)} {3300.}
(assert (= (+ (+ (* sc_93 12.616) of_93) sltop_93) 3300.))
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
; >=  {((sc.itov[3].X*50.464)+of.itov[3].X)} {10.}
(assert (<= (+ (* sc_94 50.464) of_94) 10.))
; 
; <=  {((sc.itov[3].X*50.464)+of.itov[3].X)} {0.0001}
(assert (>= (+ (* sc_94 50.464) of_94) 0.0001))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96) 0.0001))
; 
; =  {(((sc.itov[3].Y*50.464)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_96 50.464) of_96) sltop_96) 3300.))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.itov[3].K*0.)+of.itov[3].K)+sl.min.itov[3].K)} {1.}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95) 1.))
; 
; =  {(((sc.itov[3].K*1.)+of.itov[3].K)+sl.max.itov[3].K)} {330.}
(assert (= (+ (+ (* sc_95 1.) of_95) sltop_95) 330.))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96) 0.0001))
; 
; =  {(((sc.itov[3].Y*50.464)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_96 50.464) of_96) sltop_96) 3300.))
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
(declare-fun slbot_97 () Real)
(declare-fun sltop_97 () Real)
; 
; =  {(((sc.itov[5].X*0.)+of.itov[5].X)+sl.min.itov[5].X)} {0.0001}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97) 0.0001))
; 
; =  {(((sc.itov[5].X*1.)+of.itov[5].X)+sl.max.itov[5].X)} {10.}
(assert (= (+ (+ (* sc_97 1.) of_97) sltop_97) 10.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.0001))
; 
; =  {(((sc.itov[5].Y*12.616)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_99 12.616) of_99) sltop_99) 3300.))
(declare-fun slbot_98 () Real)
(declare-fun sltop_98 () Real)
; 
; =  {(((sc.itov[5].K*0.)+of.itov[5].K)+sl.min.itov[5].K)} {1.}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98) 1.))
; 
; =  {(((sc.itov[5].K*12.616)+of.itov[5].K)+sl.max.itov[5].K)} {330.}
(assert (= (+ (+ (* sc_98 12.616) of_98) sltop_98) 330.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.0001))
; 
; =  {(((sc.itov[5].Y*12.616)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_99 12.616) of_99) sltop_99) 3300.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].D}
(assert (= sc_81 sc_33))
; 
; =  {of.itov[2].Y} {of.vadd[1].D}
(assert (= of_81 of_33))
; 
; =  {sc.input.V[17].O} {sc.vadd[10].OUT2_0}
(assert (= sc_74 sc_11))
; 
; =  {of.input.V[17].O} {of.vadd[10].OUT2_0}
(assert (= of_74 of_11))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[0].X}
(assert (= sc_31 sc_88))
; 
; =  {of.vadd[4].OUT2} {of.itov[0].X}
(assert (= of_31 of_88))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[7].X}
(assert (= sc_31 sc_82))
; 
; =  {of.vadd[4].OUT2} {of.itov[7].X}
(assert (= of_31 of_82))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[9].X}
(assert (= sc_31 sc_85))
; 
; =  {of.vadd[4].OUT2} {of.itov[9].X}
(assert (= of_31 of_85))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[3].K}
(assert (= sc_38 sc_95))
; 
; =  {of.vadd[1].OUT2} {of.itov[3].K}
(assert (= of_38 of_95))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[11].X}
(assert (= sc_38 sc_91))
; 
; =  {of.vadd[1].OUT2} {of.itov[11].X}
(assert (= of_38 of_91))
; 
; =  {sc.input.I[0].O} {sc.itov[3].X}
(assert (= sc_1 sc_94))
; 
; =  {of.input.I[0].O} {of.itov[3].X}
(assert (= of_1 of_94))
; 
; =  {sc.input.V[9].O} {sc.vadd[8].OUT2_0}
(assert (= sc_50 sc_4))
; 
; =  {of.input.V[9].O} {of.vadd[8].OUT2_0}
(assert (= of_50 of_4))
; 
; =  {sc.itov[11].Y} {sc.vadd[10].D}
(assert (= sc_93 sc_12))
; 
; =  {of.itov[11].Y} {of.vadd[10].D}
(assert (= of_93 of_12))
; 
; =  {sc.input.V[15].O} {sc.itov[11].K}
(assert (= sc_58 sc_92))
; 
; =  {of.input.V[15].O} {of.itov[11].K}
(assert (= of_58 of_92))
; 
; =  {sc.input.V[13].O} {sc.vadd[10].C}
(assert (= sc_46 sc_13))
; 
; =  {of.input.V[13].O} {of.vadd[10].C}
(assert (= of_46 of_13))
; 
; =  {sc.input.V[14].O} {sc.vadd[10].A}
(assert (= sc_62 sc_14))
; 
; =  {of.input.V[14].O} {of.vadd[10].A}
(assert (= of_62 of_14))
; 
; =  {sc.input.V[11].O} {sc.vadd[8].C}
(assert (= sc_54 sc_6))
; 
; =  {of.input.V[11].O} {of.vadd[8].C}
(assert (= of_54 of_6))
; 
; =  {sc.itov[5].Y} {sc.vadd[4].B}
(assert (= sc_99 sc_29))
; 
; =  {of.itov[5].Y} {of.vadd[4].B}
(assert (= of_99 of_29))
; 
; =  {sc.input.V[8].O} {sc.vadd[6].B}
(assert (= sc_42 sc_22))
; 
; =  {of.input.V[8].O} {of.vadd[6].B}
(assert (= of_42 of_22))
; 
; =  {sc.input.V[12].O} {sc.vadd[8].D}
(assert (= sc_48 sc_5))
; 
; =  {of.input.V[12].O} {of.vadd[8].D}
(assert (= of_48 of_5))
; 
; =  {sc.input.V[2].O} {sc.itov[9].K}
(assert (= sc_40 sc_86))
; 
; =  {of.input.V[2].O} {of.itov[9].K}
(assert (= of_40 of_86))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].C}
(assert (= sc_66 sc_34))
; 
; =  {of.input.V[3].O} {of.vadd[1].C}
(assert (= of_66 of_34))
; 
; =  {sc.itov[7].Y} {sc.vadd[8].B}
(assert (= sc_84 sc_8))
; 
; =  {of.itov[7].Y} {of.vadd[8].B}
(assert (= of_84 of_8))
; 
; =  {sc.input.V[19].O} {sc.itov[7].K}
(assert (= sc_78 sc_83))
; 
; =  {of.input.V[19].O} {of.itov[7].K}
(assert (= of_78 of_83))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_90 sc_36))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_90 of_36))
; 
; =  {sc.vadd[6].OUT} {sc.itov[5].K}
(assert (= sc_23 sc_98))
; 
; =  {of.vadd[6].OUT} {of.itov[5].K}
(assert (= of_23 of_98))
; 
; =  {sc.input.V[1].O} {sc.itov[0].K}
(assert (= sc_72 sc_89))
; 
; =  {of.input.V[1].O} {of.itov[0].K}
(assert (= of_72 of_89))
; 
; =  {sc.vadd[10].OUT2} {sc.itov[2].X}
(assert (= sc_17 sc_79))
; 
; =  {of.vadd[10].OUT2} {of.itov[2].X}
(assert (= of_17 of_79))
; 
; =  {sc.vadd[10].OUT2} {sc.itov[5].X}
(assert (= sc_17 sc_97))
; 
; =  {of.vadd[10].OUT2} {of.itov[5].X}
(assert (= of_17 of_97))
; 
; =  {sc.input.V[7].O} {sc.vadd[4].C}
(assert (= sc_44 sc_27))
; 
; =  {of.input.V[7].O} {of.vadd[4].C}
(assert (= of_44 of_27))
; 
; =  {sc.vadd[8].OUT2} {sc.output.V[0].X}
(assert (= sc_10 sc_2))
; 
; =  {of.vadd[8].OUT2} {of.output.V[0].X}
(assert (= of_10 of_2))
; 
; =  {sc.itov[3].Y} {sc.vadd[6].A}
(assert (= sc_96 sc_21))
; 
; =  {of.itov[3].Y} {of.vadd[6].A}
(assert (= of_96 of_21))
; 
; =  {sc.input.V[10].O} {sc.vadd[8].A}
(assert (= sc_56 sc_7))
; 
; =  {of.input.V[10].O} {of.vadd[8].A}
(assert (= of_56 of_7))
; 
; =  {sc.input.V[0].O} {sc.vadd[4].D}
(assert (= sc_52 sc_26))
; 
; =  {of.input.V[0].O} {of.vadd[4].D}
(assert (= of_52 of_26))
; 
; =  {sc.input.V[18].O} {sc.vadd[1].OUT2_0}
(assert (= sc_76 sc_32))
; 
; =  {of.input.V[18].O} {of.vadd[1].OUT2_0}
(assert (= of_76 of_32))
; 
; =  {sc.input.V[16].O} {sc.itov[2].K}
(assert (= sc_64 sc_80))
; 
; =  {of.input.V[16].O} {of.itov[2].K}
(assert (= of_64 of_80))
; 
; =  {sc.itov[9].Y} {sc.vadd[10].B}
(assert (= sc_87 sc_15))
; 
; =  {of.itov[9].Y} {of.vadd[10].B}
(assert (= of_87 of_15))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].A}
(assert (= sc_68 sc_35))
; 
; =  {of.input.V[4].O} {of.vadd[1].A}
(assert (= of_68 of_35))
; 
; =  {sc.input.V[5].O} {sc.vadd[4].OUT2_0}
(assert (= sc_70 sc_25))
; 
; =  {of.input.V[5].O} {of.vadd[4].OUT2_0}
(assert (= of_70 of_25))
; 
; =  {sc.input.V[6].O} {sc.vadd[4].A}
(assert (= sc_60 sc_28))
; 
; =  {of.input.V[6].O} {of.vadd[4].A}
(assert (= of_60 of_28))
(assert (<= (* sc_3 0.001) 0.1))
; 
; =  {sc.vadd[8].OUT2} {sc.output.V[0].O} {sc.vadd[10].OUT2} {sc.vadd[1].OUT2} {sc.vadd[4].OUT2}
(assert (and (and (and (= sc_10 sc_3) (= sc_10 sc_17)) (= sc_10 sc_38)) (= sc_10 sc_31)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_36 0.) sltop_36 (- sltop_36)) (ite (>= sltop_96 0.) sltop_96 (- sltop_96))) (ite (>= sltop_87 0.) sltop_87 (- sltop_87))) (ite (>= slbot_16 0.) slbot_16 (- slbot_16))) (ite (>= sltop_91 0.) sltop_91 (- sltop_91))) (ite (>= slbot_10 0.) slbot_10 (- slbot_10))) (ite (>= sltop_90 0.) sltop_90 (- sltop_90))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_84 0.) slbot_84 (- slbot_84))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= sltop_10 0.) sltop_10 (- sltop_10))) (ite (>= slbot_36 0.) slbot_36 (- slbot_36))) (ite (>= sltop_82 0.) sltop_82 (- sltop_82))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= slbot_96 0.) slbot_96 (- slbot_96))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= sltop_31 0.) sltop_31 (- sltop_31))) (ite (>= slbot_95 0.) slbot_95 (- slbot_95))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= slbot_81 0.) slbot_81 (- slbot_81))) (ite (>= slbot_91 0.) slbot_91 (- slbot_91))) (ite (>= slbot_98 0.) slbot_98 (- slbot_98))) (ite (>= slbot_87 0.) slbot_87 (- slbot_87))) (ite (>= slbot_38 0.) slbot_38 (- slbot_38))) (ite (>= slbot_23 0.) slbot_23 (- slbot_23))) (ite (>= sltop_17 0.) sltop_17 (- sltop_17))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_84 0.) sltop_84 (- sltop_84))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= slbot_29 0.) slbot_29 (- slbot_29))) (ite (>= sltop_23 0.) sltop_23 (- sltop_23))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= sltop_81 0.) sltop_81 (- sltop_81))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= slbot_37 0.) slbot_37 (- slbot_37))) (ite (>= sltop_38 0.) sltop_38 (- sltop_38))) (ite (>= slbot_17 0.) slbot_17 (- slbot_17))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= sltop_29 0.) sltop_29 (- sltop_29))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_31 0.) slbot_31 (- slbot_31))) (ite (>= slbot_90 0.) slbot_90 (- slbot_90))) (ite (>= slbot_82 0.) slbot_82 (- slbot_82))) (ite (>= sltop_98 0.) sltop_98 (- sltop_98))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= sltop_16 0.) sltop_16 (- sltop_16))) (ite (>= slbot_21 0.) slbot_21 (- slbot_21))) (ite (>= sltop_95 0.) sltop_95 (- sltop_95))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= slbot_30 0.) slbot_30 (- slbot_30))) (ite (>= sltop_97 0.) sltop_97 (- sltop_97))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= sltop_30 0.) sltop_30 (- sltop_30))) (ite (>= sltop_37 0.) sltop_37 (- sltop_37))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_33 0.) slbot_33 (- slbot_33))) (ite (>= sltop_33 0.) sltop_33 (- sltop_33))) (ite (>= slbot_97 0.) slbot_97 (- slbot_97))) (ite (>= sltop_21 0.) sltop_21 (- sltop_21)))))
(check-sat)
