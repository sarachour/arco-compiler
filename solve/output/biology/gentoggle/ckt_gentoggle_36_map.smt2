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
; =  {sc.input.I[29].O} {sc.input.I[29].X}
(assert (= sc_12 sc_11))
; 
; =  {of.input.I[29].O} {of.input.I[29].X}
(assert (= of_12 of_11))
; 
; >=  {((sc.input.I[29].X*1.)+of.input.I[29].X)} {10.}
(assert (<= (+ (* sc_11 1.) of_11) 10.))
; 
; <=  {((sc.input.I[29].X*1.)+of.input.I[29].X)} {0.}
(assert (>= (+ (* sc_11 1.) of_11) 0.))
; 
; >=  {((sc.input.I[29].O*1.)+of.input.I[29].O)} {10.}
(assert (<= (+ (* sc_12 1.) of_12) 10.))
; 
; <=  {((sc.input.I[29].O*1.)+of.input.I[29].O)} {0.}
(assert (>= (+ (* sc_12 1.) of_12) 0.))
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_14 sc_13))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_14 of_13))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_13 0.) of_13) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_16 0.) of_16) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[13].X*1.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_17 1.) of_17) 10.))
; 
; <=  {((sc.input.I[13].X*1.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_17 1.) of_17) 0.))
; 
; >=  {((sc.input.I[13].O*1.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_18 1.) of_18) 10.))
; 
; <=  {((sc.input.I[13].O*1.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_18 1.) of_18) 0.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[12].X*1.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_19 1.) of_19) 10.))
; 
; <=  {((sc.input.I[12].X*1.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_19 1.) of_19) 0.))
; 
; >=  {((sc.input.I[12].O*1.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_20 1.) of_20) 10.))
; 
; <=  {((sc.input.I[12].O*1.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_20 1.) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_22 sc_21))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_22 of_21))
; 
; >=  {((sc.input.I[9].X*337.632520764)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_21 337.632520764) of_21) 10.))
; 
; <=  {((sc.input.I[9].X*337.632520764)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_21 337.632520764) of_21) 0.))
; 
; >=  {((sc.input.I[9].O*337.632520764)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_22 337.632520764) of_22) 10.))
; 
; <=  {((sc.input.I[9].O*337.632520764)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_22 337.632520764) of_22) 0.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_24 sc_23))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_24 of_23))
; 
; >=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_23 156.25) of_23) 10.))
; 
; <=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_23 156.25) of_23) 0.))
; 
; >=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_24 156.25) of_24) 10.))
; 
; <=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_24 156.25) of_24) 0.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_26 sc_25))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_26 of_25))
; 
; >=  {((sc.input.I[11].X*4.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_25 4.) of_25) 10.))
; 
; <=  {((sc.input.I[11].X*4.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_25 4.) of_25) 0.))
; 
; >=  {((sc.input.I[11].O*4.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_26 4.) of_26) 10.))
; 
; <=  {((sc.input.I[11].O*4.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_26 4.) of_26) 0.))
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
; 
; =  {sc.input.I[26].O} {sc.input.I[26].X}
(assert (= sc_28 sc_27))
; 
; =  {of.input.I[26].O} {of.input.I[26].X}
(assert (= of_28 of_27))
; 
; >=  {((sc.input.I[26].X*0.)+of.input.I[26].X)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[26].X*0.)+of.input.I[26].X)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.input.I[26].O*0.)+of.input.I[26].O)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[26].O*0.)+of.input.I[26].O)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_30 sc_29))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_30 of_29))
; 
; >=  {((sc.input.I[10].X*15.6)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_29 15.6) of_29) 10.))
; 
; <=  {((sc.input.I[10].X*15.6)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_29 15.6) of_29) 0.))
; 
; >=  {((sc.input.I[10].O*15.6)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_30 15.6) of_30) 10.))
; 
; <=  {((sc.input.I[10].O*15.6)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_30 15.6) of_30) 0.))
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
; 
; =  {sc.input.I[27].O} {sc.input.I[27].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.I[27].O} {of.input.I[27].X}
(assert (= of_32 of_31))
; 
; >=  {((sc.input.I[27].X*0.)+of.input.I[27].X)} {10.}
(assert (<= (+ (* sc_31 0.) of_31) 10.))
; 
; <=  {((sc.input.I[27].X*0.)+of.input.I[27].X)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.input.I[27].O*0.)+of.input.I[27].O)} {10.}
(assert (<= (+ (* sc_32 0.) of_32) 10.))
; 
; <=  {((sc.input.I[27].O*0.)+of.input.I[27].O)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_33 1.) of_33) 10.))
; 
; <=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_33 1.) of_33) 0.))
; 
; >=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_34 1.) of_34) 10.))
; 
; <=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_34 1.) of_34) 0.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_36 0.) of_36) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_37 1.) of_37) 10.))
; 
; <=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_37 1.) of_37) 0.))
; 
; >=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_38 1.) of_38) 10.))
; 
; <=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {0.}
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
; =  {sc.input.I[28].O} {sc.input.I[28].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.I[28].O} {of.input.I[28].X}
(assert (= of_46 of_45))
; 
; >=  {((sc.input.I[28].X*0.)+of.input.I[28].X)} {10.}
(assert (<= (+ (* sc_45 0.) of_45) 10.))
; 
; <=  {((sc.input.I[28].X*0.)+of.input.I[28].X)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
; 
; >=  {((sc.input.I[28].O*0.)+of.input.I[28].O)} {10.}
(assert (<= (+ (* sc_46 0.) of_46) 10.))
; 
; <=  {((sc.input.I[28].O*0.)+of.input.I[28].O)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_48 of_47))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_47 0.) of_47) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_48 0.) of_48) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_50 sc_49))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_50 of_49))
(declare-fun slbot_49 () Real)
(declare-fun sltop_49 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_49 156.25) of_49) sltop_49) 3300.))
(declare-fun slbot_50 () Real)
(declare-fun sltop_50 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_50 0.) of_50) slbot_50) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_50 156.25) of_50) sltop_50) 3300.))
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_52 sc_51))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_52 of_51))
(declare-fun slbot_51 () Real)
(declare-fun sltop_51 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_51 0.) of_51) slbot_51) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_51 15.6) of_51) sltop_51) 3300.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_52 15.6) of_52) sltop_52) 3300.))
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
(assert (= of_54 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_55 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_57 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_56 (* 1. sc_57)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D)}
(assert (and (= sc_56 (* 1. sc_55)) (= sc_56 (* 1. sc_54))))
; no offset
(assert (= (- (+ of_56 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT} {(sc.vadd[3].A*1.)}
(assert (= sc_58 (* sc_56 1.)))
; 
; =  {of.vadd[3].OUT} {0.}
(assert (= of_58 0.))
; no scale
(assert (= sc_54 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_54 0.))
; no offset
(assert (= of_59 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_55 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_57 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_56 (* 1. sc_57)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D*sc.vadd[3].OUT2)}
(assert (and (= sc_56 (* 1. sc_55)) (= sc_56 (* (* 1. sc_54) sc_59))))
; no offset
(assert (= (- (+ of_56 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2} {(sc.vadd[3].A*1.)}
(assert (= sc_59 (* sc_56 1.)))
; no offset
(assert (= of_59 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2_0} {(sc.vadd[3].A*1.)}
(assert (= sc_53 (* sc_56 1.)))
; 
; =  {of.vadd[3].OUT2_0} {0.}
(assert (= of_53 0.))
; 
; >=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {3300.}
(assert (<= (+ (* sc_53 0.) of_53) 3300.))
; 
; <=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
; 
; >=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {3300.}
(assert (<= (+ (* sc_54 4.) of_54) 3300.))
; 
; <=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {0.}
(assert (>= (+ (* sc_54 4.) of_54) 0.))
; 
; >=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {3300.}
(assert (<= (+ (* sc_55 0.) of_55) 3300.))
; 
; <=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
; 
; >=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {3300.}
(assert (<= (+ (* sc_56 0.) of_56) 3300.))
; 
; <=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59) 0.))
; 
; =  {(((sc.vadd[3].OUT2*156.25)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_59 156.25) of_59) sltop_59) 3300.))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.vadd[3].B*3.75903614458)+of.vadd[3].B)+sl.min.vadd[3].B)} {0.}
(assert (= (+ (+ (* sc_57 3.75903614458) of_57) slbot_57) 0.))
; 
; =  {(((sc.vadd[3].B*62.4)+of.vadd[3].B)+sl.max.vadd[3].B)} {3300.}
(assert (= (+ (+ (* sc_57 62.4) of_57) sltop_57) 3300.))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.vadd[3].OUT*3.75903614458)+of.vadd[3].OUT)+sl.min.vadd[3].OUT)} {-1650.}
(assert (= (+ (+ (* sc_58 3.75903614458) of_58) slbot_58) -1650.))
; 
; =  {(((sc.vadd[3].OUT*62.4)+of.vadd[3].OUT)+sl.max.vadd[3].OUT)} {1650.}
(assert (= (+ (+ (* sc_58 62.4) of_58) sltop_58) 1650.))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59) 0.))
; 
; =  {(((sc.vadd[3].OUT2*156.25)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_59 156.25) of_59) sltop_59) 3300.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_61 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_64 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_63 (* 1. sc_64)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_63 (* 1. sc_62)) (= sc_63 (* 1. sc_61))))
; no offset
(assert (= (- (+ of_63 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_65 (* sc_63 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
(assert (= of_65 0.))
; no scale
(assert (= sc_61 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_61 0.))
; no offset
(assert (= of_66 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_64 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_63 (* 1. sc_64)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_63 (* 1. sc_62)) (= sc_63 (* (* 1. sc_61) sc_66))))
; no offset
(assert (= (- (+ of_63 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_66 (* sc_63 1.)))
; no offset
(assert (= of_66 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_60 (* sc_63 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_60 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
; 
; >=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {3300.}
(assert (<= (+ (* sc_61 4.) of_61) 3300.))
; 
; <=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {0.}
(assert (>= (+ (* sc_61 4.) of_61) 0.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_62 0.) of_62) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_63 0.) of_63) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_66 0.) of_66) slbot_66) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_66 15.6) of_66) sltop_66) 3300.))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.vadd[5].B*0.00204799328914)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_64 0.00204799328914) of_64) slbot_64) 0.))
; 
; =  {(((sc.vadd[5].B*625.)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_64 625.) of_64) sltop_64) 3300.))
(declare-fun slbot_65 () Real)
(declare-fun sltop_65 () Real)
; 
; =  {(((sc.vadd[5].OUT*0.00204799328914)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_65 0.00204799328914) of_65) slbot_65) -1650.))
; 
; =  {(((sc.vadd[5].OUT*625.)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_65 625.) of_65) sltop_65) 1650.))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_66 0.) of_66) slbot_66) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_66 15.6) of_66) sltop_66) 3300.))
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
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
; no offset
(assert (= of_68 0.))
; no offset
(assert (= of_69 0.))
; no scale
(assert (= (/ sc_68 sc_69) 1.))
; no scale
(assert (= sc_67 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_67 0.))
; no offset
(assert (= of_68 0.))
; no offset
(assert (= of_69 0.))
; no scale
(assert (= (/ sc_68 sc_69) 1.))
; no scale
(assert (= sc_67 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_67 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_70 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_71 (* sc_70 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_71 0.))
; no scale
(assert (= sc_69 1.))
; no scale
(assert (= (* sc_67 1.) 1.))
; no offset
(assert (= of_69 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_69 1.))
; no scale
(assert (= (* sc_67 1.) 1.))
; no offset
(assert (= of_69 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_68 1.))
; no scale
(assert (= sc_67 1.))
; no offset
(assert (= of_68 0.))
; no offset
(assert (= of_67 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_70 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_72 (* sc_70 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_72 0.))
; 
; >=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_67 2.5) of_67) 5.))
; 
; <=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_67 2.5) of_67) 1.))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_68 0.) of_68) slbot_68) 1.))
; 
; =  {(((sc.ihill[0].S*156.25)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_68 156.25) of_68) sltop_68) 10.))
(declare-fun slbot_72 () Real)
(declare-fun sltop_72 () Real)
; 
; =  {(((sc.ihill[0].REP*0.000511998322284)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {9.999900001e-10}
(assert (= (+ (+ (* sc_72 0.000511998322284) of_72) slbot_72) 9.999900001e-10))
; 
; =  {(((sc.ihill[0].REP*156.25)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {5.}
(assert (= (+ (+ (* sc_72 156.25) of_72) sltop_72) 5.))
; 
; >=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_70 156.25) of_70) 10.))
; 
; <=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_70 156.25) of_70) 0.0001))
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_74 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_73 0.))
; 
; =  {sc.vtoi[7].Y} {((1./sc.vtoi[7].K)*sc.vtoi[7].X)}
(assert (= sc_75 (* (/ 1. sc_74) sc_73)))
; 
; =  {of.vtoi[7].Y} {0.}
(assert (= of_75 0.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.vtoi[7].X*0.)+of.vtoi[7].X)+sl.min.vtoi[7].X)} {1.}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73) 1.))
; 
; =  {(((sc.vtoi[7].X*156.25)+of.vtoi[7].X)+sl.max.vtoi[7].X)} {3300.}
(assert (= (+ (+ (* sc_73 156.25) of_73) sltop_73) 3300.))
; 
; >=  {((sc.vtoi[7].K*1.)+of.vtoi[7].K)} {3300.}
(assert (<= (+ (* sc_74 1.) of_74) 3300.))
; 
; <=  {((sc.vtoi[7].K*1.)+of.vtoi[7].K)} {1.}
(assert (>= (+ (* sc_74 1.) of_74) 1.))
(declare-fun slbot_75 () Real)
(declare-fun sltop_75 () Real)
; 
; =  {(((sc.vtoi[7].Y*0.)+of.vtoi[7].Y)+sl.min.vtoi[7].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_75 0.) of_75) slbot_75) 0.00030303030303))
; 
; =  {(((sc.vtoi[7].Y*156.25)+of.vtoi[7].Y)+sl.max.vtoi[7].Y)} {3300.}
(assert (= (+ (+ (* sc_75 156.25) of_75) sltop_75) 3300.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_77 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_76 0.))
; 
; =  {sc.vtoi[6].Y} {((1./sc.vtoi[6].K)*sc.vtoi[6].X)}
(assert (= sc_78 (* (/ 1. sc_77) sc_76)))
; 
; =  {of.vtoi[6].Y} {0.}
(assert (= of_78 0.))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.vtoi[6].X*0.)+of.vtoi[6].X)+sl.min.vtoi[6].X)} {1.}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76) 1.))
; 
; =  {(((sc.vtoi[6].X*0.6)+of.vtoi[6].X)+sl.max.vtoi[6].X)} {3300.}
(assert (= (+ (+ (* sc_76 0.6) of_76) sltop_76) 3300.))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.vtoi[6].Y*-0.6)+of.vtoi[6].Y)+sl.min.vtoi[6].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_78 -0.6) of_78) slbot_78) 0.00030303030303))
; 
; =  {(((sc.vtoi[6].Y*0.)+of.vtoi[6].Y)+sl.max.vtoi[6].Y)} {3300.}
(assert (= (+ (+ (* sc_78 0.) of_78) sltop_78) 3300.))
; 
; >=  {((sc.vtoi[6].K*-1.)+of.vtoi[6].K)} {3300.}
(assert (<= (+ (* sc_77 -1.) of_77) 3300.))
; 
; <=  {((sc.vtoi[6].K*-1.)+of.vtoi[6].K)} {1.}
(assert (>= (+ (* sc_77 -1.) of_77) 1.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
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
(assert (= of_80 0.))
; no offset
(assert (= of_79 0.))
; 
; =  {1.} {(sc.igenebind[10].K*sc.igenebind[10].TF)}
(assert (= 1. (* sc_80 sc_79)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_81 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[10].GE} {(sc.igenebind[10].Vmax*(1./1.))}
(assert (= sc_82 (* sc_81 (/ 1. 1.))))
; 
; =  {of.igenebind[10].GE} {0.}
(assert (= of_82 0.))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.igenebind[10].TF*-1.)+of.igenebind[10].TF)+sl.min.igenebind[10].TF)} {0.0001}
(assert (= (+ (+ (* sc_79 -1.) of_79) slbot_79) 0.0001))
; 
; =  {(((sc.igenebind[10].TF*-0.4)+of.igenebind[10].TF)+sl.max.igenebind[10].TF)} {10.}
(assert (= (+ (+ (* sc_79 -0.4) of_79) sltop_79) 10.))
; 
; >=  {((sc.igenebind[10].K*1.)+of.igenebind[10].K)} {10.}
(assert (<= (+ (* sc_80 1.) of_80) 10.))
; 
; <=  {((sc.igenebind[10].K*1.)+of.igenebind[10].K)} {0.0001}
(assert (>= (+ (* sc_80 1.) of_80) 0.0001))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.igenebind[10].GE*0.)+of.igenebind[10].GE)+sl.min.igenebind[10].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[10].GE*1.66666666667)+of.igenebind[10].GE)+sl.max.igenebind[10].GE)} {9.9999999}
(assert (= (+ (+ (* sc_82 1.66666666667) of_82) sltop_82) 9.9999999))
; 
; >=  {((sc.igenebind[10].Vmax*1.)+of.igenebind[10].Vmax)} {10.}
(assert (<= (+ (* sc_81 1.) of_81) 10.))
; 
; <=  {((sc.igenebind[10].Vmax*1.)+of.igenebind[10].Vmax)} {0.0001}
(assert (>= (+ (* sc_81 1.) of_81) 0.0001))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.igenebind[10].GE*0.)+of.igenebind[10].GE)+sl.min.igenebind[10].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[10].GE*1.66666666667)+of.igenebind[10].GE)+sl.max.igenebind[10].GE)} {9.9999999}
(assert (= (+ (+ (* sc_82 1.66666666667) of_82) sltop_82) 9.9999999))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
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
(assert (= of_84 0.))
; no offset
(assert (= of_83 0.))
; 
; =  {1.} {(sc.igenebind[1].K*sc.igenebind[1].TF)}
(assert (= 1. (* sc_84 sc_83)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_85 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[1].GE} {(sc.igenebind[1].Vmax*(1./1.))}
(assert (= sc_86 (* sc_85 (/ 1. 1.))))
; 
; =  {of.igenebind[1].GE} {0.}
(assert (= of_86 0.))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.igenebind[1].TF*0.)+of.igenebind[1].TF)+sl.min.igenebind[1].TF)} {0.0001}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83) 0.0001))
; 
; =  {(((sc.igenebind[1].TF*15.6)+of.igenebind[1].TF)+sl.max.igenebind[1].TF)} {10.}
(assert (= (+ (+ (* sc_83 15.6) of_83) sltop_83) 10.))
; 
; >=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {10.}
(assert (<= (+ (* sc_84 1.) of_84) 10.))
; 
; <=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {0.0001}
(assert (>= (+ (* sc_84 1.) of_84) 0.0001))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.igenebind[1].GE*0.939759036145)+of.igenebind[1].GE)+sl.min.igenebind[1].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_86 0.939759036145) of_86) slbot_86) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[1].GE*15.6)+of.igenebind[1].GE)+sl.max.igenebind[1].GE)} {9.9999999}
(assert (= (+ (+ (* sc_86 15.6) of_86) sltop_86) 9.9999999))
; 
; >=  {((sc.igenebind[1].Vmax*15.6)+of.igenebind[1].Vmax)} {10.}
(assert (<= (+ (* sc_85 15.6) of_85) 10.))
; 
; <=  {((sc.igenebind[1].Vmax*15.6)+of.igenebind[1].Vmax)} {0.0001}
(assert (>= (+ (* sc_85 15.6) of_85) 0.0001))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_88 sc_87))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_88 of_87))
; 
; >=  {((sc.input.V[2].X*0.125)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_87 0.125) of_87) 3300.))
; 
; <=  {((sc.input.V[2].X*0.125)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_87 0.125) of_87) 0.))
; 
; >=  {((sc.input.V[2].O*0.125)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_88 0.125) of_88) 3300.))
; 
; <=  {((sc.input.V[2].O*0.125)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_88 0.125) of_88) 0.))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_90 sc_89))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_90 of_89))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_89 0.) of_89) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_89 0.) of_89) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_90 0.) of_90) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_90 0.) of_90) 0.))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_92 sc_91))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_92 of_91))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_91 0.) of_91) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_92 0.) of_92) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_92 0.) of_92) 0.))
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_94 sc_93))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_94 of_93))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_93 1.) of_93) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_93 1.) of_93) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_94 1.) of_94) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_94 1.) of_94) 0.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_96 sc_95))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_96 of_95))
; 
; >=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_95 1000.75) of_95) 3300.))
; 
; <=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_95 1000.75) of_95) 0.))
; 
; >=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_96 1000.75) of_96) 3300.))
; 
; <=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_96 1000.75) of_96) 0.))
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_98 sc_97))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_98 of_97))
; 
; >=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_97 -1.) of_97) 3300.))
; 
; <=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_97 -1.) of_97) 0.))
; 
; >=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_98 -1.) of_98) 3300.))
; 
; <=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_98 -1.) of_98) 0.))
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_100 sc_99))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_100 of_99))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_99 0.6) of_99) sltop_99) 3300.))
(declare-fun slbot_100 () Real)
(declare-fun sltop_100 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_100 0.) of_100) slbot_100) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_100 0.6) of_100) sltop_100) 3300.))
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_102 sc_101))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_102 of_101))
; 
; >=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_101 4.) of_101) 3300.))
; 
; <=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_101 4.) of_101) 0.))
; 
; >=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_102 4.) of_102) 3300.))
; 
; <=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_102 4.) of_102) 0.))
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_104 sc_103))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_104 of_103))
; 
; >=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_103 4.) of_103) 3300.))
; 
; <=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_103 4.) of_103) 0.))
; 
; >=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_104 4.) of_104) 3300.))
; 
; <=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_104 4.) of_104) 0.))
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_106 sc_105))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_106 of_105))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_105 0.) of_105) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_105 0.) of_105) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_106 0.) of_106) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_106 0.) of_106) 0.))
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_108 sc_107))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_108 of_107))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_107 0.) of_107) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_107 0.) of_107) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_108 0.) of_108) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_108 0.) of_108) 0.))
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_110 sc_109))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_110 of_109))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_109 0.) of_109) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_109 0.) of_109) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_110 0.) of_110) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_110 0.) of_110) 0.))
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_112 sc_111))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_112 of_111))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_111 0.) of_111) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_111 0.) of_111) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_112 0.) of_112) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_112 0.) of_112) 0.))
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_114 sc_113))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_114 of_113))
; 
; >=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_113 2.5) of_113) 3300.))
; 
; <=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_113 2.5) of_113) 0.))
; 
; >=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_114 2.5) of_114) 3300.))
; 
; <=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_114 2.5) of_114) 0.))
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
; 
; =  {sc.input.V[19].O} {sc.input.V[19].X}
(assert (= sc_116 sc_115))
; 
; =  {of.input.V[19].O} {of.input.V[19].X}
(assert (= of_116 of_115))
; 
; >=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {3300.}
(assert (<= (+ (* sc_115 1.) of_115) 3300.))
; 
; <=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {0.}
(assert (>= (+ (* sc_115 1.) of_115) 0.))
; 
; >=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {3300.}
(assert (<= (+ (* sc_116 1.) of_116) 3300.))
; 
; <=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {0.}
(assert (>= (+ (* sc_116 1.) of_116) 0.))
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
; no offset
(assert (= of_118 0.))
; no offset
(assert (= of_117 0.))
; 
; =  {sc.itov[5].Y} {(sc.itov[5].K*sc.itov[5].X)}
(assert (= sc_119 (* sc_118 sc_117)))
; 
; =  {of.itov[5].Y} {0.}
(assert (= of_119 0.))
; 
; >=  {((sc.itov[5].X*1.)+of.itov[5].X)} {10.}
(assert (<= (+ (* sc_117 1.) of_117) 10.))
; 
; <=  {((sc.itov[5].X*1.)+of.itov[5].X)} {0.0001}
(assert (>= (+ (* sc_117 1.) of_117) 0.0001))
(declare-fun slbot_118 () Real)
(declare-fun sltop_118 () Real)
; 
; =  {(((sc.itov[5].K*0.939759036145)+of.itov[5].K)+sl.min.itov[5].K)} {1.}
(assert (= (+ (+ (* sc_118 0.939759036145) of_118) slbot_118) 1.))
; 
; =  {(((sc.itov[5].K*15.6)+of.itov[5].K)+sl.max.itov[5].K)} {330.}
(assert (= (+ (+ (* sc_118 15.6) of_118) sltop_118) 330.))
(declare-fun slbot_119 () Real)
(declare-fun sltop_119 () Real)
; 
; =  {(((sc.itov[5].Y*0.939759036145)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_119 0.939759036145) of_119) slbot_119) 0.0001))
; 
; =  {(((sc.itov[5].Y*15.6)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_119 15.6) of_119) sltop_119) 3300.))
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
; no offset
(assert (= of_121 0.))
; no offset
(assert (= of_120 0.))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_122 (* sc_121 sc_120)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_122 0.))
; 
; >=  {((sc.itov[4].X*4.)+of.itov[4].X)} {10.}
(assert (<= (+ (* sc_120 4.) of_120) 10.))
; 
; <=  {((sc.itov[4].X*4.)+of.itov[4].X)} {0.0001}
(assert (>= (+ (* sc_120 4.) of_120) 0.0001))
(declare-fun slbot_122 () Real)
(declare-fun sltop_122 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_122 0.00204799328914) of_122) slbot_122) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_122 625.) of_122) sltop_122) 3300.))
(declare-fun slbot_121 () Real)
(declare-fun sltop_121 () Real)
; 
; =  {(((sc.itov[4].K*0.000511998322284)+of.itov[4].K)+sl.min.itov[4].K)} {1.}
(assert (= (+ (+ (* sc_121 0.000511998322284) of_121) slbot_121) 1.))
; 
; =  {(((sc.itov[4].K*156.25)+of.itov[4].K)+sl.max.itov[4].K)} {330.}
(assert (= (+ (+ (* sc_121 156.25) of_121) sltop_121) 330.))
(declare-fun slbot_122 () Real)
(declare-fun sltop_122 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_122 0.00204799328914) of_122) slbot_122) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_122 625.) of_122) sltop_122) 3300.))
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
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
; 
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_125 sc_126))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_125 sc_124) (= sc_125 sc_123)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_127 sc_125))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_127 (- (+ of_125 of_126) (+ of_124 of_123))))
; 
; >=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {5.}
(assert (<= (+ (* sc_123 0.) of_123) 5.))
; 
; <=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {0.}
(assert (>= (+ (* sc_123 0.) of_123) 0.))
; 
; >=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {5.}
(assert (<= (+ (* sc_124 0.) of_124) 5.))
; 
; <=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {0.}
(assert (>= (+ (* sc_124 0.) of_124) 0.))
(declare-fun slbot_127 () Real)
(declare-fun sltop_127 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_127 0.) of_127) slbot_127) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_127 1.66666666667) of_127) sltop_127) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_125 0.) of_125) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_125 0.) of_125) 0.))
(declare-fun slbot_126 () Real)
(declare-fun sltop_126 () Real)
; 
; =  {(((sc.iadd[8].B*0.)+of.iadd[8].B)+sl.min.iadd[8].B)} {0.}
(assert (= (+ (+ (* sc_126 0.) of_126) slbot_126) 0.))
; 
; =  {(((sc.iadd[8].B*1.66666666667)+of.iadd[8].B)+sl.max.iadd[8].B)} {5.}
(assert (= (+ (+ (* sc_126 1.66666666667) of_126) sltop_126) 5.))
(declare-fun slbot_127 () Real)
(declare-fun sltop_127 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_127 0.) of_127) slbot_127) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_127 1.66666666667) of_127) sltop_127) 10.))
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
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
; 
; =  {sc.iadd[12].A} {sc.iadd[12].B}
(assert (= sc_130 sc_131))
; 
; =  {sc.iadd[12].A} {sc.iadd[12].C} {sc.iadd[12].D}
(assert (and (= sc_130 sc_129) (= sc_130 sc_128)))
; 
; =  {sc.iadd[12].OUT} {sc.iadd[12].A}
(assert (= sc_132 sc_130))
; 
; =  {of.iadd[12].OUT} {((of.iadd[12].A+of.iadd[12].B)-of.iadd[12].C-of.iadd[12].D)}
(assert (= of_132 (- (+ of_130 of_131) (+ of_129 of_128))))
; 
; >=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {5.}
(assert (<= (+ (* sc_128 0.) of_128) 5.))
; 
; <=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {0.}
(assert (>= (+ (* sc_128 0.) of_128) 0.))
; 
; >=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {5.}
(assert (<= (+ (* sc_129 0.) of_129) 5.))
; 
; <=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {0.}
(assert (>= (+ (* sc_129 0.) of_129) 0.))
(declare-fun slbot_130 () Real)
(declare-fun sltop_130 () Real)
; 
; =  {(((sc.iadd[12].A*0.)+of.iadd[12].A)+sl.min.iadd[12].A)} {0.}
(assert (= (+ (+ (* sc_130 0.) of_130) slbot_130) 0.))
; 
; =  {(((sc.iadd[12].A*15.6)+of.iadd[12].A)+sl.max.iadd[12].A)} {5.}
(assert (= (+ (+ (* sc_130 15.6) of_130) sltop_130) 5.))
; 
; >=  {((sc.iadd[12].B*0.)+of.iadd[12].B)} {5.}
(assert (<= (+ (* sc_131 0.) of_131) 5.))
; 
; <=  {((sc.iadd[12].B*0.)+of.iadd[12].B)} {0.}
(assert (>= (+ (* sc_131 0.) of_131) 0.))
(declare-fun slbot_132 () Real)
(declare-fun sltop_132 () Real)
; 
; =  {(((sc.iadd[12].OUT*0.)+of.iadd[12].OUT)+sl.min.iadd[12].OUT)} {-10.}
(assert (= (+ (+ (* sc_132 0.) of_132) slbot_132) -10.))
; 
; =  {(((sc.iadd[12].OUT*15.6)+of.iadd[12].OUT)+sl.max.iadd[12].OUT)} {10.}
(assert (= (+ (+ (* sc_132 15.6) of_132) sltop_132) 10.))
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
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
; 
; =  {sc.iadd[9].A} {sc.iadd[9].B}
(assert (= sc_135 sc_136))
; 
; =  {sc.iadd[9].A} {sc.iadd[9].C} {sc.iadd[9].D}
(assert (and (= sc_135 sc_134) (= sc_135 sc_133)))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[9].A}
(assert (= sc_137 sc_135))
; 
; =  {of.iadd[9].OUT} {((of.iadd[9].A+of.iadd[9].B)-of.iadd[9].C-of.iadd[9].D)}
(assert (= of_137 (- (+ of_135 of_136) (+ of_134 of_133))))
; 
; >=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {5.}
(assert (<= (+ (* sc_133 0.) of_133) 5.))
; 
; <=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {0.}
(assert (>= (+ (* sc_133 0.) of_133) 0.))
; 
; >=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {5.}
(assert (<= (+ (* sc_134 0.) of_134) 5.))
; 
; <=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {0.}
(assert (>= (+ (* sc_134 0.) of_134) 0.))
(declare-fun slbot_137 () Real)
(declare-fun sltop_137 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_137 0.) of_137) slbot_137) -10.))
; 
; =  {(((sc.iadd[9].OUT*1.66666666667)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_137 1.66666666667) of_137) sltop_137) 10.))
; 
; >=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {5.}
(assert (<= (+ (* sc_135 0.) of_135) 5.))
; 
; <=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {0.}
(assert (>= (+ (* sc_135 0.) of_135) 0.))
(declare-fun slbot_136 () Real)
(declare-fun sltop_136 () Real)
; 
; =  {(((sc.iadd[9].B*0.)+of.iadd[9].B)+sl.min.iadd[9].B)} {0.}
(assert (= (+ (+ (* sc_136 0.) of_136) slbot_136) 0.))
; 
; =  {(((sc.iadd[9].B*1.66666666667)+of.iadd[9].B)+sl.max.iadd[9].B)} {5.}
(assert (= (+ (+ (* sc_136 1.66666666667) of_136) sltop_136) 5.))
(declare-fun slbot_137 () Real)
(declare-fun sltop_137 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_137 0.) of_137) slbot_137) -10.))
; 
; =  {(((sc.iadd[9].OUT*1.66666666667)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_137 1.66666666667) of_137) sltop_137) 10.))
(declare-fun sc_138 () Real)
(assert (> sc_138 1e-08))
(declare-fun of_138 () Real)
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
; 
; =  {sc.iadd[11].A} {sc.iadd[11].B}
(assert (= sc_140 sc_141))
; 
; =  {sc.iadd[11].A} {sc.iadd[11].C} {sc.iadd[11].D}
(assert (and (= sc_140 sc_139) (= sc_140 sc_138)))
; 
; =  {sc.iadd[11].OUT} {sc.iadd[11].A}
(assert (= sc_142 sc_140))
; 
; =  {of.iadd[11].OUT} {((of.iadd[11].A+of.iadd[11].B)-of.iadd[11].C-of.iadd[11].D)}
(assert (= of_142 (- (+ of_140 of_141) (+ of_139 of_138))))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.iadd[11].D*-0.6)+of.iadd[11].D)+sl.min.iadd[11].D)} {0.}
(assert (= (+ (+ (* sc_138 -0.6) of_138) slbot_138) 0.))
; 
; =  {(((sc.iadd[11].D*0.)+of.iadd[11].D)+sl.max.iadd[11].D)} {5.}
(assert (= (+ (+ (* sc_138 0.) of_138) sltop_138) 5.))
; 
; >=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {5.}
(assert (<= (+ (* sc_139 1.) of_139) 5.))
; 
; <=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {0.}
(assert (>= (+ (* sc_139 1.) of_139) 0.))
(declare-fun slbot_142 () Real)
(declare-fun sltop_142 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_142 -1.) of_142) slbot_142) -10.))
; 
; =  {(((sc.iadd[11].OUT*-0.4)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_142 -0.4) of_142) sltop_142) 10.))
; 
; >=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {5.}
(assert (<= (+ (* sc_140 0.) of_140) 5.))
; 
; <=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {0.}
(assert (>= (+ (* sc_140 0.) of_140) 0.))
; 
; >=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {5.}
(assert (<= (+ (* sc_141 0.) of_141) 5.))
; 
; <=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {0.}
(assert (>= (+ (* sc_141 0.) of_141) 0.))
(declare-fun slbot_142 () Real)
(declare-fun sltop_142 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_142 -1.) of_142) slbot_142) -10.))
; 
; =  {(((sc.iadd[11].OUT*-0.4)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_142 -0.4) of_142) sltop_142) 10.))
; 
; =  {sc.input.I[6].O} {sc.iadd[9].C}
(assert (= sc_36 sc_134))
; 
; =  {of.input.I[6].O} {of.iadd[9].C}
(assert (= of_36 of_134))
; 
; =  {sc.input.I[0].O} {sc.ihill[0].Vmax}
(assert (= sc_24 sc_70))
; 
; =  {of.input.I[0].O} {of.ihill[0].Vmax}
(assert (= of_24 of_70))
; 
; =  {sc.switch[7].PROD} {sc.iadd[12].A}
(assert (= sc_8 sc_130))
; 
; =  {of.switch[7].PROD} {of.iadd[12].A}
(assert (= of_8 of_130))
; 
; =  {sc.ihill[0].REP} {sc.itov[4].K}
(assert (= sc_72 sc_121))
; 
; =  {of.ihill[0].REP} {of.itov[4].K}
(assert (= of_72 of_121))
; 
; =  {sc.input.V[9].O} {sc.vtoi[6].K}
(assert (= sc_98 sc_77))
; 
; =  {of.input.V[9].O} {of.vtoi[6].K}
(assert (= of_98 of_77))
; 
; =  {sc.input.I[26].O} {sc.iadd[12].C}
(assert (= sc_28 sc_129))
; 
; =  {of.input.I[26].O} {of.iadd[12].C}
(assert (= of_28 of_129))
; 
; =  {sc.input.I[9].O} {sc.switch[7].SUB}
(assert (= sc_22 sc_5))
; 
; =  {of.input.I[9].O} {of.switch[7].SUB}
(assert (= of_22 of_5))
; 
; =  {sc.vtoi[7].Y} {sc.ihill[0].S}
(assert (= sc_75 sc_68))
; 
; =  {of.vtoi[7].Y} {of.ihill[0].S}
(assert (= of_75 of_68))
; 
; =  {sc.input.I[3].O} {sc.iadd[8].C}
(assert (= sc_40 sc_124))
; 
; =  {of.input.I[3].O} {of.iadd[8].C}
(assert (= of_40 of_124))
; 
; =  {sc.input.V[13].O} {sc.vgain[2].X}
(assert (= sc_94 sc_0))
; 
; =  {of.input.V[13].O} {of.vgain[2].X}
(assert (= of_94 of_0))
; 
; =  {sc.input.I[4].O} {sc.iadd[9].D}
(assert (= sc_42 sc_133))
; 
; =  {of.input.I[4].O} {of.iadd[9].D}
(assert (= of_42 of_133))
; 
; =  {sc.igenebind[10].GE} {sc.iadd[9].B}
(assert (= sc_82 sc_136))
; 
; =  {of.igenebind[10].GE} {of.iadd[9].B}
(assert (= of_82 of_136))
; 
; =  {sc.input.I[5].O} {sc.iadd[9].A}
(assert (= sc_44 sc_135))
; 
; =  {of.input.I[5].O} {of.iadd[9].A}
(assert (= of_44 of_135))
; 
; =  {sc.vtoi[6].Y} {sc.iadd[11].D}
(assert (= sc_78 sc_138))
; 
; =  {of.vtoi[6].Y} {of.iadd[11].D}
(assert (= of_78 of_138))
; 
; =  {sc.iadd[12].OUT} {sc.igenebind[1].TF}
(assert (= sc_132 sc_83))
; 
; =  {of.iadd[12].OUT} {of.igenebind[1].TF}
(assert (= of_132 of_83))
; 
; =  {sc.itov[5].Y} {sc.vgain[2].Z}
(assert (= sc_119 sc_2))
; 
; =  {of.itov[5].Y} {of.vgain[2].Z}
(assert (= of_119 of_2))
; 
; =  {sc.input.V[11].O} {sc.vadd[5].D}
(assert (= sc_102 sc_61))
; 
; =  {of.input.V[11].O} {of.vadd[5].D}
(assert (= of_102 of_61))
; 
; =  {sc.input.I[14].O} {sc.iadd[11].C}
(assert (= sc_38 sc_139))
; 
; =  {of.input.I[14].O} {of.iadd[11].C}
(assert (= of_38 of_139))
; 
; =  {sc.input.V[8].O} {sc.vadd[3].OUT2_0}
(assert (= sc_90 sc_53))
; 
; =  {of.input.V[8].O} {of.vadd[3].OUT2_0}
(assert (= of_90 of_53))
; 
; =  {sc.input.I[2].O} {sc.iadd[8].A}
(assert (= sc_10 sc_125))
; 
; =  {of.input.I[2].O} {of.iadd[8].A}
(assert (= of_10 of_125))
; 
; =  {sc.input.V[12].O} {sc.switch[7].n}
(assert (= sc_96 sc_4))
; 
; =  {of.input.V[12].O} {of.switch[7].n}
(assert (= of_96 of_4))
; 
; =  {sc.input.I[29].O} {sc.itov[5].X}
(assert (= sc_12 sc_117))
; 
; =  {of.input.I[29].O} {of.itov[5].X}
(assert (= of_12 of_117))
; 
; =  {sc.input.V[3].O} {sc.vadd[3].A}
(assert (= sc_108 sc_56))
; 
; =  {of.input.V[3].O} {of.vadd[3].A}
(assert (= of_108 of_56))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[1].X}
(assert (= sc_66 sc_51))
; 
; =  {of.vadd[5].OUT2} {of.output.V[1].X}
(assert (= of_66 of_51))
; 
; =  {sc.vadd[5].OUT2} {sc.switch[7].Vmax}
(assert (= sc_66 sc_7))
; 
; =  {of.vadd[5].OUT2} {of.switch[7].Vmax}
(assert (= of_66 of_7))
; 
; =  {sc.input.V[2].O} {sc.vgain[2].Y}
(assert (= sc_88 sc_1))
; 
; =  {of.input.V[2].O} {of.vgain[2].Y}
(assert (= of_88 of_1))
; 
; =  {sc.input.V[19].O} {sc.vtoi[7].K}
(assert (= sc_116 sc_74))
; 
; =  {of.input.V[19].O} {of.vtoi[7].K}
(assert (= of_116 of_74))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].X}
(assert (= sc_59 sc_49))
; 
; =  {of.vadd[3].OUT2} {of.output.V[0].X}
(assert (= of_59 of_49))
; 
; =  {sc.vadd[3].OUT2} {sc.vtoi[7].X}
(assert (= sc_59 sc_73))
; 
; =  {of.vadd[3].OUT2} {of.vtoi[7].X}
(assert (= of_59 of_73))
; 
; =  {sc.input.I[15].O} {sc.igenebind[10].K}
(assert (= sc_34 sc_80))
; 
; =  {of.input.I[15].O} {of.igenebind[10].K}
(assert (= of_34 of_80))
; 
; =  {sc.input.I[1].O} {sc.iadd[8].D}
(assert (= sc_48 sc_123))
; 
; =  {of.input.I[1].O} {of.iadd[8].D}
(assert (= of_48 of_123))
; 
; =  {sc.input.I[12].O} {sc.igenebind[1].K}
(assert (= sc_20 sc_84))
; 
; =  {of.input.I[12].O} {of.igenebind[1].K}
(assert (= of_20 of_84))
; 
; =  {sc.input.I[10].O} {sc.igenebind[1].Vmax}
(assert (= sc_30 sc_85))
; 
; =  {of.input.I[10].O} {of.igenebind[1].Vmax}
(assert (= of_30 of_85))
; 
; =  {sc.iadd[11].OUT} {sc.igenebind[10].TF}
(assert (= sc_142 sc_79))
; 
; =  {of.iadd[11].OUT} {of.igenebind[10].TF}
(assert (= of_142 of_79))
; 
; =  {sc.input.I[13].O} {sc.igenebind[10].Vmax}
(assert (= sc_18 sc_81))
; 
; =  {of.input.I[13].O} {of.igenebind[10].Vmax}
(assert (= of_18 of_81))
; 
; =  {sc.input.I[7].O} {sc.iadd[11].B}
(assert (= sc_16 sc_141))
; 
; =  {of.input.I[7].O} {of.iadd[11].B}
(assert (= of_16 of_141))
; 
; =  {sc.input.V[1].O} {sc.ihill[0].n}
(assert (= sc_114 sc_67))
; 
; =  {of.input.V[1].O} {of.ihill[0].n}
(assert (= of_114 of_67))
; 
; =  {sc.input.V[7].O} {sc.vadd[5].OUT2_0}
(assert (= sc_92 sc_60))
; 
; =  {of.input.V[7].O} {of.vadd[5].OUT2_0}
(assert (= of_92 of_60))
; 
; =  {sc.igenebind[1].GE} {sc.itov[5].K}
(assert (= sc_86 sc_118))
; 
; =  {of.igenebind[1].GE} {of.itov[5].K}
(assert (= of_86 of_118))
; 
; =  {sc.input.I[8].O} {sc.iadd[11].A}
(assert (= sc_14 sc_140))
; 
; =  {of.input.I[8].O} {of.iadd[11].A}
(assert (= of_14 of_140))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[8].B}
(assert (= sc_137 sc_126))
; 
; =  {of.iadd[9].OUT} {of.iadd[8].B}
(assert (= of_137 of_126))
; 
; =  {sc.input.I[27].O} {sc.iadd[12].B}
(assert (= sc_32 sc_131))
; 
; =  {of.input.I[27].O} {of.iadd[12].B}
(assert (= of_32 of_131))
; 
; =  {sc.input.V[10].O} {sc.vadd[3].D}
(assert (= sc_104 sc_54))
; 
; =  {of.input.V[10].O} {of.vadd[3].D}
(assert (= of_104 of_54))
; 
; =  {sc.input.V[0].O} {sc.vtoi[6].X}
(assert (= sc_100 sc_76))
; 
; =  {of.input.V[0].O} {of.vtoi[6].X}
(assert (= of_100 of_76))
; 
; =  {sc.itov[4].Y} {sc.vadd[5].B}
(assert (= sc_122 sc_64))
; 
; =  {of.itov[4].Y} {of.vadd[5].B}
(assert (= of_122 of_64))
; 
; =  {sc.iadd[8].OUT} {sc.switch[7].Kmod}
(assert (= sc_127 sc_6))
; 
; =  {of.iadd[8].OUT} {of.switch[7].Kmod}
(assert (= of_127 of_6))
; 
; =  {sc.input.V[5].O} {sc.vadd[5].A}
(assert (= sc_112 sc_63))
; 
; =  {of.input.V[5].O} {of.vadd[5].A}
(assert (= of_112 of_63))
; 
; =  {sc.input.V[4].O} {sc.vadd[3].C}
(assert (= sc_110 sc_55))
; 
; =  {of.input.V[4].O} {of.vadd[3].C}
(assert (= of_110 of_55))
; 
; =  {sc.input.V[6].O} {sc.vadd[5].C}
(assert (= sc_106 sc_62))
; 
; =  {of.input.V[6].O} {of.vadd[5].C}
(assert (= of_106 of_62))
; 
; =  {sc.vgain[2].P} {sc.vadd[3].B}
(assert (= sc_3 sc_57))
; 
; =  {of.vgain[2].P} {of.vadd[3].B}
(assert (= of_3 of_57))
; 
; =  {sc.input.I[28].O} {sc.iadd[12].D}
(assert (= sc_46 sc_128))
; 
; =  {of.input.I[28].O} {of.iadd[12].D}
(assert (= of_46 of_128))
; 
; =  {sc.input.I[11].O} {sc.itov[4].X}
(assert (= sc_26 sc_120))
; 
; =  {of.input.I[11].O} {of.itov[4].X}
(assert (= of_26 of_120))
(assert (<= (* (/ 1. sc_50) 0.001) 0.001))
(assert (<= (* (/ 1. sc_52) 0.001) 0.001))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].O} {sc.vadd[5].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_59 sc_50) (= sc_59 sc_66)) (= sc_59 sc_52)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_130 0.) sltop_130 (- sltop_130)) (ite (>= slbot_72 0.) slbot_72 (- slbot_72))) (ite (>= slbot_49 0.) slbot_49 (- slbot_49))) (ite (>= sltop_66 0.) sltop_66 (- sltop_66))) (ite (>= sltop_65 0.) sltop_65 (- sltop_65))) (ite (>= sltop_76 0.) sltop_76 (- sltop_76))) (ite (>= slbot_126 0.) slbot_126 (- slbot_126))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_59 0.) slbot_59 (- slbot_59))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_76 0.) slbot_76 (- slbot_76))) (ite (>= slbot_119 0.) slbot_119 (- slbot_119))) (ite (>= slbot_130 0.) slbot_130 (- slbot_130))) (ite (>= sltop_58 0.) sltop_58 (- sltop_58))) (ite (>= slbot_122 0.) slbot_122 (- slbot_122))) (ite (>= sltop_138 0.) sltop_138 (- sltop_138))) (ite (>= sltop_82 0.) sltop_82 (- sltop_82))) (ite (>= sltop_121 0.) sltop_121 (- sltop_121))) (ite (>= slbot_127 0.) slbot_127 (- slbot_127))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_137 0.) sltop_137 (- sltop_137))) (ite (>= sltop_132 0.) sltop_132 (- sltop_132))) (ite (>= sltop_100 0.) sltop_100 (- sltop_100))) (ite (>= sltop_51 0.) sltop_51 (- sltop_51))) (ite (>= sltop_136 0.) sltop_136 (- sltop_136))) (ite (>= slbot_138 0.) slbot_138 (- slbot_138))) (ite (>= slbot_68 0.) slbot_68 (- slbot_68))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= sltop_64 0.) sltop_64 (- sltop_64))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= slbot_121 0.) slbot_121 (- slbot_121))) (ite (>= sltop_68 0.) sltop_68 (- sltop_68))) (ite (>= sltop_75 0.) sltop_75 (- sltop_75))) (ite (>= slbot_136 0.) slbot_136 (- slbot_136))) (ite (>= slbot_75 0.) slbot_75 (- slbot_75))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99))) (ite (>= sltop_119 0.) sltop_119 (- sltop_119))) (ite (>= slbot_66 0.) slbot_66 (- slbot_66))) (ite (>= sltop_72 0.) sltop_72 (- sltop_72))) (ite (>= sltop_118 0.) sltop_118 (- sltop_118))) (ite (>= sltop_52 0.) sltop_52 (- sltop_52))) (ite (>= slbot_78 0.) slbot_78 (- slbot_78))) (ite (>= sltop_127 0.) sltop_127 (- sltop_127))) (ite (>= slbot_132 0.) slbot_132 (- slbot_132))) (ite (>= slbot_83 0.) slbot_83 (- slbot_83))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= slbot_64 0.) slbot_64 (- slbot_64))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= sltop_49 0.) sltop_49 (- sltop_49))) (ite (>= slbot_82 0.) slbot_82 (- slbot_82))) (ite (>= sltop_57 0.) sltop_57 (- sltop_57))) (ite (>= slbot_57 0.) slbot_57 (- slbot_57))) (ite (>= slbot_65 0.) slbot_65 (- slbot_65))) (ite (>= slbot_52 0.) slbot_52 (- slbot_52))) (ite (>= slbot_51 0.) slbot_51 (- slbot_51))) (ite (>= slbot_142 0.) slbot_142 (- slbot_142))) (ite (>= slbot_73 0.) slbot_73 (- slbot_73))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= sltop_142 0.) sltop_142 (- sltop_142))) (ite (>= slbot_50 0.) slbot_50 (- slbot_50))) (ite (>= sltop_78 0.) sltop_78 (- sltop_78))) (ite (>= slbot_100 0.) slbot_100 (- slbot_100))) (ite (>= slbot_118 0.) slbot_118 (- slbot_118))) (ite (>= sltop_126 0.) sltop_126 (- sltop_126))) (ite (>= slbot_137 0.) slbot_137 (- slbot_137))) (ite (>= sltop_50 0.) sltop_50 (- sltop_50))) (ite (>= sltop_83 0.) sltop_83 (- sltop_83))) (ite (>= sltop_122 0.) sltop_122 (- sltop_122))) (ite (>= sltop_73 0.) sltop_73 (- sltop_73))) (ite (>= slbot_58 0.) slbot_58 (- slbot_58))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= sltop_59 0.) sltop_59 (- sltop_59)))))
(check-sat)
