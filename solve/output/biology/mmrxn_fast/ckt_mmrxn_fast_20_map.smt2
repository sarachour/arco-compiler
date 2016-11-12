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
; >=  {((sc.input.I[2].X*0.84)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_0 0.84) of_0) 10.))
; 
; <=  {((sc.input.I[2].X*0.84)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_0 0.84) of_0) 0.))
; 
; >=  {((sc.input.I[2].O*0.84)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_1 0.84) of_1) 10.))
; 
; <=  {((sc.input.I[2].O*0.84)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_1 0.84) of_1) 0.))
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
; >=  {((sc.input.I[0].X*50.464)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_2 50.464) of_2) 10.))
; 
; <=  {((sc.input.I[0].X*50.464)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_2 50.464) of_2) 0.))
; 
; >=  {((sc.input.I[0].O*50.464)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_3 50.464) of_3) 10.))
; 
; <=  {((sc.input.I[0].O*50.464)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_3 50.464) of_3) 0.))
(declare-fun sc_4 () Real)
(assert (> sc_4 1e-08))
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(assert (> sc_5 1e-08))
(declare-fun of_5 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_5 sc_4))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_5 of_4))
; 
; >=  {((sc.input.I[1].X*9.26)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_4 9.26) of_4) 10.))
; 
; <=  {((sc.input.I[1].X*9.26)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_4 9.26) of_4) 0.))
; 
; >=  {((sc.input.I[1].O*9.26)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_5 9.26) of_5) 10.))
; 
; <=  {((sc.input.I[1].O*9.26)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_5 9.26) of_5) 0.))
(declare-fun sc_6 () Real)
(assert (> sc_6 1e-08))
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_7 sc_6))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_7 of_6))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.output.V[2].X*0.124)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_6 0.124) of_6) sltop_6) 3300.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 0.0001))
; 
; =  {(((sc.output.V[2].O*0.124)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_7 0.124) of_7) sltop_7) 3300.))
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
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 0.0001))
; 
; =  {(((sc.output.V[0].X*0.256)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_8 0.256) of_8) sltop_8) 3300.))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.256)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_9 0.256) of_9) sltop_9) 3300.))
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_11 sc_10))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_11 of_10))
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X)} {0.0001}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10) 0.0001))
; 
; =  {(((sc.output.V[3].X*0.124)+of.output.V[3].X)+sl.max.output.V[3].X)} {3300.}
(assert (= (+ (+ (* sc_10 0.124) of_10) sltop_10) 3300.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O)} {0.0001}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 0.0001))
; 
; =  {(((sc.output.V[3].O*0.124)+of.output.V[3].O)+sl.max.output.V[3].O)} {3300.}
(assert (= (+ (+ (* sc_11 0.124) of_11) sltop_11) 3300.))
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_13 sc_12))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_13 of_12))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.0001))
; 
; =  {(((sc.output.V[1].X*0.124)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_12 0.124) of_12) sltop_12) 3300.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.124)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_13 0.124) of_13) sltop_13) 3300.))
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
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_15 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_18 0.))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_17 (* 1. sc_18)))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D)}
(assert (and (= sc_17 (* 1. sc_16)) (= sc_17 (* 1. sc_15))))
; no offset
(assert (= (- (+ of_17 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT} {(sc.vadd[8].A*1.)}
(assert (= sc_19 (* sc_17 1.)))
; 
; =  {of.vadd[8].OUT} {0.}
(assert (= of_19 0.))
; no scale
(assert (= sc_15 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_15 0.))
; no offset
(assert (= of_20 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_18 0.))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_17 (* 1. sc_18)))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D*sc.vadd[8].OUT2)}
(assert (and (= sc_17 (* 1. sc_16)) (= sc_17 (* (* 1. sc_15) sc_20))))
; no offset
(assert (= (- (+ of_17 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT2} {(sc.vadd[8].A*1.)}
(assert (= sc_20 (* sc_17 1.)))
; no offset
(assert (= of_20 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT2_0} {(sc.vadd[8].A*1.)}
(assert (= sc_14 (* sc_17 1.)))
; 
; =  {of.vadd[8].OUT2_0} {0.}
(assert (= of_14 0.))
; 
; >=  {((sc.vadd[8].OUT2_0*0.)+of.vadd[8].OUT2_0)} {3300.}
(assert (<= (+ (* sc_14 0.) of_14) 3300.))
; 
; <=  {((sc.vadd[8].OUT2_0*0.)+of.vadd[8].OUT2_0)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.vadd[8].D*0.)+of.vadd[8].D)} {3300.}
(assert (<= (+ (* sc_15 0.) of_15) 3300.))
; 
; <=  {((sc.vadd[8].D*0.)+of.vadd[8].D)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
; 
; >=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {3300.}
(assert (<= (+ (* sc_16 0.) of_16) 3300.))
; 
; <=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
; 
; >=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {3300.}
(assert (<= (+ (* sc_17 0.) of_17) 3300.))
; 
; <=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2)} {0.}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.))
; 
; =  {(((sc.vadd[8].OUT2*0.124)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2)} {3300.}
(assert (= (+ (+ (* sc_20 0.124) of_20) sltop_20) 3300.))
(declare-fun slbot_18 () Real)
(declare-fun sltop_18 () Real)
; 
; =  {(((sc.vadd[8].B*0.)+of.vadd[8].B)+sl.min.vadd[8].B)} {0.}
(assert (= (+ (+ (* sc_18 0.) of_18) slbot_18) 0.))
; 
; =  {(((sc.vadd[8].B*0.10416)+of.vadd[8].B)+sl.max.vadd[8].B)} {3300.}
(assert (= (+ (+ (* sc_18 0.10416) of_18) sltop_18) 3300.))
(declare-fun slbot_19 () Real)
(declare-fun sltop_19 () Real)
; 
; =  {(((sc.vadd[8].OUT*0.)+of.vadd[8].OUT)+sl.min.vadd[8].OUT)} {-1650.}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19) -1650.))
; 
; =  {(((sc.vadd[8].OUT*0.10416)+of.vadd[8].OUT)+sl.max.vadd[8].OUT)} {1650.}
(assert (= (+ (+ (* sc_19 0.10416) of_19) sltop_19) 1650.))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2)} {0.}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.))
; 
; =  {(((sc.vadd[8].OUT2*0.124)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2)} {3300.}
(assert (= (+ (+ (* sc_20 0.124) of_20) sltop_20) 3300.))
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
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_23 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_25 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_24 (* 1. sc_25)))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D)}
(assert (and (= sc_24 (* 1. sc_23)) (= sc_24 (* 1. sc_22))))
; no offset
(assert (= (- (+ of_24 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT} {(sc.vadd[10].A*1.)}
(assert (= sc_26 (* sc_24 1.)))
; 
; =  {of.vadd[10].OUT} {0.}
(assert (= of_26 0.))
; no scale
(assert (= sc_22 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= of_27 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_23 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_25 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_24 (* 1. sc_25)))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D*sc.vadd[10].OUT2)}
(assert (and (= sc_24 (* 1. sc_23)) (= sc_24 (* (* 1. sc_22) sc_27))))
; no offset
(assert (= (- (+ of_24 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT2} {(sc.vadd[10].A*1.)}
(assert (= sc_27 (* sc_24 1.)))
; no offset
(assert (= of_27 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT2_0} {(sc.vadd[10].A*1.)}
(assert (= sc_21 (* sc_24 1.)))
; 
; =  {of.vadd[10].OUT2_0} {0.}
(assert (= of_21 0.))
; 
; >=  {((sc.vadd[10].OUT2_0*0.256)+of.vadd[10].OUT2_0)} {3300.}
(assert (<= (+ (* sc_21 0.256) of_21) 3300.))
; 
; <=  {((sc.vadd[10].OUT2_0*0.256)+of.vadd[10].OUT2_0)} {0.}
(assert (>= (+ (* sc_21 0.256) of_21) 0.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[10].D*0.)+of.vadd[10].D)+sl.min.vadd[10].D)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.vadd[10].D*1.564384)+of.vadd[10].D)+sl.max.vadd[10].D)} {3300.}
(assert (= (+ (+ (* sc_22 1.564384) of_22) sltop_22) 3300.))
; 
; >=  {((sc.vadd[10].C*0.)+of.vadd[10].C)} {3300.}
(assert (<= (+ (* sc_23 0.) of_23) 3300.))
; 
; <=  {((sc.vadd[10].C*0.)+of.vadd[10].C)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
; 
; >=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {3300.}
(assert (<= (+ (* sc_24 0.) of_24) 3300.))
; 
; <=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2)} {0.}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 0.))
; 
; =  {(((sc.vadd[10].OUT2*0.256)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2)} {3300.}
(assert (= (+ (+ (* sc_27 0.256) of_27) sltop_27) 3300.))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.vadd[10].B*0.)+of.vadd[10].B)+sl.min.vadd[10].B)} {0.}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 0.))
; 
; =  {(((sc.vadd[10].B*1.14824)+of.vadd[10].B)+sl.max.vadd[10].B)} {3300.}
(assert (= (+ (+ (* sc_25 1.14824) of_25) sltop_25) 3300.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.vadd[10].OUT*0.)+of.vadd[10].OUT)+sl.min.vadd[10].OUT)} {-1650.}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) -1650.))
; 
; =  {(((sc.vadd[10].OUT*1.564384)+of.vadd[10].OUT)+sl.max.vadd[10].OUT)} {1650.}
(assert (= (+ (+ (* sc_26 1.564384) of_26) sltop_26) 1650.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2)} {0.}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 0.))
; 
; =  {(((sc.vadd[10].OUT2*0.256)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2)} {3300.}
(assert (= (+ (+ (* sc_27 0.256) of_27) sltop_27) 3300.))
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
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_32 0.))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_31 (* 1. sc_32)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D)}
(assert (and (= sc_31 (* 1. sc_30)) (= sc_31 (* 1. sc_29))))
; no offset
(assert (= (- (+ of_31 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1.)}
(assert (= sc_33 (* sc_31 1.)))
; 
; =  {of.vadd[6].OUT} {0.}
(assert (= of_33 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_32 0.))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_31 (* 1. sc_32)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D*sc.vadd[6].OUT2)}
(assert (and (= sc_31 (* 1. sc_30)) (= sc_31 (* (* 1. sc_29) sc_34))))
; no offset
(assert (= (- (+ of_31 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1.)}
(assert (= sc_34 (* sc_31 1.)))
; no offset
(assert (= of_34 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1.)}
(assert (= sc_28 (* sc_31 1.)))
; 
; =  {of.vadd[6].OUT2_0} {0.}
(assert (= of_28 0.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[6].OUT*1.564384)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1650.}
(assert (= (+ (+ (* sc_33 1.564384) of_33) sltop_33) 1650.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vadd[6].A*0.)+of.vadd[6].A)+sl.min.vadd[6].A)} {0.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.))
; 
; =  {(((sc.vadd[6].A*6.257536)+of.vadd[6].A)+sl.max.vadd[6].A)} {3300.}
(assert (= (+ (+ (* sc_31 6.257536) of_31) sltop_31) 3300.))
; 
; >=  {((sc.vadd[6].B*0.)+of.vadd[6].B)} {3300.}
(assert (<= (+ (* sc_32 0.) of_32) 3300.))
; 
; <=  {((sc.vadd[6].B*0.)+of.vadd[6].B)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[6].OUT*1.564384)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1650.}
(assert (= (+ (+ (* sc_33 1.564384) of_33) sltop_33) 1650.))
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
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_36 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_37 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_39 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_38 (* 1. sc_39)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D)}
(assert (and (= sc_38 (* 1. sc_37)) (= sc_38 (* 1. sc_36))))
; no offset
(assert (= (- (+ of_38 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1.)}
(assert (= sc_40 (* sc_38 1.)))
; 
; =  {of.vadd[4].OUT} {0.}
(assert (= of_40 0.))
; no scale
(assert (= sc_36 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_36 0.))
; no offset
(assert (= of_41 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_37 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_39 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_38 (* 1. sc_39)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D*sc.vadd[4].OUT2)}
(assert (and (= sc_38 (* 1. sc_37)) (= sc_38 (* (* 1. sc_36) sc_41))))
; no offset
(assert (= (- (+ of_38 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1.)}
(assert (= sc_41 (* sc_38 1.)))
; no offset
(assert (= of_41 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1.)}
(assert (= sc_35 (* sc_38 1.)))
; 
; =  {of.vadd[4].OUT2_0} {0.}
(assert (= of_35 0.))
; 
; >=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_35 0.) of_35) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
; 
; >=  {((sc.vadd[4].D*10.1)+of.vadd[4].D)} {3300.}
(assert (<= (+ (* sc_36 10.1) of_36) 3300.))
; 
; <=  {((sc.vadd[4].D*10.1)+of.vadd[4].D)} {0.}
(assert (>= (+ (* sc_36 10.1) of_36) 0.))
; 
; >=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {3300.}
(assert (<= (+ (* sc_37 0.) of_37) 3300.))
; 
; <=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_38 0.) of_38) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) 0.))
; 
; =  {(((sc.vadd[4].OUT2*0.124)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {3300.}
(assert (= (+ (+ (* sc_41 0.124) of_41) sltop_41) 3300.))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.vadd[4].B*0.)+of.vadd[4].B)+sl.min.vadd[4].B)} {0.}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) 0.))
; 
; =  {(((sc.vadd[4].B*0.400482304)+of.vadd[4].B)+sl.max.vadd[4].B)} {3300.}
(assert (= (+ (+ (* sc_39 0.400482304) of_39) sltop_39) 3300.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT)} {-1650.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) -1650.))
; 
; =  {(((sc.vadd[4].OUT*0.400482304)+of.vadd[4].OUT)+sl.max.vadd[4].OUT)} {1650.}
(assert (= (+ (+ (* sc_40 0.400482304) of_40) sltop_40) 1650.))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) 0.))
; 
; =  {(((sc.vadd[4].OUT2*0.124)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {3300.}
(assert (= (+ (+ (* sc_41 0.124) of_41) sltop_41) 3300.))
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
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_46 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_45 (* 1. sc_46)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_45 (* 1. sc_44)) (= sc_45 (* 1. sc_43))))
; no offset
(assert (= (- (+ of_45 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_47 (* sc_45 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_47 0.))
; no scale
(assert (= sc_43 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= of_48 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_46 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_45 (* 1. sc_46)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_45 (* 1. sc_44)) (= sc_45 (* (* 1. sc_43) sc_48))))
; no offset
(assert (= (- (+ of_45 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_48 (* sc_45 1.)))
; no offset
(assert (= of_48 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_42 (* sc_45 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_42 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_42 0.124) of_42) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_42 0.124) of_42) 0.))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vadd[1].D*0.)+of.vadd[1].D)+sl.min.vadd[1].D)} {0.}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43) 0.))
; 
; =  {(((sc.vadd[1].D*3.229696)+of.vadd[1].D)+sl.max.vadd[1].D)} {3300.}
(assert (= (+ (+ (* sc_43 3.229696) of_43) sltop_43) 3300.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_44 0.) of_44) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_45 0.) of_45) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun slbot_48 () Real)
(declare-fun sltop_48 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_48 0.124) of_48) sltop_48) 3300.))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 0.))
; 
; =  {(((sc.vadd[1].B*1.2524)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_46 1.2524) of_46) sltop_46) 3300.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47) -1650.))
; 
; =  {(((sc.vadd[1].OUT*3.229696)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_47 3.229696) of_47) sltop_47) 1650.))
(declare-fun slbot_48 () Real)
(declare-fun sltop_48 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48) 0.))
; 
; =  {(((sc.vadd[1].OUT2*0.124)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_48 0.124) of_48) sltop_48) 3300.))
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_50 sc_49))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_50 of_49))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_49 0.) of_49) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_50 0.) of_50) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_52 sc_51))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_52 of_51))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_51 0.) of_51) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_52 0.) of_52) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_54 sc_53))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_54 of_53))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_53 0.) of_53) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_54 0.) of_54) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_56 sc_55))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_56 of_55))
; 
; >=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_55 0.) of_55) 3300.))
; 
; <=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
; 
; >=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_56 0.) of_56) 3300.))
; 
; <=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_58 sc_57))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_58 of_57))
; 
; >=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_57 0.) of_57) 3300.))
; 
; <=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
; 
; >=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_58 0.) of_58) 3300.))
; 
; <=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_60 sc_59))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_60 of_59))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_59 0.) of_59) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_62 sc_61))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_62 of_61))
; 
; >=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_61 10.1) of_61) 3300.))
; 
; <=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_61 10.1) of_61) 0.))
; 
; >=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_62 10.1) of_62) 3300.))
; 
; <=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_62 10.1) of_62) 0.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_63 0.) of_63) 3300.))
; 
; <=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
; 
; >=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_64 0.) of_64) 3300.))
; 
; <=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_65 0.) of_65) 3300.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_66 0.) of_66) 3300.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_68 of_67))
; 
; >=  {((sc.input.V[15].X*12.616)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_67 12.616) of_67) 3300.))
; 
; <=  {((sc.input.V[15].X*12.616)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_67 12.616) of_67) 0.))
; 
; >=  {((sc.input.V[15].O*12.616)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_68 12.616) of_68) 3300.))
; 
; <=  {((sc.input.V[15].O*12.616)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_68 12.616) of_68) 0.))
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_70 of_69))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_69 0.) of_69) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_70 0.) of_70) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.V[14].X*12.616)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_71 12.616) of_71) 3300.))
; 
; <=  {((sc.input.V[14].X*12.616)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_71 12.616) of_71) 0.))
; 
; >=  {((sc.input.V[14].O*12.616)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_72 12.616) of_72) 3300.))
; 
; <=  {((sc.input.V[14].O*12.616)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_72 12.616) of_72) 0.))
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.V[16].X*0.256)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_73 0.256) of_73) 3300.))
; 
; <=  {((sc.input.V[16].X*0.256)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_73 0.256) of_73) 0.))
; 
; >=  {((sc.input.V[16].O*0.256)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_74 0.256) of_74) 3300.))
; 
; <=  {((sc.input.V[16].O*0.256)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_74 0.256) of_74) 0.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_75 0.) of_75) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_76 0.) of_76) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_77 0.) of_77) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_78 0.) of_78) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_80 sc_79))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_80 of_79))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_80 0.) of_80) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_80 0.) of_80) 0.))
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_82 sc_81))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_82 of_81))
; 
; >=  {((sc.input.V[1].X*10.1)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_81 10.1) of_81) 3300.))
; 
; <=  {((sc.input.V[1].X*10.1)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_81 10.1) of_81) 0.))
; 
; >=  {((sc.input.V[1].O*10.1)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_82 10.1) of_82) 3300.))
; 
; <=  {((sc.input.V[1].O*10.1)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_82 10.1) of_82) 0.))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_84 sc_83))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_84 of_83))
; 
; >=  {((sc.input.V[17].X*0.124)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_83 0.124) of_83) 3300.))
; 
; <=  {((sc.input.V[17].X*0.124)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_83 0.124) of_83) 0.))
; 
; >=  {((sc.input.V[17].O*0.124)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_84 0.124) of_84) 3300.))
; 
; <=  {((sc.input.V[17].O*0.124)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_84 0.124) of_84) 0.))
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
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_87 (* sc_86 sc_85)))
; 
; =  {of.itov[2].Y} {0.}
(assert (= of_87 0.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X)} {0.0001}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 0.0001))
; 
; =  {(((sc.itov[2].X*0.256)+of.itov[2].X)+sl.max.itov[2].X)} {10.}
(assert (= (+ (+ (* sc_85 0.256) of_85) sltop_85) 10.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 0.0001))
; 
; =  {(((sc.itov[2].Y*3.229696)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_87 3.229696) of_87) sltop_87) 3300.))
; 
; >=  {((sc.itov[2].K*12.616)+of.itov[2].K)} {330.}
(assert (<= (+ (* sc_86 12.616) of_86) 330.))
; 
; <=  {((sc.itov[2].K*12.616)+of.itov[2].K)} {1.}
(assert (>= (+ (* sc_86 12.616) of_86) 1.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 0.0001))
; 
; =  {(((sc.itov[2].Y*3.229696)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_87 3.229696) of_87) sltop_87) 3300.))
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
; 
; >=  {((sc.itov[7].X*0.84)+of.itov[7].X)} {10.}
(assert (<= (+ (* sc_88 0.84) of_88) 10.))
; 
; <=  {((sc.itov[7].X*0.84)+of.itov[7].X)} {0.0001}
(assert (>= (+ (* sc_88 0.84) of_88) 0.0001))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90) 0.0001))
; 
; =  {(((sc.itov[7].Y*0.10416)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_90 0.10416) of_90) sltop_90) 3300.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.itov[7].K*0.)+of.itov[7].K)+sl.min.itov[7].K)} {1.}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 1.))
; 
; =  {(((sc.itov[7].K*0.124)+of.itov[7].K)+sl.max.itov[7].K)} {330.}
(assert (= (+ (+ (* sc_89 0.124) of_89) sltop_89) 330.))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90) 0.0001))
; 
; =  {(((sc.itov[7].Y*0.10416)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_90 0.10416) of_90) sltop_90) 3300.))
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
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_93 (* sc_92 sc_91)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_93 0.))
; 
; >=  {((sc.itov[9].X*9.26)+of.itov[9].X)} {10.}
(assert (<= (+ (* sc_91 9.26) of_91) 10.))
; 
; <=  {((sc.itov[9].X*9.26)+of.itov[9].X)} {0.0001}
(assert (>= (+ (* sc_91 9.26) of_91) 0.0001))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 0.0001))
; 
; =  {(((sc.itov[9].Y*1.14824)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_93 1.14824) of_93) sltop_93) 3300.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.itov[9].K*0.)+of.itov[9].K)+sl.min.itov[9].K)} {1.}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 1.))
; 
; =  {(((sc.itov[9].K*0.124)+of.itov[9].K)+sl.max.itov[9].K)} {330.}
(assert (= (+ (+ (* sc_92 0.124) of_92) sltop_92) 330.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 0.0001))
; 
; =  {(((sc.itov[9].Y*1.14824)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_93 1.14824) of_93) sltop_93) 3300.))
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
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_96 (* sc_95 sc_94)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_96 0.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.itov[0].X*0.)+of.itov[0].X)+sl.min.itov[0].X)} {0.0001}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94) 0.0001))
; 
; =  {(((sc.itov[0].X*0.124)+of.itov[0].X)+sl.max.itov[0].X)} {10.}
(assert (= (+ (+ (* sc_94 0.124) of_94) sltop_94) 10.))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96) 0.0001))
; 
; =  {(((sc.itov[0].Y*1.2524)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_96 1.2524) of_96) sltop_96) 3300.))
; 
; >=  {((sc.itov[0].K*10.1)+of.itov[0].K)} {330.}
(assert (<= (+ (* sc_95 10.1) of_95) 330.))
; 
; <=  {((sc.itov[0].K*10.1)+of.itov[0].K)} {1.}
(assert (>= (+ (* sc_95 10.1) of_95) 1.))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96) 0.0001))
; 
; =  {(((sc.itov[0].Y*1.2524)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_96 1.2524) of_96) sltop_96) 3300.))
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
; =  {sc.itov[11].Y} {(sc.itov[11].K*sc.itov[11].X)}
(assert (= sc_99 (* sc_98 sc_97)))
; 
; =  {of.itov[11].Y} {0.}
(assert (= of_99 0.))
(declare-fun slbot_97 () Real)
(declare-fun sltop_97 () Real)
; 
; =  {(((sc.itov[11].X*0.)+of.itov[11].X)+sl.min.itov[11].X)} {0.0001}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97) 0.0001))
; 
; =  {(((sc.itov[11].X*0.124)+of.itov[11].X)+sl.max.itov[11].X)} {10.}
(assert (= (+ (+ (* sc_97 0.124) of_97) sltop_97) 10.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y)} {0.0001}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.0001))
; 
; =  {(((sc.itov[11].Y*1.564384)+of.itov[11].Y)+sl.max.itov[11].Y)} {3300.}
(assert (= (+ (+ (* sc_99 1.564384) of_99) sltop_99) 3300.))
; 
; >=  {((sc.itov[11].K*12.616)+of.itov[11].K)} {330.}
(assert (<= (+ (* sc_98 12.616) of_98) 330.))
; 
; <=  {((sc.itov[11].K*12.616)+of.itov[11].K)} {1.}
(assert (>= (+ (* sc_98 12.616) of_98) 1.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y)} {0.0001}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.0001))
; 
; =  {(((sc.itov[11].Y*1.564384)+of.itov[11].Y)+sl.max.itov[11].Y)} {3300.}
(assert (= (+ (+ (* sc_99 1.564384) of_99) sltop_99) 3300.))
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
; =  {sc.itov[3].Y} {(sc.itov[3].K*sc.itov[3].X)}
(assert (= sc_102 (* sc_101 sc_100)))
; 
; =  {of.itov[3].Y} {0.}
(assert (= of_102 0.))
; 
; >=  {((sc.itov[3].X*50.464)+of.itov[3].X)} {10.}
(assert (<= (+ (* sc_100 50.464) of_100) 10.))
; 
; <=  {((sc.itov[3].X*50.464)+of.itov[3].X)} {0.0001}
(assert (>= (+ (* sc_100 50.464) of_100) 0.0001))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_102 0.) of_102) slbot_102) 0.0001))
; 
; =  {(((sc.itov[3].Y*6.257536)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_102 6.257536) of_102) sltop_102) 3300.))
(declare-fun slbot_101 () Real)
(declare-fun sltop_101 () Real)
; 
; =  {(((sc.itov[3].K*0.)+of.itov[3].K)+sl.min.itov[3].K)} {1.}
(assert (= (+ (+ (* sc_101 0.) of_101) slbot_101) 1.))
; 
; =  {(((sc.itov[3].K*0.124)+of.itov[3].K)+sl.max.itov[3].K)} {330.}
(assert (= (+ (+ (* sc_101 0.124) of_101) sltop_101) 330.))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_102 0.) of_102) slbot_102) 0.0001))
; 
; =  {(((sc.itov[3].Y*6.257536)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_102 6.257536) of_102) sltop_102) 3300.))
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
; no offset
(assert (= of_104 0.))
; no offset
(assert (= of_103 0.))
; 
; =  {sc.itov[5].Y} {(sc.itov[5].K*sc.itov[5].X)}
(assert (= sc_105 (* sc_104 sc_103)))
; 
; =  {of.itov[5].Y} {0.}
(assert (= of_105 0.))
(declare-fun slbot_103 () Real)
(declare-fun sltop_103 () Real)
; 
; =  {(((sc.itov[5].X*0.)+of.itov[5].X)+sl.min.itov[5].X)} {0.0001}
(assert (= (+ (+ (* sc_103 0.) of_103) slbot_103) 0.0001))
; 
; =  {(((sc.itov[5].X*0.256)+of.itov[5].X)+sl.max.itov[5].X)} {10.}
(assert (= (+ (+ (* sc_103 0.256) of_103) sltop_103) 10.))
(declare-fun slbot_105 () Real)
(declare-fun sltop_105 () Real)
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_105 0.) of_105) slbot_105) 0.0001))
; 
; =  {(((sc.itov[5].Y*0.400482304)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_105 0.400482304) of_105) sltop_105) 3300.))
(declare-fun slbot_104 () Real)
(declare-fun sltop_104 () Real)
; 
; =  {(((sc.itov[5].K*0.)+of.itov[5].K)+sl.min.itov[5].K)} {1.}
(assert (= (+ (+ (* sc_104 0.) of_104) slbot_104) 1.))
; 
; =  {(((sc.itov[5].K*1.564384)+of.itov[5].K)+sl.max.itov[5].K)} {330.}
(assert (= (+ (+ (* sc_104 1.564384) of_104) sltop_104) 330.))
(declare-fun slbot_105 () Real)
(declare-fun sltop_105 () Real)
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_105 0.) of_105) slbot_105) 0.0001))
; 
; =  {(((sc.itov[5].Y*0.400482304)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_105 0.400482304) of_105) sltop_105) 3300.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].D}
(assert (= sc_87 sc_43))
; 
; =  {of.itov[2].Y} {of.vadd[1].D}
(assert (= of_87 of_43))
; 
; =  {sc.input.V[17].O} {sc.vadd[1].OUT2_0}
(assert (= sc_84 sc_42))
; 
; =  {of.input.V[17].O} {of.vadd[1].OUT2_0}
(assert (= of_84 of_42))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[0].X}
(assert (= sc_41 sc_94))
; 
; =  {of.vadd[4].OUT2} {of.itov[0].X}
(assert (= of_41 of_94))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[7].K}
(assert (= sc_41 sc_89))
; 
; =  {of.vadd[4].OUT2} {of.itov[7].K}
(assert (= of_41 of_89))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[9].K}
(assert (= sc_41 sc_92))
; 
; =  {of.vadd[4].OUT2} {of.itov[9].K}
(assert (= of_41 of_92))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[3].X}
(assert (= sc_41 sc_10))
; 
; =  {of.vadd[4].OUT2} {of.output.V[3].X}
(assert (= of_41 of_10))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[3].K}
(assert (= sc_48 sc_101))
; 
; =  {of.vadd[1].OUT2} {of.itov[3].K}
(assert (= of_48 of_101))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[2].X}
(assert (= sc_48 sc_6))
; 
; =  {of.vadd[1].OUT2} {of.output.V[2].X}
(assert (= of_48 of_6))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[11].X}
(assert (= sc_48 sc_97))
; 
; =  {of.vadd[1].OUT2} {of.itov[11].X}
(assert (= of_48 of_97))
; 
; =  {sc.input.I[0].O} {sc.itov[3].X}
(assert (= sc_3 sc_100))
; 
; =  {of.input.I[0].O} {of.itov[3].X}
(assert (= of_3 of_100))
; 
; =  {sc.input.V[9].O} {sc.vadd[8].A}
(assert (= sc_60 sc_17))
; 
; =  {of.input.V[9].O} {of.vadd[8].A}
(assert (= of_60 of_17))
; 
; =  {sc.itov[11].Y} {sc.vadd[10].D}
(assert (= sc_99 sc_22))
; 
; =  {of.itov[11].Y} {of.vadd[10].D}
(assert (= of_99 of_22))
; 
; =  {sc.input.V[15].O} {sc.itov[2].K}
(assert (= sc_68 sc_86))
; 
; =  {of.input.V[15].O} {of.itov[2].K}
(assert (= of_68 of_86))
; 
; =  {sc.input.V[13].O} {sc.vadd[10].A}
(assert (= sc_56 sc_24))
; 
; =  {of.input.V[13].O} {of.vadd[10].A}
(assert (= of_56 of_24))
; 
; =  {sc.input.V[14].O} {sc.itov[11].K}
(assert (= sc_72 sc_98))
; 
; =  {of.input.V[14].O} {of.itov[11].K}
(assert (= of_72 of_98))
; 
; =  {sc.input.V[11].O} {sc.vadd[8].D}
(assert (= sc_64 sc_15))
; 
; =  {of.input.V[11].O} {of.vadd[8].D}
(assert (= of_64 of_15))
; 
; =  {sc.itov[5].Y} {sc.vadd[4].B}
(assert (= sc_105 sc_39))
; 
; =  {of.itov[5].Y} {of.vadd[4].B}
(assert (= of_105 of_39))
; 
; =  {sc.input.I[2].O} {sc.itov[7].X}
(assert (= sc_1 sc_88))
; 
; =  {of.input.I[2].O} {of.itov[7].X}
(assert (= of_1 of_88))
; 
; =  {sc.input.V[8].O} {sc.vadd[8].OUT2_0}
(assert (= sc_52 sc_14))
; 
; =  {of.input.V[8].O} {of.vadd[8].OUT2_0}
(assert (= of_52 of_14))
; 
; =  {sc.input.V[12].O} {sc.vadd[10].C}
(assert (= sc_58 sc_23))
; 
; =  {of.input.V[12].O} {of.vadd[10].C}
(assert (= of_58 of_23))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].C}
(assert (= sc_50 sc_44))
; 
; =  {of.input.V[2].O} {of.vadd[1].C}
(assert (= of_50 of_44))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_76 sc_45))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_76 of_45))
; 
; =  {sc.itov[7].Y} {sc.vadd[8].B}
(assert (= sc_90 sc_18))
; 
; =  {of.itov[7].Y} {of.vadd[8].B}
(assert (= of_90 of_18))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_96 sc_46))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_96 of_46))
; 
; =  {sc.vadd[6].OUT} {sc.itov[5].K}
(assert (= sc_33 sc_104))
; 
; =  {of.vadd[6].OUT} {of.itov[5].K}
(assert (= of_33 of_104))
; 
; =  {sc.input.I[1].O} {sc.itov[9].X}
(assert (= sc_5 sc_91))
; 
; =  {of.input.I[1].O} {of.itov[9].X}
(assert (= of_5 of_91))
; 
; =  {sc.input.V[1].O} {sc.itov[0].K}
(assert (= sc_82 sc_95))
; 
; =  {of.input.V[1].O} {of.itov[0].K}
(assert (= of_82 of_95))
; 
; =  {sc.vadd[10].OUT2} {sc.itov[2].X}
(assert (= sc_27 sc_85))
; 
; =  {of.vadd[10].OUT2} {of.itov[2].X}
(assert (= of_27 of_85))
; 
; =  {sc.vadd[10].OUT2} {sc.itov[5].X}
(assert (= sc_27 sc_103))
; 
; =  {of.vadd[10].OUT2} {of.itov[5].X}
(assert (= of_27 of_103))
; 
; =  {sc.vadd[10].OUT2} {sc.output.V[0].X}
(assert (= sc_27 sc_8))
; 
; =  {of.vadd[10].OUT2} {of.output.V[0].X}
(assert (= of_27 of_8))
; 
; =  {sc.input.V[7].O} {sc.vadd[6].B}
(assert (= sc_54 sc_32))
; 
; =  {of.input.V[7].O} {of.vadd[6].B}
(assert (= of_54 of_32))
; 
; =  {sc.vadd[8].OUT2} {sc.output.V[1].X}
(assert (= sc_20 sc_12))
; 
; =  {of.vadd[8].OUT2} {of.output.V[1].X}
(assert (= of_20 of_12))
; 
; =  {sc.itov[3].Y} {sc.vadd[6].A}
(assert (= sc_102 sc_31))
; 
; =  {of.itov[3].Y} {of.vadd[6].A}
(assert (= of_102 of_31))
; 
; =  {sc.input.V[10].O} {sc.vadd[8].C}
(assert (= sc_66 sc_16))
; 
; =  {of.input.V[10].O} {of.vadd[8].C}
(assert (= of_66 of_16))
; 
; =  {sc.input.V[0].O} {sc.vadd[4].D}
(assert (= sc_62 sc_36))
; 
; =  {of.input.V[0].O} {of.vadd[4].D}
(assert (= of_62 of_36))
; 
; =  {sc.input.V[16].O} {sc.vadd[10].OUT2_0}
(assert (= sc_74 sc_21))
; 
; =  {of.input.V[16].O} {of.vadd[10].OUT2_0}
(assert (= of_74 of_21))
; 
; =  {sc.itov[9].Y} {sc.vadd[10].B}
(assert (= sc_93 sc_25))
; 
; =  {of.itov[9].Y} {of.vadd[10].B}
(assert (= of_93 of_25))
; 
; =  {sc.input.V[5].O} {sc.vadd[4].A}
(assert (= sc_80 sc_38))
; 
; =  {of.input.V[5].O} {of.vadd[4].A}
(assert (= of_80 of_38))
; 
; =  {sc.input.V[4].O} {sc.vadd[4].OUT2_0}
(assert (= sc_78 sc_35))
; 
; =  {of.input.V[4].O} {of.vadd[4].OUT2_0}
(assert (= of_78 of_35))
; 
; =  {sc.input.V[6].O} {sc.vadd[4].C}
(assert (= sc_70 sc_37))
; 
; =  {of.input.V[6].O} {of.vadd[4].C}
(assert (= of_70 of_37))
(assert (<= (* sc_9 0.001) 0.001))
(assert (<= (* sc_13 0.001) 0.001))
(assert (<= (* sc_7 0.001) 0.001))
(assert (<= (* sc_11 0.001) 0.001))
; 
; =  {sc.vadd[10].OUT2} {sc.output.V[0].O} {sc.vadd[8].OUT2} {sc.output.V[1].O} {sc.vadd[1].OUT2} {sc.output.V[2].O} {sc.vadd[4].OUT2} {sc.output.V[3].O}
(assert (and (and (and (and (and (and (= sc_27 sc_9) (= sc_27 sc_20)) (= sc_27 sc_13)) (= sc_27 sc_48)) (= sc_27 sc_7)) (= sc_27 sc_41)) (= sc_27 sc_11)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_92 0.) slbot_92 (- slbot_92)) (ite (>= sltop_96 0.) sltop_96 (- sltop_96))) (ite (>= sltop_18 0.) sltop_18 (- sltop_18))) (ite (>= sltop_87 0.) sltop_87 (- sltop_87))) (ite (>= slbot_10 0.) slbot_10 (- slbot_10))) (ite (>= sltop_90 0.) sltop_90 (- sltop_90))) (ite (>= slbot_20 0.) slbot_20 (- slbot_20))) (ite (>= sltop_27 0.) sltop_27 (- sltop_27))) (ite (>= slbot_103 0.) slbot_103 (- slbot_103))) (ite (>= slbot_46 0.) slbot_46 (- slbot_46))) (ite (>= sltop_104 0.) sltop_104 (- sltop_104))) (ite (>= slbot_26 0.) slbot_26 (- slbot_26))) (ite (>= sltop_105 0.) sltop_105 (- sltop_105))) (ite (>= sltop_10 0.) sltop_10 (- sltop_10))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= slbot_18 0.) slbot_18 (- slbot_18))) (ite (>= sltop_22 0.) sltop_22 (- sltop_22))) (ite (>= slbot_96 0.) slbot_96 (- slbot_96))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_31 0.) sltop_31 (- sltop_31))) (ite (>= sltop_94 0.) sltop_94 (- sltop_94))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= slbot_104 0.) slbot_104 (- slbot_104))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= slbot_87 0.) slbot_87 (- slbot_87))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= sltop_19 0.) sltop_19 (- sltop_19))) (ite (>= sltop_40 0.) sltop_40 (- sltop_40))) (ite (>= slbot_27 0.) slbot_27 (- slbot_27))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= slbot_89 0.) slbot_89 (- slbot_89))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= slbot_22 0.) slbot_22 (- slbot_22))) (ite (>= sltop_41 0.) sltop_41 (- sltop_41))) (ite (>= sltop_101 0.) sltop_101 (- sltop_101))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= slbot_101 0.) slbot_101 (- slbot_101))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= slbot_19 0.) slbot_19 (- slbot_19))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= sltop_39 0.) sltop_39 (- sltop_39))) (ite (>= sltop_89 0.) sltop_89 (- sltop_89))) (ite (>= sltop_92 0.) sltop_92 (- sltop_92))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_31 0.) slbot_31 (- slbot_31))) (ite (>= slbot_90 0.) slbot_90 (- slbot_90))) (ite (>= slbot_25 0.) slbot_25 (- slbot_25))) (ite (>= slbot_41 0.) slbot_41 (- slbot_41))) (ite (>= sltop_20 0.) sltop_20 (- sltop_20))) (ite (>= sltop_103 0.) sltop_103 (- sltop_103))) (ite (>= slbot_105 0.) slbot_105 (- slbot_105))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= sltop_102 0.) sltop_102 (- sltop_102))) (ite (>= slbot_48 0.) slbot_48 (- slbot_48))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= sltop_97 0.) sltop_97 (- sltop_97))) (ite (>= slbot_43 0.) slbot_43 (- slbot_43))) (ite (>= sltop_47 0.) sltop_47 (- sltop_47))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= slbot_94 0.) slbot_94 (- slbot_94))) (ite (>= sltop_48 0.) sltop_48 (- sltop_48))) (ite (>= sltop_46 0.) sltop_46 (- sltop_46))) (ite (>= sltop_25 0.) sltop_25 (- sltop_25))) (ite (>= sltop_26 0.) sltop_26 (- sltop_26))) (ite (>= slbot_39 0.) slbot_39 (- slbot_39))) (ite (>= slbot_47 0.) slbot_47 (- slbot_47))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= sltop_43 0.) sltop_43 (- sltop_43))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_33 0.) slbot_33 (- slbot_33))) (ite (>= sltop_33 0.) sltop_33 (- sltop_33))) (ite (>= slbot_40 0.) slbot_40 (- slbot_40))) (ite (>= slbot_97 0.) slbot_97 (- slbot_97))) (ite (>= slbot_102 0.) slbot_102 (- slbot_102)))))
(check-sat)
