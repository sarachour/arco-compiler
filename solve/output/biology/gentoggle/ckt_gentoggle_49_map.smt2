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
; >=  {((sc.input.I[8].X*15.6)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_11 15.6) of_11) 10.))
; 
; <=  {((sc.input.I[8].X*15.6)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_11 15.6) of_11) 0.))
; 
; >=  {((sc.input.I[8].O*15.6)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_12 15.6) of_12) 10.))
; 
; <=  {((sc.input.I[8].O*15.6)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_12 15.6) of_12) 0.))
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
; >=  {((sc.input.I[7].X*337.632520764)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_13 337.632520764) of_13) 10.))
; 
; <=  {((sc.input.I[7].X*337.632520764)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_13 337.632520764) of_13) 0.))
; 
; >=  {((sc.input.I[7].O*337.632520764)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_14 337.632520764) of_14) 10.))
; 
; <=  {((sc.input.I[7].O*337.632520764)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_14 337.632520764) of_14) 0.))
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
; >=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
; 
; >=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_16 0.) of_16) 10.))
; 
; <=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
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
; >=  {((sc.input.I[9].X*4.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_19 4.) of_19) 10.))
; 
; <=  {((sc.input.I[9].X*4.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_19 4.) of_19) 0.))
; 
; >=  {((sc.input.I[9].O*4.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_20 4.) of_20) 10.))
; 
; <=  {((sc.input.I[9].O*4.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_20 4.) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_22 sc_21))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_22 of_21))
; 
; >=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_21 0.) of_21) 10.))
; 
; <=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
; 
; >=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_22 0.) of_22) 10.))
; 
; <=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
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
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_26 sc_25))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_26 of_25))
; 
; >=  {((sc.input.I[10].X*1.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_25 1.) of_25) 10.))
; 
; <=  {((sc.input.I[10].X*1.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_25 1.) of_25) 0.))
; 
; >=  {((sc.input.I[10].O*1.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_26 1.) of_26) 10.))
; 
; <=  {((sc.input.I[10].O*1.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_26 1.) of_26) 0.))
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_28 sc_27))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_28 of_27))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_30 sc_29))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_30 of_29))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_29 0.) of_29) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_30 0.) of_30) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_32 of_31))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_31 0.) of_31) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_32 0.) of_32) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_33 0.) of_33) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_36 0.) of_36) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_38 sc_37))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_38 of_37))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_37 156.25) of_37) sltop_37) 3300.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_38 156.25) of_38) sltop_38) 3300.))
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_40 sc_39))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_40 of_39))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_39 15.6) of_39) sltop_39) 3300.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_40 15.6) of_40) sltop_40) 3300.))
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
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_44 (* 1. sc_45)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D)}
(assert (and (= sc_44 (* 1. sc_43)) (= sc_44 (* 1. sc_42))))
; no offset
(assert (= (- (+ of_44 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT} {(sc.vadd[3].A*1.)}
(assert (= sc_46 (* sc_44 1.)))
; 
; =  {of.vadd[3].OUT} {0.}
(assert (= of_46 0.))
; no scale
(assert (= sc_42 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].B)}
(assert (= sc_44 (* 1. sc_45)))
; 
; =  {sc.vadd[3].A} {(1.*sc.vadd[3].C)} {(1.*sc.vadd[3].D*sc.vadd[3].OUT2)}
(assert (and (= sc_44 (* 1. sc_43)) (= sc_44 (* (* 1. sc_42) sc_47))))
; no offset
(assert (= (- (+ of_44 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2} {(sc.vadd[3].A*1.)}
(assert (= sc_47 (* sc_44 1.)))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[3].OUT2_0} {(sc.vadd[3].A*1.)}
(assert (= sc_41 (* sc_44 1.)))
; 
; =  {of.vadd[3].OUT2_0} {0.}
(assert (= of_41 0.))
; 
; >=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {3300.}
(assert (<= (+ (* sc_41 0.) of_41) 3300.))
; 
; <=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
; 
; >=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {3300.}
(assert (<= (+ (* sc_42 4.) of_42) 3300.))
; 
; <=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {0.}
(assert (>= (+ (* sc_42 4.) of_42) 0.))
; 
; >=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {3300.}
(assert (<= (+ (* sc_43 0.) of_43) 3300.))
; 
; <=  {((sc.vadd[3].C*0.)+of.vadd[3].C)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
; 
; >=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {3300.}
(assert (<= (+ (* sc_44 0.) of_44) 3300.))
; 
; <=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47) 0.))
; 
; =  {(((sc.vadd[3].OUT2*156.25)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_47 156.25) of_47) sltop_47) 3300.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.vadd[3].B*3.75903614458)+of.vadd[3].B)+sl.min.vadd[3].B)} {0.}
(assert (= (+ (+ (* sc_45 3.75903614458) of_45) slbot_45) 0.))
; 
; =  {(((sc.vadd[3].B*62.4)+of.vadd[3].B)+sl.max.vadd[3].B)} {3300.}
(assert (= (+ (+ (* sc_45 62.4) of_45) sltop_45) 3300.))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.vadd[3].OUT*3.75903614458)+of.vadd[3].OUT)+sl.min.vadd[3].OUT)} {-1650.}
(assert (= (+ (+ (* sc_46 3.75903614458) of_46) slbot_46) -1650.))
; 
; =  {(((sc.vadd[3].OUT*62.4)+of.vadd[3].OUT)+sl.max.vadd[3].OUT)} {1650.}
(assert (= (+ (+ (* sc_46 62.4) of_46) sltop_46) 1650.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47) 0.))
; 
; =  {(((sc.vadd[3].OUT2*156.25)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {3300.}
(assert (= (+ (+ (* sc_47 156.25) of_47) sltop_47) 3300.))
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
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_49 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_50 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_52 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_51 (* 1. sc_52)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_51 (* 1. sc_50)) (= sc_51 (* 1. sc_49))))
; no offset
(assert (= (- (+ of_51 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_53 (* sc_51 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
(assert (= of_53 0.))
; no scale
(assert (= sc_49 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_49 0.))
; no offset
(assert (= of_54 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_50 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_52 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_51 (* 1. sc_52)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_51 (* 1. sc_50)) (= sc_51 (* (* 1. sc_49) sc_54))))
; no offset
(assert (= (- (+ of_51 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_54 (* sc_51 1.)))
; no offset
(assert (= of_54 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_48 (* sc_51 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_48 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_48 0.) of_48) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {3300.}
(assert (<= (+ (* sc_49 4.) of_49) 3300.))
; 
; <=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {0.}
(assert (>= (+ (* sc_49 4.) of_49) 0.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_50 0.) of_50) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_51 0.) of_51) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_54 0.) of_54) slbot_54) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_54 15.6) of_54) sltop_54) 3300.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.vadd[5].B*0.00204799328914)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_52 0.00204799328914) of_52) slbot_52) 0.))
; 
; =  {(((sc.vadd[5].B*625.)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_52 625.) of_52) sltop_52) 3300.))
(declare-fun slbot_53 () Real)
(declare-fun sltop_53 () Real)
; 
; =  {(((sc.vadd[5].OUT*0.00204799328914)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_53 0.00204799328914) of_53) slbot_53) -1650.))
; 
; =  {(((sc.vadd[5].OUT*625.)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_53 625.) of_53) sltop_53) 1650.))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_54 0.) of_54) slbot_54) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_54 15.6) of_54) sltop_54) 3300.))
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
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
; no offset
(assert (= of_56 0.))
; no offset
(assert (= of_57 0.))
; no scale
(assert (= (/ sc_56 sc_57) 1.))
; no scale
(assert (= sc_55 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_55 0.))
; no offset
(assert (= of_56 0.))
; no offset
(assert (= of_57 0.))
; no scale
(assert (= (/ sc_56 sc_57) 1.))
; no scale
(assert (= sc_55 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_55 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_58 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_59 (* sc_58 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_59 0.))
; no scale
(assert (= sc_57 1.))
; no scale
(assert (= (* sc_55 1.) 1.))
; no offset
(assert (= of_57 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_57 1.))
; no scale
(assert (= (* sc_55 1.) 1.))
; no offset
(assert (= of_57 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_56 1.))
; no scale
(assert (= sc_55 1.))
; no offset
(assert (= of_56 0.))
; no offset
(assert (= of_55 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_58 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_60 (* sc_58 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_60 0.))
; 
; >=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_55 2.5) of_55) 5.))
; 
; <=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_55 2.5) of_55) 1.))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) 1.))
; 
; =  {(((sc.ihill[0].S*156.25)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_56 156.25) of_56) sltop_56) 10.))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.ihill[0].REP*0.000511998322284)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {9.999900001e-10}
(assert (= (+ (+ (* sc_60 0.000511998322284) of_60) slbot_60) 9.999900001e-10))
; 
; =  {(((sc.ihill[0].REP*156.25)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {5.}
(assert (= (+ (+ (* sc_60 156.25) of_60) sltop_60) 5.))
; 
; >=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_58 156.25) of_58) 10.))
; 
; <=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_58 156.25) of_58) 0.0001))
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_61 0.))
; 
; =  {sc.vtoi[10].Y} {((1./sc.vtoi[10].K)*sc.vtoi[10].X)}
(assert (= sc_63 (* (/ 1. sc_62) sc_61)))
; 
; =  {of.vtoi[10].Y} {0.}
(assert (= of_63 0.))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.vtoi[10].X*0.)+of.vtoi[10].X)+sl.min.vtoi[10].X)} {1.}
(assert (= (+ (+ (* sc_61 0.) of_61) slbot_61) 1.))
; 
; =  {(((sc.vtoi[10].X*156.25)+of.vtoi[10].X)+sl.max.vtoi[10].X)} {3300.}
(assert (= (+ (+ (* sc_61 156.25) of_61) sltop_61) 3300.))
; 
; >=  {((sc.vtoi[10].K*1.)+of.vtoi[10].K)} {3300.}
(assert (<= (+ (* sc_62 1.) of_62) 3300.))
; 
; <=  {((sc.vtoi[10].K*1.)+of.vtoi[10].K)} {1.}
(assert (>= (+ (* sc_62 1.) of_62) 1.))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.vtoi[10].Y*0.)+of.vtoi[10].Y)+sl.min.vtoi[10].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63) 0.00030303030303))
; 
; =  {(((sc.vtoi[10].Y*156.25)+of.vtoi[10].Y)+sl.max.vtoi[10].Y)} {3300.}
(assert (= (+ (+ (* sc_63 156.25) of_63) sltop_63) 3300.))
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
(assert (= of_65 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_64 0.))
; 
; =  {sc.vtoi[6].Y} {((1./sc.vtoi[6].K)*sc.vtoi[6].X)}
(assert (= sc_66 (* (/ 1. sc_65) sc_64)))
; 
; =  {of.vtoi[6].Y} {0.}
(assert (= of_66 0.))
; 
; >=  {((sc.vtoi[6].X*1.)+of.vtoi[6].X)} {3300.}
(assert (<= (+ (* sc_64 1.) of_64) 3300.))
; 
; <=  {((sc.vtoi[6].X*1.)+of.vtoi[6].X)} {1.}
(assert (>= (+ (* sc_64 1.) of_64) 1.))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.vtoi[6].Y*0.)+of.vtoi[6].Y)+sl.min.vtoi[6].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_66 0.) of_66) slbot_66) 0.00030303030303))
; 
; =  {(((sc.vtoi[6].Y*1.66666666667)+of.vtoi[6].Y)+sl.max.vtoi[6].Y)} {3300.}
(assert (= (+ (+ (* sc_66 1.66666666667) of_66) sltop_66) 3300.))
(declare-fun slbot_65 () Real)
(declare-fun sltop_65 () Real)
; 
; =  {(((sc.vtoi[6].K*0.)+of.vtoi[6].K)+sl.min.vtoi[6].K)} {1.}
(assert (= (+ (+ (* sc_65 0.) of_65) slbot_65) 1.))
; 
; =  {(((sc.vtoi[6].K*0.6)+of.vtoi[6].K)+sl.max.vtoi[6].K)} {3300.}
(assert (= (+ (+ (* sc_65 0.6) of_65) sltop_65) 3300.))
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
; no offset
(assert (= of_68 0.))
; no offset
(assert (= of_67 0.))
; 
; =  {1.} {(sc.igenebind[1].K*sc.igenebind[1].TF)}
(assert (= 1. (* sc_68 sc_67)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[1].GE} {(sc.igenebind[1].Vmax*(1./1.))}
(assert (= sc_70 (* sc_69 (/ 1. 1.))))
; 
; =  {of.igenebind[1].GE} {0.}
(assert (= of_70 0.))
(declare-fun slbot_67 () Real)
(declare-fun sltop_67 () Real)
; 
; =  {(((sc.igenebind[1].TF*0.)+of.igenebind[1].TF)+sl.min.igenebind[1].TF)} {0.0001}
(assert (= (+ (+ (* sc_67 0.) of_67) slbot_67) 0.0001))
; 
; =  {(((sc.igenebind[1].TF*15.6)+of.igenebind[1].TF)+sl.max.igenebind[1].TF)} {10.}
(assert (= (+ (+ (* sc_67 15.6) of_67) sltop_67) 10.))
; 
; >=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {10.}
(assert (<= (+ (* sc_68 1.) of_68) 10.))
; 
; <=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {0.0001}
(assert (>= (+ (* sc_68 1.) of_68) 0.0001))
(declare-fun slbot_70 () Real)
(declare-fun sltop_70 () Real)
; 
; =  {(((sc.igenebind[1].GE*0.939759036145)+of.igenebind[1].GE)+sl.min.igenebind[1].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_70 0.939759036145) of_70) slbot_70) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[1].GE*15.6)+of.igenebind[1].GE)+sl.max.igenebind[1].GE)} {9.9999999}
(assert (= (+ (+ (* sc_70 15.6) of_70) sltop_70) 9.9999999))
; 
; >=  {((sc.igenebind[1].Vmax*15.6)+of.igenebind[1].Vmax)} {10.}
(assert (<= (+ (* sc_69 15.6) of_69) 10.))
; 
; <=  {((sc.igenebind[1].Vmax*15.6)+of.igenebind[1].Vmax)} {0.0001}
(assert (>= (+ (* sc_69 15.6) of_69) 0.0001))
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.V[2].X*0.125)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_71 0.125) of_71) 3300.))
; 
; <=  {((sc.input.V[2].X*0.125)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_71 0.125) of_71) 0.))
; 
; >=  {((sc.input.V[2].O*0.125)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_72 0.125) of_72) 3300.))
; 
; <=  {((sc.input.V[2].O*0.125)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_72 0.125) of_72) 0.))
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_73 0.) of_73) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_74 0.) of_74) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_75 0.) of_75) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_76 0.) of_76) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_77 1.) of_77) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_77 1.) of_77) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_78 1.) of_78) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_78 1.) of_78) 0.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_80 sc_79))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_80 of_79))
; 
; >=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_79 1.) of_79) 3300.))
; 
; <=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_79 1.) of_79) 0.))
; 
; >=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_80 1.) of_80) 3300.))
; 
; <=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_80 1.) of_80) 0.))
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_82 sc_81))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_82 of_81))
; 
; >=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_81 4.) of_81) 3300.))
; 
; <=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_81 4.) of_81) 0.))
; 
; >=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_82 4.) of_82) 3300.))
; 
; <=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_82 4.) of_82) 0.))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_84 sc_83))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_84 of_83))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_83 0.6) of_83) sltop_83) 3300.))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_84 0.6) of_84) sltop_84) 3300.))
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_86 sc_85))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_86 of_85))
; 
; >=  {((sc.input.V[11].X*1000.75)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_85 1000.75) of_85) 3300.))
; 
; <=  {((sc.input.V[11].X*1000.75)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_85 1000.75) of_85) 0.))
; 
; >=  {((sc.input.V[11].O*1000.75)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_86 1000.75) of_86) 3300.))
; 
; <=  {((sc.input.V[11].O*1000.75)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_86 1000.75) of_86) 0.))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_88 sc_87))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_88 of_87))
; 
; >=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_87 4.) of_87) 3300.))
; 
; <=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_87 4.) of_87) 0.))
; 
; >=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_88 4.) of_88) 3300.))
; 
; <=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_88 4.) of_88) 0.))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_90 sc_89))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_90 of_89))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_89 1.) of_89) 3300.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_89 1.) of_89) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_90 1.) of_90) 3300.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_90 1.) of_90) 0.))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_92 sc_91))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_92 of_91))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_91 0.) of_91) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_92 0.) of_92) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_92 0.) of_92) 0.))
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_94 sc_93))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_94 of_93))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_93 1.) of_93) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_93 1.) of_93) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_94 1.) of_94) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_94 1.) of_94) 0.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_96 sc_95))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_96 of_95))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_95 0.) of_95) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_95 0.) of_95) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_96 0.) of_96) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_96 0.) of_96) 0.))
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_98 sc_97))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_98 of_97))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_97 0.) of_97) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_97 0.) of_97) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_98 0.) of_98) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_98 0.) of_98) 0.))
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_100 sc_99))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_100 of_99))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_99 0.) of_99) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_99 0.) of_99) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_100 0.) of_100) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_100 0.) of_100) 0.))
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_102 sc_101))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_102 of_101))
; 
; >=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_101 2.5) of_101) 3300.))
; 
; <=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_101 2.5) of_101) 0.))
; 
; >=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_102 2.5) of_102) 3300.))
; 
; <=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_102 2.5) of_102) 0.))
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
; =  {(((sc.itov[5].X*0.939759036145)+of.itov[5].X)+sl.min.itov[5].X)} {0.0001}
(assert (= (+ (+ (* sc_103 0.939759036145) of_103) slbot_103) 0.0001))
; 
; =  {(((sc.itov[5].X*15.6)+of.itov[5].X)+sl.max.itov[5].X)} {10.}
(assert (= (+ (+ (* sc_103 15.6) of_103) sltop_103) 10.))
; 
; >=  {((sc.itov[5].K*1.)+of.itov[5].K)} {330.}
(assert (<= (+ (* sc_104 1.) of_104) 330.))
; 
; <=  {((sc.itov[5].K*1.)+of.itov[5].K)} {1.}
(assert (>= (+ (* sc_104 1.) of_104) 1.))
(declare-fun slbot_105 () Real)
(declare-fun sltop_105 () Real)
; 
; =  {(((sc.itov[5].Y*0.939759036145)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_105 0.939759036145) of_105) slbot_105) 0.0001))
; 
; =  {(((sc.itov[5].Y*15.6)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_105 15.6) of_105) sltop_105) 3300.))
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
; no offset
(assert (= of_107 0.))
; no offset
(assert (= of_106 0.))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_108 (* sc_107 sc_106)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_108 0.))
; 
; >=  {((sc.itov[4].X*4.)+of.itov[4].X)} {10.}
(assert (<= (+ (* sc_106 4.) of_106) 10.))
; 
; <=  {((sc.itov[4].X*4.)+of.itov[4].X)} {0.0001}
(assert (>= (+ (* sc_106 4.) of_106) 0.0001))
(declare-fun slbot_108 () Real)
(declare-fun sltop_108 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_108 0.00204799328914) of_108) slbot_108) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_108 625.) of_108) sltop_108) 3300.))
(declare-fun slbot_107 () Real)
(declare-fun sltop_107 () Real)
; 
; =  {(((sc.itov[4].K*0.000511998322284)+of.itov[4].K)+sl.min.itov[4].K)} {1.}
(assert (= (+ (+ (* sc_107 0.000511998322284) of_107) slbot_107) 1.))
; 
; =  {(((sc.itov[4].K*156.25)+of.itov[4].K)+sl.max.itov[4].K)} {330.}
(assert (= (+ (+ (* sc_107 156.25) of_107) sltop_107) 330.))
(declare-fun slbot_108 () Real)
(declare-fun sltop_108 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_108 0.00204799328914) of_108) slbot_108) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_108 625.) of_108) sltop_108) 3300.))
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
; 
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_111 sc_112))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_111 sc_110) (= sc_111 sc_109)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_113 sc_111))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_113 (- (+ of_111 of_112) (+ of_110 of_109))))
; 
; >=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {5.}
(assert (<= (+ (* sc_109 0.) of_109) 5.))
; 
; <=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {0.}
(assert (>= (+ (* sc_109 0.) of_109) 0.))
; 
; >=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {5.}
(assert (<= (+ (* sc_110 0.) of_110) 5.))
; 
; <=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {0.}
(assert (>= (+ (* sc_110 0.) of_110) 0.))
(declare-fun slbot_113 () Real)
(declare-fun sltop_113 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_113 0.) of_113) slbot_113) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_113 1.66666666667) of_113) sltop_113) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_111 0.) of_111) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_111 0.) of_111) 0.))
(declare-fun slbot_112 () Real)
(declare-fun sltop_112 () Real)
; 
; =  {(((sc.iadd[8].B*0.)+of.iadd[8].B)+sl.min.iadd[8].B)} {0.}
(assert (= (+ (+ (* sc_112 0.) of_112) slbot_112) 0.))
; 
; =  {(((sc.iadd[8].B*1.66666666667)+of.iadd[8].B)+sl.max.iadd[8].B)} {5.}
(assert (= (+ (+ (* sc_112 1.66666666667) of_112) sltop_112) 5.))
(declare-fun slbot_113 () Real)
(declare-fun sltop_113 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_113 0.) of_113) slbot_113) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_113 1.66666666667) of_113) sltop_113) 10.))
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
; 
; =  {sc.iadd[9].A} {sc.iadd[9].B}
(assert (= sc_116 sc_117))
; 
; =  {sc.iadd[9].A} {sc.iadd[9].C} {sc.iadd[9].D}
(assert (and (= sc_116 sc_115) (= sc_116 sc_114)))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[9].A}
(assert (= sc_118 sc_116))
; 
; =  {of.iadd[9].OUT} {((of.iadd[9].A+of.iadd[9].B)-of.iadd[9].C-of.iadd[9].D)}
(assert (= of_118 (- (+ of_116 of_117) (+ of_115 of_114))))
; 
; >=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {5.}
(assert (<= (+ (* sc_114 0.) of_114) 5.))
; 
; <=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {0.}
(assert (>= (+ (* sc_114 0.) of_114) 0.))
; 
; >=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {5.}
(assert (<= (+ (* sc_115 0.) of_115) 5.))
; 
; <=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {0.}
(assert (>= (+ (* sc_115 0.) of_115) 0.))
(declare-fun slbot_118 () Real)
(declare-fun sltop_118 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_118 0.) of_118) slbot_118) -10.))
; 
; =  {(((sc.iadd[9].OUT*1.66666666667)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_118 1.66666666667) of_118) sltop_118) 10.))
; 
; >=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {5.}
(assert (<= (+ (* sc_116 0.) of_116) 5.))
; 
; <=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {0.}
(assert (>= (+ (* sc_116 0.) of_116) 0.))
(declare-fun slbot_117 () Real)
(declare-fun sltop_117 () Real)
; 
; =  {(((sc.iadd[9].B*0.)+of.iadd[9].B)+sl.min.iadd[9].B)} {0.}
(assert (= (+ (+ (* sc_117 0.) of_117) slbot_117) 0.))
; 
; =  {(((sc.iadd[9].B*1.66666666667)+of.iadd[9].B)+sl.max.iadd[9].B)} {5.}
(assert (= (+ (+ (* sc_117 1.66666666667) of_117) sltop_117) 5.))
(declare-fun slbot_118 () Real)
(declare-fun sltop_118 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_118 0.) of_118) slbot_118) -10.))
; 
; =  {(((sc.iadd[9].OUT*1.66666666667)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_118 1.66666666667) of_118) sltop_118) 10.))
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
; 
; =  {sc.iadd[11].A} {sc.iadd[11].B}
(assert (= sc_121 sc_122))
; 
; =  {sc.iadd[11].A} {sc.iadd[11].C} {sc.iadd[11].D}
(assert (and (= sc_121 sc_120) (= sc_121 sc_119)))
; 
; =  {sc.iadd[11].OUT} {sc.iadd[11].A}
(assert (= sc_123 sc_121))
; 
; =  {of.iadd[11].OUT} {((of.iadd[11].A+of.iadd[11].B)-of.iadd[11].C-of.iadd[11].D)}
(assert (= of_123 (- (+ of_121 of_122) (+ of_120 of_119))))
; 
; >=  {((sc.iadd[11].D*0.)+of.iadd[11].D)} {5.}
(assert (<= (+ (* sc_119 0.) of_119) 5.))
; 
; <=  {((sc.iadd[11].D*0.)+of.iadd[11].D)} {0.}
(assert (>= (+ (* sc_119 0.) of_119) 0.))
; 
; >=  {((sc.iadd[11].C*0.)+of.iadd[11].C)} {5.}
(assert (<= (+ (* sc_120 0.) of_120) 5.))
; 
; <=  {((sc.iadd[11].C*0.)+of.iadd[11].C)} {0.}
(assert (>= (+ (* sc_120 0.) of_120) 0.))
(declare-fun slbot_121 () Real)
(declare-fun sltop_121 () Real)
; 
; =  {(((sc.iadd[11].A*0.)+of.iadd[11].A)+sl.min.iadd[11].A)} {0.}
(assert (= (+ (+ (* sc_121 0.) of_121) slbot_121) 0.))
; 
; =  {(((sc.iadd[11].A*15.6)+of.iadd[11].A)+sl.max.iadd[11].A)} {5.}
(assert (= (+ (+ (* sc_121 15.6) of_121) sltop_121) 5.))
; 
; >=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {5.}
(assert (<= (+ (* sc_122 0.) of_122) 5.))
; 
; <=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {0.}
(assert (>= (+ (* sc_122 0.) of_122) 0.))
(declare-fun slbot_123 () Real)
(declare-fun sltop_123 () Real)
; 
; =  {(((sc.iadd[11].OUT*0.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_123 0.) of_123) slbot_123) -10.))
; 
; =  {(((sc.iadd[11].OUT*15.6)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_123 15.6) of_123) sltop_123) 10.))
; 
; =  {sc.input.I[6].O} {sc.iadd[9].A}
(assert (= sc_28 sc_116))
; 
; =  {of.input.I[6].O} {of.iadd[9].A}
(assert (= of_28 of_116))
; 
; =  {sc.input.I[0].O} {sc.ihill[0].Vmax}
(assert (= sc_24 sc_58))
; 
; =  {of.input.I[0].O} {of.ihill[0].Vmax}
(assert (= of_24 of_58))
; 
; =  {sc.switch[7].PROD} {sc.iadd[11].A}
(assert (= sc_8 sc_121))
; 
; =  {of.switch[7].PROD} {of.iadd[11].A}
(assert (= of_8 of_121))
; 
; =  {sc.input.V[9].O} {sc.vadd[3].D}
(assert (= sc_82 sc_42))
; 
; =  {of.input.V[9].O} {of.vadd[3].D}
(assert (= of_82 of_42))
; 
; =  {sc.ihill[0].REP} {sc.itov[4].K}
(assert (= sc_60 sc_107))
; 
; =  {of.ihill[0].REP} {of.itov[4].K}
(assert (= of_60 of_107))
; 
; =  {sc.input.V[15].O} {sc.itov[5].K}
(assert (= sc_90 sc_104))
; 
; =  {of.input.V[15].O} {of.itov[5].K}
(assert (= of_90 of_104))
; 
; =  {sc.input.I[9].O} {sc.itov[4].X}
(assert (= sc_20 sc_106))
; 
; =  {of.input.I[9].O} {of.itov[4].X}
(assert (= of_20 of_106))
; 
; =  {sc.input.I[4].O} {sc.iadd[9].D}
(assert (= sc_32 sc_114))
; 
; =  {of.input.I[4].O} {of.iadd[9].D}
(assert (= of_32 of_114))
; 
; =  {sc.input.I[3].O} {sc.iadd[8].C}
(assert (= sc_30 sc_110))
; 
; =  {of.input.I[3].O} {of.iadd[8].C}
(assert (= of_30 of_110))
; 
; =  {sc.input.V[13].O} {sc.vgain[2].X}
(assert (= sc_78 sc_0))
; 
; =  {of.input.V[13].O} {of.vgain[2].X}
(assert (= of_78 of_0))
; 
; =  {sc.input.I[5].O} {sc.iadd[9].C}
(assert (= sc_34 sc_115))
; 
; =  {of.input.I[5].O} {of.iadd[9].C}
(assert (= of_34 of_115))
; 
; =  {sc.vtoi[6].Y} {sc.iadd[9].B}
(assert (= sc_66 sc_117))
; 
; =  {of.vtoi[6].Y} {of.iadd[9].B}
(assert (= of_66 of_117))
; 
; =  {sc.input.V[14].O} {sc.vtoi[10].K}
(assert (= sc_94 sc_62))
; 
; =  {of.input.V[14].O} {of.vtoi[10].K}
(assert (= of_94 of_62))
; 
; =  {sc.itov[5].Y} {sc.vgain[2].Z}
(assert (= sc_105 sc_2))
; 
; =  {of.itov[5].Y} {of.vgain[2].Z}
(assert (= of_105 of_2))
; 
; =  {sc.input.V[11].O} {sc.switch[7].n}
(assert (= sc_86 sc_4))
; 
; =  {of.input.V[11].O} {of.switch[7].n}
(assert (= of_86 of_4))
; 
; =  {sc.input.V[12].O} {sc.vtoi[6].X}
(assert (= sc_80 sc_64))
; 
; =  {of.input.V[12].O} {of.vtoi[6].X}
(assert (= of_80 of_64))
; 
; =  {sc.input.I[2].O} {sc.iadd[8].A}
(assert (= sc_10 sc_111))
; 
; =  {of.input.I[2].O} {of.iadd[8].A}
(assert (= of_10 of_111))
; 
; =  {sc.input.V[8].O} {sc.vadd[3].OUT2_0}
(assert (= sc_74 sc_41))
; 
; =  {of.input.V[8].O} {of.vadd[3].OUT2_0}
(assert (= of_74 of_41))
; 
; =  {sc.input.V[3].O} {sc.vadd[3].A}
(assert (= sc_96 sc_44))
; 
; =  {of.input.V[3].O} {of.vadd[3].A}
(assert (= of_96 of_44))
; 
; =  {sc.input.V[2].O} {sc.vgain[2].Y}
(assert (= sc_72 sc_1))
; 
; =  {of.input.V[2].O} {of.vgain[2].Y}
(assert (= of_72 of_1))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[1].X}
(assert (= sc_54 sc_39))
; 
; =  {of.vadd[5].OUT2} {of.output.V[1].X}
(assert (= of_54 of_39))
; 
; =  {sc.vadd[5].OUT2} {sc.switch[7].Vmax}
(assert (= sc_54 sc_7))
; 
; =  {of.vadd[5].OUT2} {of.switch[7].Vmax}
(assert (= of_54 of_7))
; 
; =  {sc.vadd[3].OUT2} {sc.vtoi[10].X}
(assert (= sc_47 sc_61))
; 
; =  {of.vadd[3].OUT2} {of.vtoi[10].X}
(assert (= of_47 of_61))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].X}
(assert (= sc_47 sc_37))
; 
; =  {of.vadd[3].OUT2} {of.output.V[0].X}
(assert (= of_47 of_37))
; 
; =  {sc.vtoi[10].Y} {sc.ihill[0].S}
(assert (= sc_63 sc_56))
; 
; =  {of.vtoi[10].Y} {of.ihill[0].S}
(assert (= of_63 of_56))
; 
; =  {sc.input.I[12].O} {sc.iadd[11].B}
(assert (= sc_18 sc_122))
; 
; =  {of.input.I[12].O} {of.iadd[11].B}
(assert (= of_18 of_122))
; 
; =  {sc.input.I[1].O} {sc.iadd[8].D}
(assert (= sc_36 sc_109))
; 
; =  {of.input.I[1].O} {of.iadd[8].D}
(assert (= of_36 of_109))
; 
; =  {sc.input.I[10].O} {sc.igenebind[1].K}
(assert (= sc_26 sc_68))
; 
; =  {of.input.I[10].O} {of.igenebind[1].K}
(assert (= of_26 of_68))
; 
; =  {sc.iadd[11].OUT} {sc.igenebind[1].TF}
(assert (= sc_123 sc_67))
; 
; =  {of.iadd[11].OUT} {of.igenebind[1].TF}
(assert (= of_123 of_67))
; 
; =  {sc.input.I[13].O} {sc.iadd[11].D}
(assert (= sc_16 sc_119))
; 
; =  {of.input.I[13].O} {of.iadd[11].D}
(assert (= of_16 of_119))
; 
; =  {sc.input.I[7].O} {sc.switch[7].SUB}
(assert (= sc_14 sc_5))
; 
; =  {of.input.I[7].O} {of.switch[7].SUB}
(assert (= of_14 of_5))
; 
; =  {sc.input.V[1].O} {sc.ihill[0].n}
(assert (= sc_102 sc_55))
; 
; =  {of.input.V[1].O} {of.ihill[0].n}
(assert (= of_102 of_55))
; 
; =  {sc.input.V[7].O} {sc.vadd[5].OUT2_0}
(assert (= sc_76 sc_48))
; 
; =  {of.input.V[7].O} {of.vadd[5].OUT2_0}
(assert (= of_76 of_48))
; 
; =  {sc.igenebind[1].GE} {sc.itov[5].X}
(assert (= sc_70 sc_103))
; 
; =  {of.igenebind[1].GE} {of.itov[5].X}
(assert (= of_70 of_103))
; 
; =  {sc.input.I[8].O} {sc.igenebind[1].Vmax}
(assert (= sc_12 sc_69))
; 
; =  {of.input.I[8].O} {of.igenebind[1].Vmax}
(assert (= of_12 of_69))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[8].B}
(assert (= sc_118 sc_112))
; 
; =  {of.iadd[9].OUT} {of.iadd[8].B}
(assert (= of_118 of_112))
; 
; =  {sc.input.V[10].O} {sc.vadd[5].D}
(assert (= sc_88 sc_49))
; 
; =  {of.input.V[10].O} {of.vadd[5].D}
(assert (= of_88 of_49))
; 
; =  {sc.input.V[0].O} {sc.vtoi[6].K}
(assert (= sc_84 sc_65))
; 
; =  {of.input.V[0].O} {of.vtoi[6].K}
(assert (= of_84 of_65))
; 
; =  {sc.itov[4].Y} {sc.vadd[5].B}
(assert (= sc_108 sc_52))
; 
; =  {of.itov[4].Y} {of.vadd[5].B}
(assert (= of_108 of_52))
; 
; =  {sc.iadd[8].OUT} {sc.switch[7].Kmod}
(assert (= sc_113 sc_6))
; 
; =  {of.iadd[8].OUT} {of.switch[7].Kmod}
(assert (= of_113 of_6))
; 
; =  {sc.input.V[4].O} {sc.vadd[3].C}
(assert (= sc_98 sc_43))
; 
; =  {of.input.V[4].O} {of.vadd[3].C}
(assert (= of_98 of_43))
; 
; =  {sc.input.V[5].O} {sc.vadd[5].A}
(assert (= sc_100 sc_51))
; 
; =  {of.input.V[5].O} {of.vadd[5].A}
(assert (= of_100 of_51))
; 
; =  {sc.input.V[6].O} {sc.vadd[5].C}
(assert (= sc_92 sc_50))
; 
; =  {of.input.V[6].O} {of.vadd[5].C}
(assert (= of_92 of_50))
; 
; =  {sc.vgain[2].P} {sc.vadd[3].B}
(assert (= sc_3 sc_45))
; 
; =  {of.vgain[2].P} {of.vadd[3].B}
(assert (= of_3 of_45))
; 
; =  {sc.input.I[11].O} {sc.iadd[11].C}
(assert (= sc_22 sc_120))
; 
; =  {of.input.I[11].O} {of.iadd[11].C}
(assert (= of_22 of_120))
(assert (<= (* (/ 1. sc_38) 0.001) 0.001))
(assert (<= (* (/ 1. sc_40) 0.001) 0.001))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].O} {sc.vadd[5].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_47 sc_38) (= sc_47 sc_54)) (= sc_47 sc_40)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_66 0.) sltop_66 (- sltop_66)) (ite (>= sltop_65 0.) sltop_65 (- sltop_65))) (ite (>= slbot_103 0.) slbot_103 (- slbot_103))) (ite (>= slbot_107 0.) slbot_107 (- slbot_107))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_46 0.) slbot_46 (- slbot_46))) (ite (>= slbot_53 0.) slbot_53 (- slbot_53))) (ite (>= slbot_84 0.) slbot_84 (- slbot_84))) (ite (>= sltop_105 0.) sltop_105 (- sltop_105))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= sltop_112 0.) sltop_112 (- sltop_112))) (ite (>= sltop_121 0.) sltop_121 (- sltop_121))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= slbot_54 0.) slbot_54 (- slbot_54))) (ite (>= slbot_56 0.) slbot_56 (- slbot_56))) (ite (>= slbot_45 0.) slbot_45 (- slbot_45))) (ite (>= slbot_108 0.) slbot_108 (- slbot_108))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= slbot_38 0.) slbot_38 (- slbot_38))) (ite (>= sltop_45 0.) sltop_45 (- sltop_45))) (ite (>= slbot_121 0.) slbot_121 (- slbot_121))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_40 0.) sltop_40 (- sltop_40))) (ite (>= sltop_84 0.) sltop_84 (- sltop_84))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= slbot_66 0.) slbot_66 (- slbot_66))) (ite (>= sltop_118 0.) sltop_118 (- sltop_118))) (ite (>= sltop_52 0.) sltop_52 (- sltop_52))) (ite (>= slbot_60 0.) slbot_60 (- slbot_60))) (ite (>= sltop_70 0.) sltop_70 (- sltop_70))) (ite (>= slbot_83 0.) slbot_83 (- slbot_83))) (ite (>= slbot_112 0.) slbot_112 (- slbot_112))) (ite (>= slbot_63 0.) slbot_63 (- slbot_63))) (ite (>= sltop_123 0.) sltop_123 (- sltop_123))) (ite (>= sltop_54 0.) sltop_54 (- sltop_54))) (ite (>= slbot_37 0.) slbot_37 (- slbot_37))) (ite (>= slbot_61 0.) slbot_61 (- slbot_61))) (ite (>= sltop_107 0.) sltop_107 (- sltop_107))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= sltop_38 0.) sltop_38 (- sltop_38))) (ite (>= sltop_67 0.) sltop_67 (- sltop_67))) (ite (>= sltop_39 0.) sltop_39 (- sltop_39))) (ite (>= slbot_117 0.) slbot_117 (- slbot_117))) (ite (>= sltop_117 0.) sltop_117 (- sltop_117))) (ite (>= slbot_113 0.) slbot_113 (- slbot_113))) (ite (>= sltop_103 0.) sltop_103 (- sltop_103))) (ite (>= slbot_67 0.) slbot_67 (- slbot_67))) (ite (>= slbot_65 0.) slbot_65 (- slbot_65))) (ite (>= slbot_105 0.) slbot_105 (- slbot_105))) (ite (>= slbot_52 0.) slbot_52 (- slbot_52))) (ite (>= sltop_56 0.) sltop_56 (- sltop_56))) (ite (>= sltop_60 0.) sltop_60 (- sltop_60))) (ite (>= slbot_70 0.) slbot_70 (- slbot_70))) (ite (>= sltop_47 0.) sltop_47 (- sltop_47))) (ite (>= slbot_118 0.) slbot_118 (- slbot_118))) (ite (>= sltop_53 0.) sltop_53 (- sltop_53))) (ite (>= sltop_83 0.) sltop_83 (- sltop_83))) (ite (>= slbot_123 0.) slbot_123 (- slbot_123))) (ite (>= sltop_37 0.) sltop_37 (- sltop_37))) (ite (>= sltop_46 0.) sltop_46 (- sltop_46))) (ite (>= sltop_61 0.) sltop_61 (- sltop_61))) (ite (>= sltop_63 0.) sltop_63 (- sltop_63))) (ite (>= slbot_39 0.) slbot_39 (- slbot_39))) (ite (>= slbot_47 0.) slbot_47 (- slbot_47))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_40 0.) slbot_40 (- slbot_40))) (ite (>= sltop_108 0.) sltop_108 (- sltop_108))) (ite (>= sltop_113 0.) sltop_113 (- sltop_113)))))
(check-sat)
