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
(declare-fun sc_4 () Real)
(assert (> sc_4 1e-08))
(declare-fun of_4 () Real)
; no offset
(assert (= of_0 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_1 0.))
; no offset
(assert (= of_2 0.))
; 
; =  {(sc.switch[7].SUB/sc.switch[7].Kmod)} {1.}
(assert (= (/ sc_1 sc_2) 1.))
; no scale
(assert (= (/ sc_1 sc_2) 1.))
; no scale
(assert (= (/ sc_0 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_3 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[7].PROD} {(sc.switch[7].Vmax/1.)}
(assert (= sc_4 (/ sc_3 1.)))
; 
; =  {of.switch[7].PROD} {0.}
(assert (= of_4 0.))
; 
; >=  {((sc.switch[7].n*1000.75)+of.switch[7].n)} {3300.}
(assert (<= (+ (* sc_0 1000.75) of_0) 3300.))
; 
; <=  {((sc.switch[7].n*1000.75)+of.switch[7].n)} {0.5}
(assert (>= (+ (* sc_0 1000.75) of_0) 0.5))
; 
; >=  {((sc.switch[7].SUB*337.632520764)+of.switch[7].SUB)} {10.}
(assert (<= (+ (* sc_1 337.632520764) of_1) 10.))
; 
; <=  {((sc.switch[7].SUB*337.632520764)+of.switch[7].SUB)} {0.0001}
(assert (>= (+ (* sc_1 337.632520764) of_1) 0.0001))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.switch[7].Kmod*0.)+of.switch[7].Kmod)+sl.min.switch[7].Kmod)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.switch[7].Kmod*1.66666666667)+of.switch[7].Kmod)+sl.max.switch[7].Kmod)} {10.}
(assert (= (+ (+ (* sc_2 1.66666666667) of_2) sltop_2) 10.))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.switch[7].PROD*0.)+of.switch[7].PROD)+sl.min.switch[7].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4) 9.99934002508e-38))
; 
; =  {(((sc.switch[7].PROD*15.6)+of.switch[7].PROD)+sl.max.switch[7].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_4 15.6) of_4) sltop_4) 9.9999999))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.switch[7].Vmax*0.)+of.switch[7].Vmax)+sl.min.switch[7].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 0.0001))
; 
; =  {(((sc.switch[7].Vmax*15.6)+of.switch[7].Vmax)+sl.max.switch[7].Vmax)} {10.}
(assert (= (+ (+ (* sc_3 15.6) of_3) sltop_3) 10.))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.switch[7].PROD*0.)+of.switch[7].PROD)+sl.min.switch[7].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4) 9.99934002508e-38))
; 
; =  {(((sc.switch[7].PROD*15.6)+of.switch[7].PROD)+sl.max.switch[7].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_4 15.6) of_4) sltop_4) 9.9999999))
(declare-fun sc_5 () Real)
(assert (> sc_5 1e-08))
(declare-fun of_5 () Real)
(declare-fun sc_6 () Real)
(assert (> sc_6 1e-08))
(declare-fun of_6 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_6 sc_5))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_6 of_5))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_5 0.) of_5) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_5 0.) of_5) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_6 0.) of_6) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_6 0.) of_6) 0.))
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_8 sc_7))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_8 of_7))
; 
; >=  {((sc.input.I[8].X*1.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_7 1.) of_7) 10.))
; 
; <=  {((sc.input.I[8].X*1.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_7 1.) of_7) 0.))
; 
; >=  {((sc.input.I[8].O*1.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_8 1.) of_8) 10.))
; 
; <=  {((sc.input.I[8].O*1.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_8 1.) of_8) 0.))
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_10 sc_9))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_10 of_9))
; 
; >=  {((sc.input.I[7].X*4.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_9 4.) of_9) 10.))
; 
; <=  {((sc.input.I[7].X*4.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_9 4.) of_9) 0.))
; 
; >=  {((sc.input.I[7].O*4.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_10 4.) of_10) 10.))
; 
; <=  {((sc.input.I[7].O*4.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_10 4.) of_10) 0.))
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_12 sc_11))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_12 of_11))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_11 0.) of_11) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_12 0.) of_12) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_14 sc_13))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_14 of_13))
; 
; >=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_13 0.) of_13) 10.))
; 
; <=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
; 
; >=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_15 156.25) of_15) 10.))
; 
; <=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_15 156.25) of_15) 0.))
; 
; >=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_16 156.25) of_16) 10.))
; 
; <=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_16 156.25) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_17 0.) of_17) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_18 0.) of_18) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[6].X*4.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_19 4.) of_19) 10.))
; 
; <=  {((sc.input.I[6].X*4.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_19 4.) of_19) 0.))
; 
; >=  {((sc.input.I[6].O*4.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_20 4.) of_20) 10.))
; 
; <=  {((sc.input.I[6].O*4.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_20 4.) of_20) 0.))
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
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_21 0.) of_21) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_22 0.) of_22) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
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
; >=  {((sc.input.I[4].X*337.632520764)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_23 337.632520764) of_23) 10.))
; 
; <=  {((sc.input.I[4].X*337.632520764)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_23 337.632520764) of_23) 0.))
; 
; >=  {((sc.input.I[4].O*337.632520764)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_24 337.632520764) of_24) 10.))
; 
; <=  {((sc.input.I[4].O*337.632520764)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_24 337.632520764) of_24) 0.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_26 sc_25))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_26 of_25))
; 
; >=  {((sc.input.I[5].X*15.6)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_25 15.6) of_25) 10.))
; 
; <=  {((sc.input.I[5].X*15.6)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_25 15.6) of_25) 0.))
; 
; >=  {((sc.input.I[5].O*15.6)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_26 15.6) of_26) 10.))
; 
; <=  {((sc.input.I[5].O*15.6)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_26 15.6) of_26) 0.))
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_28 sc_27))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_28 of_27))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_30 sc_29))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_30 of_29))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_29 156.25) of_29) sltop_29) 3300.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_30 156.25) of_30) sltop_30) 3300.))
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_32 sc_31))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_32 of_31))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_31 15.6) of_31) sltop_31) 3300.))
(declare-fun slbot_32 () Real)
(declare-fun sltop_32 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_32 15.6) of_32) sltop_32) 3300.))
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
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_34 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_37 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_36 (* 1. sc_37)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D)}
(assert (and (= sc_36 (* 1. sc_35)) (= sc_36 (* 1. sc_34))))
; no offset
(assert (= (- (+ of_36 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1.)}
(assert (= sc_38 (* sc_36 1.)))
; 
; =  {of.vadd[2].OUT} {0.}
(assert (= of_38 0.))
; no scale
(assert (= sc_34 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_34 0.))
; no offset
(assert (= of_39 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_37 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_36 (* 1. sc_37)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D*sc.vadd[2].OUT2)}
(assert (and (= sc_36 (* 1. sc_35)) (= sc_36 (* (* 1. sc_34) sc_39))))
; no offset
(assert (= (- (+ of_36 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1.)}
(assert (= sc_39 (* sc_36 1.)))
; no offset
(assert (= of_39 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1.)}
(assert (= sc_33 (* sc_36 1.)))
; 
; =  {of.vadd[2].OUT2_0} {0.}
(assert (= of_33 0.))
; 
; >=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {3300.}
(assert (<= (+ (* sc_34 4.) of_34) 3300.))
; 
; <=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {0.}
(assert (>= (+ (* sc_34 4.) of_34) 0.))
; 
; >=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {3300.}
(assert (<= (+ (* sc_35 0.) of_35) 3300.))
; 
; <=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
; 
; >=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {3300.}
(assert (<= (+ (* sc_36 0.) of_36) 3300.))
; 
; <=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_39 156.25) of_39) sltop_39) 3300.))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.vadd[2].B*3.75903614458)+of.vadd[2].B)+sl.min.vadd[2].B)} {0.}
(assert (= (+ (+ (* sc_37 3.75903614458) of_37) slbot_37) 0.))
; 
; =  {(((sc.vadd[2].B*62.4)+of.vadd[2].B)+sl.max.vadd[2].B)} {3300.}
(assert (= (+ (+ (* sc_37 62.4) of_37) sltop_37) 3300.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.vadd[2].OUT*3.75903614458)+of.vadd[2].OUT)+sl.min.vadd[2].OUT)} {-1650.}
(assert (= (+ (+ (* sc_38 3.75903614458) of_38) slbot_38) -1650.))
; 
; =  {(((sc.vadd[2].OUT*62.4)+of.vadd[2].OUT)+sl.max.vadd[2].OUT)} {1650.}
(assert (= (+ (+ (* sc_38 62.4) of_38) sltop_38) 1650.))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_39 156.25) of_39) sltop_39) 3300.))
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
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_44 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_43 (* 1. sc_44)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_43 (* 1. sc_42)) (= sc_43 (* 1. sc_41))))
; no offset
(assert (= (- (+ of_43 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_45 (* sc_43 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
(assert (= of_45 0.))
; no scale
(assert (= sc_41 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; no offset
(assert (= of_46 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_44 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_43 (* 1. sc_44)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_43 (* 1. sc_42)) (= sc_43 (* (* 1. sc_41) sc_46))))
; no offset
(assert (= (- (+ of_43 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_46 (* sc_43 1.)))
; no offset
(assert (= of_46 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_40 (* sc_43 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_40 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_40 0.) of_40) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {3300.}
(assert (<= (+ (* sc_41 4.) of_41) 3300.))
; 
; <=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {0.}
(assert (>= (+ (* sc_41 4.) of_41) 0.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_42 0.) of_42) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_43 0.) of_43) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_46 15.6) of_46) sltop_46) 3300.))
(declare-fun slbot_44 () Real)
(declare-fun sltop_44 () Real)
; 
; =  {(((sc.vadd[5].B*0.00204799328914)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_44 0.00204799328914) of_44) slbot_44) 0.))
; 
; =  {(((sc.vadd[5].B*625.)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_44 625.) of_44) sltop_44) 3300.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.vadd[5].OUT*0.00204799328914)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_45 0.00204799328914) of_45) slbot_45) -1650.))
; 
; =  {(((sc.vadd[5].OUT*625.)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_45 625.) of_45) sltop_45) 1650.))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_46 15.6) of_46) sltop_46) 3300.))
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
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
; no offset
(assert (= of_48 0.))
; no offset
(assert (= of_49 0.))
; no scale
(assert (= (/ sc_48 sc_49) 1.))
; no scale
(assert (= sc_47 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= of_48 0.))
; no offset
(assert (= of_49 0.))
; no scale
(assert (= (/ sc_48 sc_49) 1.))
; no scale
(assert (= sc_47 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_47 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_50 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_51 (* sc_50 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_51 0.))
; no scale
(assert (= sc_49 1.))
; no scale
(assert (= (* sc_47 1.) 1.))
; no offset
(assert (= of_49 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_49 1.))
; no scale
(assert (= (* sc_47 1.) 1.))
; no offset
(assert (= of_49 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_48 1.))
; no scale
(assert (= sc_47 1.))
; no offset
(assert (= of_48 0.))
; no offset
(assert (= of_47 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_50 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_52 (* sc_50 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_52 0.))
; 
; >=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_47 2.5) of_47) 5.))
; 
; <=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_47 2.5) of_47) 1.))
(declare-fun slbot_48 () Real)
(declare-fun sltop_48 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48) 1.))
; 
; =  {(((sc.ihill[0].S*156.25)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_48 156.25) of_48) sltop_48) 10.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.ihill[0].REP*0.000511998322284)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {9.999900001e-10}
(assert (= (+ (+ (* sc_52 0.000511998322284) of_52) slbot_52) 9.999900001e-10))
; 
; =  {(((sc.ihill[0].REP*156.25)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {5.}
(assert (= (+ (+ (* sc_52 156.25) of_52) sltop_52) 5.))
; 
; >=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_50 156.25) of_50) 10.))
; 
; <=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_50 156.25) of_50) 0.0001))
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
(assert (= 0. 0.))
; no offset
(assert (= of_54 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_53 0.))
; 
; =  {sc.vtoi[8].Y} {((1./sc.vtoi[8].K)*sc.vtoi[8].X)}
(assert (= sc_55 (* (/ 1. sc_54) sc_53)))
; 
; =  {of.vtoi[8].Y} {0.}
(assert (= of_55 0.))
(declare-fun slbot_53 () Real)
(declare-fun sltop_53 () Real)
; 
; =  {(((sc.vtoi[8].X*0.)+of.vtoi[8].X)+sl.min.vtoi[8].X)} {1.}
(assert (= (+ (+ (* sc_53 0.) of_53) slbot_53) 1.))
; 
; =  {(((sc.vtoi[8].X*156.25)+of.vtoi[8].X)+sl.max.vtoi[8].X)} {3300.}
(assert (= (+ (+ (* sc_53 156.25) of_53) sltop_53) 3300.))
; 
; >=  {((sc.vtoi[8].K*1.)+of.vtoi[8].K)} {3300.}
(assert (<= (+ (* sc_54 1.) of_54) 3300.))
; 
; <=  {((sc.vtoi[8].K*1.)+of.vtoi[8].K)} {1.}
(assert (>= (+ (* sc_54 1.) of_54) 1.))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.vtoi[8].Y*0.)+of.vtoi[8].Y)+sl.min.vtoi[8].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55) 0.00030303030303))
; 
; =  {(((sc.vtoi[8].Y*156.25)+of.vtoi[8].Y)+sl.max.vtoi[8].Y)} {3300.}
(assert (= (+ (+ (* sc_55 156.25) of_55) sltop_55) 3300.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_57 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_56 0.))
; 
; =  {sc.vtoi[6].Y} {((1./sc.vtoi[6].K)*sc.vtoi[6].X)}
(assert (= sc_58 (* (/ 1. sc_57) sc_56)))
; 
; =  {of.vtoi[6].Y} {0.}
(assert (= of_58 0.))
; 
; >=  {((sc.vtoi[6].X*1.)+of.vtoi[6].X)} {3300.}
(assert (<= (+ (* sc_56 1.) of_56) 3300.))
; 
; <=  {((sc.vtoi[6].X*1.)+of.vtoi[6].X)} {1.}
(assert (>= (+ (* sc_56 1.) of_56) 1.))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.vtoi[6].Y*0.)+of.vtoi[6].Y)+sl.min.vtoi[6].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) 0.00030303030303))
; 
; =  {(((sc.vtoi[6].Y*1.66666666667)+of.vtoi[6].Y)+sl.max.vtoi[6].Y)} {3300.}
(assert (= (+ (+ (* sc_58 1.66666666667) of_58) sltop_58) 3300.))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.vtoi[6].K*0.)+of.vtoi[6].K)+sl.min.vtoi[6].K)} {1.}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) 1.))
; 
; =  {(((sc.vtoi[6].K*0.6)+of.vtoi[6].K)+sl.max.vtoi[6].K)} {3300.}
(assert (= (+ (+ (* sc_57 0.6) of_57) sltop_57) 3300.))
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; no offset
(assert (= of_60 0.))
; no offset
(assert (= of_59 0.))
; 
; =  {1.} {(sc.igenebind[3].K*sc.igenebind[3].TF)}
(assert (= 1. (* sc_60 sc_59)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_61 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[3].GE} {(sc.igenebind[3].Vmax*(1./1.))}
(assert (= sc_62 (* sc_61 (/ 1. 1.))))
; 
; =  {of.igenebind[3].GE} {0.}
(assert (= of_62 0.))
; 
; >=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {10.}
(assert (<= (+ (* sc_59 1.) of_59) 10.))
; 
; <=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {0.0001}
(assert (>= (+ (* sc_59 1.) of_59) 0.0001))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.igenebind[3].K*0.)+of.igenebind[3].K)+sl.min.igenebind[3].K)} {0.0001}
(assert (= (+ (+ (* sc_60 0.) of_60) slbot_60) 0.0001))
; 
; =  {(((sc.igenebind[3].K*15.6)+of.igenebind[3].K)+sl.max.igenebind[3].K)} {10.}
(assert (= (+ (+ (* sc_60 15.6) of_60) sltop_60) 10.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.igenebind[3].GE*0.939759036145)+of.igenebind[3].GE)+sl.min.igenebind[3].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_62 0.939759036145) of_62) slbot_62) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[3].GE*15.6)+of.igenebind[3].GE)+sl.max.igenebind[3].GE)} {9.9999999}
(assert (= (+ (+ (* sc_62 15.6) of_62) sltop_62) 9.9999999))
; 
; >=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {10.}
(assert (<= (+ (* sc_61 15.6) of_61) 10.))
; 
; <=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {0.0001}
(assert (>= (+ (* sc_61 15.6) of_61) 0.0001))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_63 0.) of_63) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_64 0.) of_64) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_65 4.) of_65) 3300.))
; 
; <=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_65 4.) of_65) 0.))
; 
; >=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_66 4.) of_66) 3300.))
; 
; <=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_66 4.) of_66) 0.))
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_68 of_67))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_67 0.) of_67) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_68 0.) of_68) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
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
; >=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_75 1.) of_75) 3300.))
; 
; <=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_75 1.) of_75) 0.))
; 
; >=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_76 1.) of_76) 3300.))
; 
; <=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_76 1.) of_76) 0.))
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
; >=  {((sc.input.V[10].X*1000.75)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_77 1000.75) of_77) 3300.))
; 
; <=  {((sc.input.V[10].X*1000.75)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_77 1000.75) of_77) 0.))
; 
; >=  {((sc.input.V[10].O*1000.75)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_78 1000.75) of_78) 3300.))
; 
; <=  {((sc.input.V[10].O*1000.75)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_78 1000.75) of_78) 0.))
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
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_82 sc_81))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_82 of_81))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_81 0.) of_81) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_81 0.) of_81) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_82 0.) of_82) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_82 0.) of_82) 0.))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_84 sc_83))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_84 of_83))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_83 0.) of_83) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_83 0.) of_83) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_84 0.) of_84) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_84 0.) of_84) 0.))
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_86 sc_85))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_86 of_85))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_85 0.) of_85) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_85 0.) of_85) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_86 0.) of_86) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_86 0.) of_86) 0.))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_88 sc_87))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_88 of_87))
; 
; >=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_87 2.5) of_87) 3300.))
; 
; <=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_87 2.5) of_87) 0.))
; 
; >=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_88 2.5) of_88) 3300.))
; 
; <=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_88 2.5) of_88) 0.))
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
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_91 (* sc_90 sc_89)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_91 0.))
; 
; >=  {((sc.itov[4].X*4.)+of.itov[4].X)} {10.}
(assert (<= (+ (* sc_89 4.) of_89) 10.))
; 
; <=  {((sc.itov[4].X*4.)+of.itov[4].X)} {0.0001}
(assert (>= (+ (* sc_89 4.) of_89) 0.0001))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_91 0.00204799328914) of_91) slbot_91) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_91 625.) of_91) sltop_91) 3300.))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.itov[4].K*0.000511998322284)+of.itov[4].K)+sl.min.itov[4].K)} {1.}
(assert (= (+ (+ (* sc_90 0.000511998322284) of_90) slbot_90) 1.))
; 
; =  {(((sc.itov[4].K*156.25)+of.itov[4].K)+sl.max.itov[4].K)} {330.}
(assert (= (+ (+ (* sc_90 156.25) of_90) sltop_90) 330.))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_91 0.00204799328914) of_91) slbot_91) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_91 625.) of_91) sltop_91) 3300.))
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
; =  {sc.itov[1].Y} {(sc.itov[1].K*sc.itov[1].X)}
(assert (= sc_94 (* sc_93 sc_92)))
; 
; =  {of.itov[1].Y} {0.}
(assert (= of_94 0.))
; 
; >=  {((sc.itov[1].X*4.)+of.itov[1].X)} {10.}
(assert (<= (+ (* sc_92 4.) of_92) 10.))
; 
; <=  {((sc.itov[1].X*4.)+of.itov[1].X)} {0.0001}
(assert (>= (+ (* sc_92 4.) of_92) 0.0001))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_94 3.75903614458) of_94) slbot_94) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_94 62.4) of_94) sltop_94) 3300.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.itov[1].K*0.939759036145)+of.itov[1].K)+sl.min.itov[1].K)} {1.}
(assert (= (+ (+ (* sc_93 0.939759036145) of_93) slbot_93) 1.))
; 
; =  {(((sc.itov[1].K*15.6)+of.itov[1].K)+sl.max.itov[1].K)} {330.}
(assert (= (+ (+ (* sc_93 15.6) of_93) sltop_93) 330.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_94 3.75903614458) of_94) slbot_94) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_94 62.4) of_94) sltop_94) 3300.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
; 
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_97 sc_98))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_97 sc_96) (= sc_97 sc_95)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_99 sc_97))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_99 (- (+ of_97 of_98) (+ of_96 of_95))))
; 
; >=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {5.}
(assert (<= (+ (* sc_95 0.) of_95) 5.))
; 
; <=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {0.}
(assert (>= (+ (* sc_95 0.) of_95) 0.))
; 
; >=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {5.}
(assert (<= (+ (* sc_96 0.) of_96) 5.))
; 
; <=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {0.}
(assert (>= (+ (* sc_96 0.) of_96) 0.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_99 1.66666666667) of_99) sltop_99) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_97 0.) of_97) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_97 0.) of_97) 0.))
(declare-fun slbot_98 () Real)
(declare-fun sltop_98 () Real)
; 
; =  {(((sc.iadd[8].B*0.)+of.iadd[8].B)+sl.min.iadd[8].B)} {0.}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98) 0.))
; 
; =  {(((sc.iadd[8].B*1.66666666667)+of.iadd[8].B)+sl.max.iadd[8].B)} {5.}
(assert (= (+ (+ (* sc_98 1.66666666667) of_98) sltop_98) 5.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_99 1.66666666667) of_99) sltop_99) 10.))
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
; 
; =  {sc.iadd[9].A} {sc.iadd[9].B}
(assert (= sc_102 sc_103))
; 
; =  {sc.iadd[9].A} {sc.iadd[9].C} {sc.iadd[9].D}
(assert (and (= sc_102 sc_101) (= sc_102 sc_100)))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[9].A}
(assert (= sc_104 sc_102))
; 
; =  {of.iadd[9].OUT} {((of.iadd[9].A+of.iadd[9].B)-of.iadd[9].C-of.iadd[9].D)}
(assert (= of_104 (- (+ of_102 of_103) (+ of_101 of_100))))
; 
; >=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {5.}
(assert (<= (+ (* sc_100 0.) of_100) 5.))
; 
; <=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {0.}
(assert (>= (+ (* sc_100 0.) of_100) 0.))
; 
; >=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {5.}
(assert (<= (+ (* sc_101 0.) of_101) 5.))
; 
; <=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {0.}
(assert (>= (+ (* sc_101 0.) of_101) 0.))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.iadd[9].A*0.)+of.iadd[9].A)+sl.min.iadd[9].A)} {0.}
(assert (= (+ (+ (* sc_102 0.) of_102) slbot_102) 0.))
; 
; =  {(((sc.iadd[9].A*15.6)+of.iadd[9].A)+sl.max.iadd[9].A)} {5.}
(assert (= (+ (+ (* sc_102 15.6) of_102) sltop_102) 5.))
; 
; >=  {((sc.iadd[9].B*0.)+of.iadd[9].B)} {5.}
(assert (<= (+ (* sc_103 0.) of_103) 5.))
; 
; <=  {((sc.iadd[9].B*0.)+of.iadd[9].B)} {0.}
(assert (>= (+ (* sc_103 0.) of_103) 0.))
(declare-fun slbot_104 () Real)
(declare-fun sltop_104 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_104 0.) of_104) slbot_104) -10.))
; 
; =  {(((sc.iadd[9].OUT*15.6)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_104 15.6) of_104) sltop_104) 10.))
; 
; =  {sc.input.I[6].O} {sc.itov[1].X}
(assert (= sc_20 sc_92))
; 
; =  {of.input.I[6].O} {of.itov[1].X}
(assert (= of_20 of_92))
; 
; =  {sc.input.I[0].O} {sc.ihill[0].Vmax}
(assert (= sc_16 sc_50))
; 
; =  {of.input.I[0].O} {of.ihill[0].Vmax}
(assert (= of_16 of_50))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].X}
(assert (= sc_39 sc_29))
; 
; =  {of.vadd[2].OUT2} {of.output.V[0].X}
(assert (= of_39 of_29))
; 
; =  {sc.vadd[2].OUT2} {sc.vtoi[8].X}
(assert (= sc_39 sc_53))
; 
; =  {of.vadd[2].OUT2} {of.vtoi[8].X}
(assert (= of_39 of_53))
; 
; =  {sc.switch[7].PROD} {sc.iadd[9].A}
(assert (= sc_4 sc_102))
; 
; =  {of.switch[7].PROD} {of.iadd[9].A}
(assert (= of_4 of_102))
; 
; =  {sc.input.V[9].O} {sc.vadd[5].D}
(assert (= sc_72 sc_41))
; 
; =  {of.input.V[9].O} {of.vadd[5].D}
(assert (= of_72 of_41))
; 
; =  {sc.ihill[0].REP} {sc.itov[4].K}
(assert (= sc_52 sc_90))
; 
; =  {of.ihill[0].REP} {of.itov[4].K}
(assert (= of_52 of_90))
; 
; =  {sc.itov[1].Y} {sc.vadd[2].B}
(assert (= sc_94 sc_37))
; 
; =  {of.itov[1].Y} {of.vadd[2].B}
(assert (= of_94 of_37))
; 
; =  {sc.input.I[9].O} {sc.iadd[9].C}
(assert (= sc_12 sc_101))
; 
; =  {of.input.I[9].O} {of.iadd[9].C}
(assert (= of_12 of_101))
; 
; =  {sc.input.I[3].O} {sc.iadd[8].A}
(assert (= sc_22 sc_97))
; 
; =  {of.input.I[3].O} {of.iadd[8].A}
(assert (= of_22 of_97))
; 
; =  {sc.input.I[4].O} {sc.switch[7].SUB}
(assert (= sc_24 sc_1))
; 
; =  {of.input.I[4].O} {of.switch[7].SUB}
(assert (= of_24 of_1))
; 
; =  {sc.input.I[5].O} {sc.igenebind[3].Vmax}
(assert (= sc_26 sc_61))
; 
; =  {of.input.I[5].O} {of.igenebind[3].Vmax}
(assert (= of_26 of_61))
; 
; =  {sc.vtoi[6].Y} {sc.iadd[8].B}
(assert (= sc_58 sc_98))
; 
; =  {of.vtoi[6].Y} {of.iadd[8].B}
(assert (= of_58 of_98))
; 
; =  {sc.input.V[11].O} {sc.vtoi[6].X}
(assert (= sc_76 sc_56))
; 
; =  {of.input.V[11].O} {of.vtoi[6].X}
(assert (= of_76 of_56))
; 
; =  {sc.input.V[12].O} {sc.vtoi[8].K}
(assert (= sc_70 sc_54))
; 
; =  {of.input.V[12].O} {of.vtoi[8].K}
(assert (= of_70 of_54))
; 
; =  {sc.input.V[8].O} {sc.vadd[2].D}
(assert (= sc_66 sc_34))
; 
; =  {of.input.V[8].O} {of.vadd[2].D}
(assert (= of_66 of_34))
; 
; =  {sc.input.I[2].O} {sc.iadd[8].C}
(assert (= sc_6 sc_96))
; 
; =  {of.input.I[2].O} {of.iadd[8].C}
(assert (= of_6 of_96))
; 
; =  {sc.input.V[2].O} {sc.vadd[2].A}
(assert (= sc_64 sc_36))
; 
; =  {of.input.V[2].O} {of.vadd[2].A}
(assert (= of_64 of_36))
; 
; =  {sc.input.V[3].O} {sc.vadd[2].C}
(assert (= sc_82 sc_35))
; 
; =  {of.input.V[3].O} {of.vadd[2].C}
(assert (= of_82 of_35))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[1].X}
(assert (= sc_46 sc_31))
; 
; =  {of.vadd[5].OUT2} {of.output.V[1].X}
(assert (= of_46 of_31))
; 
; =  {sc.vadd[5].OUT2} {sc.switch[7].Vmax}
(assert (= sc_46 sc_3))
; 
; =  {of.vadd[5].OUT2} {of.switch[7].Vmax}
(assert (= of_46 of_3))
; 
; =  {sc.input.I[10].O} {sc.iadd[9].B}
(assert (= sc_18 sc_103))
; 
; =  {of.input.I[10].O} {of.iadd[9].B}
(assert (= of_18 of_103))
; 
; =  {sc.input.I[1].O} {sc.iadd[8].D}
(assert (= sc_28 sc_95))
; 
; =  {of.input.I[1].O} {of.iadd[8].D}
(assert (= of_28 of_95))
; 
; =  {sc.input.I[7].O} {sc.itov[4].X}
(assert (= sc_10 sc_89))
; 
; =  {of.input.I[7].O} {of.itov[4].X}
(assert (= of_10 of_89))
; 
; =  {sc.input.V[1].O} {sc.ihill[0].n}
(assert (= sc_88 sc_47))
; 
; =  {of.input.V[1].O} {of.ihill[0].n}
(assert (= of_88 of_47))
; 
; =  {sc.input.V[7].O} {sc.vadd[2].OUT2_0}
(assert (= sc_68 sc_33))
; 
; =  {of.input.V[7].O} {of.vadd[2].OUT2_0}
(assert (= of_68 of_33))
; 
; =  {sc.iadd[9].OUT} {sc.igenebind[3].K}
(assert (= sc_104 sc_60))
; 
; =  {of.iadd[9].OUT} {of.igenebind[3].K}
(assert (= of_104 of_60))
; 
; =  {sc.input.I[8].O} {sc.igenebind[3].TF}
(assert (= sc_8 sc_59))
; 
; =  {of.input.I[8].O} {of.igenebind[3].TF}
(assert (= of_8 of_59))
; 
; =  {sc.vtoi[8].Y} {sc.ihill[0].S}
(assert (= sc_55 sc_48))
; 
; =  {of.vtoi[8].Y} {of.ihill[0].S}
(assert (= of_55 of_48))
; 
; =  {sc.input.V[0].O} {sc.vtoi[6].K}
(assert (= sc_74 sc_57))
; 
; =  {of.input.V[0].O} {of.vtoi[6].K}
(assert (= of_74 of_57))
; 
; =  {sc.igenebind[3].GE} {sc.itov[1].K}
(assert (= sc_62 sc_93))
; 
; =  {of.igenebind[3].GE} {of.itov[1].K}
(assert (= of_62 of_93))
; 
; =  {sc.input.V[10].O} {sc.switch[7].n}
(assert (= sc_78 sc_0))
; 
; =  {of.input.V[10].O} {of.switch[7].n}
(assert (= of_78 of_0))
; 
; =  {sc.itov[4].Y} {sc.vadd[5].B}
(assert (= sc_91 sc_44))
; 
; =  {of.itov[4].Y} {of.vadd[5].B}
(assert (= of_91 of_44))
; 
; =  {sc.iadd[8].OUT} {sc.switch[7].Kmod}
(assert (= sc_99 sc_2))
; 
; =  {of.iadd[8].OUT} {of.switch[7].Kmod}
(assert (= of_99 of_2))
; 
; =  {sc.input.V[5].O} {sc.vadd[5].C}
(assert (= sc_86 sc_42))
; 
; =  {of.input.V[5].O} {of.vadd[5].C}
(assert (= of_86 of_42))
; 
; =  {sc.input.V[4].O} {sc.vadd[5].A}
(assert (= sc_84 sc_43))
; 
; =  {of.input.V[4].O} {of.vadd[5].A}
(assert (= of_84 of_43))
; 
; =  {sc.input.V[6].O} {sc.vadd[5].OUT2_0}
(assert (= sc_80 sc_40))
; 
; =  {of.input.V[6].O} {of.vadd[5].OUT2_0}
(assert (= of_80 of_40))
; 
; =  {sc.input.I[11].O} {sc.iadd[9].D}
(assert (= sc_14 sc_100))
; 
; =  {of.input.I[11].O} {of.iadd[9].D}
(assert (= of_14 of_100))
(assert (<= (* (/ 1. sc_30) 0.001) 0.1))
(assert (<= (* (/ 1. sc_32) 0.001) 0.1))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].O} {sc.vadd[5].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_39 sc_30) (= sc_39 sc_46)) (= sc_39 sc_32)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_29 0.) slbot_29 (- slbot_29)) (ite (>= slbot_32 0.) slbot_32 (- slbot_32))) (ite (>= slbot_44 0.) slbot_44 (- slbot_44))) (ite (>= sltop_52 0.) sltop_52 (- sltop_52))) (ite (>= sltop_32 0.) sltop_32 (- sltop_32))) (ite (>= sltop_55 0.) sltop_55 (- sltop_55))) (ite (>= sltop_91 0.) sltop_91 (- sltop_91))) (ite (>= sltop_90 0.) sltop_90 (- sltop_90))) (ite (>= sltop_4 0.) sltop_4 (- sltop_4))) (ite (>= slbot_60 0.) slbot_60 (- slbot_60))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_46 0.) slbot_46 (- slbot_46))) (ite (>= slbot_53 0.) slbot_53 (- slbot_53))) (ite (>= sltop_104 0.) sltop_104 (- sltop_104))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_37 0.) slbot_37 (- slbot_37))) (ite (>= sltop_38 0.) sltop_38 (- sltop_38))) (ite (>= sltop_44 0.) sltop_44 (- sltop_44))) (ite (>= sltop_29 0.) sltop_29 (- sltop_29))) (ite (>= sltop_39 0.) sltop_39 (- sltop_39))) (ite (>= sltop_58 0.) sltop_58 (- sltop_58))) (ite (>= slbot_31 0.) slbot_31 (- slbot_31))) (ite (>= slbot_90 0.) slbot_90 (- slbot_90))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_31 0.) sltop_31 (- sltop_31))) (ite (>= sltop_94 0.) sltop_94 (- sltop_94))) (ite (>= sltop_57 0.) sltop_57 (- sltop_57))) (ite (>= sltop_62 0.) sltop_62 (- sltop_62))) (ite (>= sltop_98 0.) sltop_98 (- sltop_98))) (ite (>= slbot_104 0.) slbot_104 (- slbot_104))) (ite (>= slbot_4 0.) slbot_4 (- slbot_4))) (ite (>= slbot_55 0.) slbot_55 (- slbot_55))) (ite (>= slbot_57 0.) slbot_57 (- slbot_57))) (ite (>= slbot_62 0.) slbot_62 (- slbot_62))) (ite (>= slbot_52 0.) slbot_52 (- slbot_52))) (ite (>= sltop_74 0.) sltop_74 (- sltop_74))) (ite (>= sltop_102 0.) sltop_102 (- sltop_102))) (ite (>= slbot_91 0.) slbot_91 (- slbot_91))) (ite (>= slbot_98 0.) slbot_98 (- slbot_98))) (ite (>= slbot_45 0.) slbot_45 (- slbot_45))) (ite (>= slbot_48 0.) slbot_48 (- slbot_48))) (ite (>= sltop_60 0.) sltop_60 (- sltop_60))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= slbot_30 0.) slbot_30 (- slbot_30))) (ite (>= slbot_73 0.) slbot_73 (- slbot_73))) (ite (>= slbot_94 0.) slbot_94 (- slbot_94))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= sltop_30 0.) sltop_30 (- sltop_30))) (ite (>= slbot_38 0.) slbot_38 (- slbot_38))) (ite (>= sltop_45 0.) sltop_45 (- sltop_45))) (ite (>= sltop_53 0.) sltop_53 (- sltop_53))) (ite (>= sltop_48 0.) sltop_48 (- sltop_48))) (ite (>= sltop_37 0.) sltop_37 (- sltop_37))) (ite (>= sltop_46 0.) sltop_46 (- sltop_46))) (ite (>= slbot_74 0.) slbot_74 (- slbot_74))) (ite (>= sltop_73 0.) sltop_73 (- sltop_73))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_39 0.) slbot_39 (- slbot_39))) (ite (>= slbot_58 0.) slbot_58 (- slbot_58))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99))) (ite (>= slbot_102 0.) slbot_102 (- slbot_102)))))
(check-sat)
