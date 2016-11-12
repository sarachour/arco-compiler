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
; =  {(sc.switch[4].SUB/sc.switch[4].Kmod)} {1.}
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
; =  {sc.switch[4].PROD} {(sc.switch[4].Vmax/1.)}
(assert (= sc_4 (/ sc_3 1.)))
; 
; =  {of.switch[4].PROD} {0.}
(assert (= of_4 0.))
; 
; >=  {((sc.switch[4].n*1000.75)+of.switch[4].n)} {3300.}
(assert (<= (+ (* sc_0 1000.75) of_0) 3300.))
; 
; <=  {((sc.switch[4].n*1000.75)+of.switch[4].n)} {0.5}
(assert (>= (+ (* sc_0 1000.75) of_0) 0.5))
(declare-fun slbot_1 () Real)
(declare-fun sltop_1 () Real)
; 
; =  {(((sc.switch[4].SUB*0.)+of.switch[4].SUB)+sl.min.switch[4].SUB)} {0.0001}
(assert (= (+ (+ (* sc_1 0.) of_1) slbot_1) 0.0001))
; 
; =  {(((sc.switch[4].SUB*0.06)+of.switch[4].SUB)+sl.max.switch[4].SUB)} {10.}
(assert (= (+ (+ (* sc_1 0.06) of_1) sltop_1) 10.))
; 
; >=  {((sc.switch[4].Kmod*0.029618)+of.switch[4].Kmod)} {10.}
(assert (<= (+ (* sc_2 0.029618) of_2) 10.))
; 
; <=  {((sc.switch[4].Kmod*0.029618)+of.switch[4].Kmod)} {0.0001}
(assert (>= (+ (* sc_2 0.029618) of_2) 0.0001))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.switch[4].PROD*0.)+of.switch[4].PROD)+sl.min.switch[4].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4) 9.99934002508e-38))
; 
; =  {(((sc.switch[4].PROD*0.0156)+of.switch[4].PROD)+sl.max.switch[4].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_4 0.0156) of_4) sltop_4) 9.9999999))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.switch[4].Vmax*0.)+of.switch[4].Vmax)+sl.min.switch[4].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 0.0001))
; 
; =  {(((sc.switch[4].Vmax*0.0156)+of.switch[4].Vmax)+sl.max.switch[4].Vmax)} {10.}
(assert (= (+ (+ (* sc_3 0.0156) of_3) sltop_3) 10.))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.switch[4].PROD*0.)+of.switch[4].PROD)+sl.min.switch[4].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4) 9.99934002508e-38))
; 
; =  {(((sc.switch[4].PROD*0.0156)+of.switch[4].PROD)+sl.max.switch[4].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_4 0.0156) of_4) sltop_4) 9.9999999))
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
(declare-fun slbot_5 () Real)
(declare-fun sltop_5 () Real)
; 
; =  {(((sc.input.I[2].X*0.5)+of.input.I[2].X)+sl.min.input.I[2].X)} {0.}
(assert (= (+ (+ (* sc_5 0.5) of_5) slbot_5) 0.))
; 
; =  {(((sc.input.I[2].X*1.)+of.input.I[2].X)+sl.max.input.I[2].X)} {10.}
(assert (= (+ (+ (* sc_5 1.) of_5) sltop_5) 10.))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.input.I[2].O*0.5)+of.input.I[2].O)+sl.min.input.I[2].O)} {0.}
(assert (= (+ (+ (* sc_6 0.5) of_6) slbot_6) 0.))
; 
; =  {(((sc.input.I[2].O*1.)+of.input.I[2].O)+sl.max.input.I[2].O)} {10.}
(assert (= (+ (+ (* sc_6 1.) of_6) sltop_6) 10.))
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
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_7 0.) of_7) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_7 0.) of_7) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_8 0.) of_8) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_8 0.) of_8) 0.))
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
; >=  {((sc.input.I[7].X*0.029618)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_9 0.029618) of_9) 10.))
; 
; <=  {((sc.input.I[7].X*0.029618)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_9 0.029618) of_9) 0.))
; 
; >=  {((sc.input.I[7].O*0.029618)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_10 0.029618) of_10) 10.))
; 
; <=  {((sc.input.I[7].O*0.029618)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_10 0.029618) of_10) 0.))
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
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_14 sc_13))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_14 of_13))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.input.I[0].X*0.)+of.input.I[0].X)+sl.min.input.I[0].X)} {0.}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 0.))
; 
; =  {(((sc.input.I[0].X*0.06)+of.input.I[0].X)+sl.max.input.I[0].X)} {10.}
(assert (= (+ (+ (* sc_13 0.06) of_13) sltop_13) 10.))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.input.I[0].O*0.)+of.input.I[0].O)+sl.min.input.I[0].O)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14) 0.))
; 
; =  {(((sc.input.I[0].O*0.06)+of.input.I[0].O)+sl.max.input.I[0].O)} {10.}
(assert (= (+ (+ (* sc_14 0.06) of_14) sltop_14) 10.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_16 0.) of_16) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[6].X*4.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_17 4.) of_17) 10.))
; 
; <=  {((sc.input.I[6].X*4.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_17 4.) of_17) 0.))
; 
; >=  {((sc.input.I[6].O*4.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_18 4.) of_18) 10.))
; 
; <=  {((sc.input.I[6].O*4.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_18 4.) of_18) 0.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[3].X*0.15625)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_19 0.15625) of_19) 10.))
; 
; <=  {((sc.input.I[3].X*0.15625)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_19 0.15625) of_19) 0.))
; 
; >=  {((sc.input.I[3].O*0.15625)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_20 0.15625) of_20) 10.))
; 
; <=  {((sc.input.I[3].O*0.15625)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_20 0.15625) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_22 sc_21))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_22 of_21))
; 
; >=  {((sc.input.I[4].X*0.0156)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_21 0.0156) of_21) 10.))
; 
; <=  {((sc.input.I[4].X*0.0156)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_21 0.0156) of_21) 0.))
; 
; >=  {((sc.input.I[4].O*0.0156)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_22 0.0156) of_22) 10.))
; 
; <=  {((sc.input.I[4].O*0.0156)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_22 0.0156) of_22) 0.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_24 sc_23))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_24 of_23))
; 
; >=  {((sc.input.I[5].X*4.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_23 4.) of_23) 10.))
; 
; <=  {((sc.input.I[5].X*4.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_23 4.) of_23) 0.))
; 
; >=  {((sc.input.I[5].O*4.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_24 4.) of_24) 10.))
; 
; <=  {((sc.input.I[5].O*4.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_24 4.) of_24) 0.))
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
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.input.I[1].X*0.5)+of.input.I[1].X)+sl.min.input.I[1].X)} {0.}
(assert (= (+ (+ (* sc_25 0.5) of_25) slbot_25) 0.))
; 
; =  {(((sc.input.I[1].X*1.)+of.input.I[1].X)+sl.max.input.I[1].X)} {10.}
(assert (= (+ (+ (* sc_25 1.) of_25) sltop_25) 10.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.input.I[1].O*0.5)+of.input.I[1].O)+sl.min.input.I[1].O)} {0.}
(assert (= (+ (+ (* sc_26 0.5) of_26) slbot_26) 0.))
; 
; =  {(((sc.input.I[1].O*1.)+of.input.I[1].O)+sl.max.input.I[1].O)} {10.}
(assert (= (+ (+ (* sc_26 1.) of_26) sltop_26) 10.))
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
; =  {(((sc.output.V[0].X*0.15625)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_27 0.15625) of_27) sltop_27) 3300.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.15625)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_28 0.15625) of_28) sltop_28) 3300.))
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
; =  {(((sc.output.V[1].X*0.0156)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_29 0.0156) of_29) sltop_29) 3300.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.0156)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_30 0.0156) of_30) sltop_30) 3300.))
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
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_34 (* 1. sc_35)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D)}
(assert (and (= sc_34 (* 1. sc_33)) (= sc_34 (* 1. sc_32))))
; no offset
(assert (= (- (+ of_34 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1.)}
(assert (= sc_36 (* sc_34 1.)))
; 
; =  {of.vadd[6].OUT} {0.}
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
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_34 (* 1. sc_35)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D*sc.vadd[6].OUT2)}
(assert (and (= sc_34 (* 1. sc_33)) (= sc_34 (* (* 1. sc_32) sc_37))))
; no offset
(assert (= (- (+ of_34 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1.)}
(assert (= sc_37 (* sc_34 1.)))
; no offset
(assert (= of_37 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1.)}
(assert (= sc_31 (* sc_34 1.)))
; 
; =  {of.vadd[6].OUT2_0} {0.}
(assert (= of_31 0.))
; 
; >=  {((sc.vadd[6].OUT2_0*0.)+of.vadd[6].OUT2_0)} {3300.}
(assert (<= (+ (* sc_31 0.) of_31) 3300.))
; 
; <=  {((sc.vadd[6].OUT2_0*0.)+of.vadd[6].OUT2_0)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.vadd[6].D*4e-06)+of.vadd[6].D)} {3300.}
(assert (<= (+ (* sc_32 4e-06) of_32) 3300.))
; 
; <=  {((sc.vadd[6].D*4e-06)+of.vadd[6].D)} {0.}
(assert (>= (+ (* sc_32 4e-06) of_32) 0.))
; 
; >=  {((sc.vadd[6].C*0.)+of.vadd[6].C)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.vadd[6].C*0.)+of.vadd[6].C)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {3300.}
(assert (<= (+ (* sc_34 0.) of_34) 3300.))
; 
; <=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) 0.))
; 
; =  {(((sc.vadd[6].OUT2*0.15625)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {3300.}
(assert (= (+ (+ (* sc_37 0.15625) of_37) sltop_37) 3300.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.vadd[6].B*0.0307207562032)+of.vadd[6].B)+sl.min.vadd[6].B)} {0.}
(assert (= (+ (+ (* sc_35 0.0307207562032) of_35) slbot_35) 0.))
; 
; =  {(((sc.vadd[6].B*0.1248)+of.vadd[6].B)+sl.max.vadd[6].B)} {3300.}
(assert (= (+ (+ (* sc_35 0.1248) of_35) sltop_35) 3300.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.0307207562032)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {-1650.}
(assert (= (+ (+ (* sc_36 0.0307207562032) of_36) slbot_36) -1650.))
; 
; =  {(((sc.vadd[6].OUT*0.1248)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1650.}
(assert (= (+ (+ (* sc_36 0.1248) of_36) sltop_36) 1650.))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) 0.))
; 
; =  {(((sc.vadd[6].OUT2*0.15625)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {3300.}
(assert (= (+ (+ (* sc_37 0.15625) of_37) sltop_37) 3300.))
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
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_41 (* 1. sc_42)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D)}
(assert (and (= sc_41 (* 1. sc_40)) (= sc_41 (* 1. sc_39))))
; no offset
(assert (= (- (+ of_41 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT} {(sc.vadd[3].A*1.)}
(assert (= sc_43 (* sc_41 1.)))
; 
; =  {of.vadd[3].OUT} {0.}
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
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_41 (* 1. sc_42)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D*sc.vadd[3].OUT2)}
(assert (and (= sc_41 (* 1. sc_40)) (= sc_41 (* (* 1. sc_39) sc_44))))
; no offset
(assert (= (- (+ of_41 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2} {(sc.vadd[3].A*1.)}
(assert (= sc_44 (* sc_41 1.)))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2_0} {(sc.vadd[3].A*1.)}
(assert (= sc_38 (* sc_41 1.)))
; 
; =  {of.vadd[3].OUT2_0} {0.}
(assert (= of_38 0.))
; 
; >=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {3300.}
(assert (<= (+ (* sc_38 0.) of_38) 3300.))
; 
; <=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.vadd[3].D*4e-06)+of.vadd[3].D)} {3300.}
(assert (<= (+ (* sc_39 4e-06) of_39) 3300.))
; 
; <=  {((sc.vadd[3].D*4e-06)+of.vadd[3].D)} {0.}
(assert (>= (+ (* sc_39 4e-06) of_39) 0.))
; 
; >=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {3300.}
(assert (<= (+ (* sc_40 0.) of_40) 3300.))
; 
; <=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {3300.}
(assert (<= (+ (* sc_41 0.) of_41) 3300.))
; 
; <=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun slbot_44 () Real)
(declare-fun sltop_44 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44) 0.))
; 
; =  {(((sc.vadd[3].OUT2*0.0156)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_44 0.0156) of_44) sltop_44) 3300.))
(declare-fun slbot_42 () Real)
(declare-fun sltop_42 () Real)
; 
; =  {(((sc.vadd[3].B*0.109429385666)+of.vadd[3].B)+sl.min.vadd[3].B)} {0.}
(assert (= (+ (+ (* sc_42 0.109429385666) of_42) slbot_42) 0.))
; 
; =  {(((sc.vadd[3].B*3.53553390593)+of.vadd[3].B)+sl.max.vadd[3].B)} {3300.}
(assert (= (+ (+ (* sc_42 3.53553390593) of_42) sltop_42) 3300.))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vadd[3].OUT*0.109429385666)+of.vadd[3].OUT)+sl.min.vadd[3].OUT)} {-1650.}
(assert (= (+ (+ (* sc_43 0.109429385666) of_43) slbot_43) -1650.))
; 
; =  {(((sc.vadd[3].OUT*3.53553390593)+of.vadd[3].OUT)+sl.max.vadd[3].OUT)} {1650.}
(assert (= (+ (+ (* sc_43 3.53553390593) of_43) sltop_43) 1650.))
(declare-fun slbot_44 () Real)
(declare-fun sltop_44 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44) 0.))
; 
; =  {(((sc.vadd[3].OUT2*0.0156)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_44 0.0156) of_44) sltop_44) 3300.))
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
(assert (= sc_45 1.))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= of_45 0.))
; no scale
(assert (= sc_47 1.))
; no scale
(assert (= sc_45 1.))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= of_45 0.))
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
; >=  {((sc.ihill[0].n*1.)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_45 1.) of_45) 5.))
; 
; <=  {((sc.ihill[0].n*1.)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_45 1.) of_45) 1.))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 1.))
; 
; =  {(((sc.ihill[0].S*0.0156)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_46 0.0156) of_46) sltop_46) 10.))
(declare-fun slbot_50 () Real)
(declare-fun sltop_50 () Real)
; 
; =  {(((sc.ihill[0].REP*0.00768018905081)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {5e-10}
(assert (= (+ (+ (* sc_50 0.00768018905081) of_50) slbot_50) 5e-10))
; 
; =  {(((sc.ihill[0].REP*0.0312)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {500000.}
(assert (= (+ (+ (* sc_50 0.0312) of_50) sltop_50) 500000.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.ihill[0].Km*0.5)+of.ihill[0].Km)+sl.min.ihill[0].Km)} {1.}
(assert (= (+ (+ (* sc_47 0.5) of_47) slbot_47) 1.))
; 
; =  {(((sc.ihill[0].Km*1.)+of.ihill[0].Km)+sl.max.ihill[0].Km)} {10.}
(assert (= (+ (+ (* sc_47 1.) of_47) sltop_47) 10.))
; 
; >=  {((sc.ihill[0].Vmax*0.0156)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_48 0.0156) of_48) 10.))
; 
; <=  {((sc.ihill[0].Vmax*0.0156)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_48 0.0156) of_48) 0.0001))
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
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
; no offset
(assert (= of_52 0.))
; no offset
(assert (= of_53 0.))
; no scale
(assert (= (/ sc_52 sc_53) 1.))
; no scale
(assert (= sc_51 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_51 0.))
; no offset
(assert (= of_52 0.))
; no offset
(assert (= of_53 0.))
; no scale
(assert (= (/ sc_52 sc_53) 1.))
; no scale
(assert (= sc_51 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_51 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_54 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[1].STIM} {(sc.ihill[1].Vmax*(1./1.))}
(assert (= sc_55 (* sc_54 (/ 1. 1.))))
; 
; =  {of.ihill[1].STIM} {0.}
(assert (= of_55 0.))
; no scale
(assert (= sc_53 1.))
; no scale
(assert (= sc_51 1.))
; no offset
(assert (= of_53 0.))
; no offset
(assert (= of_51 0.))
; no scale
(assert (= sc_53 1.))
; no scale
(assert (= sc_51 1.))
; no offset
(assert (= of_53 0.))
; no offset
(assert (= of_51 0.))
; no scale
(assert (= sc_52 1.))
; no scale
(assert (= sc_51 1.))
; no offset
(assert (= of_52 0.))
; no offset
(assert (= of_51 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_54 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[1].REP} {(sc.ihill[1].Vmax*(1./1.))}
(assert (= sc_56 (* sc_54 (/ 1. 1.))))
; 
; =  {of.ihill[1].REP} {0.}
(assert (= of_56 0.))
; 
; >=  {((sc.ihill[1].n*2.5)+of.ihill[1].n)} {5.}
(assert (<= (+ (* sc_51 2.5) of_51) 5.))
; 
; <=  {((sc.ihill[1].n*2.5)+of.ihill[1].n)} {1.}
(assert (>= (+ (* sc_51 2.5) of_51) 1.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.ihill[1].S*0.)+of.ihill[1].S)+sl.min.ihill[1].S)} {1.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) 1.))
; 
; =  {(((sc.ihill[1].S*0.15625)+of.ihill[1].S)+sl.max.ihill[1].S)} {10.}
(assert (= (+ (+ (* sc_52 0.15625) of_52) sltop_52) 10.))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.ihill[1].REP*0.0273573464165)+of.ihill[1].REP)+sl.min.ihill[1].REP)} {5e-10}
(assert (= (+ (+ (* sc_56 0.0273573464165) of_56) slbot_56) 5e-10))
; 
; =  {(((sc.ihill[1].REP*0.883883476483)+of.ihill[1].REP)+sl.max.ihill[1].REP)} {500000.}
(assert (= (+ (+ (* sc_56 0.883883476483) of_56) sltop_56) 500000.))
(declare-fun slbot_53 () Real)
(declare-fun sltop_53 () Real)
; 
; =  {(((sc.ihill[1].Km*0.5)+of.ihill[1].Km)+sl.min.ihill[1].Km)} {1.}
(assert (= (+ (+ (* sc_53 0.5) of_53) slbot_53) 1.))
; 
; =  {(((sc.ihill[1].Km*1.)+of.ihill[1].Km)+sl.max.ihill[1].Km)} {10.}
(assert (= (+ (+ (* sc_53 1.) of_53) sltop_53) 10.))
; 
; >=  {((sc.ihill[1].Vmax*0.15625)+of.ihill[1].Vmax)} {10.}
(assert (<= (+ (* sc_54 0.15625) of_54) 10.))
; 
; <=  {((sc.ihill[1].Vmax*0.15625)+of.ihill[1].Vmax)} {0.0001}
(assert (>= (+ (* sc_54 0.15625) of_54) 0.0001))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.ihill[1].STIM*1.)+of.ihill[1].STIM)+sl.min.ihill[1].STIM)} {9.999900001e-15}
(assert (= (+ (+ (* sc_55 1.) of_55) slbot_55) 9.999900001e-15))
; 
; =  {(((sc.ihill[1].STIM*5.65685424949)+of.ihill[1].STIM)+sl.max.ihill[1].STIM)} {999990.0001}
(assert (= (+ (+ (* sc_55 5.65685424949) of_55) sltop_55) 999990.0001))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.ihill[1].REP*0.0273573464165)+of.ihill[1].REP)+sl.min.ihill[1].REP)} {5e-10}
(assert (= (+ (+ (* sc_56 0.0273573464165) of_56) slbot_56) 5e-10))
; 
; =  {(((sc.ihill[1].REP*0.883883476483)+of.ihill[1].REP)+sl.max.ihill[1].REP)} {500000.}
(assert (= (+ (+ (* sc_56 0.883883476483) of_56) sltop_56) 500000.))
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_58 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_57 0.))
; 
; =  {sc.vtoi[1].Y} {((1./sc.vtoi[1].K)*sc.vtoi[1].X)}
(assert (= sc_59 (* (/ 1. sc_58) sc_57)))
; 
; =  {of.vtoi[1].Y} {0.}
(assert (= of_59 0.))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.vtoi[1].X*0.)+of.vtoi[1].X)+sl.min.vtoi[1].X)} {1.}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) 1.))
; 
; =  {(((sc.vtoi[1].X*0.15625)+of.vtoi[1].X)+sl.max.vtoi[1].X)} {3300.}
(assert (= (+ (+ (* sc_57 0.15625) of_57) sltop_57) 3300.))
; 
; >=  {((sc.vtoi[1].K*1.)+of.vtoi[1].K)} {3300.}
(assert (<= (+ (* sc_58 1.) of_58) 3300.))
; 
; <=  {((sc.vtoi[1].K*1.)+of.vtoi[1].K)} {1.}
(assert (>= (+ (* sc_58 1.) of_58) 1.))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.vtoi[1].Y*0.)+of.vtoi[1].Y)+sl.min.vtoi[1].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59) 0.00030303030303))
; 
; =  {(((sc.vtoi[1].Y*0.15625)+of.vtoi[1].Y)+sl.max.vtoi[1].Y)} {3300.}
(assert (= (+ (+ (* sc_59 0.15625) of_59) sltop_59) 3300.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_61 0.) of_61) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.V[8].X*4e-06)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_62 4e-06) of_62) 3300.))
; 
; <=  {((sc.input.V[8].X*4e-06)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_62 4e-06) of_62) 0.))
; 
; >=  {((sc.input.V[8].O*4e-06)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_63 4e-06) of_63) 3300.))
; 
; <=  {((sc.input.V[8].O*4e-06)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_63 4e-06) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.V[7].X*4e-06)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_64 4e-06) of_64) 3300.))
; 
; <=  {((sc.input.V[7].X*4e-06)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_64 4e-06) of_64) 0.))
; 
; >=  {((sc.input.V[7].O*4e-06)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_65 4e-06) of_65) 3300.))
; 
; <=  {((sc.input.V[7].O*4e-06)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_65 4e-06) of_65) 0.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.V[9].X*1000.75)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_66 1000.75) of_66) 3300.))
; 
; <=  {((sc.input.V[9].X*1000.75)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_66 1000.75) of_66) 0.))
; 
; >=  {((sc.input.V[9].O*1000.75)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_67 1000.75) of_67) 3300.))
; 
; <=  {((sc.input.V[9].O*1000.75)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_67 1000.75) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_68 1.) of_68) 3300.))
; 
; <=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_68 1.) of_68) 0.))
; 
; >=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_69 1.) of_69) 3300.))
; 
; <=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_69 1.) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.V[0].X*2.5)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_70 2.5) of_70) 3300.))
; 
; <=  {((sc.input.V[0].X*2.5)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_70 2.5) of_70) 0.))
; 
; >=  {((sc.input.V[0].O*2.5)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_71 2.5) of_71) 3300.))
; 
; <=  {((sc.input.V[0].O*2.5)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_71 2.5) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_73 sc_72))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_73 of_72))
; 
; >=  {((sc.input.V[10].X*1.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_72 1.) of_72) 3300.))
; 
; <=  {((sc.input.V[10].X*1.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_72 1.) of_72) 0.))
; 
; >=  {((sc.input.V[10].O*1.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_73 1.) of_73) 3300.))
; 
; <=  {((sc.input.V[10].O*1.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_73 1.) of_73) 0.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_75 sc_74))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_75 of_74))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_74 0.) of_74) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_75 0.) of_75) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_77 sc_76))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_77 of_76))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_76 0.) of_76) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_77 0.) of_77) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_79 sc_78))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_79 of_78))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_78 0.) of_78) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_81 sc_80))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_81 of_80))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_80 0.) of_80) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_80 0.) of_80) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_81 0.) of_81) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_81 0.) of_81) 0.))
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_83 sc_82))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_83 of_82))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_82 0.) of_82) 3300.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_82 0.) of_82) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_83 0.) of_83) 3300.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_83 0.) of_83) 0.))
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
; no offset
(assert (= of_85 0.))
; no offset
(assert (= of_84 0.))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_86 (* sc_85 sc_84)))
; 
; =  {of.itov[2].Y} {0.}
(assert (= of_86 0.))
; 
; >=  {((sc.itov[2].X*4.)+of.itov[2].X)} {10.}
(assert (<= (+ (* sc_84 4.) of_84) 10.))
; 
; <=  {((sc.itov[2].X*4.)+of.itov[2].X)} {0.0001}
(assert (>= (+ (* sc_84 4.) of_84) 0.0001))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.itov[2].Y*0.109429385666)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_86 0.109429385666) of_86) slbot_86) 0.0001))
; 
; =  {(((sc.itov[2].Y*3.53553390593)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_86 3.53553390593) of_86) sltop_86) 3300.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.itov[2].K*0.0273573464165)+of.itov[2].K)+sl.min.itov[2].K)} {1.}
(assert (= (+ (+ (* sc_85 0.0273573464165) of_85) slbot_85) 1.))
; 
; =  {(((sc.itov[2].K*0.883883476483)+of.itov[2].K)+sl.max.itov[2].K)} {330.}
(assert (= (+ (+ (* sc_85 0.883883476483) of_85) sltop_85) 330.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.itov[2].Y*0.109429385666)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_86 0.109429385666) of_86) slbot_86) 0.0001))
; 
; =  {(((sc.itov[2].Y*3.53553390593)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_86 3.53553390593) of_86) sltop_86) 3300.))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
; no offset
(assert (= of_88 0.))
; no offset
(assert (= of_87 0.))
; 
; =  {sc.itov[5].Y} {(sc.itov[5].K*sc.itov[5].X)}
(assert (= sc_89 (* sc_88 sc_87)))
; 
; =  {of.itov[5].Y} {0.}
(assert (= of_89 0.))
; 
; >=  {((sc.itov[5].X*4.)+of.itov[5].X)} {10.}
(assert (<= (+ (* sc_87 4.) of_87) 10.))
; 
; <=  {((sc.itov[5].X*4.)+of.itov[5].X)} {0.0001}
(assert (>= (+ (* sc_87 4.) of_87) 0.0001))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.itov[5].Y*0.0307207562032)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_89 0.0307207562032) of_89) slbot_89) 0.0001))
; 
; =  {(((sc.itov[5].Y*0.1248)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_89 0.1248) of_89) sltop_89) 3300.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.itov[5].K*0.00768018905081)+of.itov[5].K)+sl.min.itov[5].K)} {1.}
(assert (= (+ (+ (* sc_88 0.00768018905081) of_88) slbot_88) 1.))
; 
; =  {(((sc.itov[5].K*0.0312)+of.itov[5].K)+sl.max.itov[5].K)} {330.}
(assert (= (+ (+ (* sc_88 0.0312) of_88) sltop_88) 330.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.itov[5].Y*0.0307207562032)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_89 0.0307207562032) of_89) slbot_89) 0.0001))
; 
; =  {(((sc.itov[5].Y*0.1248)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_89 0.1248) of_89) sltop_89) 3300.))
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; 
; =  {sc.iadd[0].A} {sc.iadd[0].B}
(assert (= sc_92 sc_93))
; 
; =  {sc.iadd[0].A} {sc.iadd[0].C} {sc.iadd[0].D}
(assert (and (= sc_92 sc_91) (= sc_92 sc_90)))
; 
; =  {sc.iadd[0].OUT} {sc.iadd[0].A}
(assert (= sc_94 sc_92))
; 
; =  {of.iadd[0].OUT} {((of.iadd[0].A+of.iadd[0].B)-of.iadd[0].C-of.iadd[0].D)}
(assert (= of_94 (- (+ of_92 of_93) (+ of_91 of_90))))
; 
; >=  {((sc.iadd[0].D*0.)+of.iadd[0].D)} {5.}
(assert (<= (+ (* sc_90 0.) of_90) 5.))
; 
; <=  {((sc.iadd[0].D*0.)+of.iadd[0].D)} {0.}
(assert (>= (+ (* sc_90 0.) of_90) 0.))
; 
; >=  {((sc.iadd[0].C*0.)+of.iadd[0].C)} {5.}
(assert (<= (+ (* sc_91 0.) of_91) 5.))
; 
; <=  {((sc.iadd[0].C*0.)+of.iadd[0].C)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.iadd[0].A*0.)+of.iadd[0].A)+sl.min.iadd[0].A)} {0.}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 0.))
; 
; =  {(((sc.iadd[0].A*0.0156)+of.iadd[0].A)+sl.max.iadd[0].A)} {5.}
(assert (= (+ (+ (* sc_92 0.0156) of_92) sltop_92) 5.))
; 
; >=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {5.}
(assert (<= (+ (* sc_93 0.) of_93) 5.))
; 
; <=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {0.}
(assert (>= (+ (* sc_93 0.) of_93) 0.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.iadd[0].OUT*0.)+of.iadd[0].OUT)+sl.min.iadd[0].OUT)} {-10.}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94) -10.))
; 
; =  {(((sc.iadd[0].OUT*0.0156)+of.iadd[0].OUT)+sl.max.iadd[0].OUT)} {10.}
(assert (= (+ (+ (* sc_94 0.0156) of_94) sltop_94) 10.))
; 
; =  {sc.itov[2].Y} {sc.vadd[3].B}
(assert (= sc_86 sc_42))
; 
; =  {of.itov[2].Y} {of.vadd[3].B}
(assert (= of_86 of_42))
; 
; =  {sc.input.I[6].O} {sc.itov[2].X}
(assert (= sc_18 sc_84))
; 
; =  {of.input.I[6].O} {of.itov[2].X}
(assert (= of_18 of_84))
; 
; =  {sc.input.I[0].O} {sc.switch[4].SUB}
(assert (= sc_14 sc_1))
; 
; =  {of.input.I[0].O} {of.switch[4].SUB}
(assert (= of_14 of_1))
; 
; =  {sc.ihill[0].REP} {sc.itov[5].K}
(assert (= sc_50 sc_88))
; 
; =  {of.ihill[0].REP} {of.itov[5].K}
(assert (= of_50 of_88))
; 
; =  {sc.input.V[9].O} {sc.switch[4].n}
(assert (= sc_67 sc_0))
; 
; =  {of.input.V[9].O} {of.switch[4].n}
(assert (= of_67 of_0))
; 
; =  {sc.input.I[9].O} {sc.iadd[0].B}
(assert (= sc_12 sc_93))
; 
; =  {of.input.I[9].O} {of.iadd[0].B}
(assert (= of_12 of_93))
; 
; =  {sc.input.I[4].O} {sc.ihill[0].Vmax}
(assert (= sc_22 sc_48))
; 
; =  {of.input.I[4].O} {of.ihill[0].Vmax}
(assert (= of_22 of_48))
; 
; =  {sc.input.I[3].O} {sc.ihill[1].Vmax}
(assert (= sc_20 sc_54))
; 
; =  {of.input.I[3].O} {of.ihill[1].Vmax}
(assert (= of_20 of_54))
; 
; =  {sc.input.I[5].O} {sc.itov[5].X}
(assert (= sc_24 sc_87))
; 
; =  {of.input.I[5].O} {of.itov[5].X}
(assert (= of_24 of_87))
; 
; =  {sc.input.V[11].O} {sc.vtoi[1].K}
(assert (= sc_69 sc_58))
; 
; =  {of.input.V[11].O} {of.vtoi[1].K}
(assert (= of_69 of_58))
; 
; =  {sc.vtoi[1].Y} {sc.ihill[1].S}
(assert (= sc_59 sc_52))
; 
; =  {of.vtoi[1].Y} {of.ihill[1].S}
(assert (= of_59 of_52))
; 
; =  {sc.itov[5].Y} {sc.vadd[6].B}
(assert (= sc_89 sc_35))
; 
; =  {of.itov[5].Y} {of.vadd[6].B}
(assert (= of_89 of_35))
; 
; =  {sc.input.V[8].O} {sc.vadd[3].D}
(assert (= sc_63 sc_39))
; 
; =  {of.input.V[8].O} {of.vadd[3].D}
(assert (= of_63 of_39))
; 
; =  {sc.input.I[2].O} {sc.ihill[0].Km}
(assert (= sc_6 sc_47))
; 
; =  {of.input.I[2].O} {of.ihill[0].Km}
(assert (= of_6 of_47))
; 
; =  {sc.input.V[2].O} {sc.vadd[3].C}
(assert (= sc_61 sc_40))
; 
; =  {of.input.V[2].O} {of.vadd[3].C}
(assert (= of_61 of_40))
; 
; =  {sc.input.V[3].O} {sc.vadd[6].C}
(assert (= sc_77 sc_33))
; 
; =  {of.input.V[3].O} {of.vadd[6].C}
(assert (= of_77 of_33))
; 
; =  {sc.iadd[0].OUT} {sc.ihill[0].S}
(assert (= sc_94 sc_46))
; 
; =  {of.iadd[0].OUT} {of.ihill[0].S}
(assert (= of_94 of_46))
; 
; =  {sc.vadd[3].OUT2} {sc.switch[4].Vmax}
(assert (= sc_44 sc_3))
; 
; =  {of.vadd[3].OUT2} {of.switch[4].Vmax}
(assert (= of_44 of_3))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[1].X}
(assert (= sc_44 sc_29))
; 
; =  {of.vadd[3].OUT2} {of.output.V[1].X}
(assert (= of_44 of_29))
; 
; =  {sc.input.I[10].O} {sc.iadd[0].D}
(assert (= sc_16 sc_90))
; 
; =  {of.input.I[10].O} {of.iadd[0].D}
(assert (= of_16 of_90))
; 
; =  {sc.input.I[1].O} {sc.ihill[1].Km}
(assert (= sc_26 sc_53))
; 
; =  {of.input.I[1].O} {of.ihill[1].Km}
(assert (= of_26 of_53))
; 
; =  {sc.input.V[1].O} {sc.vadd[3].A}
(assert (= sc_83 sc_41))
; 
; =  {of.input.V[1].O} {of.vadd[3].A}
(assert (= of_83 of_41))
; 
; =  {sc.input.I[7].O} {sc.switch[4].Kmod}
(assert (= sc_10 sc_2))
; 
; =  {of.input.I[7].O} {of.switch[4].Kmod}
(assert (= of_10 of_2))
; 
; =  {sc.input.V[7].O} {sc.vadd[6].D}
(assert (= sc_65 sc_32))
; 
; =  {of.input.V[7].O} {of.vadd[6].D}
(assert (= of_65 of_32))
; 
; =  {sc.input.I[8].O} {sc.iadd[0].C}
(assert (= sc_8 sc_91))
; 
; =  {of.input.I[8].O} {of.iadd[0].C}
(assert (= of_8 of_91))
; 
; =  {sc.switch[4].PROD} {sc.iadd[0].A}
(assert (= sc_4 sc_92))
; 
; =  {of.switch[4].PROD} {of.iadd[0].A}
(assert (= of_4 of_92))
; 
; =  {sc.ihill[1].REP} {sc.itov[2].K}
(assert (= sc_56 sc_85))
; 
; =  {of.ihill[1].REP} {of.itov[2].K}
(assert (= of_56 of_85))
; 
; =  {sc.input.V[10].O} {sc.ihill[0].n}
(assert (= sc_73 sc_45))
; 
; =  {of.input.V[10].O} {of.ihill[0].n}
(assert (= of_73 of_45))
; 
; =  {sc.input.V[0].O} {sc.ihill[1].n}
(assert (= sc_71 sc_51))
; 
; =  {of.input.V[0].O} {of.ihill[1].n}
(assert (= of_71 of_51))
; 
; =  {sc.input.V[4].O} {sc.vadd[6].A}
(assert (= sc_79 sc_34))
; 
; =  {of.input.V[4].O} {of.vadd[6].A}
(assert (= of_79 of_34))
; 
; =  {sc.input.V[5].O} {sc.vadd[6].OUT2_0}
(assert (= sc_81 sc_31))
; 
; =  {of.input.V[5].O} {of.vadd[6].OUT2_0}
(assert (= of_81 of_31))
; 
; =  {sc.vadd[6].OUT2} {sc.vtoi[1].X}
(assert (= sc_37 sc_57))
; 
; =  {of.vadd[6].OUT2} {of.vtoi[1].X}
(assert (= of_37 of_57))
; 
; =  {sc.vadd[6].OUT2} {sc.output.V[0].X}
(assert (= sc_37 sc_27))
; 
; =  {of.vadd[6].OUT2} {of.output.V[0].X}
(assert (= of_37 of_27))
; 
; =  {sc.input.V[6].O} {sc.vadd[3].OUT2_0}
(assert (= sc_75 sc_38))
; 
; =  {of.input.V[6].O} {of.vadd[3].OUT2_0}
(assert (= of_75 of_38))
(assert (<= (* sc_28 0.001) 0.001))
(assert (<= (* sc_30 0.001) 0.001))
; 
; =  {sc.vadd[6].OUT2} {sc.output.V[0].O} {sc.vadd[3].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_37 sc_28) (= sc_37 sc_44)) (= sc_37 sc_30)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_36 0.) sltop_36 (- sltop_36)) (ite (>= slbot_92 0.) slbot_92 (- slbot_92))) (ite (>= slbot_14 0.) slbot_14 (- slbot_14))) (ite (>= sltop_1 0.) sltop_1 (- sltop_1))) (ite (>= sltop_14 0.) sltop_14 (- sltop_14))) (ite (>= slbot_44 0.) slbot_44 (- slbot_44))) (ite (>= slbot_35 0.) slbot_35 (- slbot_35))) (ite (>= sltop_4 0.) sltop_4 (- sltop_4))) (ite (>= sltop_27 0.) sltop_27 (- sltop_27))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_42 0.) sltop_42 (- sltop_42))) (ite (>= slbot_46 0.) slbot_46 (- slbot_46))) (ite (>= slbot_53 0.) slbot_53 (- slbot_53))) (ite (>= slbot_26 0.) slbot_26 (- slbot_26))) (ite (>= slbot_59 0.) slbot_59 (- slbot_59))) (ite (>= slbot_36 0.) slbot_36 (- slbot_36))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_94 0.) sltop_94 (- sltop_94))) (ite (>= slbot_28 0.) slbot_28 (- slbot_28))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= slbot_55 0.) slbot_55 (- slbot_55))) (ite (>= slbot_56 0.) slbot_56 (- slbot_56))) (ite (>= slbot_5 0.) slbot_5 (- slbot_5))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= slbot_42 0.) slbot_42 (- slbot_42))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_35 0.) sltop_35 (- sltop_35))) (ite (>= slbot_27 0.) slbot_27 (- slbot_27))) (ite (>= slbot_89 0.) slbot_89 (- slbot_89))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= slbot_29 0.) slbot_29 (- slbot_29))) (ite (>= sltop_52 0.) sltop_52 (- sltop_52))) (ite (>= sltop_55 0.) sltop_55 (- sltop_55))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= sltop_28 0.) sltop_28 (- sltop_28))) (ite (>= slbot_37 0.) slbot_37 (- slbot_37))) (ite (>= sltop_44 0.) sltop_44 (- sltop_44))) (ite (>= sltop_29 0.) sltop_29 (- sltop_29))) (ite (>= sltop_89 0.) sltop_89 (- sltop_89))) (ite (>= sltop_92 0.) sltop_92 (- sltop_92))) (ite (>= slbot_25 0.) slbot_25 (- slbot_25))) (ite (>= sltop_5 0.) sltop_5 (- sltop_5))) (ite (>= sltop_57 0.) sltop_57 (- sltop_57))) (ite (>= slbot_4 0.) slbot_4 (- slbot_4))) (ite (>= slbot_57 0.) slbot_57 (- slbot_57))) (ite (>= slbot_52 0.) slbot_52 (- slbot_52))) (ite (>= sltop_56 0.) sltop_56 (- sltop_56))) (ite (>= slbot_30 0.) slbot_30 (- slbot_30))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= slbot_43 0.) slbot_43 (- slbot_43))) (ite (>= slbot_50 0.) slbot_50 (- slbot_50))) (ite (>= sltop_47 0.) sltop_47 (- sltop_47))) (ite (>= slbot_94 0.) slbot_94 (- slbot_94))) (ite (>= sltop_30 0.) sltop_30 (- sltop_30))) (ite (>= sltop_53 0.) sltop_53 (- sltop_53))) (ite (>= sltop_50 0.) sltop_50 (- sltop_50))) (ite (>= sltop_37 0.) sltop_37 (- sltop_37))) (ite (>= sltop_46 0.) sltop_46 (- sltop_46))) (ite (>= sltop_25 0.) sltop_25 (- sltop_25))) (ite (>= sltop_26 0.) sltop_26 (- sltop_26))) (ite (>= slbot_47 0.) slbot_47 (- slbot_47))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= sltop_43 0.) sltop_43 (- sltop_43))) (ite (>= slbot_1 0.) slbot_1 (- slbot_1))) (ite (>= sltop_59 0.) sltop_59 (- sltop_59)))))
(check-sat)
