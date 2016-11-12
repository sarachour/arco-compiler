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
; =  {sc.vgain[4].P} {((sc.vgain[4].X/sc.vgain[4].Y)*sc.vgain[4].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[4].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[4].X*1.)+of.vgain[4].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[4].X*1.)+of.vgain[4].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[4].Y*0.125)+of.vgain[4].Y)} {3300.}
(assert (<= (+ (* sc_1 0.125) of_1) 3300.))
; 
; <=  {((sc.vgain[4].Y*0.125)+of.vgain[4].Y)} {1.}
(assert (>= (+ (* sc_1 0.125) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[4].P*3.75903614458)+of.vgain[4].P)+sl.min.vgain[4].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 3.75903614458) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[4].P*62.4)+of.vgain[4].P)+sl.max.vgain[4].P)} {5445000.}
(assert (= (+ (+ (* sc_3 62.4) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[4].Z*0.939759036145)+of.vgain[4].Z)+sl.min.vgain[4].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.939759036145) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[4].Z*15.6)+of.vgain[4].Z)+sl.max.vgain[4].Z)} {3300.}
(assert (= (+ (+ (* sc_2 15.6) of_2) sltop_2) 3300.))
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
; =  {(sc.switch[3].SUB/sc.switch[3].Kmod)} {1.}
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
; =  {sc.switch[3].PROD} {(sc.switch[3].Vmax/1.)}
(assert (= sc_8 (/ sc_7 1.)))
; 
; =  {of.switch[3].PROD} {0.}
(assert (= of_8 0.))
; 
; >=  {((sc.switch[3].n*1000.75)+of.switch[3].n)} {3300.}
(assert (<= (+ (* sc_4 1000.75) of_4) 3300.))
; 
; <=  {((sc.switch[3].n*1000.75)+of.switch[3].n)} {0.5}
(assert (>= (+ (* sc_4 1000.75) of_4) 0.5))
; 
; >=  {((sc.switch[3].SUB*337.632520764)+of.switch[3].SUB)} {10.}
(assert (<= (+ (* sc_5 337.632520764) of_5) 10.))
; 
; <=  {((sc.switch[3].SUB*337.632520764)+of.switch[3].SUB)} {0.0001}
(assert (>= (+ (* sc_5 337.632520764) of_5) 0.0001))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.switch[3].Kmod*0.)+of.switch[3].Kmod)+sl.min.switch[3].Kmod)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.switch[3].Kmod*1.66666666667)+of.switch[3].Kmod)+sl.max.switch[3].Kmod)} {10.}
(assert (= (+ (+ (* sc_6 1.66666666667) of_6) sltop_6) 10.))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[3].PROD*0.)+of.switch[3].PROD)+sl.min.switch[3].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[3].PROD*15.6)+of.switch[3].PROD)+sl.max.switch[3].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 15.6) of_8) sltop_8) 9.9999999))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.switch[3].Vmax*0.)+of.switch[3].Vmax)+sl.min.switch[3].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 0.0001))
; 
; =  {(((sc.switch[3].Vmax*15.6)+of.switch[3].Vmax)+sl.max.switch[3].Vmax)} {10.}
(assert (= (+ (+ (* sc_7 15.6) of_7) sltop_7) 10.))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[3].PROD*0.)+of.switch[3].PROD)+sl.min.switch[3].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[3].PROD*15.6)+of.switch[3].PROD)+sl.max.switch[3].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 15.6) of_8) sltop_8) 9.9999999))
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
; >=  {((sc.input.I[2].X*15.6)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_9 15.6) of_9) 10.))
; 
; <=  {((sc.input.I[2].X*15.6)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_9 15.6) of_9) 0.))
; 
; >=  {((sc.input.I[2].O*15.6)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_10 15.6) of_10) 10.))
; 
; <=  {((sc.input.I[2].O*15.6)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_10 15.6) of_10) 0.))
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_12 sc_11))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_12 of_11))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_11 0.) of_11) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_12 0.) of_12) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_14 sc_13))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_14 of_13))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_13 0.) of_13) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[11].X*1.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_15 1.) of_15) 10.))
; 
; <=  {((sc.input.I[11].X*1.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_15 1.) of_15) 0.))
; 
; >=  {((sc.input.I[11].O*1.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_16 1.) of_16) 10.))
; 
; <=  {((sc.input.I[11].O*1.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_16 1.) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_17 156.25) of_17) 10.))
; 
; <=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_17 156.25) of_17) 0.))
; 
; >=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_18 156.25) of_18) 10.))
; 
; <=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_18 156.25) of_18) 0.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_22 sc_21))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_22 of_21))
; 
; >=  {((sc.input.I[3].X*4.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_21 4.) of_21) 10.))
; 
; <=  {((sc.input.I[3].X*4.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_21 4.) of_21) 0.))
; 
; >=  {((sc.input.I[3].O*4.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_22 4.) of_22) 10.))
; 
; <=  {((sc.input.I[3].O*4.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_22 4.) of_22) 0.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_24 sc_23))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_24 of_23))
; 
; >=  {((sc.input.I[4].X*1.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_23 1.) of_23) 10.))
; 
; <=  {((sc.input.I[4].X*1.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_23 1.) of_23) 0.))
; 
; >=  {((sc.input.I[4].O*1.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_24 1.) of_24) 10.))
; 
; <=  {((sc.input.I[4].O*1.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_24 1.) of_24) 0.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_26 sc_25))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_26 of_25))
; 
; >=  {((sc.input.I[1].X*337.632520764)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_25 337.632520764) of_25) 10.))
; 
; <=  {((sc.input.I[1].X*337.632520764)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_25 337.632520764) of_25) 0.))
; 
; >=  {((sc.input.I[1].O*337.632520764)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_26 337.632520764) of_26) 10.))
; 
; <=  {((sc.input.I[1].O*337.632520764)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_26 337.632520764) of_26) 0.))
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_28 sc_27))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_28 of_27))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_27 156.25) of_27) sltop_27) 3300.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_28 156.25) of_28) sltop_28) 3300.))
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_30 sc_29))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_30 of_29))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_29 15.6) of_29) sltop_29) 3300.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_30 15.6) of_30) sltop_30) 3300.))
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
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].B)}
(assert (= sc_34 (* 1. sc_35)))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].C)} {(1.*sc.vadd[7].D)}
(assert (and (= sc_34 (* 1. sc_33)) (= sc_34 (* 1. sc_32))))
; no offset
(assert (= (- (+ of_34 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT} {(sc.vadd[7].A*1.)}
(assert (= sc_36 (* sc_34 1.)))
; 
; =  {of.vadd[7].OUT} {0.}
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
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].B)}
(assert (= sc_34 (* 1. sc_35)))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].C)} {(1.*sc.vadd[7].D*sc.vadd[7].OUT2)}
(assert (and (= sc_34 (* 1. sc_33)) (= sc_34 (* (* 1. sc_32) sc_37))))
; no offset
(assert (= (- (+ of_34 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT2} {(sc.vadd[7].A*1.)}
(assert (= sc_37 (* sc_34 1.)))
; no offset
(assert (= of_37 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT2_0} {(sc.vadd[7].A*1.)}
(assert (= sc_31 (* sc_34 1.)))
; 
; =  {of.vadd[7].OUT2_0} {0.}
(assert (= of_31 0.))
; 
; >=  {((sc.vadd[7].OUT2_0*0.)+of.vadd[7].OUT2_0)} {3300.}
(assert (<= (+ (* sc_31 0.) of_31) 3300.))
; 
; <=  {((sc.vadd[7].OUT2_0*0.)+of.vadd[7].OUT2_0)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.vadd[7].D*4.)+of.vadd[7].D)} {3300.}
(assert (<= (+ (* sc_32 4.) of_32) 3300.))
; 
; <=  {((sc.vadd[7].D*4.)+of.vadd[7].D)} {0.}
(assert (>= (+ (* sc_32 4.) of_32) 0.))
; 
; >=  {((sc.vadd[7].C*0.)+of.vadd[7].C)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.vadd[7].C*0.)+of.vadd[7].C)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.vadd[7].A*0.)+of.vadd[7].A)} {3300.}
(assert (<= (+ (* sc_34 0.) of_34) 3300.))
; 
; <=  {((sc.vadd[7].A*0.)+of.vadd[7].A)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.vadd[7].OUT2*0.)+of.vadd[7].OUT2)+sl.min.vadd[7].OUT2)} {0.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) 0.))
; 
; =  {(((sc.vadd[7].OUT2*15.6)+of.vadd[7].OUT2)+sl.max.vadd[7].OUT2)} {3300.}
(assert (= (+ (+ (* sc_37 15.6) of_37) sltop_37) 3300.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.vadd[7].B*0.00204799328914)+of.vadd[7].B)+sl.min.vadd[7].B)} {0.}
(assert (= (+ (+ (* sc_35 0.00204799328914) of_35) slbot_35) 0.))
; 
; =  {(((sc.vadd[7].B*625.)+of.vadd[7].B)+sl.max.vadd[7].B)} {3300.}
(assert (= (+ (+ (* sc_35 625.) of_35) sltop_35) 3300.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vadd[7].OUT*0.00204799328914)+of.vadd[7].OUT)+sl.min.vadd[7].OUT)} {-1650.}
(assert (= (+ (+ (* sc_36 0.00204799328914) of_36) slbot_36) -1650.))
; 
; =  {(((sc.vadd[7].OUT*625.)+of.vadd[7].OUT)+sl.max.vadd[7].OUT)} {1650.}
(assert (= (+ (+ (* sc_36 625.) of_36) sltop_36) 1650.))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.vadd[7].OUT2*0.)+of.vadd[7].OUT2)+sl.min.vadd[7].OUT2)} {0.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) 0.))
; 
; =  {(((sc.vadd[7].OUT2*15.6)+of.vadd[7].OUT2)+sl.max.vadd[7].OUT2)} {3300.}
(assert (= (+ (+ (* sc_37 15.6) of_37) sltop_37) 3300.))
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
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_41 (* 1. sc_42)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_41 (* 1. sc_40)) (= sc_41 (* 1. sc_39))))
; no offset
(assert (= (- (+ of_41 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_43 (* sc_41 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
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
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_41 (* 1. sc_42)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_41 (* 1. sc_40)) (= sc_41 (* (* 1. sc_39) sc_44))))
; no offset
(assert (= (- (+ of_41 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_44 (* sc_41 1.)))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_38 (* sc_41 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_38 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_38 0.) of_38) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {3300.}
(assert (<= (+ (* sc_39 4.) of_39) 3300.))
; 
; <=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {0.}
(assert (>= (+ (* sc_39 4.) of_39) 0.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_40 0.) of_40) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_41 0.) of_41) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun slbot_44 () Real)
(declare-fun sltop_44 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44) 0.))
; 
; =  {(((sc.vadd[5].OUT2*156.25)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_44 156.25) of_44) sltop_44) 3300.))
(declare-fun slbot_42 () Real)
(declare-fun sltop_42 () Real)
; 
; =  {(((sc.vadd[5].B*3.75903614458)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_42 3.75903614458) of_42) slbot_42) 0.))
; 
; =  {(((sc.vadd[5].B*62.4)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_42 62.4) of_42) sltop_42) 3300.))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vadd[5].OUT*3.75903614458)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_43 3.75903614458) of_43) slbot_43) -1650.))
; 
; =  {(((sc.vadd[5].OUT*62.4)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_43 62.4) of_43) sltop_43) 1650.))
(declare-fun slbot_44 () Real)
(declare-fun sltop_44 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44) 0.))
; 
; =  {(((sc.vadd[5].OUT2*156.25)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_44 156.25) of_44) sltop_44) 3300.))
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
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
; no offset
(assert (= of_46 0.))
; no offset
(assert (= of_47 0.))
; no scale
(assert (= (/ sc_46 sc_47) 1.))
; no scale
(assert (= sc_45 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= of_46 0.))
; no offset
(assert (= of_47 0.))
; no scale
(assert (= (/ sc_46 sc_47) 1.))
; no scale
(assert (= sc_45 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_48 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_49 (* sc_48 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_49 0.))
; no scale
(assert (= sc_47 1.))
; no scale
(assert (= (* sc_45 1.) 1.))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_47 1.))
; no scale
(assert (= (* sc_45 1.) 1.))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_46 1.))
; no scale
(assert (= sc_45 1.))
; no offset
(assert (= of_46 0.))
; no offset
(assert (= of_45 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_48 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_50 (* sc_48 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_50 0.))
; 
; >=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_45 2.5) of_45) 5.))
; 
; <=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_45 2.5) of_45) 1.))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 1.))
; 
; =  {(((sc.ihill[0].S*156.25)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_46 156.25) of_46) sltop_46) 10.))
(declare-fun slbot_50 () Real)
(declare-fun sltop_50 () Real)
; 
; =  {(((sc.ihill[0].REP*0.000511998322284)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {9.999900001e-10}
(assert (= (+ (+ (* sc_50 0.000511998322284) of_50) slbot_50) 9.999900001e-10))
; 
; =  {(((sc.ihill[0].REP*156.25)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {5.}
(assert (= (+ (+ (* sc_50 156.25) of_50) sltop_50) 5.))
; 
; >=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_48 156.25) of_48) 10.))
; 
; <=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_48 156.25) of_48) 0.0001))
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_52 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_51 0.))
; 
; =  {sc.vtoi[2].Y} {((1./sc.vtoi[2].K)*sc.vtoi[2].X)}
(assert (= sc_53 (* (/ 1. sc_52) sc_51)))
; 
; =  {of.vtoi[2].Y} {0.}
(assert (= of_53 0.))
; 
; >=  {((sc.vtoi[2].X*1.)+of.vtoi[2].X)} {3300.}
(assert (<= (+ (* sc_51 1.) of_51) 3300.))
; 
; <=  {((sc.vtoi[2].X*1.)+of.vtoi[2].X)} {1.}
(assert (>= (+ (* sc_51 1.) of_51) 1.))
(declare-fun slbot_53 () Real)
(declare-fun sltop_53 () Real)
; 
; =  {(((sc.vtoi[2].Y*0.)+of.vtoi[2].Y)+sl.min.vtoi[2].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_53 0.) of_53) slbot_53) 0.00030303030303))
; 
; =  {(((sc.vtoi[2].Y*1.66666666667)+of.vtoi[2].Y)+sl.max.vtoi[2].Y)} {3300.}
(assert (= (+ (+ (* sc_53 1.66666666667) of_53) sltop_53) 3300.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.vtoi[2].K*0.)+of.vtoi[2].K)+sl.min.vtoi[2].K)} {1.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) 1.))
; 
; =  {(((sc.vtoi[2].K*0.6)+of.vtoi[2].K)+sl.max.vtoi[2].K)} {3300.}
(assert (= (+ (+ (* sc_52 0.6) of_52) sltop_52) 3300.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_55 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_54 0.))
; 
; =  {sc.vtoi[3].Y} {((1./sc.vtoi[3].K)*sc.vtoi[3].X)}
(assert (= sc_56 (* (/ 1. sc_55) sc_54)))
; 
; =  {of.vtoi[3].Y} {0.}
(assert (= of_56 0.))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.vtoi[3].X*0.)+of.vtoi[3].X)+sl.min.vtoi[3].X)} {1.}
(assert (= (+ (+ (* sc_54 0.) of_54) slbot_54) 1.))
; 
; =  {(((sc.vtoi[3].X*156.25)+of.vtoi[3].X)+sl.max.vtoi[3].X)} {3300.}
(assert (= (+ (+ (* sc_54 156.25) of_54) sltop_54) 3300.))
; 
; >=  {((sc.vtoi[3].K*1.)+of.vtoi[3].K)} {3300.}
(assert (<= (+ (* sc_55 1.) of_55) 3300.))
; 
; <=  {((sc.vtoi[3].K*1.)+of.vtoi[3].K)} {1.}
(assert (>= (+ (* sc_55 1.) of_55) 1.))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.vtoi[3].Y*0.)+of.vtoi[3].Y)+sl.min.vtoi[3].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) 0.00030303030303))
; 
; =  {(((sc.vtoi[3].Y*156.25)+of.vtoi[3].Y)+sl.max.vtoi[3].Y)} {3300.}
(assert (= (+ (+ (* sc_56 156.25) of_56) sltop_56) 3300.))
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
; no offset
(assert (= of_58 0.))
; no offset
(assert (= of_57 0.))
; 
; =  {1.} {(sc.igenebind[1].K*sc.igenebind[1].TF)}
(assert (= 1. (* sc_58 sc_57)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_59 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[1].GE} {(sc.igenebind[1].Vmax*(1./1.))}
(assert (= sc_60 (* sc_59 (/ 1. 1.))))
; 
; =  {of.igenebind[1].GE} {0.}
(assert (= of_60 0.))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.igenebind[1].TF*0.)+of.igenebind[1].TF)+sl.min.igenebind[1].TF)} {0.0001}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) 0.0001))
; 
; =  {(((sc.igenebind[1].TF*15.6)+of.igenebind[1].TF)+sl.max.igenebind[1].TF)} {10.}
(assert (= (+ (+ (* sc_57 15.6) of_57) sltop_57) 10.))
; 
; >=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {10.}
(assert (<= (+ (* sc_58 1.) of_58) 10.))
; 
; <=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {0.0001}
(assert (>= (+ (* sc_58 1.) of_58) 0.0001))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.igenebind[1].GE*0.939759036145)+of.igenebind[1].GE)+sl.min.igenebind[1].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_60 0.939759036145) of_60) slbot_60) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[1].GE*15.6)+of.igenebind[1].GE)+sl.max.igenebind[1].GE)} {9.9999999}
(assert (= (+ (+ (* sc_60 15.6) of_60) sltop_60) 9.9999999))
; 
; >=  {((sc.igenebind[1].Vmax*15.6)+of.igenebind[1].Vmax)} {10.}
(assert (<= (+ (* sc_59 15.6) of_59) 10.))
; 
; <=  {((sc.igenebind[1].Vmax*15.6)+of.igenebind[1].Vmax)} {0.0001}
(assert (>= (+ (* sc_59 15.6) of_59) 0.0001))
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_62 sc_61))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_62 of_61))
; 
; >=  {((sc.input.V[2].X*0.125)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_61 0.125) of_61) 3300.))
; 
; <=  {((sc.input.V[2].X*0.125)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_61 0.125) of_61) 0.))
; 
; >=  {((sc.input.V[2].O*0.125)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_62 0.125) of_62) 3300.))
; 
; <=  {((sc.input.V[2].O*0.125)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_62 0.125) of_62) 0.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_63 0.) of_63) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_64 0.) of_64) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_65 0.) of_65) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_66 0.) of_66) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_68 of_67))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_67 1.) of_67) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_67 1.) of_67) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_68 1.) of_68) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_68 1.) of_68) 0.))
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_70 of_69))
; 
; >=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_69 1.) of_69) 3300.))
; 
; <=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_69 1.) of_69) 0.))
; 
; >=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_70 1.) of_70) 3300.))
; 
; <=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_70 1.) of_70) 0.))
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_71 4.) of_71) 3300.))
; 
; <=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_71 4.) of_71) 0.))
; 
; >=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_72 4.) of_72) 3300.))
; 
; <=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_72 4.) of_72) 0.))
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_74 of_73))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_73 0.6) of_73) sltop_73) 3300.))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_74 0.) of_74) slbot_74) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_74 0.6) of_74) sltop_74) 3300.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.V[11].X*1000.75)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_75 1000.75) of_75) 3300.))
; 
; <=  {((sc.input.V[11].X*1000.75)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_75 1000.75) of_75) 0.))
; 
; >=  {((sc.input.V[11].O*1000.75)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_76 1000.75) of_76) 3300.))
; 
; <=  {((sc.input.V[11].O*1000.75)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_76 1000.75) of_76) 0.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_77 4.) of_77) 3300.))
; 
; <=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_77 4.) of_77) 0.))
; 
; >=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_78 4.) of_78) 3300.))
; 
; <=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_78 4.) of_78) 0.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_80 sc_79))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_80 of_79))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_80 0.) of_80) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_80 0.) of_80) 0.))
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_82 sc_81))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_82 of_81))
; 
; >=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_81 1.) of_81) 3300.))
; 
; <=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_81 1.) of_81) 0.))
; 
; >=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_82 1.) of_82) 3300.))
; 
; <=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_82 1.) of_82) 0.))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_84 sc_83))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_84 of_83))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_83 0.) of_83) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_83 0.) of_83) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_84 0.) of_84) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_84 0.) of_84) 0.))
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_86 sc_85))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_86 of_85))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_85 0.) of_85) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_85 0.) of_85) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_86 0.) of_86) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_86 0.) of_86) 0.))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_88 sc_87))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_88 of_87))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_87 0.) of_87) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_87 0.) of_87) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_88 0.) of_88) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_88 0.) of_88) 0.))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_90 sc_89))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_90 of_89))
; 
; >=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_89 2.5) of_89) 3300.))
; 
; <=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_89 2.5) of_89) 0.))
; 
; >=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_90 2.5) of_90) 3300.))
; 
; <=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_90 2.5) of_90) 0.))
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
; =  {sc.itov[8].Y} {(sc.itov[8].K*sc.itov[8].X)}
(assert (= sc_93 (* sc_92 sc_91)))
; 
; =  {of.itov[8].Y} {0.}
(assert (= of_93 0.))
; 
; >=  {((sc.itov[8].X*1.)+of.itov[8].X)} {10.}
(assert (<= (+ (* sc_91 1.) of_91) 10.))
; 
; <=  {((sc.itov[8].X*1.)+of.itov[8].X)} {0.0001}
(assert (>= (+ (* sc_91 1.) of_91) 0.0001))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.itov[8].K*0.939759036145)+of.itov[8].K)+sl.min.itov[8].K)} {1.}
(assert (= (+ (+ (* sc_92 0.939759036145) of_92) slbot_92) 1.))
; 
; =  {(((sc.itov[8].K*15.6)+of.itov[8].K)+sl.max.itov[8].K)} {330.}
(assert (= (+ (+ (* sc_92 15.6) of_92) sltop_92) 330.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.itov[8].Y*0.939759036145)+of.itov[8].Y)+sl.min.itov[8].Y)} {0.0001}
(assert (= (+ (+ (* sc_93 0.939759036145) of_93) slbot_93) 0.0001))
; 
; =  {(((sc.itov[8].Y*15.6)+of.itov[8].Y)+sl.max.itov[8].Y)} {3300.}
(assert (= (+ (+ (* sc_93 15.6) of_93) sltop_93) 3300.))
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
; =  {sc.itov[6].Y} {(sc.itov[6].K*sc.itov[6].X)}
(assert (= sc_96 (* sc_95 sc_94)))
; 
; =  {of.itov[6].Y} {0.}
(assert (= of_96 0.))
; 
; >=  {((sc.itov[6].X*4.)+of.itov[6].X)} {10.}
(assert (<= (+ (* sc_94 4.) of_94) 10.))
; 
; <=  {((sc.itov[6].X*4.)+of.itov[6].X)} {0.0001}
(assert (>= (+ (* sc_94 4.) of_94) 0.0001))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.itov[6].Y*0.00204799328914)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_96 0.00204799328914) of_96) slbot_96) 0.0001))
; 
; =  {(((sc.itov[6].Y*625.)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_96 625.) of_96) sltop_96) 3300.))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.itov[6].K*0.000511998322284)+of.itov[6].K)+sl.min.itov[6].K)} {1.}
(assert (= (+ (+ (* sc_95 0.000511998322284) of_95) slbot_95) 1.))
; 
; =  {(((sc.itov[6].K*156.25)+of.itov[6].K)+sl.max.itov[6].K)} {330.}
(assert (= (+ (+ (* sc_95 156.25) of_95) sltop_95) 330.))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.itov[6].Y*0.00204799328914)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_96 0.00204799328914) of_96) slbot_96) 0.0001))
; 
; =  {(((sc.itov[6].Y*625.)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_96 625.) of_96) sltop_96) 3300.))
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
; 
; =  {sc.iadd[0].A} {sc.iadd[0].B}
(assert (= sc_99 sc_100))
; 
; =  {sc.iadd[0].A} {sc.iadd[0].C} {sc.iadd[0].D}
(assert (and (= sc_99 sc_98) (= sc_99 sc_97)))
; 
; =  {sc.iadd[0].OUT} {sc.iadd[0].A}
(assert (= sc_101 sc_99))
; 
; =  {of.iadd[0].OUT} {((of.iadd[0].A+of.iadd[0].B)-of.iadd[0].C-of.iadd[0].D)}
(assert (= of_101 (- (+ of_99 of_100) (+ of_98 of_97))))
; 
; >=  {((sc.iadd[0].D*0.)+of.iadd[0].D)} {5.}
(assert (<= (+ (* sc_97 0.) of_97) 5.))
; 
; <=  {((sc.iadd[0].D*0.)+of.iadd[0].D)} {0.}
(assert (>= (+ (* sc_97 0.) of_97) 0.))
; 
; >=  {((sc.iadd[0].C*0.)+of.iadd[0].C)} {5.}
(assert (<= (+ (* sc_98 0.) of_98) 5.))
; 
; <=  {((sc.iadd[0].C*0.)+of.iadd[0].C)} {0.}
(assert (>= (+ (* sc_98 0.) of_98) 0.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.iadd[0].A*0.)+of.iadd[0].A)+sl.min.iadd[0].A)} {0.}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.))
; 
; =  {(((sc.iadd[0].A*15.6)+of.iadd[0].A)+sl.max.iadd[0].A)} {5.}
(assert (= (+ (+ (* sc_99 15.6) of_99) sltop_99) 5.))
; 
; >=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {5.}
(assert (<= (+ (* sc_100 0.) of_100) 5.))
; 
; <=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {0.}
(assert (>= (+ (* sc_100 0.) of_100) 0.))
(declare-fun slbot_101 () Real)
(declare-fun sltop_101 () Real)
; 
; =  {(((sc.iadd[0].OUT*0.)+of.iadd[0].OUT)+sl.min.iadd[0].OUT)} {-10.}
(assert (= (+ (+ (* sc_101 0.) of_101) slbot_101) -10.))
; 
; =  {(((sc.iadd[0].OUT*15.6)+of.iadd[0].OUT)+sl.max.iadd[0].OUT)} {10.}
(assert (= (+ (+ (* sc_101 15.6) of_101) sltop_101) 10.))
; 
; =  {sc.vadd[7].OUT2} {sc.output.V[1].X}
(assert (= sc_37 sc_29))
; 
; =  {of.vadd[7].OUT2} {of.output.V[1].X}
(assert (= of_37 of_29))
; 
; =  {sc.vadd[7].OUT2} {sc.switch[3].Vmax}
(assert (= sc_37 sc_7))
; 
; =  {of.vadd[7].OUT2} {of.switch[3].Vmax}
(assert (= of_37 of_7))
; 
; =  {sc.vtoi[3].Y} {sc.ihill[0].S}
(assert (= sc_56 sc_46))
; 
; =  {of.vtoi[3].Y} {of.ihill[0].S}
(assert (= of_56 of_46))
; 
; =  {sc.input.I[0].O} {sc.ihill[0].Vmax}
(assert (= sc_18 sc_48))
; 
; =  {of.input.I[0].O} {of.ihill[0].Vmax}
(assert (= of_18 of_48))
; 
; =  {sc.ihill[0].REP} {sc.itov[6].K}
(assert (= sc_50 sc_95))
; 
; =  {of.ihill[0].REP} {of.itov[6].K}
(assert (= of_50 of_95))
; 
; =  {sc.input.V[9].O} {sc.vadd[5].D}
(assert (= sc_72 sc_39))
; 
; =  {of.input.V[9].O} {of.vadd[5].D}
(assert (= of_72 of_39))
; 
; =  {sc.input.I[9].O} {sc.iadd[0].B}
(assert (= sc_14 sc_100))
; 
; =  {of.input.I[9].O} {of.iadd[0].B}
(assert (= of_14 of_100))
; 
; =  {sc.input.V[13].O} {sc.vtoi[2].X}
(assert (= sc_68 sc_51))
; 
; =  {of.input.V[13].O} {of.vtoi[2].X}
(assert (= of_68 of_51))
; 
; =  {sc.input.I[3].O} {sc.itov[6].X}
(assert (= sc_22 sc_94))
; 
; =  {of.input.I[3].O} {of.itov[6].X}
(assert (= of_22 of_94))
; 
; =  {sc.input.I[4].O} {sc.igenebind[1].K}
(assert (= sc_24 sc_58))
; 
; =  {of.input.I[4].O} {of.igenebind[1].K}
(assert (= of_24 of_58))
; 
; =  {sc.itov[8].Y} {sc.vgain[4].Z}
(assert (= sc_93 sc_2))
; 
; =  {of.itov[8].Y} {of.vgain[4].Z}
(assert (= of_93 of_2))
; 
; =  {sc.input.V[11].O} {sc.switch[3].n}
(assert (= sc_76 sc_4))
; 
; =  {of.input.V[11].O} {of.switch[3].n}
(assert (= of_76 of_4))
; 
; =  {sc.switch[3].PROD} {sc.iadd[0].A}
(assert (= sc_8 sc_99))
; 
; =  {of.switch[3].PROD} {of.iadd[0].A}
(assert (= of_8 of_99))
; 
; =  {sc.input.I[2].O} {sc.igenebind[1].Vmax}
(assert (= sc_10 sc_59))
; 
; =  {of.input.I[2].O} {of.igenebind[1].Vmax}
(assert (= of_10 of_59))
; 
; =  {sc.input.V[8].O} {sc.vadd[5].OUT2_0}
(assert (= sc_64 sc_38))
; 
; =  {of.input.V[8].O} {of.vadd[5].OUT2_0}
(assert (= of_64 of_38))
; 
; =  {sc.input.V[12].O} {sc.vgain[4].X}
(assert (= sc_70 sc_0))
; 
; =  {of.input.V[12].O} {of.vgain[4].X}
(assert (= of_70 of_0))
; 
; =  {sc.input.V[3].O} {sc.vadd[5].A}
(assert (= sc_84 sc_41))
; 
; =  {of.input.V[3].O} {of.vadd[5].A}
(assert (= of_84 of_41))
; 
; =  {sc.input.V[2].O} {sc.vgain[4].Y}
(assert (= sc_62 sc_1))
; 
; =  {of.input.V[2].O} {of.vgain[4].Y}
(assert (= of_62 of_1))
; 
; =  {sc.vadd[5].OUT2} {sc.vtoi[3].X}
(assert (= sc_44 sc_54))
; 
; =  {of.vadd[5].OUT2} {of.vtoi[3].X}
(assert (= of_44 of_54))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[0].X}
(assert (= sc_44 sc_27))
; 
; =  {of.vadd[5].OUT2} {of.output.V[0].X}
(assert (= of_44 of_27))
; 
; =  {sc.vtoi[2].Y} {sc.switch[3].Kmod}
(assert (= sc_53 sc_6))
; 
; =  {of.vtoi[2].Y} {of.switch[3].Kmod}
(assert (= of_53 of_6))
; 
; =  {sc.iadd[0].OUT} {sc.igenebind[1].TF}
(assert (= sc_101 sc_57))
; 
; =  {of.iadd[0].OUT} {of.igenebind[1].TF}
(assert (= of_101 of_57))
; 
; =  {sc.input.I[10].O} {sc.iadd[0].C}
(assert (= sc_20 sc_98))
; 
; =  {of.input.I[10].O} {of.iadd[0].C}
(assert (= of_20 of_98))
; 
; =  {sc.input.I[1].O} {sc.switch[3].SUB}
(assert (= sc_26 sc_5))
; 
; =  {of.input.I[1].O} {of.switch[3].SUB}
(assert (= of_26 of_5))
; 
; =  {sc.input.V[1].O} {sc.ihill[0].n}
(assert (= sc_90 sc_45))
; 
; =  {of.input.V[1].O} {of.ihill[0].n}
(assert (= of_90 of_45))
; 
; =  {sc.input.V[7].O} {sc.vadd[7].OUT2_0}
(assert (= sc_66 sc_31))
; 
; =  {of.input.V[7].O} {of.vadd[7].OUT2_0}
(assert (= of_66 of_31))
; 
; =  {sc.input.I[8].O} {sc.iadd[0].D}
(assert (= sc_12 sc_97))
; 
; =  {of.input.I[8].O} {of.iadd[0].D}
(assert (= of_12 of_97))
; 
; =  {sc.igenebind[1].GE} {sc.itov[8].K}
(assert (= sc_60 sc_92))
; 
; =  {of.igenebind[1].GE} {of.itov[8].K}
(assert (= of_60 of_92))
; 
; =  {sc.itov[6].Y} {sc.vadd[7].B}
(assert (= sc_96 sc_35))
; 
; =  {of.itov[6].Y} {of.vadd[7].B}
(assert (= of_96 of_35))
; 
; =  {sc.vgain[4].P} {sc.vadd[5].B}
(assert (= sc_3 sc_42))
; 
; =  {of.vgain[4].P} {of.vadd[5].B}
(assert (= of_3 of_42))
; 
; =  {sc.input.V[0].O} {sc.vtoi[2].K}
(assert (= sc_74 sc_52))
; 
; =  {of.input.V[0].O} {of.vtoi[2].K}
(assert (= of_74 of_52))
; 
; =  {sc.input.V[10].O} {sc.vadd[7].D}
(assert (= sc_78 sc_32))
; 
; =  {of.input.V[10].O} {of.vadd[7].D}
(assert (= of_78 of_32))
; 
; =  {sc.input.V[16].O} {sc.vtoi[3].K}
(assert (= sc_82 sc_55))
; 
; =  {of.input.V[16].O} {of.vtoi[3].K}
(assert (= of_82 of_55))
; 
; =  {sc.input.V[5].O} {sc.vadd[7].C}
(assert (= sc_88 sc_33))
; 
; =  {of.input.V[5].O} {of.vadd[7].C}
(assert (= of_88 of_33))
; 
; =  {sc.input.V[4].O} {sc.vadd[5].C}
(assert (= sc_86 sc_40))
; 
; =  {of.input.V[4].O} {of.vadd[5].C}
(assert (= of_86 of_40))
; 
; =  {sc.input.V[6].O} {sc.vadd[7].A}
(assert (= sc_80 sc_34))
; 
; =  {of.input.V[6].O} {of.vadd[7].A}
(assert (= of_80 of_34))
; 
; =  {sc.input.I[11].O} {sc.itov[8].X}
(assert (= sc_16 sc_91))
; 
; =  {of.input.I[11].O} {of.itov[8].X}
(assert (= of_16 of_91))
(assert (<= (* (/ 1. sc_28) 0.001) 0.001))
(assert (<= (* (/ 1. sc_30) 0.001) 0.001))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[0].O} {sc.vadd[7].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_44 sc_28) (= sc_44 sc_37)) (= sc_44 sc_30)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_36 0.) sltop_36 (- sltop_36)) (ite (>= slbot_92 0.) slbot_92 (- slbot_92))) (ite (>= sltop_96 0.) sltop_96 (- sltop_96))) (ite (>= slbot_29 0.) slbot_29 (- slbot_29))) (ite (>= slbot_44 0.) slbot_44 (- slbot_44))) (ite (>= sltop_52 0.) sltop_52 (- sltop_52))) (ite (>= sltop_101 0.) sltop_101 (- sltop_101))) (ite (>= slbot_35 0.) slbot_35 (- slbot_35))) (ite (>= slbot_101 0.) slbot_101 (- slbot_101))) (ite (>= sltop_27 0.) sltop_27 (- sltop_27))) (ite (>= slbot_60 0.) slbot_60 (- slbot_60))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_42 0.) sltop_42 (- sltop_42))) (ite (>= slbot_46 0.) slbot_46 (- slbot_46))) (ite (>= slbot_53 0.) slbot_53 (- slbot_53))) (ite (>= sltop_28 0.) sltop_28 (- sltop_28))) (ite (>= sltop_54 0.) sltop_54 (- sltop_54))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_37 0.) slbot_37 (- slbot_37))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= sltop_44 0.) sltop_44 (- sltop_44))) (ite (>= sltop_29 0.) sltop_29 (- sltop_29))) (ite (>= sltop_92 0.) sltop_92 (- sltop_92))) (ite (>= slbot_36 0.) slbot_36 (- slbot_36))) (ite (>= slbot_96 0.) slbot_96 (- slbot_96))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= slbot_95 0.) slbot_95 (- slbot_95))) (ite (>= slbot_28 0.) slbot_28 (- slbot_28))) (ite (>= sltop_57 0.) sltop_57 (- sltop_57))) (ite (>= slbot_57 0.) slbot_57 (- slbot_57))) (ite (>= slbot_52 0.) slbot_52 (- slbot_52))) (ite (>= slbot_54 0.) slbot_54 (- slbot_54))) (ite (>= slbot_56 0.) slbot_56 (- slbot_56))) (ite (>= sltop_56 0.) sltop_56 (- sltop_56))) (ite (>= sltop_74 0.) sltop_74 (- sltop_74))) (ite (>= sltop_95 0.) sltop_95 (- sltop_95))) (ite (>= sltop_60 0.) sltop_60 (- sltop_60))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= slbot_30 0.) slbot_30 (- slbot_30))) (ite (>= slbot_73 0.) slbot_73 (- slbot_73))) (ite (>= slbot_43 0.) slbot_43 (- slbot_43))) (ite (>= slbot_50 0.) slbot_50 (- slbot_50))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= sltop_30 0.) sltop_30 (- sltop_30))) (ite (>= sltop_53 0.) sltop_53 (- sltop_53))) (ite (>= sltop_50 0.) sltop_50 (- sltop_50))) (ite (>= sltop_37 0.) sltop_37 (- sltop_37))) (ite (>= slbot_42 0.) slbot_42 (- slbot_42))) (ite (>= sltop_46 0.) sltop_46 (- sltop_46))) (ite (>= slbot_74 0.) slbot_74 (- slbot_74))) (ite (>= sltop_73 0.) sltop_73 (- sltop_73))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_35 0.) sltop_35 (- sltop_35))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= slbot_27 0.) slbot_27 (- slbot_27))) (ite (>= sltop_43 0.) sltop_43 (- sltop_43))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99)))))
(check-sat)
