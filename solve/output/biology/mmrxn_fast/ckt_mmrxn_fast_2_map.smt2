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
; =  {sc.vgain[5].P} {((sc.vgain[5].X/sc.vgain[5].Y)*sc.vgain[5].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[5].P} {0.}
(assert (= of_3 0.))
(declare-fun slbot_0 () Real)
(declare-fun sltop_0 () Real)
; 
; =  {(((sc.vgain[5].X*0.)+of.vgain[5].X)+sl.min.vgain[5].X)} {0.0001}
(assert (= (+ (+ (* sc_0 0.) of_0) slbot_0) 0.0001))
; 
; =  {(((sc.vgain[5].X*1.)+of.vgain[5].X)+sl.max.vgain[5].X)} {3300.}
(assert (= (+ (+ (* sc_0 1.) of_0) sltop_0) 3300.))
; 
; >=  {((sc.vgain[5].Y*0.0396322130628)+of.vgain[5].Y)} {3300.}
(assert (<= (+ (* sc_1 0.0396322130628) of_1) 3300.))
; 
; <=  {((sc.vgain[5].Y*0.0396322130628)+of.vgain[5].Y)} {1.}
(assert (>= (+ (* sc_1 0.0396322130628) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[5].P*0.)+of.vgain[5].P)+sl.min.vgain[5].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[5].P*12.616)+of.vgain[5].P)+sl.max.vgain[5].P)} {5445000.}
(assert (= (+ (+ (* sc_3 12.616) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[5].Z*0.)+of.vgain[5].Z)+sl.min.vgain[5].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[5].Z*1.)+of.vgain[5].Z)+sl.max.vgain[5].Z)} {3300.}
(assert (= (+ (+ (* sc_2 1.) of_2) sltop_2) 3300.))
(declare-fun sc_4 () Real)
(assert (> sc_4 1e-08))
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(assert (> sc_5 1e-08))
(declare-fun of_5 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_5 sc_4))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_5 of_4))
; 
; >=  {((sc.input.I[0].X*10.1)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_4 10.1) of_4) 10.))
; 
; <=  {((sc.input.I[0].X*10.1)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_4 10.1) of_4) 0.))
; 
; >=  {((sc.input.I[0].O*10.1)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_5 10.1) of_5) 10.))
; 
; <=  {((sc.input.I[0].O*10.1)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_5 10.1) of_5) 0.))
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
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_6 1.) of_6) sltop_6) 3300.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_7 1.) of_7) sltop_7) 3300.))
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
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_9 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_10 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_12 0.))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_11 (* 1. sc_12)))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D)}
(assert (and (= sc_11 (* 1. sc_10)) (= sc_11 (* 1. sc_9))))
; no offset
(assert (= (- (+ of_11 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT} {(sc.vadd[8].A*1.)}
(assert (= sc_13 (* sc_11 1.)))
; 
; =  {of.vadd[8].OUT} {0.}
(assert (= of_13 0.))
; no scale
(assert (= sc_9 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_9 0.))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_10 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_12 0.))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_11 (* 1. sc_12)))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D*sc.vadd[8].OUT2)}
(assert (and (= sc_11 (* 1. sc_10)) (= sc_11 (* (* 1. sc_9) sc_14))))
; no offset
(assert (= (- (+ of_11 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT2} {(sc.vadd[8].A*1.)}
(assert (= sc_14 (* sc_11 1.)))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT2_0} {(sc.vadd[8].A*1.)}
(assert (= sc_8 (* sc_11 1.)))
; 
; =  {of.vadd[8].OUT2_0} {0.}
(assert (= of_8 0.))
; 
; >=  {((sc.vadd[8].OUT2_0*0.256)+of.vadd[8].OUT2_0)} {3300.}
(assert (<= (+ (* sc_8 0.256) of_8) 3300.))
; 
; <=  {((sc.vadd[8].OUT2_0*0.256)+of.vadd[8].OUT2_0)} {0.}
(assert (>= (+ (* sc_8 0.256) of_8) 0.))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.vadd[8].D*0.)+of.vadd[8].D)+sl.min.vadd[8].D)} {0.}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9) 0.))
; 
; =  {(((sc.vadd[8].D*12.616)+of.vadd[8].D)+sl.max.vadd[8].D)} {3300.}
(assert (= (+ (+ (* sc_9 12.616) of_9) sltop_9) 3300.))
; 
; >=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {3300.}
(assert (<= (+ (* sc_10 0.) of_10) 3300.))
; 
; <=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {0.}
(assert (>= (+ (* sc_10 0.) of_10) 0.))
; 
; >=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {3300.}
(assert (<= (+ (* sc_11 0.) of_11) 3300.))
; 
; <=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14) 0.))
; 
; =  {(((sc.vadd[8].OUT2*1.)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2)} {3300.}
(assert (= (+ (+ (* sc_14 1.) of_14) sltop_14) 3300.))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.vadd[8].B*0.)+of.vadd[8].B)+sl.min.vadd[8].B)} {0.}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.))
; 
; =  {(((sc.vadd[8].B*9.26)+of.vadd[8].B)+sl.max.vadd[8].B)} {3300.}
(assert (= (+ (+ (* sc_12 9.26) of_12) sltop_12) 3300.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.vadd[8].OUT*0.)+of.vadd[8].OUT)+sl.min.vadd[8].OUT)} {-1650.}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) -1650.))
; 
; =  {(((sc.vadd[8].OUT*12.616)+of.vadd[8].OUT)+sl.max.vadd[8].OUT)} {1650.}
(assert (= (+ (+ (* sc_13 12.616) of_13) sltop_13) 1650.))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14) 0.))
; 
; =  {(((sc.vadd[8].OUT2*1.)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2)} {3300.}
(assert (= (+ (+ (* sc_14 1.) of_14) sltop_14) 3300.))
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
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_17 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_19 0.))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_18 (* 1. sc_19)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D)}
(assert (and (= sc_18 (* 1. sc_17)) (= sc_18 (* 1. sc_16))))
; no offset
(assert (= (- (+ of_18 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1.)}
(assert (= sc_20 (* sc_18 1.)))
; 
; =  {of.vadd[6].OUT} {0.}
(assert (= of_20 0.))
; no scale
(assert (= sc_16 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= of_21 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_17 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_19 0.))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_18 (* 1. sc_19)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D*sc.vadd[6].OUT2)}
(assert (and (= sc_18 (* 1. sc_17)) (= sc_18 (* (* 1. sc_16) sc_21))))
; no offset
(assert (= (- (+ of_18 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1.)}
(assert (= sc_21 (* sc_18 1.)))
; no offset
(assert (= of_21 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1.)}
(assert (= sc_15 (* sc_18 1.)))
; 
; =  {of.vadd[6].OUT2_0} {0.}
(assert (= of_15 0.))
; 
; >=  {((sc.vadd[6].OUT2_0*0.)+of.vadd[6].OUT2_0)} {3300.}
(assert (<= (+ (* sc_15 0.) of_15) 3300.))
; 
; <=  {((sc.vadd[6].OUT2_0*0.)+of.vadd[6].OUT2_0)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
; 
; >=  {((sc.vadd[6].D*10.1)+of.vadd[6].D)} {3300.}
(assert (<= (+ (* sc_16 10.1) of_16) 3300.))
; 
; <=  {((sc.vadd[6].D*10.1)+of.vadd[6].D)} {0.}
(assert (>= (+ (* sc_16 10.1) of_16) 0.))
; 
; >=  {((sc.vadd[6].C*0.)+of.vadd[6].C)} {3300.}
(assert (<= (+ (* sc_17 0.) of_17) 3300.))
; 
; <=  {((sc.vadd[6].C*0.)+of.vadd[6].C)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
; 
; >=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {3300.}
(assert (<= (+ (* sc_18 0.) of_18) 3300.))
; 
; <=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {3300.}
(assert (= (+ (+ (* sc_21 1.) of_21) sltop_21) 3300.))
(declare-fun slbot_19 () Real)
(declare-fun sltop_19 () Real)
; 
; =  {(((sc.vadd[6].B*0.)+of.vadd[6].B)+sl.min.vadd[6].B)} {0.}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19) 0.))
; 
; =  {(((sc.vadd[6].B*12.616)+of.vadd[6].B)+sl.max.vadd[6].B)} {3300.}
(assert (= (+ (+ (* sc_19 12.616) of_19) sltop_19) 3300.))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {-1650.}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) -1650.))
; 
; =  {(((sc.vadd[6].OUT*12.616)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1650.}
(assert (= (+ (+ (* sc_20 12.616) of_20) sltop_20) 1650.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {3300.}
(assert (= (+ (+ (* sc_21 1.) of_21) sltop_21) 3300.))
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
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_25 (* 1. sc_26)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D)}
(assert (and (= sc_25 (* 1. sc_24)) (= sc_25 (* 1. sc_23))))
; no offset
(assert (= (- (+ of_25 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1.)}
(assert (= sc_27 (* sc_25 1.)))
; 
; =  {of.vadd[4].OUT} {0.}
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
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_25 (* 1. sc_26)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D*sc.vadd[4].OUT2)}
(assert (and (= sc_25 (* 1. sc_24)) (= sc_25 (* (* 1. sc_23) sc_28))))
; no offset
(assert (= (- (+ of_25 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1.)}
(assert (= sc_28 (* sc_25 1.)))
; no offset
(assert (= of_28 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1.)}
(assert (= sc_22 (* sc_25 1.)))
; 
; =  {of.vadd[4].OUT2_0} {0.}
(assert (= of_22 0.))
; 
; >=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_22 0.) of_22) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.vadd[4].D*0.)+of.vadd[4].D)} {3300.}
(assert (<= (+ (* sc_23 0.) of_23) 3300.))
; 
; <=  {((sc.vadd[4].D*0.)+of.vadd[4].D)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
; 
; >=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {3300.}
(assert (<= (+ (* sc_24 0.) of_24) 3300.))
; 
; <=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_25 0.) of_25) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {3300.}
(assert (= (+ (+ (* sc_28 1.) of_28) sltop_28) 3300.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.vadd[4].B*0.)+of.vadd[4].B)+sl.min.vadd[4].B)} {0.}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.))
; 
; =  {(((sc.vadd[4].B*0.84)+of.vadd[4].B)+sl.max.vadd[4].B)} {3300.}
(assert (= (+ (+ (* sc_26 0.84) of_26) sltop_26) 3300.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT)} {-1650.}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) -1650.))
; 
; =  {(((sc.vadd[4].OUT*0.84)+of.vadd[4].OUT)+sl.max.vadd[4].OUT)} {1650.}
(assert (= (+ (+ (* sc_27 0.84) of_27) sltop_27) 1650.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {3300.}
(assert (= (+ (+ (* sc_28 1.) of_28) sltop_28) 3300.))
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
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_30 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_33 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_32 (* 1. sc_33)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_32 (* 1. sc_31)) (= sc_32 (* 1. sc_30))))
; no offset
(assert (= (- (+ of_32 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_34 (* sc_32 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_34 0.))
; no scale
(assert (= sc_30 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_30 0.))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_33 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_32 (* 1. sc_33)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_32 (* 1. sc_31)) (= sc_32 (* (* 1. sc_30) sc_35))))
; no offset
(assert (= (- (+ of_32 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_35 (* sc_32 1.)))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_29 (* sc_32 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_29 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_29 0.124) of_29) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_29 0.124) of_29) 0.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vadd[1].D*0.)+of.vadd[1].D)+sl.min.vadd[1].D)} {0.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.))
; 
; =  {(((sc.vadd[1].D*12.616)+of.vadd[1].D)+sl.max.vadd[1].D)} {3300.}
(assert (= (+ (+ (* sc_30 12.616) of_30) sltop_30) 3300.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_31 0.) of_31) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_32 0.) of_32) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_35 1.) of_35) sltop_35) 3300.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[1].B*10.1)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_33 10.1) of_33) sltop_33) 3300.))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) -1650.))
; 
; =  {(((sc.vadd[1].OUT*12.616)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_34 12.616) of_34) sltop_34) 1650.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_35 1.) of_35) sltop_35) 3300.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_36 0.) of_36) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_37 0.) of_37) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_38 0.) of_38) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_39 0.) of_39) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_40 0.) of_40) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_41 0.) of_41) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.V[13].X*12.616)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_42 12.616) of_42) 3300.))
; 
; <=  {((sc.input.V[13].X*12.616)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_42 12.616) of_42) 0.))
; 
; >=  {((sc.input.V[13].O*12.616)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_43 12.616) of_43) 3300.))
; 
; <=  {((sc.input.V[13].O*12.616)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_43 12.616) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_44 0.) of_44) 3300.))
; 
; <=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_45 0.) of_45) 3300.))
; 
; <=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_46 0.) of_46) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_47 0.) of_47) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_48 10.1) of_48) 3300.))
; 
; <=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_48 10.1) of_48) 0.))
; 
; >=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_49 10.1) of_49) 3300.))
; 
; <=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_49 10.1) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_50 0.) of_50) 3300.))
; 
; <=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_51 0.) of_51) 3300.))
; 
; <=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_52 0.) of_52) 3300.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_53 0.) of_53) 3300.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.V[15].X*0.256)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_54 0.256) of_54) 3300.))
; 
; <=  {((sc.input.V[15].X*0.256)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_54 0.256) of_54) 0.))
; 
; >=  {((sc.input.V[15].O*0.256)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_55 0.256) of_55) 3300.))
; 
; <=  {((sc.input.V[15].O*0.256)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_55 0.256) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_56 0.) of_56) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_57 0.) of_57) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.V[14].X*12.616)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_58 12.616) of_58) 3300.))
; 
; <=  {((sc.input.V[14].X*12.616)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_58 12.616) of_58) 0.))
; 
; >=  {((sc.input.V[14].O*12.616)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_59 12.616) of_59) 3300.))
; 
; <=  {((sc.input.V[14].O*12.616)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_59 12.616) of_59) 0.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.V[16].X*0.124)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_60 0.124) of_60) 3300.))
; 
; <=  {((sc.input.V[16].X*0.124)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_60 0.124) of_60) 0.))
; 
; >=  {((sc.input.V[16].O*0.124)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_61 0.124) of_61) 3300.))
; 
; <=  {((sc.input.V[16].O*0.124)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_61 0.124) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_62 0.) of_62) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_63 0.) of_63) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_64 0.) of_64) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_65 0.) of_65) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_66 0.) of_66) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_67 0.) of_67) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.V[1].X*9.26)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_68 9.26) of_68) 3300.))
; 
; <=  {((sc.input.V[1].X*9.26)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_68 9.26) of_68) 0.))
; 
; >=  {((sc.input.V[1].O*9.26)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_69 9.26) of_69) 3300.))
; 
; <=  {((sc.input.V[1].O*9.26)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_69 9.26) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.V[17].X*0.84)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_70 0.84) of_70) 3300.))
; 
; <=  {((sc.input.V[17].X*0.84)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_70 0.84) of_70) 0.))
; 
; >=  {((sc.input.V[17].O*0.84)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_71 0.84) of_71) 3300.))
; 
; <=  {((sc.input.V[17].O*0.84)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_71 0.84) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_73 sc_72))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_73 of_72))
; 
; >=  {((sc.input.V[18].X*0.0396322130628)+of.input.V[18].X)} {3300.}
(assert (<= (+ (* sc_72 0.0396322130628) of_72) 3300.))
; 
; <=  {((sc.input.V[18].X*0.0396322130628)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_72 0.0396322130628) of_72) 0.))
; 
; >=  {((sc.input.V[18].O*0.0396322130628)+of.input.V[18].O)} {3300.}
(assert (<= (+ (* sc_73 0.0396322130628) of_73) 3300.))
; 
; <=  {((sc.input.V[18].O*0.0396322130628)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_73 0.0396322130628) of_73) 0.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; no offset
(assert (= of_75 0.))
; no offset
(assert (= of_74 0.))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_76 (* sc_75 sc_74)))
; 
; =  {of.itov[2].Y} {0.}
(assert (= of_76 0.))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X)} {0.0001}
(assert (= (+ (+ (* sc_74 0.) of_74) slbot_74) 0.0001))
; 
; =  {(((sc.itov[2].X*1.)+of.itov[2].X)+sl.max.itov[2].X)} {10.}
(assert (= (+ (+ (* sc_74 1.) of_74) sltop_74) 10.))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76) 0.0001))
; 
; =  {(((sc.itov[2].Y*12.616)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_76 12.616) of_76) sltop_76) 3300.))
; 
; >=  {((sc.itov[2].K*12.616)+of.itov[2].K)} {330.}
(assert (<= (+ (* sc_75 12.616) of_75) 330.))
; 
; <=  {((sc.itov[2].K*12.616)+of.itov[2].K)} {1.}
(assert (>= (+ (* sc_75 12.616) of_75) 1.))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76) 0.0001))
; 
; =  {(((sc.itov[2].Y*12.616)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_76 12.616) of_76) sltop_76) 3300.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; no offset
(assert (= of_78 0.))
; no offset
(assert (= of_77 0.))
; 
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_79 (* sc_78 sc_77)))
; 
; =  {of.itov[7].Y} {0.}
(assert (= of_79 0.))
(declare-fun slbot_77 () Real)
(declare-fun sltop_77 () Real)
; 
; =  {(((sc.itov[7].X*0.)+of.itov[7].X)+sl.min.itov[7].X)} {0.0001}
(assert (= (+ (+ (* sc_77 0.) of_77) slbot_77) 0.0001))
; 
; =  {(((sc.itov[7].X*1.)+of.itov[7].X)+sl.max.itov[7].X)} {10.}
(assert (= (+ (+ (* sc_77 1.) of_77) sltop_77) 10.))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79) 0.0001))
; 
; =  {(((sc.itov[7].Y*9.26)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_79 9.26) of_79) sltop_79) 3300.))
; 
; >=  {((sc.itov[7].K*9.26)+of.itov[7].K)} {330.}
(assert (<= (+ (* sc_78 9.26) of_78) 330.))
; 
; <=  {((sc.itov[7].K*9.26)+of.itov[7].K)} {1.}
(assert (>= (+ (* sc_78 9.26) of_78) 1.))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79) 0.0001))
; 
; =  {(((sc.itov[7].Y*9.26)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_79 9.26) of_79) sltop_79) 3300.))
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
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_82 (* sc_81 sc_80)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_82 0.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.itov[9].X*0.)+of.itov[9].X)+sl.min.itov[9].X)} {0.0001}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 0.0001))
; 
; =  {(((sc.itov[9].X*1.)+of.itov[9].X)+sl.max.itov[9].X)} {10.}
(assert (= (+ (+ (* sc_80 1.) of_80) sltop_80) 10.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) 0.0001))
; 
; =  {(((sc.itov[9].Y*12.616)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_82 12.616) of_82) sltop_82) 3300.))
; 
; >=  {((sc.itov[9].K*12.616)+of.itov[9].K)} {330.}
(assert (<= (+ (* sc_81 12.616) of_81) 330.))
; 
; <=  {((sc.itov[9].K*12.616)+of.itov[9].K)} {1.}
(assert (>= (+ (* sc_81 12.616) of_81) 1.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) 0.0001))
; 
; =  {(((sc.itov[9].Y*12.616)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_82 12.616) of_82) sltop_82) 3300.))
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
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_85 (* sc_84 sc_83)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_85 0.))
; 
; >=  {((sc.itov[0].X*10.1)+of.itov[0].X)} {10.}
(assert (<= (+ (* sc_83 10.1) of_83) 10.))
; 
; <=  {((sc.itov[0].X*10.1)+of.itov[0].X)} {0.0001}
(assert (>= (+ (* sc_83 10.1) of_83) 0.0001))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 0.0001))
; 
; =  {(((sc.itov[0].Y*10.1)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_85 10.1) of_85) sltop_85) 3300.))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.itov[0].K*0.)+of.itov[0].K)+sl.min.itov[0].K)} {1.}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84) 1.))
; 
; =  {(((sc.itov[0].K*1.)+of.itov[0].K)+sl.max.itov[0].K)} {330.}
(assert (= (+ (+ (* sc_84 1.) of_84) sltop_84) 330.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 0.0001))
; 
; =  {(((sc.itov[0].Y*10.1)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_85 10.1) of_85) sltop_85) 3300.))
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
; =  {sc.itov[3].Y} {(sc.itov[3].K*sc.itov[3].X)}
(assert (= sc_88 (* sc_87 sc_86)))
; 
; =  {of.itov[3].Y} {0.}
(assert (= of_88 0.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.itov[3].X*0.)+of.itov[3].X)+sl.min.itov[3].X)} {0.0001}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 0.0001))
; 
; =  {(((sc.itov[3].X*1.)+of.itov[3].X)+sl.max.itov[3].X)} {10.}
(assert (= (+ (+ (* sc_86 1.) of_86) sltop_86) 10.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.0001))
; 
; =  {(((sc.itov[3].Y*0.84)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_88 0.84) of_88) sltop_88) 3300.))
; 
; >=  {((sc.itov[3].K*0.84)+of.itov[3].K)} {330.}
(assert (<= (+ (* sc_87 0.84) of_87) 330.))
; 
; <=  {((sc.itov[3].K*0.84)+of.itov[3].K)} {1.}
(assert (>= (+ (* sc_87 0.84) of_87) 1.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.0001))
; 
; =  {(((sc.itov[3].Y*0.84)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_88 0.84) of_88) sltop_88) 3300.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].D}
(assert (= sc_76 sc_30))
; 
; =  {of.itov[2].Y} {of.vadd[1].D}
(assert (= of_76 of_30))
; 
; =  {sc.input.V[17].O} {sc.itov[3].K}
(assert (= sc_71 sc_87))
; 
; =  {of.input.V[17].O} {of.itov[3].K}
(assert (= of_71 of_87))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[0].X}
(assert (= sc_28 sc_6))
; 
; =  {of.vadd[4].OUT2} {of.output.V[0].X}
(assert (= of_28 of_6))
; 
; =  {sc.vadd[1].OUT2} {sc.vgain[5].X}
(assert (= sc_35 sc_0))
; 
; =  {of.vadd[1].OUT2} {of.vgain[5].X}
(assert (= of_35 of_0))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[9].X}
(assert (= sc_35 sc_80))
; 
; =  {of.vadd[1].OUT2} {of.itov[9].X}
(assert (= of_35 of_80))
; 
; =  {sc.input.I[0].O} {sc.itov[0].X}
(assert (= sc_5 sc_83))
; 
; =  {of.input.I[0].O} {of.itov[0].X}
(assert (= of_5 of_83))
; 
; =  {sc.input.V[9].O} {sc.vadd[6].A}
(assert (= sc_47 sc_18))
; 
; =  {of.input.V[9].O} {of.vadd[6].A}
(assert (= of_47 of_18))
; 
; =  {sc.input.V[15].O} {sc.vadd[8].OUT2_0}
(assert (= sc_55 sc_8))
; 
; =  {of.input.V[15].O} {of.vadd[8].OUT2_0}
(assert (= of_55 of_8))
; 
; =  {sc.input.V[13].O} {sc.itov[9].K}
(assert (= sc_43 sc_81))
; 
; =  {of.input.V[13].O} {of.itov[9].K}
(assert (= of_43 of_81))
; 
; =  {sc.input.V[14].O} {sc.itov[2].K}
(assert (= sc_59 sc_75))
; 
; =  {of.input.V[14].O} {of.itov[2].K}
(assert (= of_59 of_75))
; 
; =  {sc.input.V[11].O} {sc.vadd[8].C}
(assert (= sc_51 sc_10))
; 
; =  {of.input.V[11].O} {of.vadd[8].C}
(assert (= of_51 of_10))
; 
; =  {sc.input.V[8].O} {sc.vadd[6].OUT2_0}
(assert (= sc_39 sc_15))
; 
; =  {of.input.V[8].O} {of.vadd[6].OUT2_0}
(assert (= of_39 of_15))
; 
; =  {sc.input.V[12].O} {sc.vadd[8].A}
(assert (= sc_45 sc_11))
; 
; =  {of.input.V[12].O} {of.vadd[8].A}
(assert (= of_45 of_11))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_63 sc_32))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_63 of_32))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].C}
(assert (= sc_37 sc_31))
; 
; =  {of.input.V[2].O} {of.vadd[1].C}
(assert (= of_37 of_31))
; 
; =  {sc.itov[7].Y} {sc.vadd[8].B}
(assert (= sc_79 sc_12))
; 
; =  {of.itov[7].Y} {of.vadd[8].B}
(assert (= of_79 of_12))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_85 sc_33))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_85 of_33))
; 
; =  {sc.input.V[1].O} {sc.itov[7].K}
(assert (= sc_69 sc_78))
; 
; =  {of.input.V[1].O} {of.itov[7].K}
(assert (= of_69 of_78))
; 
; =  {sc.input.V[7].O} {sc.vadd[4].D}
(assert (= sc_41 sc_23))
; 
; =  {of.input.V[7].O} {of.vadd[4].D}
(assert (= of_41 of_23))
; 
; =  {sc.vadd[8].OUT2} {sc.vgain[5].Z}
(assert (= sc_14 sc_2))
; 
; =  {of.vadd[8].OUT2} {of.vgain[5].Z}
(assert (= of_14 of_2))
; 
; =  {sc.vadd[8].OUT2} {sc.itov[2].X}
(assert (= sc_14 sc_74))
; 
; =  {of.vadd[8].OUT2} {of.itov[2].X}
(assert (= of_14 of_74))
; 
; =  {sc.itov[3].Y} {sc.vadd[4].B}
(assert (= sc_88 sc_26))
; 
; =  {of.itov[3].Y} {of.vadd[4].B}
(assert (= of_88 of_26))
; 
; =  {sc.input.V[10].O} {sc.vadd[6].C}
(assert (= sc_53 sc_17))
; 
; =  {of.input.V[10].O} {of.vadd[6].C}
(assert (= of_53 of_17))
; 
; =  {sc.input.V[0].O} {sc.vadd[6].D}
(assert (= sc_49 sc_16))
; 
; =  {of.input.V[0].O} {of.vadd[6].D}
(assert (= of_49 of_16))
; 
; =  {sc.input.V[16].O} {sc.vadd[1].OUT2_0}
(assert (= sc_61 sc_29))
; 
; =  {of.input.V[16].O} {of.vadd[1].OUT2_0}
(assert (= of_61 of_29))
; 
; =  {sc.input.V[18].O} {sc.vgain[5].Y}
(assert (= sc_73 sc_1))
; 
; =  {of.input.V[18].O} {of.vgain[5].Y}
(assert (= of_73 of_1))
; 
; =  {sc.itov[9].Y} {sc.vadd[8].D}
(assert (= sc_82 sc_9))
; 
; =  {of.itov[9].Y} {of.vadd[8].D}
(assert (= of_82 of_9))
; 
; =  {sc.input.V[4].O} {sc.vadd[4].OUT2_0}
(assert (= sc_65 sc_22))
; 
; =  {of.input.V[4].O} {of.vadd[4].OUT2_0}
(assert (= of_65 of_22))
; 
; =  {sc.input.V[5].O} {sc.vadd[4].A}
(assert (= sc_67 sc_25))
; 
; =  {of.input.V[5].O} {of.vadd[4].A}
(assert (= of_67 of_25))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[3].X}
(assert (= sc_21 sc_86))
; 
; =  {of.vadd[6].OUT2} {of.itov[3].X}
(assert (= of_21 of_86))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[0].K}
(assert (= sc_21 sc_84))
; 
; =  {of.vadd[6].OUT2} {of.itov[0].K}
(assert (= of_21 of_84))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[7].X}
(assert (= sc_21 sc_77))
; 
; =  {of.vadd[6].OUT2} {of.itov[7].X}
(assert (= of_21 of_77))
; 
; =  {sc.input.V[6].O} {sc.vadd[4].C}
(assert (= sc_57 sc_24))
; 
; =  {of.input.V[6].O} {of.vadd[4].C}
(assert (= of_57 of_24))
; 
; =  {sc.vgain[5].P} {sc.vadd[6].B}
(assert (= sc_3 sc_19))
; 
; =  {of.vgain[5].P} {of.vadd[6].B}
(assert (= of_3 of_19))
(assert (<= (* sc_7 0.001) 0.1))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[0].O} {sc.vadd[8].OUT2} {sc.vadd[1].OUT2} {sc.vadd[6].OUT2}
(assert (and (and (and (= sc_28 sc_7) (= sc_28 sc_14)) (= sc_28 sc_35)) (= sc_28 sc_21)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_77 0.) sltop_77 (- sltop_77)) (ite (>= slbot_0 0.) slbot_0 (- slbot_0))) (ite (>= slbot_14 0.) slbot_14 (- slbot_14))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= sltop_14 0.) sltop_14 (- sltop_14))) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= slbot_35 0.) slbot_35 (- slbot_35))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= sltop_0 0.) sltop_0 (- sltop_0))) (ite (>= slbot_20 0.) slbot_20 (- slbot_20))) (ite (>= sltop_27 0.) sltop_27 (- sltop_27))) (ite (>= sltop_76 0.) sltop_76 (- sltop_76))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_19 0.) slbot_19 (- slbot_19))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= slbot_84 0.) slbot_84 (- slbot_84))) (ite (>= sltop_28 0.) sltop_28 (- sltop_28))) (ite (>= slbot_26 0.) slbot_26 (- slbot_26))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_76 0.) slbot_76 (- slbot_76))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= sltop_82 0.) sltop_82 (- sltop_82))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= slbot_82 0.) slbot_82 (- slbot_82))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_20 0.) sltop_20 (- sltop_20))) (ite (>= slbot_28 0.) slbot_28 (- slbot_28))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= sltop_74 0.) sltop_74 (- sltop_74))) (ite (>= slbot_21 0.) slbot_21 (- slbot_21))) (ite (>= sltop_34 0.) sltop_34 (- sltop_34))) (ite (>= slbot_30 0.) slbot_30 (- slbot_30))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= sltop_19 0.) sltop_19 (- sltop_19))) (ite (>= sltop_30 0.) sltop_30 (- sltop_30))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= slbot_74 0.) slbot_74 (- slbot_74))) (ite (>= slbot_77 0.) slbot_77 (- slbot_77))) (ite (>= slbot_34 0.) slbot_34 (- slbot_34))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_26 0.) sltop_26 (- sltop_26))) (ite (>= sltop_35 0.) sltop_35 (- sltop_35))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= slbot_27 0.) slbot_27 (- slbot_27))) (ite (>= sltop_84 0.) sltop_84 (- sltop_84))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= slbot_33 0.) slbot_33 (- slbot_33))) (ite (>= sltop_33 0.) sltop_33 (- sltop_33))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= sltop_21 0.) sltop_21 (- sltop_21)))))
(check-sat)
