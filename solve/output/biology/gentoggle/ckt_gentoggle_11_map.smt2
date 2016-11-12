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
; 
; >=  {((sc.vgain[2].X*1.)+of.vgain[2].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[2].X*1.)+of.vgain[2].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[2].Y*0.125)+of.vgain[2].Y)} {3300.}
(assert (<= (+ (* sc_1 0.125) of_1) 3300.))
; 
; <=  {((sc.vgain[2].Y*0.125)+of.vgain[2].Y)} {1.}
(assert (>= (+ (* sc_1 0.125) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[2].P*3.75903614458)+of.vgain[2].P)+sl.min.vgain[2].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 3.75903614458) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[2].P*62.4)+of.vgain[2].P)+sl.max.vgain[2].P)} {5445000.}
(assert (= (+ (+ (* sc_3 62.4) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[2].Z*0.939759036145)+of.vgain[2].Z)+sl.min.vgain[2].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.939759036145) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[2].Z*15.6)+of.vgain[2].Z)+sl.max.vgain[2].Z)} {3300.}
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
; =  {(sc.switch[7].SUB/sc.switch[7].Kmod)} {1.}
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
; =  {sc.switch[7].PROD} {(sc.switch[7].Vmax/1.)}
(assert (= sc_8 (/ sc_7 1.)))
; 
; =  {of.switch[7].PROD} {0.}
(assert (= of_8 0.))
; 
; >=  {((sc.switch[7].n*1000.75)+of.switch[7].n)} {3300.}
(assert (<= (+ (* sc_4 1000.75) of_4) 3300.))
; 
; <=  {((sc.switch[7].n*1000.75)+of.switch[7].n)} {0.5}
(assert (>= (+ (* sc_4 1000.75) of_4) 0.5))
; 
; >=  {((sc.switch[7].SUB*337.632520764)+of.switch[7].SUB)} {10.}
(assert (<= (+ (* sc_5 337.632520764) of_5) 10.))
; 
; <=  {((sc.switch[7].SUB*337.632520764)+of.switch[7].SUB)} {0.0001}
(assert (>= (+ (* sc_5 337.632520764) of_5) 0.0001))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.switch[7].Kmod*0.)+of.switch[7].Kmod)+sl.min.switch[7].Kmod)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.switch[7].Kmod*1.66666666667)+of.switch[7].Kmod)+sl.max.switch[7].Kmod)} {10.}
(assert (= (+ (+ (* sc_6 1.66666666667) of_6) sltop_6) 10.))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[7].PROD*0.)+of.switch[7].PROD)+sl.min.switch[7].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[7].PROD*15.6)+of.switch[7].PROD)+sl.max.switch[7].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 15.6) of_8) sltop_8) 9.9999999))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.switch[7].Vmax*0.)+of.switch[7].Vmax)+sl.min.switch[7].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 0.0001))
; 
; =  {(((sc.switch[7].Vmax*15.6)+of.switch[7].Vmax)+sl.max.switch[7].Vmax)} {10.}
(assert (= (+ (+ (* sc_7 15.6) of_7) sltop_7) 10.))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[7].PROD*0.)+of.switch[7].PROD)+sl.min.switch[7].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[7].PROD*15.6)+of.switch[7].PROD)+sl.max.switch[7].PROD)} {9.9999999}
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
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_14 sc_13))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_14 of_13))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_13 0.) of_13) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[13].X*337.632520764)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_15 337.632520764) of_15) 10.))
; 
; <=  {((sc.input.I[13].X*337.632520764)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_15 337.632520764) of_15) 0.))
; 
; >=  {((sc.input.I[13].O*337.632520764)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_16 337.632520764) of_16) 10.))
; 
; <=  {((sc.input.I[13].O*337.632520764)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_16 337.632520764) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_17 0.) of_17) 10.))
; 
; <=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
; 
; >=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_18 0.) of_18) 10.))
; 
; <=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_22 sc_21))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_22 of_21))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.input.I[0].X*0.)+of.input.I[0].X)+sl.min.input.I[0].X)} {0.}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) 0.))
; 
; =  {(((sc.input.I[0].X*0.6)+of.input.I[0].X)+sl.max.input.I[0].X)} {10.}
(assert (= (+ (+ (* sc_21 0.6) of_21) sltop_21) 10.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.input.I[0].O*0.)+of.input.I[0].O)+sl.min.input.I[0].O)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.input.I[0].O*0.6)+of.input.I[0].O)+sl.max.input.I[0].O)} {10.}
(assert (= (+ (+ (* sc_22 0.6) of_22) sltop_22) 10.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_24 sc_23))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_24 of_23))
; 
; >=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_23 0.) of_23) 10.))
; 
; <=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
; 
; >=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_24 0.) of_24) 10.))
; 
; <=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; 
; =  {sc.input.I[26].O} {sc.input.I[26].X}
(assert (= sc_26 sc_25))
; 
; =  {of.input.I[26].O} {of.input.I[26].X}
(assert (= of_26 of_25))
; 
; >=  {((sc.input.I[26].X*1.)+of.input.I[26].X)} {10.}
(assert (<= (+ (* sc_25 1.) of_25) 10.))
; 
; <=  {((sc.input.I[26].X*1.)+of.input.I[26].X)} {0.}
(assert (>= (+ (* sc_25 1.) of_25) 0.))
; 
; >=  {((sc.input.I[26].O*1.)+of.input.I[26].O)} {10.}
(assert (<= (+ (* sc_26 1.) of_26) 10.))
; 
; <=  {((sc.input.I[26].O*1.)+of.input.I[26].O)} {0.}
(assert (>= (+ (* sc_26 1.) of_26) 0.))
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_28 sc_27))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_28 of_27))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_30 sc_29))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_30 of_29))
; 
; >=  {((sc.input.I[15].X*4.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_29 4.) of_29) 10.))
; 
; <=  {((sc.input.I[15].X*4.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_29 4.) of_29) 0.))
; 
; >=  {((sc.input.I[15].O*4.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_30 4.) of_30) 10.))
; 
; <=  {((sc.input.I[15].O*4.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_30 4.) of_30) 0.))
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_32 of_31))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_31 0.) of_31) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_32 0.) of_32) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.I[14].X*15.6)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_33 15.6) of_33) 10.))
; 
; <=  {((sc.input.I[14].X*15.6)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_33 15.6) of_33) 0.))
; 
; >=  {((sc.input.I[14].O*15.6)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_34 15.6) of_34) 10.))
; 
; <=  {((sc.input.I[14].O*15.6)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_34 15.6) of_34) 0.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.input.I[24].O} {sc.input.I[24].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.I[24].O} {of.input.I[24].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
; 
; >=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {10.}
(assert (<= (+ (* sc_36 0.) of_36) 10.))
; 
; <=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_37 1.) of_37) 10.))
; 
; <=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_37 1.) of_37) 0.))
; 
; >=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_38 1.) of_38) 10.))
; 
; <=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_38 1.) of_38) 0.))
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_40 of_39))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_39 0.) of_39) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_40 0.) of_40) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_42 of_41))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_41 0.) of_41) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_42 0.) of_42) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_44 of_43))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_43 0.) of_43) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_44 0.) of_44) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
; 
; =  {sc.input.I[23].O} {sc.input.I[23].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.I[23].O} {of.input.I[23].X}
(assert (= of_46 of_45))
; 
; >=  {((sc.input.I[23].X*0.)+of.input.I[23].X)} {10.}
(assert (<= (+ (* sc_45 0.) of_45) 10.))
; 
; <=  {((sc.input.I[23].X*0.)+of.input.I[23].X)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
; 
; >=  {((sc.input.I[23].O*0.)+of.input.I[23].O)} {10.}
(assert (<= (+ (* sc_46 0.) of_46) 10.))
; 
; <=  {((sc.input.I[23].O*0.)+of.input.I[23].O)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
; 
; =  {sc.input.I[25].O} {sc.input.I[25].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.I[25].O} {of.input.I[25].X}
(assert (= of_48 of_47))
; 
; >=  {((sc.input.I[25].X*0.)+of.input.I[25].X)} {10.}
(assert (<= (+ (* sc_47 0.) of_47) 10.))
; 
; <=  {((sc.input.I[25].X*0.)+of.input.I[25].X)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
; 
; >=  {((sc.input.I[25].O*0.)+of.input.I[25].O)} {10.}
(assert (<= (+ (* sc_48 0.) of_48) 10.))
; 
; <=  {((sc.input.I[25].O*0.)+of.input.I[25].O)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_50 sc_49))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_50 of_49))
; 
; >=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_49 156.25) of_49) 10.))
; 
; <=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_49 156.25) of_49) 0.))
; 
; >=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_50 156.25) of_50) 10.))
; 
; <=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_50 156.25) of_50) 0.))
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_52 sc_51))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_52 of_51))
; 
; >=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_51 1.) of_51) 10.))
; 
; <=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_51 1.) of_51) 0.))
; 
; >=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_52 1.) of_52) 10.))
; 
; <=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_52 1.) of_52) 0.))
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
; 
; =  {sc.input.I[18].O} {sc.input.I[18].X}
(assert (= sc_54 sc_53))
; 
; =  {of.input.I[18].O} {of.input.I[18].X}
(assert (= of_54 of_53))
; 
; >=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {10.}
(assert (<= (+ (* sc_53 1.) of_53) 10.))
; 
; <=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {0.}
(assert (>= (+ (* sc_53 1.) of_53) 0.))
; 
; >=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {10.}
(assert (<= (+ (* sc_54 1.) of_54) 10.))
; 
; <=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {0.}
(assert (>= (+ (* sc_54 1.) of_54) 0.))
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
; 
; =  {sc.input.I[19].O} {sc.input.I[19].X}
(assert (= sc_56 sc_55))
; 
; =  {of.input.I[19].O} {of.input.I[19].X}
(assert (= of_56 of_55))
; 
; >=  {((sc.input.I[19].X*1.)+of.input.I[19].X)} {10.}
(assert (<= (+ (* sc_55 1.) of_55) 10.))
; 
; <=  {((sc.input.I[19].X*1.)+of.input.I[19].X)} {0.}
(assert (>= (+ (* sc_55 1.) of_55) 0.))
; 
; >=  {((sc.input.I[19].O*1.)+of.input.I[19].O)} {10.}
(assert (<= (+ (* sc_56 1.) of_56) 10.))
; 
; <=  {((sc.input.I[19].O*1.)+of.input.I[19].O)} {0.}
(assert (>= (+ (* sc_56 1.) of_56) 0.))
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_58 sc_57))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_58 of_57))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_57 156.25) of_57) sltop_57) 3300.))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_58 156.25) of_58) sltop_58) 3300.))
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_60 sc_59))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_60 of_59))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_59 15.6) of_59) sltop_59) 3300.))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_60 0.) of_60) slbot_60) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_60 15.6) of_60) sltop_60) 3300.))
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_63 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_65 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_64 (* 1. sc_65)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D)}
(assert (and (= sc_64 (* 1. sc_63)) (= sc_64 (* 1. sc_62))))
; no offset
(assert (= (- (+ of_64 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT} {(sc.vadd[3].A*1.)}
(assert (= sc_66 (* sc_64 1.)))
; 
; =  {of.vadd[3].OUT} {0.}
(assert (= of_66 0.))
; no scale
(assert (= sc_62 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; no offset
(assert (= of_67 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_63 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_65 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_64 (* 1. sc_65)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D*sc.vadd[3].OUT2)}
(assert (and (= sc_64 (* 1. sc_63)) (= sc_64 (* (* 1. sc_62) sc_67))))
; no offset
(assert (= (- (+ of_64 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2} {(sc.vadd[3].A*1.)}
(assert (= sc_67 (* sc_64 1.)))
; no offset
(assert (= of_67 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2_0} {(sc.vadd[3].A*1.)}
(assert (= sc_61 (* sc_64 1.)))
; 
; =  {of.vadd[3].OUT2_0} {0.}
(assert (= of_61 0.))
; 
; >=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {3300.}
(assert (<= (+ (* sc_61 0.) of_61) 3300.))
; 
; <=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
; 
; >=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {3300.}
(assert (<= (+ (* sc_62 4.) of_62) 3300.))
; 
; <=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {0.}
(assert (>= (+ (* sc_62 4.) of_62) 0.))
; 
; >=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {3300.}
(assert (<= (+ (* sc_63 0.) of_63) 3300.))
; 
; <=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
; 
; >=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {3300.}
(assert (<= (+ (* sc_64 0.) of_64) 3300.))
; 
; <=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
(declare-fun slbot_67 () Real)
(declare-fun sltop_67 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_67 0.) of_67) slbot_67) 0.))
; 
; =  {(((sc.vadd[3].OUT2*156.25)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_67 156.25) of_67) sltop_67) 3300.))
(declare-fun slbot_65 () Real)
(declare-fun sltop_65 () Real)
; 
; =  {(((sc.vadd[3].B*3.75903614458)+of.vadd[3].B)+sl.min.vadd[3].B)} {0.}
(assert (= (+ (+ (* sc_65 3.75903614458) of_65) slbot_65) 0.))
; 
; =  {(((sc.vadd[3].B*62.4)+of.vadd[3].B)+sl.max.vadd[3].B)} {3300.}
(assert (= (+ (+ (* sc_65 62.4) of_65) sltop_65) 3300.))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.vadd[3].OUT*3.75903614458)+of.vadd[3].OUT)+sl.min.vadd[3].OUT)} {-1650.}
(assert (= (+ (+ (* sc_66 3.75903614458) of_66) slbot_66) -1650.))
; 
; =  {(((sc.vadd[3].OUT*62.4)+of.vadd[3].OUT)+sl.max.vadd[3].OUT)} {1650.}
(assert (= (+ (+ (* sc_66 62.4) of_66) sltop_66) 1650.))
(declare-fun slbot_67 () Real)
(declare-fun sltop_67 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_67 0.) of_67) slbot_67) 0.))
; 
; =  {(((sc.vadd[3].OUT2*156.25)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_67 156.25) of_67) sltop_67) 3300.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_70 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_72 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_71 (* 1. sc_72)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_71 (* 1. sc_70)) (= sc_71 (* 1. sc_69))))
; no offset
(assert (= (- (+ of_71 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_73 (* sc_71 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
(assert (= of_73 0.))
; no scale
(assert (= sc_69 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; no offset
(assert (= of_74 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_70 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_72 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_71 (* 1. sc_72)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_71 (* 1. sc_70)) (= sc_71 (* (* 1. sc_69) sc_74))))
; no offset
(assert (= (- (+ of_71 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_74 (* sc_71 1.)))
; no offset
(assert (= of_74 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_68 (* sc_71 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_68 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_68 0.) of_68) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
; 
; >=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {3300.}
(assert (<= (+ (* sc_69 4.) of_69) 3300.))
; 
; <=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {0.}
(assert (>= (+ (* sc_69 4.) of_69) 0.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_70 0.) of_70) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_71 0.) of_71) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_71 0.) of_71) 0.))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_74 0.) of_74) slbot_74) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_74 15.6) of_74) sltop_74) 3300.))
(declare-fun slbot_72 () Real)
(declare-fun sltop_72 () Real)
; 
; =  {(((sc.vadd[5].B*0.00204799328914)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_72 0.00204799328914) of_72) slbot_72) 0.))
; 
; =  {(((sc.vadd[5].B*625.)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_72 625.) of_72) sltop_72) 3300.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.vadd[5].OUT*0.00204799328914)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_73 0.00204799328914) of_73) slbot_73) -1650.))
; 
; =  {(((sc.vadd[5].OUT*625.)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_73 625.) of_73) sltop_73) 1650.))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_74 0.) of_74) slbot_74) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_74 15.6) of_74) sltop_74) 3300.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
; no offset
(assert (= of_76 0.))
; no offset
(assert (= of_77 0.))
; no scale
(assert (= (/ sc_76 sc_77) 1.))
; no scale
(assert (= sc_75 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_75 0.))
; no offset
(assert (= of_76 0.))
; no offset
(assert (= of_77 0.))
; no scale
(assert (= (/ sc_76 sc_77) 1.))
; no scale
(assert (= sc_75 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_75 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_78 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_79 (* sc_78 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_79 0.))
; no scale
(assert (= sc_77 1.))
; no scale
(assert (= (* sc_75 1.) 1.))
; no offset
(assert (= of_77 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_77 1.))
; no scale
(assert (= (* sc_75 1.) 1.))
; no offset
(assert (= of_77 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_76 1.))
; no scale
(assert (= sc_75 1.))
; no offset
(assert (= of_76 0.))
; no offset
(assert (= of_75 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_78 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_80 (* sc_78 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_80 0.))
; 
; >=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_75 2.5) of_75) 5.))
; 
; <=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_75 2.5) of_75) 1.))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76) 1.))
; 
; =  {(((sc.ihill[0].S*156.25)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_76 156.25) of_76) sltop_76) 10.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.ihill[0].REP*0.000511998322284)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {9.999900001e-10}
(assert (= (+ (+ (* sc_80 0.000511998322284) of_80) slbot_80) 9.999900001e-10))
; 
; =  {(((sc.ihill[0].REP*156.25)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {5.}
(assert (= (+ (+ (* sc_80 156.25) of_80) sltop_80) 5.))
; 
; >=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_78 156.25) of_78) 10.))
; 
; <=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_78 156.25) of_78) 0.0001))
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_82 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_81 0.))
; 
; =  {sc.vtoi[1].Y} {((1./sc.vtoi[1].K)*sc.vtoi[1].X)}
(assert (= sc_83 (* (/ 1. sc_82) sc_81)))
; 
; =  {of.vtoi[1].Y} {0.}
(assert (= of_83 0.))
(declare-fun slbot_81 () Real)
(declare-fun sltop_81 () Real)
; 
; =  {(((sc.vtoi[1].X*0.)+of.vtoi[1].X)+sl.min.vtoi[1].X)} {1.}
(assert (= (+ (+ (* sc_81 0.) of_81) slbot_81) 1.))
; 
; =  {(((sc.vtoi[1].X*156.25)+of.vtoi[1].X)+sl.max.vtoi[1].X)} {3300.}
(assert (= (+ (+ (* sc_81 156.25) of_81) sltop_81) 3300.))
; 
; >=  {((sc.vtoi[1].K*1.)+of.vtoi[1].K)} {3300.}
(assert (<= (+ (* sc_82 1.) of_82) 3300.))
; 
; <=  {((sc.vtoi[1].K*1.)+of.vtoi[1].K)} {1.}
(assert (>= (+ (* sc_82 1.) of_82) 1.))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.vtoi[1].Y*0.)+of.vtoi[1].Y)+sl.min.vtoi[1].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83) 0.00030303030303))
; 
; =  {(((sc.vtoi[1].Y*156.25)+of.vtoi[1].Y)+sl.max.vtoi[1].Y)} {3300.}
(assert (= (+ (+ (* sc_83 156.25) of_83) sltop_83) 3300.))
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
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
(assert (= of_85 0.))
; no offset
(assert (= of_84 0.))
; 
; =  {1.} {(sc.igenebind[10].K*sc.igenebind[10].TF)}
(assert (= 1. (* sc_85 sc_84)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_86 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[10].GE} {(sc.igenebind[10].Vmax*(1./1.))}
(assert (= sc_87 (* sc_86 (/ 1. 1.))))
; 
; =  {of.igenebind[10].GE} {0.}
(assert (= of_87 0.))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.igenebind[10].TF*-1.)+of.igenebind[10].TF)+sl.min.igenebind[10].TF)} {0.0001}
(assert (= (+ (+ (* sc_84 -1.) of_84) slbot_84) 0.0001))
; 
; =  {(((sc.igenebind[10].TF*-0.4)+of.igenebind[10].TF)+sl.max.igenebind[10].TF)} {10.}
(assert (= (+ (+ (* sc_84 -0.4) of_84) sltop_84) 10.))
; 
; >=  {((sc.igenebind[10].K*1.)+of.igenebind[10].K)} {10.}
(assert (<= (+ (* sc_85 1.) of_85) 10.))
; 
; <=  {((sc.igenebind[10].K*1.)+of.igenebind[10].K)} {0.0001}
(assert (>= (+ (* sc_85 1.) of_85) 0.0001))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.igenebind[10].GE*0.)+of.igenebind[10].GE)+sl.min.igenebind[10].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[10].GE*1.66666666667)+of.igenebind[10].GE)+sl.max.igenebind[10].GE)} {9.9999999}
(assert (= (+ (+ (* sc_87 1.66666666667) of_87) sltop_87) 9.9999999))
; 
; >=  {((sc.igenebind[10].Vmax*1.)+of.igenebind[10].Vmax)} {10.}
(assert (<= (+ (* sc_86 1.) of_86) 10.))
; 
; <=  {((sc.igenebind[10].Vmax*1.)+of.igenebind[10].Vmax)} {0.0001}
(assert (>= (+ (* sc_86 1.) of_86) 0.0001))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.igenebind[10].GE*0.)+of.igenebind[10].GE)+sl.min.igenebind[10].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[10].GE*1.66666666667)+of.igenebind[10].GE)+sl.max.igenebind[10].GE)} {9.9999999}
(assert (= (+ (+ (* sc_87 1.66666666667) of_87) sltop_87) 9.9999999))
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
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
(assert (= of_89 0.))
; no offset
(assert (= of_88 0.))
; 
; =  {1.} {(sc.igenebind[1].K*sc.igenebind[1].TF)}
(assert (= 1. (* sc_89 sc_88)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_90 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[1].GE} {(sc.igenebind[1].Vmax*(1./1.))}
(assert (= sc_91 (* sc_90 (/ 1. 1.))))
; 
; =  {of.igenebind[1].GE} {0.}
(assert (= of_91 0.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.igenebind[1].TF*0.)+of.igenebind[1].TF)+sl.min.igenebind[1].TF)} {0.0001}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.0001))
; 
; =  {(((sc.igenebind[1].TF*15.6)+of.igenebind[1].TF)+sl.max.igenebind[1].TF)} {10.}
(assert (= (+ (+ (* sc_88 15.6) of_88) sltop_88) 10.))
; 
; >=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {10.}
(assert (<= (+ (* sc_89 1.) of_89) 10.))
; 
; <=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {0.0001}
(assert (>= (+ (* sc_89 1.) of_89) 0.0001))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.igenebind[1].GE*0.939759036145)+of.igenebind[1].GE)+sl.min.igenebind[1].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_91 0.939759036145) of_91) slbot_91) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[1].GE*15.6)+of.igenebind[1].GE)+sl.max.igenebind[1].GE)} {9.9999999}
(assert (= (+ (+ (* sc_91 15.6) of_91) sltop_91) 9.9999999))
; 
; >=  {((sc.igenebind[1].Vmax*15.6)+of.igenebind[1].Vmax)} {10.}
(assert (<= (+ (* sc_90 15.6) of_90) 10.))
; 
; <=  {((sc.igenebind[1].Vmax*15.6)+of.igenebind[1].Vmax)} {0.0001}
(assert (>= (+ (* sc_90 15.6) of_90) 0.0001))
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_93 sc_92))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_93 of_92))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_92 0.) of_92) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_92 0.) of_92) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_93 0.) of_93) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_93 0.) of_93) 0.))
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_95 sc_94))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_95 of_94))
; 
; >=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_94 4.) of_94) 3300.))
; 
; <=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_94 4.) of_94) 0.))
; 
; >=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_95 4.) of_95) 3300.))
; 
; <=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_95 4.) of_95) 0.))
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_97 sc_96))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_97 of_96))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_96 0.) of_96) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_96 0.) of_96) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_97 0.) of_97) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_97 0.) of_97) 0.))
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_99 sc_98))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_99 of_98))
; 
; >=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_98 4.) of_98) 3300.))
; 
; <=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_98 4.) of_98) 0.))
; 
; >=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_99 4.) of_99) 3300.))
; 
; <=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_99 4.) of_99) 0.))
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_101 sc_100))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_101 of_100))
; 
; >=  {((sc.input.V[0].X*2.5)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_100 2.5) of_100) 3300.))
; 
; <=  {((sc.input.V[0].X*2.5)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_100 2.5) of_100) 0.))
; 
; >=  {((sc.input.V[0].O*2.5)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_101 2.5) of_101) 3300.))
; 
; <=  {((sc.input.V[0].O*2.5)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_101 2.5) of_101) 0.))
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_103 sc_102))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_103 of_102))
; 
; >=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_102 1.) of_102) 3300.))
; 
; <=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_102 1.) of_102) 0.))
; 
; >=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_103 1.) of_103) 3300.))
; 
; <=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_103 1.) of_103) 0.))
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_105 sc_104))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_105 of_104))
; 
; >=  {((sc.input.V[10].X*1000.75)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_104 1000.75) of_104) 3300.))
; 
; <=  {((sc.input.V[10].X*1000.75)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_104 1000.75) of_104) 0.))
; 
; >=  {((sc.input.V[10].O*1000.75)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_105 1000.75) of_105) 3300.))
; 
; <=  {((sc.input.V[10].O*1000.75)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_105 1000.75) of_105) 0.))
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_107 sc_106))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_107 of_106))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_106 0.) of_106) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_106 0.) of_106) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_107 0.) of_107) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_107 0.) of_107) 0.))
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_109 sc_108))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_109 of_108))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_108 1.) of_108) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_108 1.) of_108) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_109 1.) of_109) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_109 1.) of_109) 0.))
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_111 sc_110))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_111 of_110))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_110 0.) of_110) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_110 0.) of_110) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_111 0.) of_111) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_111 0.) of_111) 0.))
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_113 sc_112))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_113 of_112))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_112 0.) of_112) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_112 0.) of_112) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_113 0.) of_113) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_113 0.) of_113) 0.))
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_115 sc_114))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_115 of_114))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_114 0.) of_114) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_114 0.) of_114) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_115 0.) of_115) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_115 0.) of_115) 0.))
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_117 sc_116))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_117 of_116))
; 
; >=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_116 0.125) of_116) 3300.))
; 
; <=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_116 0.125) of_116) 0.))
; 
; >=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_117 0.125) of_117) 3300.))
; 
; <=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_117 0.125) of_117) 0.))
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
; no offset
(assert (= of_119 0.))
; no offset
(assert (= of_118 0.))
; 
; =  {sc.itov[5].Y} {(sc.itov[5].K*sc.itov[5].X)}
(assert (= sc_120 (* sc_119 sc_118)))
; 
; =  {of.itov[5].Y} {0.}
(assert (= of_120 0.))
; 
; >=  {((sc.itov[5].X*1.)+of.itov[5].X)} {10.}
(assert (<= (+ (* sc_118 1.) of_118) 10.))
; 
; <=  {((sc.itov[5].X*1.)+of.itov[5].X)} {0.0001}
(assert (>= (+ (* sc_118 1.) of_118) 0.0001))
(declare-fun slbot_119 () Real)
(declare-fun sltop_119 () Real)
; 
; =  {(((sc.itov[5].K*0.939759036145)+of.itov[5].K)+sl.min.itov[5].K)} {1.}
(assert (= (+ (+ (* sc_119 0.939759036145) of_119) slbot_119) 1.))
; 
; =  {(((sc.itov[5].K*15.6)+of.itov[5].K)+sl.max.itov[5].K)} {330.}
(assert (= (+ (+ (* sc_119 15.6) of_119) sltop_119) 330.))
(declare-fun slbot_120 () Real)
(declare-fun sltop_120 () Real)
; 
; =  {(((sc.itov[5].Y*0.939759036145)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_120 0.939759036145) of_120) slbot_120) 0.0001))
; 
; =  {(((sc.itov[5].Y*15.6)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_120 15.6) of_120) sltop_120) 3300.))
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
; no offset
(assert (= of_122 0.))
; no offset
(assert (= of_121 0.))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_123 (* sc_122 sc_121)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_123 0.))
; 
; >=  {((sc.itov[4].X*4.)+of.itov[4].X)} {10.}
(assert (<= (+ (* sc_121 4.) of_121) 10.))
; 
; <=  {((sc.itov[4].X*4.)+of.itov[4].X)} {0.0001}
(assert (>= (+ (* sc_121 4.) of_121) 0.0001))
(declare-fun slbot_123 () Real)
(declare-fun sltop_123 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_123 0.00204799328914) of_123) slbot_123) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_123 625.) of_123) sltop_123) 3300.))
(declare-fun slbot_122 () Real)
(declare-fun sltop_122 () Real)
; 
; =  {(((sc.itov[4].K*0.000511998322284)+of.itov[4].K)+sl.min.itov[4].K)} {1.}
(assert (= (+ (+ (* sc_122 0.000511998322284) of_122) slbot_122) 1.))
; 
; =  {(((sc.itov[4].K*156.25)+of.itov[4].K)+sl.max.itov[4].K)} {330.}
(assert (= (+ (+ (* sc_122 156.25) of_122) sltop_122) 330.))
(declare-fun slbot_123 () Real)
(declare-fun sltop_123 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_123 0.00204799328914) of_123) slbot_123) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_123 625.) of_123) sltop_123) 3300.))
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
(declare-fun sc_126 () Real)
(assert (> sc_126 1e-08))
(declare-fun of_126 () Real)
(declare-fun sc_127 () Real)
(assert (> sc_127 1e-08))
(declare-fun of_127 () Real)
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
; 
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_126 sc_127))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_126 sc_125) (= sc_126 sc_124)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_128 sc_126))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_128 (- (+ of_126 of_127) (+ of_125 of_124))))
; 
; >=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {5.}
(assert (<= (+ (* sc_124 0.) of_124) 5.))
; 
; <=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {0.}
(assert (>= (+ (* sc_124 0.) of_124) 0.))
; 
; >=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {5.}
(assert (<= (+ (* sc_125 0.) of_125) 5.))
; 
; <=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {0.}
(assert (>= (+ (* sc_125 0.) of_125) 0.))
(declare-fun slbot_128 () Real)
(declare-fun sltop_128 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_128 0.) of_128) slbot_128) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_128 1.66666666667) of_128) sltop_128) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_126 0.) of_126) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_126 0.) of_126) 0.))
(declare-fun slbot_127 () Real)
(declare-fun sltop_127 () Real)
; 
; =  {(((sc.iadd[8].B*0.)+of.iadd[8].B)+sl.min.iadd[8].B)} {0.}
(assert (= (+ (+ (* sc_127 0.) of_127) slbot_127) 0.))
; 
; =  {(((sc.iadd[8].B*1.66666666667)+of.iadd[8].B)+sl.max.iadd[8].B)} {5.}
(assert (= (+ (+ (* sc_127 1.66666666667) of_127) sltop_127) 5.))
(declare-fun slbot_128 () Real)
(declare-fun sltop_128 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_128 0.) of_128) slbot_128) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_128 1.66666666667) of_128) sltop_128) 10.))
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
(declare-fun sc_130 () Real)
(assert (> sc_130 1e-08))
(declare-fun of_130 () Real)
(declare-fun sc_131 () Real)
(assert (> sc_131 1e-08))
(declare-fun of_131 () Real)
(declare-fun sc_132 () Real)
(assert (> sc_132 1e-08))
(declare-fun of_132 () Real)
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
; 
; =  {sc.iadd[12].A} {sc.iadd[12].B}
(assert (= sc_131 sc_132))
; 
; =  {sc.iadd[12].A} {sc.iadd[12].C} {sc.iadd[12].D}
(assert (and (= sc_131 sc_130) (= sc_131 sc_129)))
; 
; =  {sc.iadd[12].OUT} {sc.iadd[12].A}
(assert (= sc_133 sc_131))
; 
; =  {of.iadd[12].OUT} {((of.iadd[12].A+of.iadd[12].B)-of.iadd[12].C-of.iadd[12].D)}
(assert (= of_133 (- (+ of_131 of_132) (+ of_130 of_129))))
; 
; >=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {5.}
(assert (<= (+ (* sc_129 0.) of_129) 5.))
; 
; <=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {0.}
(assert (>= (+ (* sc_129 0.) of_129) 0.))
; 
; >=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {5.}
(assert (<= (+ (* sc_130 0.) of_130) 5.))
; 
; <=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {0.}
(assert (>= (+ (* sc_130 0.) of_130) 0.))
(declare-fun slbot_131 () Real)
(declare-fun sltop_131 () Real)
; 
; =  {(((sc.iadd[12].A*0.)+of.iadd[12].A)+sl.min.iadd[12].A)} {0.}
(assert (= (+ (+ (* sc_131 0.) of_131) slbot_131) 0.))
; 
; =  {(((sc.iadd[12].A*15.6)+of.iadd[12].A)+sl.max.iadd[12].A)} {5.}
(assert (= (+ (+ (* sc_131 15.6) of_131) sltop_131) 5.))
; 
; >=  {((sc.iadd[12].B*0.)+of.iadd[12].B)} {5.}
(assert (<= (+ (* sc_132 0.) of_132) 5.))
; 
; <=  {((sc.iadd[12].B*0.)+of.iadd[12].B)} {0.}
(assert (>= (+ (* sc_132 0.) of_132) 0.))
(declare-fun slbot_133 () Real)
(declare-fun sltop_133 () Real)
; 
; =  {(((sc.iadd[12].OUT*0.)+of.iadd[12].OUT)+sl.min.iadd[12].OUT)} {-10.}
(assert (= (+ (+ (* sc_133 0.) of_133) slbot_133) -10.))
; 
; =  {(((sc.iadd[12].OUT*15.6)+of.iadd[12].OUT)+sl.max.iadd[12].OUT)} {10.}
(assert (= (+ (+ (* sc_133 15.6) of_133) sltop_133) 10.))
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
(declare-fun sc_135 () Real)
(assert (> sc_135 1e-08))
(declare-fun of_135 () Real)
(declare-fun sc_136 () Real)
(assert (> sc_136 1e-08))
(declare-fun of_136 () Real)
(declare-fun sc_137 () Real)
(assert (> sc_137 1e-08))
(declare-fun of_137 () Real)
(declare-fun sc_138 () Real)
(assert (> sc_138 1e-08))
(declare-fun of_138 () Real)
; 
; =  {sc.iadd[9].A} {sc.iadd[9].B}
(assert (= sc_136 sc_137))
; 
; =  {sc.iadd[9].A} {sc.iadd[9].C} {sc.iadd[9].D}
(assert (and (= sc_136 sc_135) (= sc_136 sc_134)))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[9].A}
(assert (= sc_138 sc_136))
; 
; =  {of.iadd[9].OUT} {((of.iadd[9].A+of.iadd[9].B)-of.iadd[9].C-of.iadd[9].D)}
(assert (= of_138 (- (+ of_136 of_137) (+ of_135 of_134))))
; 
; >=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {5.}
(assert (<= (+ (* sc_134 0.) of_134) 5.))
; 
; <=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {0.}
(assert (>= (+ (* sc_134 0.) of_134) 0.))
; 
; >=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {5.}
(assert (<= (+ (* sc_135 0.) of_135) 5.))
; 
; <=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {0.}
(assert (>= (+ (* sc_135 0.) of_135) 0.))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_138 0.) of_138) slbot_138) -10.))
; 
; =  {(((sc.iadd[9].OUT*1.66666666667)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_138 1.66666666667) of_138) sltop_138) 10.))
; 
; >=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {5.}
(assert (<= (+ (* sc_136 0.) of_136) 5.))
; 
; <=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {0.}
(assert (>= (+ (* sc_136 0.) of_136) 0.))
(declare-fun slbot_137 () Real)
(declare-fun sltop_137 () Real)
; 
; =  {(((sc.iadd[9].B*0.)+of.iadd[9].B)+sl.min.iadd[9].B)} {0.}
(assert (= (+ (+ (* sc_137 0.) of_137) slbot_137) 0.))
; 
; =  {(((sc.iadd[9].B*1.66666666667)+of.iadd[9].B)+sl.max.iadd[9].B)} {5.}
(assert (= (+ (+ (* sc_137 1.66666666667) of_137) sltop_137) 5.))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_138 0.) of_138) slbot_138) -10.))
; 
; =  {(((sc.iadd[9].OUT*1.66666666667)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_138 1.66666666667) of_138) sltop_138) 10.))
(declare-fun sc_139 () Real)
(assert (> sc_139 1e-08))
(declare-fun of_139 () Real)
(declare-fun sc_140 () Real)
(assert (> sc_140 1e-08))
(declare-fun of_140 () Real)
(declare-fun sc_141 () Real)
(assert (> sc_141 1e-08))
(declare-fun of_141 () Real)
(declare-fun sc_142 () Real)
(assert (> sc_142 1e-08))
(declare-fun of_142 () Real)
(declare-fun sc_143 () Real)
(assert (> sc_143 1e-08))
(declare-fun of_143 () Real)
; 
; =  {sc.iadd[11].A} {sc.iadd[11].B}
(assert (= sc_141 sc_142))
; 
; =  {sc.iadd[11].A} {sc.iadd[11].C} {sc.iadd[11].D}
(assert (and (= sc_141 sc_140) (= sc_141 sc_139)))
; 
; =  {sc.iadd[11].OUT} {sc.iadd[11].A}
(assert (= sc_143 sc_141))
; 
; =  {of.iadd[11].OUT} {((of.iadd[11].A+of.iadd[11].B)-of.iadd[11].C-of.iadd[11].D)}
(assert (= of_143 (- (+ of_141 of_142) (+ of_140 of_139))))
(declare-fun slbot_139 () Real)
(declare-fun sltop_139 () Real)
; 
; =  {(((sc.iadd[11].D*-0.6)+of.iadd[11].D)+sl.min.iadd[11].D)} {0.}
(assert (= (+ (+ (* sc_139 -0.6) of_139) slbot_139) 0.))
; 
; =  {(((sc.iadd[11].D*0.)+of.iadd[11].D)+sl.max.iadd[11].D)} {5.}
(assert (= (+ (+ (* sc_139 0.) of_139) sltop_139) 5.))
; 
; >=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {5.}
(assert (<= (+ (* sc_140 1.) of_140) 5.))
; 
; <=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {0.}
(assert (>= (+ (* sc_140 1.) of_140) 0.))
(declare-fun slbot_143 () Real)
(declare-fun sltop_143 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_143 -1.) of_143) slbot_143) -10.))
; 
; =  {(((sc.iadd[11].OUT*-0.4)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_143 -0.4) of_143) sltop_143) 10.))
; 
; >=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {5.}
(assert (<= (+ (* sc_141 0.) of_141) 5.))
; 
; <=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {0.}
(assert (>= (+ (* sc_141 0.) of_141) 0.))
; 
; >=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {5.}
(assert (<= (+ (* sc_142 0.) of_142) 5.))
; 
; <=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {0.}
(assert (>= (+ (* sc_142 0.) of_142) 0.))
(declare-fun slbot_143 () Real)
(declare-fun sltop_143 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_143 -1.) of_143) slbot_143) -10.))
; 
; =  {(((sc.iadd[11].OUT*-0.4)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_143 -0.4) of_143) sltop_143) 10.))
(declare-fun sc_144 () Real)
(assert (> sc_144 1e-08))
(declare-fun of_144 () Real)
(declare-fun sc_145 () Real)
(assert (> sc_145 1e-08))
(declare-fun of_145 () Real)
(declare-fun sc_146 () Real)
(assert (> sc_146 1e-08))
(declare-fun of_146 () Real)
(declare-fun sc_147 () Real)
(assert (> sc_147 1e-08))
(declare-fun of_147 () Real)
(declare-fun sc_148 () Real)
(assert (> sc_148 1e-08))
(declare-fun of_148 () Real)
; 
; =  {sc.iadd[6].A} {sc.iadd[6].B}
(assert (= sc_146 sc_147))
; 
; =  {sc.iadd[6].A} {sc.iadd[6].C} {sc.iadd[6].D}
(assert (and (= sc_146 sc_145) (= sc_146 sc_144)))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[6].A}
(assert (= sc_148 sc_146))
; 
; =  {of.iadd[6].OUT} {((of.iadd[6].A+of.iadd[6].B)-of.iadd[6].C-of.iadd[6].D)}
(assert (= of_148 (- (+ of_146 of_147) (+ of_145 of_144))))
; 
; >=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {5.}
(assert (<= (+ (* sc_144 0.) of_144) 5.))
; 
; <=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {0.}
(assert (>= (+ (* sc_144 0.) of_144) 0.))
(declare-fun slbot_145 () Real)
(declare-fun sltop_145 () Real)
; 
; =  {(((sc.iadd[6].C*0.)+of.iadd[6].C)+sl.min.iadd[6].C)} {0.}
(assert (= (+ (+ (* sc_145 0.) of_145) slbot_145) 0.))
; 
; =  {(((sc.iadd[6].C*0.6)+of.iadd[6].C)+sl.max.iadd[6].C)} {5.}
(assert (= (+ (+ (* sc_145 0.6) of_145) sltop_145) 5.))
(declare-fun slbot_148 () Real)
(declare-fun sltop_148 () Real)
; 
; =  {(((sc.iadd[6].OUT*-0.6)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_148 -0.6) of_148) slbot_148) -10.))
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_148 0.) of_148) sltop_148) 10.))
; 
; >=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {5.}
(assert (<= (+ (* sc_146 0.) of_146) 5.))
; 
; <=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {0.}
(assert (>= (+ (* sc_146 0.) of_146) 0.))
; 
; >=  {((sc.iadd[6].B*0.)+of.iadd[6].B)} {5.}
(assert (<= (+ (* sc_147 0.) of_147) 5.))
; 
; <=  {((sc.iadd[6].B*0.)+of.iadd[6].B)} {0.}
(assert (>= (+ (* sc_147 0.) of_147) 0.))
; 
; =  {sc.input.I[6].O} {sc.iadd[8].A}
(assert (= sc_32 sc_126))
; 
; =  {of.input.I[6].O} {of.iadd[8].A}
(assert (= of_32 of_126))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[11].D}
(assert (= sc_148 sc_139))
; 
; =  {of.iadd[6].OUT} {of.iadd[11].D}
(assert (= of_148 of_139))
; 
; =  {sc.input.I[0].O} {sc.iadd[6].C}
(assert (= sc_22 sc_145))
; 
; =  {of.input.I[0].O} {of.iadd[6].C}
(assert (= of_22 of_145))
; 
; =  {sc.switch[7].PROD} {sc.iadd[12].A}
(assert (= sc_8 sc_131))
; 
; =  {of.switch[7].PROD} {of.iadd[12].A}
(assert (= of_8 of_131))
; 
; =  {sc.input.V[9].O} {sc.vadd[5].D}
(assert (= sc_99 sc_69))
; 
; =  {of.input.V[9].O} {of.vadd[5].D}
(assert (= of_99 of_69))
; 
; =  {sc.ihill[0].REP} {sc.itov[4].K}
(assert (= sc_80 sc_122))
; 
; =  {of.ihill[0].REP} {of.itov[4].K}
(assert (= of_80 of_122))
; 
; =  {sc.input.I[26].O} {sc.itov[5].X}
(assert (= sc_26 sc_118))
; 
; =  {of.input.I[26].O} {of.itov[5].X}
(assert (= of_26 of_118))
; 
; =  {sc.input.I[25].O} {sc.iadd[12].D}
(assert (= sc_48 sc_129))
; 
; =  {of.input.I[25].O} {of.iadd[12].D}
(assert (= of_48 of_129))
; 
; =  {sc.input.I[18].O} {sc.iadd[11].C}
(assert (= sc_54 sc_140))
; 
; =  {of.input.I[18].O} {of.iadd[11].C}
(assert (= of_54 of_140))
; 
; =  {sc.input.I[9].O} {sc.iadd[9].A}
(assert (= sc_20 sc_136))
; 
; =  {of.input.I[9].O} {of.iadd[9].A}
(assert (= of_20 of_136))
; 
; =  {sc.input.I[16].O} {sc.igenebind[1].K}
(assert (= sc_38 sc_89))
; 
; =  {of.input.I[16].O} {of.igenebind[1].K}
(assert (= of_38 of_89))
; 
; =  {sc.input.I[3].O} {sc.iadd[6].D}
(assert (= sc_40 sc_144))
; 
; =  {of.input.I[3].O} {of.iadd[6].D}
(assert (= of_40 of_144))
; 
; =  {sc.input.I[4].O} {sc.iadd[6].B}
(assert (= sc_42 sc_147))
; 
; =  {of.input.I[4].O} {of.iadd[6].B}
(assert (= of_42 of_147))
; 
; =  {sc.igenebind[10].GE} {sc.iadd[9].B}
(assert (= sc_87 sc_137))
; 
; =  {of.igenebind[10].GE} {of.iadd[9].B}
(assert (= of_87 of_137))
; 
; =  {sc.input.I[5].O} {sc.iadd[8].D}
(assert (= sc_44 sc_124))
; 
; =  {of.input.I[5].O} {of.iadd[8].D}
(assert (= of_44 of_124))
; 
; =  {sc.input.V[14].O} {sc.vtoi[1].K}
(assert (= sc_109 sc_82))
; 
; =  {of.input.V[14].O} {of.vtoi[1].K}
(assert (= of_109 of_82))
; 
; =  {sc.iadd[12].OUT} {sc.igenebind[1].TF}
(assert (= sc_133 sc_88))
; 
; =  {of.iadd[12].OUT} {of.igenebind[1].TF}
(assert (= of_133 of_88))
; 
; =  {sc.vtoi[1].Y} {sc.ihill[0].S}
(assert (= sc_83 sc_76))
; 
; =  {of.vtoi[1].Y} {of.ihill[0].S}
(assert (= of_83 of_76))
; 
; =  {sc.itov[5].Y} {sc.vgain[2].Z}
(assert (= sc_120 sc_2))
; 
; =  {of.itov[5].Y} {of.vgain[2].Z}
(assert (= of_120 of_2))
; 
; =  {sc.input.I[14].O} {sc.igenebind[1].Vmax}
(assert (= sc_34 sc_90))
; 
; =  {of.input.I[14].O} {of.igenebind[1].Vmax}
(assert (= of_34 of_90))
; 
; =  {sc.input.V[11].O} {sc.vgain[2].X}
(assert (= sc_103 sc_0))
; 
; =  {of.input.V[11].O} {of.vgain[2].X}
(assert (= of_103 of_0))
; 
; =  {sc.input.V[8].O} {sc.vadd[3].D}
(assert (= sc_95 sc_62))
; 
; =  {of.input.V[8].O} {of.vadd[3].D}
(assert (= of_95 of_62))
; 
; =  {sc.input.I[2].O} {sc.iadd[6].A}
(assert (= sc_10 sc_146))
; 
; =  {of.input.I[2].O} {of.iadd[6].A}
(assert (= of_10 of_146))
; 
; =  {sc.input.V[3].O} {sc.vadd[3].C}
(assert (= sc_111 sc_63))
; 
; =  {of.input.V[3].O} {of.vadd[3].C}
(assert (= of_111 of_63))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[1].X}
(assert (= sc_74 sc_59))
; 
; =  {of.vadd[5].OUT2} {of.output.V[1].X}
(assert (= of_74 of_59))
; 
; =  {sc.vadd[5].OUT2} {sc.switch[7].Vmax}
(assert (= sc_74 sc_7))
; 
; =  {of.vadd[5].OUT2} {of.switch[7].Vmax}
(assert (= of_74 of_7))
; 
; =  {sc.input.V[2].O} {sc.vadd[3].A}
(assert (= sc_93 sc_64))
; 
; =  {of.input.V[2].O} {of.vadd[3].A}
(assert (= of_93 of_64))
; 
; =  {sc.vadd[3].OUT2} {sc.vtoi[1].X}
(assert (= sc_67 sc_81))
; 
; =  {of.vadd[3].OUT2} {of.vtoi[1].X}
(assert (= of_67 of_81))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].X}
(assert (= sc_67 sc_57))
; 
; =  {of.vadd[3].OUT2} {of.output.V[0].X}
(assert (= of_67 of_57))
; 
; =  {sc.input.I[24].O} {sc.iadd[12].B}
(assert (= sc_36 sc_132))
; 
; =  {of.input.I[24].O} {of.iadd[12].B}
(assert (= of_36 of_132))
; 
; =  {sc.input.I[15].O} {sc.itov[4].X}
(assert (= sc_30 sc_121))
; 
; =  {of.input.I[15].O} {of.itov[4].X}
(assert (= of_30 of_121))
; 
; =  {sc.input.I[12].O} {sc.iadd[11].A}
(assert (= sc_18 sc_141))
; 
; =  {of.input.I[12].O} {of.iadd[11].A}
(assert (= of_18 of_141))
; 
; =  {sc.input.I[10].O} {sc.iadd[9].C}
(assert (= sc_28 sc_135))
; 
; =  {of.input.I[10].O} {of.iadd[9].C}
(assert (= of_28 of_135))
; 
; =  {sc.input.I[1].O} {sc.ihill[0].Vmax}
(assert (= sc_50 sc_78))
; 
; =  {of.input.I[1].O} {of.ihill[0].Vmax}
(assert (= of_50 of_78))
; 
; =  {sc.iadd[11].OUT} {sc.igenebind[10].TF}
(assert (= sc_143 sc_84))
; 
; =  {of.iadd[11].OUT} {of.igenebind[10].TF}
(assert (= of_143 of_84))
; 
; =  {sc.input.I[7].O} {sc.iadd[8].C}
(assert (= sc_14 sc_125))
; 
; =  {of.input.I[7].O} {of.iadd[8].C}
(assert (= of_14 of_125))
; 
; =  {sc.input.V[1].O} {sc.vgain[2].Y}
(assert (= sc_117 sc_1))
; 
; =  {of.input.V[1].O} {of.vgain[2].Y}
(assert (= of_117 of_1))
; 
; =  {sc.input.I[13].O} {sc.switch[7].SUB}
(assert (= sc_16 sc_5))
; 
; =  {of.input.I[13].O} {of.switch[7].SUB}
(assert (= of_16 of_5))
; 
; =  {sc.input.V[7].O} {sc.vadd[3].OUT2_0}
(assert (= sc_97 sc_61))
; 
; =  {of.input.V[7].O} {of.vadd[3].OUT2_0}
(assert (= of_97 of_61))
; 
; =  {sc.input.I[17].O} {sc.igenebind[10].Vmax}
(assert (= sc_52 sc_86))
; 
; =  {of.input.I[17].O} {of.igenebind[10].Vmax}
(assert (= of_52 of_86))
; 
; =  {sc.igenebind[1].GE} {sc.itov[5].K}
(assert (= sc_91 sc_119))
; 
; =  {of.igenebind[1].GE} {of.itov[5].K}
(assert (= of_91 of_119))
; 
; =  {sc.input.I[8].O} {sc.iadd[9].D}
(assert (= sc_12 sc_134))
; 
; =  {of.input.I[8].O} {of.iadd[9].D}
(assert (= of_12 of_134))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[8].B}
(assert (= sc_138 sc_127))
; 
; =  {of.iadd[9].OUT} {of.iadd[8].B}
(assert (= of_138 of_127))
; 
; =  {sc.input.I[23].O} {sc.iadd[12].C}
(assert (= sc_46 sc_130))
; 
; =  {of.input.I[23].O} {of.iadd[12].C}
(assert (= of_46 of_130))
; 
; =  {sc.input.V[0].O} {sc.ihill[0].n}
(assert (= sc_101 sc_75))
; 
; =  {of.input.V[0].O} {of.ihill[0].n}
(assert (= of_101 of_75))
; 
; =  {sc.input.V[10].O} {sc.switch[7].n}
(assert (= sc_105 sc_4))
; 
; =  {of.input.V[10].O} {of.switch[7].n}
(assert (= of_105 of_4))
; 
; =  {sc.itov[4].Y} {sc.vadd[5].B}
(assert (= sc_123 sc_72))
; 
; =  {of.itov[4].Y} {of.vadd[5].B}
(assert (= of_123 of_72))
; 
; =  {sc.iadd[8].OUT} {sc.switch[7].Kmod}
(assert (= sc_128 sc_6))
; 
; =  {of.iadd[8].OUT} {of.switch[7].Kmod}
(assert (= of_128 of_6))
; 
; =  {sc.input.V[4].O} {sc.vadd[5].A}
(assert (= sc_113 sc_71))
; 
; =  {of.input.V[4].O} {of.vadd[5].A}
(assert (= of_113 of_71))
; 
; =  {sc.input.V[5].O} {sc.vadd[5].C}
(assert (= sc_115 sc_70))
; 
; =  {of.input.V[5].O} {of.vadd[5].C}
(assert (= of_115 of_70))
; 
; =  {sc.input.I[19].O} {sc.igenebind[10].K}
(assert (= sc_56 sc_85))
; 
; =  {of.input.I[19].O} {of.igenebind[10].K}
(assert (= of_56 of_85))
; 
; =  {sc.input.V[6].O} {sc.vadd[5].OUT2_0}
(assert (= sc_107 sc_68))
; 
; =  {of.input.V[6].O} {of.vadd[5].OUT2_0}
(assert (= of_107 of_68))
; 
; =  {sc.vgain[2].P} {sc.vadd[3].B}
(assert (= sc_3 sc_65))
; 
; =  {of.vgain[2].P} {of.vadd[3].B}
(assert (= of_3 of_65))
; 
; =  {sc.input.I[11].O} {sc.iadd[11].B}
(assert (= sc_24 sc_142))
; 
; =  {of.input.I[11].O} {of.iadd[11].B}
(assert (= of_24 of_142))
(assert (<= (* (/ 1. sc_58) 0.001) 0.001))
(assert (<= (* (/ 1. sc_60) 0.001) 0.001))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].O} {sc.vadd[5].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_67 sc_58) (= sc_67 sc_74)) (= sc_67 sc_60)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_128 0.) slbot_128 (- slbot_128)) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= sltop_87 0.) sltop_87 (- sltop_87))) (ite (>= slbot_72 0.) slbot_72 (- slbot_72))) (ite (>= sltop_91 0.) sltop_91 (- sltop_91))) (ite (>= sltop_65 0.) sltop_65 (- sltop_65))) (ite (>= sltop_66 0.) sltop_66 (- sltop_66))) (ite (>= sltop_76 0.) sltop_76 (- sltop_76))) (ite (>= sltop_120 0.) sltop_120 (- sltop_120))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_84 0.) slbot_84 (- slbot_84))) (ite (>= slbot_133 0.) slbot_133 (- slbot_133))) (ite (>= slbot_59 0.) slbot_59 (- slbot_59))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_76 0.) slbot_76 (- slbot_76))) (ite (>= slbot_119 0.) slbot_119 (- slbot_119))) (ite (>= slbot_120 0.) slbot_120 (- slbot_120))) (ite (>= sltop_58 0.) sltop_58 (- sltop_58))) (ite (>= slbot_122 0.) slbot_122 (- slbot_122))) (ite (>= sltop_138 0.) sltop_138 (- sltop_138))) (ite (>= slbot_143 0.) slbot_143 (- slbot_143))) (ite (>= slbot_127 0.) slbot_127 (- slbot_127))) (ite (>= sltop_22 0.) sltop_22 (- sltop_22))) (ite (>= sltop_128 0.) sltop_128 (- sltop_128))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_137 0.) sltop_137 (- sltop_137))) (ite (>= slbot_131 0.) slbot_131 (- slbot_131))) (ite (>= sltop_74 0.) sltop_74 (- sltop_74))) (ite (>= sltop_133 0.) sltop_133 (- sltop_133))) (ite (>= slbot_81 0.) slbot_81 (- slbot_81))) (ite (>= slbot_91 0.) slbot_91 (- slbot_91))) (ite (>= sltop_131 0.) sltop_131 (- sltop_131))) (ite (>= slbot_138 0.) slbot_138 (- slbot_138))) (ite (>= slbot_87 0.) slbot_87 (- slbot_87))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_139 0.) slbot_139 (- slbot_139))) (ite (>= sltop_84 0.) sltop_84 (- sltop_84))) (ite (>= sltop_143 0.) sltop_143 (- sltop_143))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= sltop_119 0.) sltop_119 (- sltop_119))) (ite (>= slbot_66 0.) slbot_66 (- slbot_66))) (ite (>= sltop_139 0.) sltop_139 (- sltop_139))) (ite (>= sltop_72 0.) sltop_72 (- sltop_72))) (ite (>= slbot_22 0.) slbot_22 (- slbot_22))) (ite (>= sltop_127 0.) sltop_127 (- sltop_127))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= slbot_60 0.) slbot_60 (- slbot_60))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= sltop_81 0.) sltop_81 (- sltop_81))) (ite (>= slbot_83 0.) slbot_83 (- slbot_83))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= sltop_123 0.) sltop_123 (- sltop_123))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= sltop_67 0.) sltop_67 (- sltop_67))) (ite (>= sltop_57 0.) sltop_57 (- sltop_57))) (ite (>= slbot_67 0.) slbot_67 (- slbot_67))) (ite (>= slbot_57 0.) slbot_57 (- slbot_57))) (ite (>= slbot_65 0.) slbot_65 (- slbot_65))) (ite (>= slbot_21 0.) slbot_21 (- slbot_21))) (ite (>= sltop_60 0.) sltop_60 (- sltop_60))) (ite (>= slbot_73 0.) slbot_73 (- slbot_73))) (ite (>= sltop_145 0.) sltop_145 (- sltop_145))) (ite (>= slbot_137 0.) slbot_137 (- slbot_137))) (ite (>= sltop_83 0.) sltop_83 (- sltop_83))) (ite (>= slbot_123 0.) slbot_123 (- slbot_123))) (ite (>= slbot_145 0.) slbot_145 (- slbot_145))) (ite (>= sltop_148 0.) sltop_148 (- sltop_148))) (ite (>= slbot_74 0.) slbot_74 (- slbot_74))) (ite (>= sltop_122 0.) sltop_122 (- sltop_122))) (ite (>= slbot_148 0.) slbot_148 (- slbot_148))) (ite (>= sltop_73 0.) sltop_73 (- sltop_73))) (ite (>= slbot_58 0.) slbot_58 (- slbot_58))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= sltop_21 0.) sltop_21 (- sltop_21))) (ite (>= sltop_59 0.) sltop_59 (- sltop_59)))))
(check-sat)
