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
(declare-fun sc_6 () Real)
(assert (> sc_6 1e-08))
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
; no offset
(assert (= of_4 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_5 0.))
; no offset
(assert (= of_6 0.))
; 
; =  {(sc.switch[0].SUB/sc.switch[0].Kmod)} {1.}
(assert (= (/ sc_5 sc_6) 1.))
; no scale
(assert (= (/ sc_5 sc_6) 1.))
; no scale
(assert (= (/ sc_4 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_7 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[0].PROD} {(sc.switch[0].Vmax/1.)}
(assert (= sc_8 (/ sc_7 1.)))
; 
; =  {of.switch[0].PROD} {0.}
(assert (= of_8 0.))
; 
; >=  {((sc.switch[0].n*-500.)+of.switch[0].n)} {3300.}
(assert (<= (+ (* sc_4 -500.) of_4) 3300.))
; 
; <=  {((sc.switch[0].n*-500.)+of.switch[0].n)} {0.5}
(assert (>= (+ (* sc_4 -500.) of_4) 0.5))
; 
; >=  {((sc.switch[0].SUB*1.)+of.switch[0].SUB)} {10.}
(assert (<= (+ (* sc_5 1.) of_5) 10.))
; 
; <=  {((sc.switch[0].SUB*1.)+of.switch[0].SUB)} {0.0001}
(assert (>= (+ (* sc_5 1.) of_5) 0.0001))
; 
; >=  {((sc.switch[0].Kmod*-0.5)+of.switch[0].Kmod)} {10.}
(assert (<= (+ (* sc_6 -0.5) of_6) 10.))
; 
; <=  {((sc.switch[0].Kmod*-0.5)+of.switch[0].Kmod)} {0.0001}
(assert (>= (+ (* sc_6 -0.5) of_6) 0.0001))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[0].PROD*-0.11)+of.switch[0].PROD)+sl.min.switch[0].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 -0.11) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[0].PROD*0.)+of.switch[0].PROD)+sl.max.switch[0].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 0.) of_8) sltop_8) 9.9999999))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.switch[0].Vmax*0.)+of.switch[0].Vmax)+sl.min.switch[0].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 0.0001))
; 
; =  {(((sc.switch[0].Vmax*0.11)+of.switch[0].Vmax)+sl.max.switch[0].Vmax)} {10.}
(assert (= (+ (+ (* sc_7 0.11) of_7) sltop_7) 10.))
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_10 sc_9))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_10 of_9))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_9 0.) of_9) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_9 0.) of_9) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_10 0.) of_10) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_10 0.) of_10) 0.))
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_12 sc_11))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_12 of_11))
; 
; >=  {((sc.input.I[7].X*1.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_11 1.) of_11) 10.))
; 
; <=  {((sc.input.I[7].X*1.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_11 1.) of_11) 0.))
; 
; >=  {((sc.input.I[7].O*1.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_12 1.) of_12) 10.))
; 
; <=  {((sc.input.I[7].O*1.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_12 1.) of_12) 0.))
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_14 sc_13))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_14 of_13))
; 
; >=  {((sc.input.I[0].X*-0.11)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_13 -0.11) of_13) 10.))
; 
; <=  {((sc.input.I[0].X*-0.11)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_13 -0.11) of_13) 0.))
; 
; >=  {((sc.input.I[0].O*-0.11)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_14 -0.11) of_14) 10.))
; 
; <=  {((sc.input.I[0].O*-0.11)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_14 -0.11) of_14) 0.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[6].X*-0.5)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_15 -0.5) of_15) 10.))
; 
; <=  {((sc.input.I[6].X*-0.5)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_15 -0.5) of_15) 0.))
; 
; >=  {((sc.input.I[6].O*-0.5)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_16 -0.5) of_16) 10.))
; 
; <=  {((sc.input.I[6].O*-0.5)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_16 -0.5) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_17 0.) of_17) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_18 0.) of_18) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_22 sc_21))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_22 of_21))
; 
; >=  {((sc.input.I[5].X*0.15)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_21 0.15) of_21) 10.))
; 
; <=  {((sc.input.I[5].X*0.15)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_21 0.15) of_21) 0.))
; 
; >=  {((sc.input.I[5].O*0.15)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_22 0.15) of_22) 10.))
; 
; <=  {((sc.input.I[5].O*0.15)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_22 0.15) of_22) 0.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_24 sc_23))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_24 of_23))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_23 0.) of_23) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_24 0.) of_24) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_26 sc_25))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_26 of_25))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 0.0001))
; 
; =  {(((sc.output.V[0].X*0.11)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_25 0.11) of_25) sltop_25) 3300.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.11)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_26 0.11) of_26) sltop_26) 3300.))
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
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_30 (* 1. sc_31)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D)}
(assert (and (= sc_30 (* 1. sc_29)) (= sc_30 (* 1. sc_28))))
; no offset
(assert (= (- (+ of_30 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT} {(sc.vadd[3].A*1.)}
(assert (= sc_32 (* sc_30 1.)))
; 
; =  {of.vadd[3].OUT} {0.}
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
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_30 (* 1. sc_31)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D*sc.vadd[3].OUT2)}
(assert (and (= sc_30 (* 1. sc_29)) (= sc_30 (* (* 1. sc_28) sc_33))))
; no offset
(assert (= (- (+ of_30 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2} {(sc.vadd[3].A*1.)}
(assert (= sc_33 (* sc_30 1.)))
; no offset
(assert (= of_33 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2_0} {(sc.vadd[3].A*1.)}
(assert (= sc_27 (* sc_30 1.)))
; 
; =  {of.vadd[3].OUT2_0} {0.}
(assert (= of_27 0.))
; 
; >=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {3300.}
(assert (<= (+ (* sc_27 0.) of_27) 3300.))
; 
; <=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {3300.}
(assert (<= (+ (* sc_28 4.) of_28) 3300.))
; 
; <=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {0.}
(assert (>= (+ (* sc_28 4.) of_28) 0.))
; 
; >=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {3300.}
(assert (<= (+ (* sc_29 0.) of_29) 3300.))
; 
; <=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
; 
; >=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {3300.}
(assert (<= (+ (* sc_30 0.) of_30) 3300.))
; 
; <=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[3].OUT2*0.11)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_33 0.11) of_33) sltop_33) 3300.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vadd[3].B*0.)+of.vadd[3].B)+sl.min.vadd[3].B)} {0.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.))
; 
; =  {(((sc.vadd[3].B*0.066)+of.vadd[3].B)+sl.max.vadd[3].B)} {3300.}
(assert (= (+ (+ (* sc_31 0.066) of_31) sltop_31) 3300.))
(declare-fun slbot_32 () Real)
(declare-fun sltop_32 () Real)
; 
; =  {(((sc.vadd[3].OUT*0.)+of.vadd[3].OUT)+sl.min.vadd[3].OUT)} {-1650.}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32) -1650.))
; 
; =  {(((sc.vadd[3].OUT*0.066)+of.vadd[3].OUT)+sl.max.vadd[3].OUT)} {1650.}
(assert (= (+ (+ (* sc_32 0.066) of_32) sltop_32) 1650.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[3].OUT2*0.11)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_33 0.11) of_33) sltop_33) 3300.))
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
(assert (= of_35 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_34 0.))
; 
; =  {sc.vtoi[0].Y} {((1./sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_36 (* (/ 1. sc_35) sc_34)))
; 
; =  {of.vtoi[0].Y} {0.}
(assert (= of_36 0.))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) 1.))
; 
; =  {(((sc.vtoi[0].X*0.11)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_34 0.11) of_34) sltop_34) 3300.))
; 
; >=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_35 1.) of_35) 3300.))
; 
; <=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_35 1.) of_35) 1.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*0.11)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_36 0.11) of_36) sltop_36) 3300.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_37 0.) of_37) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_38 0.) of_38) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_40 of_39))
; 
; >=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_39 0.125) of_39) 3300.))
; 
; <=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_39 0.125) of_39) 0.))
; 
; >=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_40 0.125) of_40) 3300.))
; 
; <=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_40 0.125) of_40) 0.))
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_42 of_41))
; 
; >=  {((sc.input.V[6].X*1.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_41 1.) of_41) 3300.))
; 
; <=  {((sc.input.V[6].X*1.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_41 1.) of_41) 0.))
; 
; >=  {((sc.input.V[6].O*1.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_42 1.) of_42) 3300.))
; 
; <=  {((sc.input.V[6].O*1.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_42 1.) of_42) 0.))
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_44 of_43))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_43 0.) of_43) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_44 0.) of_44) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_46 of_45))
; 
; >=  {((sc.input.V[4].X*-500.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_45 -500.) of_45) 3300.))
; 
; <=  {((sc.input.V[4].X*-500.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_45 -500.) of_45) 0.))
; 
; >=  {((sc.input.V[4].O*-500.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_46 -500.) of_46) 3300.))
; 
; <=  {((sc.input.V[4].O*-500.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_46 -500.) of_46) 0.))
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_48 of_47))
; 
; >=  {((sc.input.V[5].X*4.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_47 4.) of_47) 3300.))
; 
; <=  {((sc.input.V[5].X*4.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_47 4.) of_47) 0.))
; 
; >=  {((sc.input.V[5].O*4.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_48 4.) of_48) 3300.))
; 
; <=  {((sc.input.V[5].O*4.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_48 4.) of_48) 0.))
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_50 sc_49))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_50 of_49))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_49 0.) of_49) 3300.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_50 0.) of_50) 3300.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
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
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.iadd[4].A} {sc.iadd[4].B}
(assert (= sc_53 sc_54))
; 
; =  {sc.iadd[4].A} {sc.iadd[4].C} {sc.iadd[4].D}
(assert (and (= sc_53 sc_52) (= sc_53 sc_51)))
; 
; =  {sc.iadd[4].OUT} {sc.iadd[4].A}
(assert (= sc_55 sc_53))
; 
; =  {of.iadd[4].OUT} {((of.iadd[4].A+of.iadd[4].B)-of.iadd[4].C-of.iadd[4].D)}
(assert (= of_55 (- (+ of_53 of_54) (+ of_52 of_51))))
(declare-fun slbot_51 () Real)
(declare-fun sltop_51 () Real)
; 
; =  {(((sc.iadd[4].D*0.)+of.iadd[4].D)+sl.min.iadd[4].D)} {0.}
(assert (= (+ (+ (* sc_51 0.) of_51) slbot_51) 0.))
; 
; =  {(((sc.iadd[4].D*0.11)+of.iadd[4].D)+sl.max.iadd[4].D)} {5.}
(assert (= (+ (+ (* sc_51 0.11) of_51) sltop_51) 5.))
; 
; >=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {5.}
(assert (<= (+ (* sc_52 0.) of_52) 5.))
; 
; <=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55) -10.))
; 
; =  {(((sc.iadd[4].OUT*0.15)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_55 0.15) of_55) sltop_55) 10.))
; 
; >=  {((sc.iadd[4].A*0.15)+of.iadd[4].A)} {5.}
(assert (<= (+ (* sc_53 0.15) of_53) 5.))
; 
; <=  {((sc.iadd[4].A*0.15)+of.iadd[4].A)} {0.}
(assert (>= (+ (* sc_53 0.15) of_53) 0.))
; 
; >=  {((sc.iadd[4].B*0.)+of.iadd[4].B)} {5.}
(assert (<= (+ (* sc_54 0.) of_54) 5.))
; 
; <=  {((sc.iadd[4].B*0.)+of.iadd[4].B)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55) -10.))
; 
; =  {(((sc.iadd[4].OUT*0.15)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_55 0.15) of_55) sltop_55) 10.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
; 
; =  {sc.iadd[1].A} {sc.iadd[1].B}
(assert (= sc_58 sc_59))
; 
; =  {sc.iadd[1].A} {sc.iadd[1].C} {sc.iadd[1].D}
(assert (and (= sc_58 sc_57) (= sc_58 sc_56)))
; 
; =  {sc.iadd[1].OUT} {sc.iadd[1].A}
(assert (= sc_60 sc_58))
; 
; =  {of.iadd[1].OUT} {((of.iadd[1].A+of.iadd[1].B)-of.iadd[1].C-of.iadd[1].D)}
(assert (= of_60 (- (+ of_58 of_59) (+ of_57 of_56))))
; 
; >=  {((sc.iadd[1].D*-0.11)+of.iadd[1].D)} {5.}
(assert (<= (+ (* sc_56 -0.11) of_56) 5.))
; 
; <=  {((sc.iadd[1].D*-0.11)+of.iadd[1].D)} {0.}
(assert (>= (+ (* sc_56 -0.11) of_56) 0.))
; 
; >=  {((sc.iadd[1].C*0.)+of.iadd[1].C)} {5.}
(assert (<= (+ (* sc_57 0.) of_57) 5.))
; 
; <=  {((sc.iadd[1].C*0.)+of.iadd[1].C)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_60 0.) of_60) slbot_60) -10.))
; 
; =  {(((sc.iadd[1].OUT*0.11)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_60 0.11) of_60) sltop_60) 10.))
; 
; >=  {((sc.iadd[1].A*0.)+of.iadd[1].A)} {5.}
(assert (<= (+ (* sc_58 0.) of_58) 5.))
; 
; <=  {((sc.iadd[1].A*0.)+of.iadd[1].A)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.iadd[1].B*-0.11)+of.iadd[1].B)+sl.min.iadd[1].B)} {0.}
(assert (= (+ (+ (* sc_59 -0.11) of_59) slbot_59) 0.))
; 
; =  {(((sc.iadd[1].B*0.)+of.iadd[1].B)+sl.max.iadd[1].B)} {5.}
(assert (= (+ (+ (* sc_59 0.) of_59) sltop_59) 5.))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_60 0.) of_60) slbot_60) -10.))
; 
; =  {(((sc.iadd[1].OUT*0.11)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_60 0.11) of_60) sltop_60) 10.))
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_62 sc_61))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_62 of_61))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_61 0.) of_61) slbot_61) 0.))
; 
; =  {(((sc.output.I[0].X*0.11)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_61 0.11) of_61) sltop_61) 10.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_62 0.) of_62) slbot_62) 0.))
; 
; =  {(((sc.output.I[0].O*0.11)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_62 0.11) of_62) sltop_62) 10.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; 
; =  {sc.output.I[1].O} {sc.output.I[1].X}
(assert (= sc_64 sc_63))
; 
; =  {of.output.I[1].O} {of.output.I[1].X}
(assert (= of_64 of_63))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.output.I[1].X*0.)+of.output.I[1].X)+sl.min.output.I[1].X)} {0.}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63) 0.))
; 
; =  {(((sc.output.I[1].X*0.15)+of.output.I[1].X)+sl.max.output.I[1].X)} {10.}
(assert (= (+ (+ (* sc_63 0.15) of_63) sltop_63) 10.))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.output.I[1].O*0.)+of.output.I[1].O)+sl.min.output.I[1].O)} {0.}
(assert (= (+ (+ (* sc_64 0.) of_64) slbot_64) 0.))
; 
; =  {(((sc.output.I[1].O*0.15)+of.output.I[1].O)+sl.max.output.I[1].O)} {10.}
(assert (= (+ (+ (* sc_64 0.15) of_64) sltop_64) 10.))
; 
; =  {sc.input.I[6].O} {sc.switch[0].Kmod}
(assert (= sc_16 sc_6))
; 
; =  {of.input.I[6].O} {of.switch[0].Kmod}
(assert (= of_16 of_6))
; 
; =  {sc.input.I[0].O} {sc.iadd[1].D}
(assert (= sc_14 sc_56))
; 
; =  {of.input.I[0].O} {of.iadd[1].D}
(assert (= of_14 of_56))
; 
; =  {sc.iadd[4].OUT} {sc.vgain[2].X}
(assert (= sc_55 sc_0))
; 
; =  {of.iadd[4].OUT} {of.vgain[2].X}
(assert (= of_55 of_0))
; 
; =  {sc.iadd[4].OUT} {sc.output.I[1].X}
(assert (= sc_55 sc_63))
; 
; =  {of.iadd[4].OUT} {of.output.I[1].X}
(assert (= of_55 of_63))
; 
; =  {sc.input.I[3].O} {sc.iadd[4].B}
(assert (= sc_18 sc_54))
; 
; =  {of.input.I[3].O} {of.iadd[4].B}
(assert (= of_18 of_54))
; 
; =  {sc.input.I[4].O} {sc.iadd[4].C}
(assert (= sc_20 sc_52))
; 
; =  {of.input.I[4].O} {of.iadd[4].C}
(assert (= of_20 of_52))
; 
; =  {sc.switch[0].PROD} {sc.iadd[1].B}
(assert (= sc_8 sc_59))
; 
; =  {of.switch[0].PROD} {of.iadd[1].B}
(assert (= of_8 of_59))
; 
; =  {sc.input.I[5].O} {sc.iadd[4].A}
(assert (= sc_22 sc_53))
; 
; =  {of.input.I[5].O} {of.iadd[4].A}
(assert (= of_22 of_53))
; 
; =  {sc.vtoi[0].Y} {sc.iadd[4].D}
(assert (= sc_36 sc_51))
; 
; =  {of.vtoi[0].Y} {of.iadd[4].D}
(assert (= of_36 of_51))
; 
; =  {sc.input.I[2].O} {sc.iadd[1].C}
(assert (= sc_10 sc_57))
; 
; =  {of.input.I[2].O} {of.iadd[1].C}
(assert (= of_10 of_57))
; 
; =  {sc.input.V[3].O} {sc.vadd[3].A}
(assert (= sc_44 sc_30))
; 
; =  {of.input.V[3].O} {of.vadd[3].A}
(assert (= of_44 of_30))
; 
; =  {sc.input.V[2].O} {sc.vadd[3].C}
(assert (= sc_38 sc_29))
; 
; =  {of.input.V[2].O} {of.vadd[3].C}
(assert (= of_38 of_29))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].X}
(assert (= sc_33 sc_25))
; 
; =  {of.vadd[3].OUT2} {of.output.V[0].X}
(assert (= of_33 of_25))
; 
; =  {sc.vadd[3].OUT2} {sc.vtoi[0].X}
(assert (= sc_33 sc_34))
; 
; =  {of.vadd[3].OUT2} {of.vtoi[0].X}
(assert (= of_33 of_34))
; 
; =  {sc.vadd[3].OUT2} {sc.switch[0].Vmax}
(assert (= sc_33 sc_7))
; 
; =  {of.vadd[3].OUT2} {of.switch[0].Vmax}
(assert (= of_33 of_7))
; 
; =  {sc.input.I[1].O} {sc.iadd[1].A}
(assert (= sc_24 sc_58))
; 
; =  {of.input.I[1].O} {of.iadd[1].A}
(assert (= of_24 of_58))
; 
; =  {sc.iadd[1].OUT} {sc.output.I[0].X}
(assert (= sc_60 sc_61))
; 
; =  {of.iadd[1].OUT} {of.output.I[0].X}
(assert (= of_60 of_61))
; 
; =  {sc.iadd[1].OUT} {sc.vgain[2].Z}
(assert (= sc_60 sc_2))
; 
; =  {of.iadd[1].OUT} {of.vgain[2].Z}
(assert (= of_60 of_2))
; 
; =  {sc.input.I[7].O} {sc.switch[0].SUB}
(assert (= sc_12 sc_5))
; 
; =  {of.input.I[7].O} {of.switch[0].SUB}
(assert (= of_12 of_5))
; 
; =  {sc.input.V[1].O} {sc.vadd[3].OUT2_0}
(assert (= sc_50 sc_27))
; 
; =  {of.input.V[1].O} {of.vadd[3].OUT2_0}
(assert (= of_50 of_27))
; 
; =  {sc.input.V[0].O} {sc.vgain[2].Y}
(assert (= sc_40 sc_1))
; 
; =  {of.input.V[0].O} {of.vgain[2].Y}
(assert (= of_40 of_1))
; 
; =  {sc.input.V[4].O} {sc.switch[0].n}
(assert (= sc_46 sc_4))
; 
; =  {of.input.V[4].O} {of.switch[0].n}
(assert (= of_46 of_4))
; 
; =  {sc.input.V[5].O} {sc.vadd[3].D}
(assert (= sc_48 sc_28))
; 
; =  {of.input.V[5].O} {of.vadd[3].D}
(assert (= of_48 of_28))
; 
; =  {sc.input.V[6].O} {sc.vtoi[0].K}
(assert (= sc_42 sc_35))
; 
; =  {of.input.V[6].O} {of.vtoi[0].K}
(assert (= of_42 of_35))
; 
; =  {sc.vgain[2].P} {sc.vadd[3].B}
(assert (= sc_3 sc_31))
; 
; =  {of.vgain[2].P} {of.vadd[3].B}
(assert (= of_3 of_31))
(assert (<= (* (/ 1. sc_26) 0.001) 0.001))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].O}
(assert (= sc_33 sc_26))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_36 0.) sltop_36 (- sltop_36)) (ite (>= slbot_0 0.) slbot_0 (- slbot_0))) (ite (>= slbot_32 0.) slbot_32 (- slbot_32))) (ite (>= sltop_32 0.) sltop_32 (- sltop_32))) (ite (>= sltop_55 0.) sltop_55 (- sltop_55))) (ite (>= sltop_0 0.) sltop_0 (- sltop_0))) (ite (>= slbot_60 0.) slbot_60 (- slbot_60))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_63 0.) slbot_63 (- slbot_63))) (ite (>= slbot_26 0.) slbot_26 (- slbot_26))) (ite (>= slbot_59 0.) slbot_59 (- slbot_59))) (ite (>= slbot_64 0.) slbot_64 (- slbot_64))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_61 0.) slbot_61 (- slbot_61))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= slbot_31 0.) slbot_31 (- slbot_31))) (ite (>= slbot_36 0.) slbot_36 (- slbot_36))) (ite (>= slbot_25 0.) slbot_25 (- slbot_25))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_31 0.) sltop_31 (- sltop_31))) (ite (>= sltop_62 0.) sltop_62 (- sltop_62))) (ite (>= slbot_55 0.) slbot_55 (- slbot_55))) (ite (>= slbot_62 0.) slbot_62 (- slbot_62))) (ite (>= slbot_51 0.) slbot_51 (- slbot_51))) (ite (>= sltop_51 0.) sltop_51 (- sltop_51))) (ite (>= sltop_34 0.) sltop_34 (- sltop_34))) (ite (>= sltop_60 0.) sltop_60 (- sltop_60))) (ite (>= sltop_64 0.) sltop_64 (- sltop_64))) (ite (>= sltop_61 0.) sltop_61 (- sltop_61))) (ite (>= sltop_25 0.) sltop_25 (- sltop_25))) (ite (>= slbot_34 0.) slbot_34 (- slbot_34))) (ite (>= sltop_63 0.) sltop_63 (- sltop_63))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_26 0.) sltop_26 (- sltop_26))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= slbot_33 0.) slbot_33 (- slbot_33))) (ite (>= sltop_33 0.) sltop_33 (- sltop_33))) (ite (>= sltop_59 0.) sltop_59 (- sltop_59)))))
(check-sat)
