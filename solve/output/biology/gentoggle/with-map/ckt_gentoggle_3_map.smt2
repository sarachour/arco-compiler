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
; >=  {((sc.switch[4].n*-500.)+of.switch[4].n)} {3300.}
(assert (<= (+ (* sc_0 -500.) of_0) 3300.))
; 
; <=  {((sc.switch[4].n*-500.)+of.switch[4].n)} {0.5}
(assert (>= (+ (* sc_0 -500.) of_0) 0.5))
; 
; >=  {((sc.switch[4].SUB*-2.)+of.switch[4].SUB)} {10.}
(assert (<= (+ (* sc_1 -2.) of_1) 10.))
; 
; <=  {((sc.switch[4].SUB*-2.)+of.switch[4].SUB)} {0.0001}
(assert (>= (+ (* sc_1 -2.) of_1) 0.0001))
; 
; >=  {((sc.switch[4].Kmod*1.)+of.switch[4].Kmod)} {10.}
(assert (<= (+ (* sc_2 1.) of_2) 10.))
; 
; <=  {((sc.switch[4].Kmod*1.)+of.switch[4].Kmod)} {0.0001}
(assert (>= (+ (* sc_2 1.) of_2) 0.0001))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.switch[4].PROD*-0.6)+of.switch[4].PROD)+sl.min.switch[4].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 -0.6) of_4) slbot_4) 9.99934002508e-38))
; 
; =  {(((sc.switch[4].PROD*0.)+of.switch[4].PROD)+sl.max.switch[4].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_4 0.) of_4) sltop_4) 9.9999999))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.switch[4].Vmax*0.)+of.switch[4].Vmax)+sl.min.switch[4].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 0.0001))
; 
; =  {(((sc.switch[4].Vmax*0.6)+of.switch[4].Vmax)+sl.max.switch[4].Vmax)} {10.}
(assert (= (+ (+ (* sc_3 0.6) of_3) sltop_3) 10.))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.switch[4].PROD*-0.6)+of.switch[4].PROD)+sl.min.switch[4].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 -0.6) of_4) slbot_4) 9.99934002508e-38))
; 
; =  {(((sc.switch[4].PROD*0.)+of.switch[4].PROD)+sl.max.switch[4].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_4 0.) of_4) sltop_4) 9.9999999))
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
; no offset
(assert (= of_5 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_6 0.))
; no offset
(assert (= of_7 0.))
; 
; =  {(sc.switch[5].SUB/sc.switch[5].Kmod)} {1.}
(assert (= (/ sc_6 sc_7) 1.))
; no scale
(assert (= (/ sc_6 sc_7) 1.))
; no scale
(assert (= (/ sc_5 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_8 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[5].PROD} {(sc.switch[5].Vmax/1.)}
(assert (= sc_9 (/ sc_8 1.)))
; 
; =  {of.switch[5].PROD} {0.}
(assert (= of_9 0.))
; 
; >=  {((sc.switch[5].n*1000.75)+of.switch[5].n)} {3300.}
(assert (<= (+ (* sc_5 1000.75) of_5) 3300.))
; 
; <=  {((sc.switch[5].n*1000.75)+of.switch[5].n)} {0.5}
(assert (>= (+ (* sc_5 1000.75) of_5) 0.5))
; 
; >=  {((sc.switch[5].SUB*337.632520764)+of.switch[5].SUB)} {10.}
(assert (<= (+ (* sc_6 337.632520764) of_6) 10.))
; 
; <=  {((sc.switch[5].SUB*337.632520764)+of.switch[5].SUB)} {0.0001}
(assert (>= (+ (* sc_6 337.632520764) of_6) 0.0001))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.switch[5].Kmod*0.)+of.switch[5].Kmod)+sl.min.switch[5].Kmod)} {0.0001}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 0.0001))
; 
; =  {(((sc.switch[5].Kmod*1.66666666667)+of.switch[5].Kmod)+sl.max.switch[5].Kmod)} {10.}
(assert (= (+ (+ (* sc_7 1.66666666667) of_7) sltop_7) 10.))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.switch[5].PROD*0.)+of.switch[5].PROD)+sl.min.switch[5].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9) 9.99934002508e-38))
; 
; =  {(((sc.switch[5].PROD*15.6)+of.switch[5].PROD)+sl.max.switch[5].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_9 15.6) of_9) sltop_9) 9.9999999))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[5].Vmax*0.)+of.switch[5].Vmax)+sl.min.switch[5].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 0.0001))
; 
; =  {(((sc.switch[5].Vmax*15.6)+of.switch[5].Vmax)+sl.max.switch[5].Vmax)} {10.}
(assert (= (+ (+ (* sc_8 15.6) of_8) sltop_8) 10.))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.switch[5].PROD*0.)+of.switch[5].PROD)+sl.min.switch[5].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9) 9.99934002508e-38))
; 
; =  {(((sc.switch[5].PROD*15.6)+of.switch[5].PROD)+sl.max.switch[5].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_9 15.6) of_9) sltop_9) 9.9999999))
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
; 
; =  {sc.input.I[20].O} {sc.input.I[20].X}
(assert (= sc_11 sc_10))
; 
; =  {of.input.I[20].O} {of.input.I[20].X}
(assert (= of_11 of_10))
; 
; >=  {((sc.input.I[20].X*0.)+of.input.I[20].X)} {10.}
(assert (<= (+ (* sc_10 0.) of_10) 10.))
; 
; <=  {((sc.input.I[20].X*0.)+of.input.I[20].X)} {0.}
(assert (>= (+ (* sc_10 0.) of_10) 0.))
; 
; >=  {((sc.input.I[20].O*0.)+of.input.I[20].O)} {10.}
(assert (<= (+ (* sc_11 0.) of_11) 10.))
; 
; <=  {((sc.input.I[20].O*0.)+of.input.I[20].O)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_13 sc_12))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_13 of_12))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_12 0.) of_12) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_13 0.) of_13) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_15 sc_14))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_15 of_14))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_17 sc_16))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_17 of_16))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_16 0.) of_16) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_17 0.) of_17) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_19 sc_18))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_19 of_18))
; 
; >=  {((sc.input.I[13].X*4.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_18 4.) of_18) 10.))
; 
; <=  {((sc.input.I[13].X*4.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_18 4.) of_18) 0.))
; 
; >=  {((sc.input.I[13].O*4.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_19 4.) of_19) 10.))
; 
; <=  {((sc.input.I[13].O*4.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_19 4.) of_19) 0.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_21 sc_20))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_21 of_20))
; 
; >=  {((sc.input.I[12].X*-2.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_20 -2.) of_20) 10.))
; 
; <=  {((sc.input.I[12].X*-2.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_20 -2.) of_20) 0.))
; 
; >=  {((sc.input.I[12].O*-2.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_21 -2.) of_21) 10.))
; 
; <=  {((sc.input.I[12].O*-2.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_21 -2.) of_21) 0.))
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_23 sc_22))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_23 of_22))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_22 0.) of_22) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_23 0.) of_23) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_25 sc_24))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_25 of_24))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.input.I[0].X*0.)+of.input.I[0].X)+sl.min.input.I[0].X)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.))
; 
; =  {(((sc.input.I[0].X*0.6)+of.input.I[0].X)+sl.max.input.I[0].X)} {10.}
(assert (= (+ (+ (* sc_24 0.6) of_24) sltop_24) 10.))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.input.I[0].O*0.)+of.input.I[0].O)+sl.min.input.I[0].O)} {0.}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 0.))
; 
; =  {(((sc.input.I[0].O*0.6)+of.input.I[0].O)+sl.max.input.I[0].O)} {10.}
(assert (= (+ (+ (* sc_25 0.6) of_25) sltop_25) 10.))
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_27 sc_26))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_27 of_26))
; 
; >=  {((sc.input.I[11].X*15.6)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_26 15.6) of_26) 10.))
; 
; <=  {((sc.input.I[11].X*15.6)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_26 15.6) of_26) 0.))
; 
; >=  {((sc.input.I[11].O*15.6)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_27 15.6) of_27) 10.))
; 
; <=  {((sc.input.I[11].O*15.6)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_27 15.6) of_27) 0.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_29 sc_28))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_29 of_28))
; 
; >=  {((sc.input.I[10].X*337.632520764)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_28 337.632520764) of_28) 10.))
; 
; <=  {((sc.input.I[10].X*337.632520764)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_28 337.632520764) of_28) 0.))
; 
; >=  {((sc.input.I[10].O*337.632520764)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_29 337.632520764) of_29) 10.))
; 
; <=  {((sc.input.I[10].O*337.632520764)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_29 337.632520764) of_29) 0.))
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_31 sc_30))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_31 of_30))
; 
; >=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_30 1.) of_30) 10.))
; 
; <=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_30 1.) of_30) 0.))
; 
; >=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_31 1.) of_31) 10.))
; 
; <=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_31 1.) of_31) 0.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_33 sc_32))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_33 of_32))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_32 0.) of_32) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_33 0.) of_33) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; 
; =  {sc.input.I[21].O} {sc.input.I[21].X}
(assert (= sc_35 sc_34))
; 
; =  {of.input.I[21].O} {of.input.I[21].X}
(assert (= of_35 of_34))
; 
; >=  {((sc.input.I[21].X*0.)+of.input.I[21].X)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[21].X*0.)+of.input.I[21].X)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.input.I[21].O*0.)+of.input.I[21].O)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[21].O*0.)+of.input.I[21].O)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_36 1.) of_36) 10.))
; 
; <=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_36 1.) of_36) 0.))
; 
; >=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_37 1.) of_37) 10.))
; 
; <=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_37 1.) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_38 1.) of_38) 10.))
; 
; <=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_38 1.) of_38) 0.))
; 
; >=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_39 1.) of_39) 10.))
; 
; <=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_39 1.) of_39) 0.))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_40 0.) of_40) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_41 0.) of_41) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_42 0.) of_42) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_43 0.) of_43) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_44 0.) of_44) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_45 0.) of_45) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_46 156.25) of_46) 10.))
; 
; <=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_46 156.25) of_46) 0.))
; 
; >=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_47 156.25) of_47) 10.))
; 
; <=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_47 156.25) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_48 1.) of_48) 10.))
; 
; <=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_48 1.) of_48) 0.))
; 
; >=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_49 1.) of_49) 10.))
; 
; <=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_49 1.) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.I[19].O} {sc.input.I[19].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.I[19].O} {of.input.I[19].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.I[19].X*0.)+of.input.I[19].X)} {10.}
(assert (<= (+ (* sc_50 0.) of_50) 10.))
; 
; <=  {((sc.input.I[19].X*0.)+of.input.I[19].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.I[19].O*0.)+of.input.I[19].O)} {10.}
(assert (<= (+ (* sc_51 0.) of_51) 10.))
; 
; <=  {((sc.input.I[19].O*0.)+of.input.I[19].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.I[18].O} {sc.input.I[18].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.I[18].O} {of.input.I[18].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {10.}
(assert (<= (+ (* sc_52 1.) of_52) 10.))
; 
; <=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {0.}
(assert (>= (+ (* sc_52 1.) of_52) 0.))
; 
; >=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {10.}
(assert (<= (+ (* sc_53 1.) of_53) 10.))
; 
; <=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {0.}
(assert (>= (+ (* sc_53 1.) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_55 sc_54))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_55 of_54))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_54 0.) of_54) slbot_54) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_54 156.25) of_54) sltop_54) 3300.))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_55 156.25) of_55) sltop_55) 3300.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_57 sc_56))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_57 of_56))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_56 15.6) of_56) sltop_56) 3300.))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_57 15.6) of_57) sltop_57) 3300.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
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
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_59 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_60 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_61 (* 1. sc_62)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D)}
(assert (and (= sc_61 (* 1. sc_60)) (= sc_61 (* 1. sc_59))))
; no offset
(assert (= (- (+ of_61 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1.)}
(assert (= sc_63 (* sc_61 1.)))
; 
; =  {of.vadd[2].OUT} {0.}
(assert (= of_63 0.))
; no scale
(assert (= sc_59 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_59 0.))
; no offset
(assert (= of_64 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_60 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_61 (* 1. sc_62)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D*sc.vadd[2].OUT2)}
(assert (and (= sc_61 (* 1. sc_60)) (= sc_61 (* (* 1. sc_59) sc_64))))
; no offset
(assert (= (- (+ of_61 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1.)}
(assert (= sc_64 (* sc_61 1.)))
; no offset
(assert (= of_64 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1.)}
(assert (= sc_58 (* sc_61 1.)))
; 
; =  {of.vadd[2].OUT2_0} {0.}
(assert (= of_58 0.))
; 
; >=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {3300.}
(assert (<= (+ (* sc_58 0.) of_58) 3300.))
; 
; <=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
; 
; >=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {3300.}
(assert (<= (+ (* sc_59 4.) of_59) 3300.))
; 
; <=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {0.}
(assert (>= (+ (* sc_59 4.) of_59) 0.))
; 
; >=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
; 
; >=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {3300.}
(assert (<= (+ (* sc_61 0.) of_61) 3300.))
; 
; <=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_64 0.) of_64) slbot_64) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_64 156.25) of_64) sltop_64) 3300.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.vadd[2].B*3.75903614458)+of.vadd[2].B)+sl.min.vadd[2].B)} {0.}
(assert (= (+ (+ (* sc_62 3.75903614458) of_62) slbot_62) 0.))
; 
; =  {(((sc.vadd[2].B*62.4)+of.vadd[2].B)+sl.max.vadd[2].B)} {3300.}
(assert (= (+ (+ (* sc_62 62.4) of_62) sltop_62) 3300.))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.vadd[2].OUT*3.75903614458)+of.vadd[2].OUT)+sl.min.vadd[2].OUT)} {-1650.}
(assert (= (+ (+ (* sc_63 3.75903614458) of_63) slbot_63) -1650.))
; 
; =  {(((sc.vadd[2].OUT*62.4)+of.vadd[2].OUT)+sl.max.vadd[2].OUT)} {1650.}
(assert (= (+ (+ (* sc_63 62.4) of_63) sltop_63) 1650.))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_64 0.) of_64) slbot_64) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_64 156.25) of_64) sltop_64) 3300.))
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_66 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_67 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; 
; =  {sc.vadd[11].A} {(1.*sc.vadd[11].B)}
(assert (= sc_68 (* 1. sc_69)))
; 
; =  {sc.vadd[11].A} {(1.*sc.vadd[11].C)} {(1.*sc.vadd[11].D)}
(assert (and (= sc_68 (* 1. sc_67)) (= sc_68 (* 1. sc_66))))
; no offset
(assert (= (- (+ of_68 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[11].OUT} {(sc.vadd[11].A*1.)}
(assert (= sc_70 (* sc_68 1.)))
; 
; =  {of.vadd[11].OUT} {0.}
(assert (= of_70 0.))
; no scale
(assert (= sc_66 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_66 0.))
; no offset
(assert (= of_71 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_67 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; 
; =  {sc.vadd[11].A} {(1.*sc.vadd[11].B)}
(assert (= sc_68 (* 1. sc_69)))
; 
; =  {sc.vadd[11].A} {(1.*sc.vadd[11].C)} {(1.*sc.vadd[11].D*sc.vadd[11].OUT2)}
(assert (and (= sc_68 (* 1. sc_67)) (= sc_68 (* (* 1. sc_66) sc_71))))
; no offset
(assert (= (- (+ of_68 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[11].OUT2} {(sc.vadd[11].A*1.)}
(assert (= sc_71 (* sc_68 1.)))
; no offset
(assert (= of_71 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[11].OUT2_0} {(sc.vadd[11].A*1.)}
(assert (= sc_65 (* sc_68 1.)))
; 
; =  {of.vadd[11].OUT2_0} {0.}
(assert (= of_65 0.))
; 
; >=  {((sc.vadd[11].OUT2_0*0.)+of.vadd[11].OUT2_0)} {3300.}
(assert (<= (+ (* sc_65 0.) of_65) 3300.))
; 
; <=  {((sc.vadd[11].OUT2_0*0.)+of.vadd[11].OUT2_0)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
; 
; >=  {((sc.vadd[11].D*4.)+of.vadd[11].D)} {3300.}
(assert (<= (+ (* sc_66 4.) of_66) 3300.))
; 
; <=  {((sc.vadd[11].D*4.)+of.vadd[11].D)} {0.}
(assert (>= (+ (* sc_66 4.) of_66) 0.))
; 
; >=  {((sc.vadd[11].C*0.)+of.vadd[11].C)} {3300.}
(assert (<= (+ (* sc_67 0.) of_67) 3300.))
; 
; <=  {((sc.vadd[11].C*0.)+of.vadd[11].C)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
; 
; >=  {((sc.vadd[11].A*0.)+of.vadd[11].A)} {3300.}
(assert (<= (+ (* sc_68 0.) of_68) 3300.))
; 
; <=  {((sc.vadd[11].A*0.)+of.vadd[11].A)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
(declare-fun slbot_71 () Real)
(declare-fun sltop_71 () Real)
; 
; =  {(((sc.vadd[11].OUT2*0.)+of.vadd[11].OUT2)+sl.min.vadd[11].OUT2)} {0.}
(assert (= (+ (+ (* sc_71 0.) of_71) slbot_71) 0.))
; 
; =  {(((sc.vadd[11].OUT2*15.6)+of.vadd[11].OUT2)+sl.max.vadd[11].OUT2)} {3300.}
(assert (= (+ (+ (* sc_71 15.6) of_71) sltop_71) 3300.))
(declare-fun slbot_69 () Real)
(declare-fun sltop_69 () Real)
; 
; =  {(((sc.vadd[11].B*0.00204799328914)+of.vadd[11].B)+sl.min.vadd[11].B)} {0.}
(assert (= (+ (+ (* sc_69 0.00204799328914) of_69) slbot_69) 0.))
; 
; =  {(((sc.vadd[11].B*625.)+of.vadd[11].B)+sl.max.vadd[11].B)} {3300.}
(assert (= (+ (+ (* sc_69 625.) of_69) sltop_69) 3300.))
(declare-fun slbot_70 () Real)
(declare-fun sltop_70 () Real)
; 
; =  {(((sc.vadd[11].OUT*0.00204799328914)+of.vadd[11].OUT)+sl.min.vadd[11].OUT)} {-1650.}
(assert (= (+ (+ (* sc_70 0.00204799328914) of_70) slbot_70) -1650.))
; 
; =  {(((sc.vadd[11].OUT*625.)+of.vadd[11].OUT)+sl.max.vadd[11].OUT)} {1650.}
(assert (= (+ (+ (* sc_70 625.) of_70) sltop_70) 1650.))
(declare-fun slbot_71 () Real)
(declare-fun sltop_71 () Real)
; 
; =  {(((sc.vadd[11].OUT2*0.)+of.vadd[11].OUT2)+sl.min.vadd[11].OUT2)} {0.}
(assert (= (+ (+ (* sc_71 0.) of_71) slbot_71) 0.))
; 
; =  {(((sc.vadd[11].OUT2*15.6)+of.vadd[11].OUT2)+sl.max.vadd[11].OUT2)} {3300.}
(assert (= (+ (+ (* sc_71 15.6) of_71) sltop_71) 3300.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; no offset
(assert (= of_73 0.))
; no offset
(assert (= of_74 0.))
; no scale
(assert (= (/ sc_73 sc_74) 1.))
; no scale
(assert (= sc_72 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_72 0.))
; no offset
(assert (= of_73 0.))
; no offset
(assert (= of_74 0.))
; no scale
(assert (= (/ sc_73 sc_74) 1.))
; no scale
(assert (= sc_72 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_72 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_75 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_76 (* sc_75 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_76 0.))
; no scale
(assert (= sc_74 1.))
; no scale
(assert (= (* sc_72 1.) 1.))
; no offset
(assert (= of_74 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_74 1.))
; no scale
(assert (= (* sc_72 1.) 1.))
; no offset
(assert (= of_74 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_73 1.))
; no scale
(assert (= sc_72 1.))
; no offset
(assert (= of_73 0.))
; no offset
(assert (= of_72 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_75 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_77 (* sc_75 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_77 0.))
; 
; >=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_72 2.5) of_72) 5.))
; 
; <=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_72 2.5) of_72) 1.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73) 1.))
; 
; =  {(((sc.ihill[0].S*156.25)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_73 156.25) of_73) sltop_73) 10.))
(declare-fun slbot_77 () Real)
(declare-fun sltop_77 () Real)
; 
; =  {(((sc.ihill[0].REP*0.000511998322284)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {9.999900001e-10}
(assert (= (+ (+ (* sc_77 0.000511998322284) of_77) slbot_77) 9.999900001e-10))
; 
; =  {(((sc.ihill[0].REP*156.25)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {5.}
(assert (= (+ (+ (* sc_77 156.25) of_77) sltop_77) 5.))
; 
; >=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_75 156.25) of_75) 10.))
; 
; <=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_75 156.25) of_75) 0.0001))
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
(assert (= 0. 0.))
; no offset
(assert (= of_79 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_78 0.))
; 
; =  {sc.vtoi[0].Y} {((1./sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_80 (* (/ 1. sc_79) sc_78)))
; 
; =  {of.vtoi[0].Y} {0.}
(assert (= of_80 0.))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78) 1.))
; 
; =  {(((sc.vtoi[0].X*156.25)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_78 156.25) of_78) sltop_78) 3300.))
; 
; >=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_79 1.) of_79) 3300.))
; 
; <=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_79 1.) of_79) 1.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*156.25)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_80 156.25) of_80) sltop_80) 3300.))
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
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
(assert (= of_82 0.))
; no offset
(assert (= of_81 0.))
; 
; =  {1.} {(sc.igenebind[8].K*sc.igenebind[8].TF)}
(assert (= 1. (* sc_82 sc_81)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_83 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[8].GE} {(sc.igenebind[8].Vmax*(1./1.))}
(assert (= sc_84 (* sc_83 (/ 1. 1.))))
; 
; =  {of.igenebind[8].GE} {0.}
(assert (= of_84 0.))
(declare-fun slbot_81 () Real)
(declare-fun sltop_81 () Real)
; 
; =  {(((sc.igenebind[8].TF*-1.)+of.igenebind[8].TF)+sl.min.igenebind[8].TF)} {0.0001}
(assert (= (+ (+ (* sc_81 -1.) of_81) slbot_81) 0.0001))
; 
; =  {(((sc.igenebind[8].TF*-0.4)+of.igenebind[8].TF)+sl.max.igenebind[8].TF)} {10.}
(assert (= (+ (+ (* sc_81 -0.4) of_81) sltop_81) 10.))
; 
; >=  {((sc.igenebind[8].K*1.)+of.igenebind[8].K)} {10.}
(assert (<= (+ (* sc_82 1.) of_82) 10.))
; 
; <=  {((sc.igenebind[8].K*1.)+of.igenebind[8].K)} {0.0001}
(assert (>= (+ (* sc_82 1.) of_82) 0.0001))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.igenebind[8].GE*0.)+of.igenebind[8].GE)+sl.min.igenebind[8].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[8].GE*1.66666666667)+of.igenebind[8].GE)+sl.max.igenebind[8].GE)} {9.9999999}
(assert (= (+ (+ (* sc_84 1.66666666667) of_84) sltop_84) 9.9999999))
; 
; >=  {((sc.igenebind[8].Vmax*1.)+of.igenebind[8].Vmax)} {10.}
(assert (<= (+ (* sc_83 1.) of_83) 10.))
; 
; <=  {((sc.igenebind[8].Vmax*1.)+of.igenebind[8].Vmax)} {0.0001}
(assert (>= (+ (* sc_83 1.) of_83) 0.0001))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.igenebind[8].GE*0.)+of.igenebind[8].GE)+sl.min.igenebind[8].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[8].GE*1.66666666667)+of.igenebind[8].GE)+sl.max.igenebind[8].GE)} {9.9999999}
(assert (= (+ (+ (* sc_84 1.66666666667) of_84) sltop_84) 9.9999999))
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
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
(assert (= of_86 0.))
; no offset
(assert (= of_85 0.))
; 
; =  {1.} {(sc.igenebind[3].K*sc.igenebind[3].TF)}
(assert (= 1. (* sc_86 sc_85)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_87 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[3].GE} {(sc.igenebind[3].Vmax*(1./1.))}
(assert (= sc_88 (* sc_87 (/ 1. 1.))))
; 
; =  {of.igenebind[3].GE} {0.}
(assert (= of_88 0.))
; 
; >=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {10.}
(assert (<= (+ (* sc_85 1.) of_85) 10.))
; 
; <=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {0.0001}
(assert (>= (+ (* sc_85 1.) of_85) 0.0001))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.igenebind[3].K*0.)+of.igenebind[3].K)+sl.min.igenebind[3].K)} {0.0001}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 0.0001))
; 
; =  {(((sc.igenebind[3].K*15.6)+of.igenebind[3].K)+sl.max.igenebind[3].K)} {10.}
(assert (= (+ (+ (* sc_86 15.6) of_86) sltop_86) 10.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.igenebind[3].GE*0.939759036145)+of.igenebind[3].GE)+sl.min.igenebind[3].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_88 0.939759036145) of_88) slbot_88) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[3].GE*15.6)+of.igenebind[3].GE)+sl.max.igenebind[3].GE)} {9.9999999}
(assert (= (+ (+ (* sc_88 15.6) of_88) sltop_88) 9.9999999))
; 
; >=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {10.}
(assert (<= (+ (* sc_87 15.6) of_87) 10.))
; 
; <=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {0.0001}
(assert (>= (+ (* sc_87 15.6) of_87) 0.0001))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_90 sc_89))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_90 of_89))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_89 0.) of_89) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_89 0.) of_89) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_90 0.) of_90) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_90 0.) of_90) 0.))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_92 sc_91))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_92 of_91))
; 
; >=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_91 4.) of_91) 3300.))
; 
; <=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_91 4.) of_91) 0.))
; 
; >=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_92 4.) of_92) 3300.))
; 
; <=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_92 4.) of_92) 0.))
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_94 sc_93))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_94 of_93))
; 
; >=  {((sc.input.V[7].X*-500.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_93 -500.) of_93) 3300.))
; 
; <=  {((sc.input.V[7].X*-500.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_93 -500.) of_93) 0.))
; 
; >=  {((sc.input.V[7].O*-500.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_94 -500.) of_94) 3300.))
; 
; <=  {((sc.input.V[7].O*-500.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_94 -500.) of_94) 0.))
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
; >=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_95 1.) of_95) 3300.))
; 
; <=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_95 1.) of_95) 0.))
; 
; >=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_96 1.) of_96) 3300.))
; 
; <=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_96 1.) of_96) 0.))
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
; >=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_97 4.) of_97) 3300.))
; 
; <=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_97 4.) of_97) 0.))
; 
; >=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_98 4.) of_98) 3300.))
; 
; <=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_98 4.) of_98) 0.))
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
; 
; >=  {((sc.input.V[0].X*2.5)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_99 2.5) of_99) 3300.))
; 
; <=  {((sc.input.V[0].X*2.5)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_99 2.5) of_99) 0.))
; 
; >=  {((sc.input.V[0].O*2.5)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_100 2.5) of_100) 3300.))
; 
; <=  {((sc.input.V[0].O*2.5)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_100 2.5) of_100) 0.))
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
; >=  {((sc.input.V[11].X*1000.75)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_101 1000.75) of_101) 3300.))
; 
; <=  {((sc.input.V[11].X*1000.75)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_101 1000.75) of_101) 0.))
; 
; >=  {((sc.input.V[11].O*1000.75)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_102 1000.75) of_102) 3300.))
; 
; <=  {((sc.input.V[11].O*1000.75)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_102 1000.75) of_102) 0.))
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
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_113 0.) of_113) 3300.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_113 0.) of_113) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_114 0.) of_114) 3300.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_114 0.) of_114) 0.))
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
; no offset
(assert (= of_116 0.))
; no offset
(assert (= of_115 0.))
; 
; =  {sc.itov[10].Y} {(sc.itov[10].K*sc.itov[10].X)}
(assert (= sc_117 (* sc_116 sc_115)))
; 
; =  {of.itov[10].Y} {0.}
(assert (= of_117 0.))
(declare-fun slbot_115 () Real)
(declare-fun sltop_115 () Real)
; 
; =  {(((sc.itov[10].X*0.000511998322284)+of.itov[10].X)+sl.min.itov[10].X)} {0.0001}
(assert (= (+ (+ (* sc_115 0.000511998322284) of_115) slbot_115) 0.0001))
; 
; =  {(((sc.itov[10].X*156.25)+of.itov[10].X)+sl.max.itov[10].X)} {10.}
(assert (= (+ (+ (* sc_115 156.25) of_115) sltop_115) 10.))
(declare-fun slbot_117 () Real)
(declare-fun sltop_117 () Real)
; 
; =  {(((sc.itov[10].Y*0.00204799328914)+of.itov[10].Y)+sl.min.itov[10].Y)} {0.0001}
(assert (= (+ (+ (* sc_117 0.00204799328914) of_117) slbot_117) 0.0001))
; 
; =  {(((sc.itov[10].Y*625.)+of.itov[10].Y)+sl.max.itov[10].Y)} {3300.}
(assert (= (+ (+ (* sc_117 625.) of_117) sltop_117) 3300.))
; 
; >=  {((sc.itov[10].K*4.)+of.itov[10].K)} {330.}
(assert (<= (+ (* sc_116 4.) of_116) 330.))
; 
; <=  {((sc.itov[10].K*4.)+of.itov[10].K)} {1.}
(assert (>= (+ (* sc_116 4.) of_116) 1.))
(declare-fun slbot_117 () Real)
(declare-fun sltop_117 () Real)
; 
; =  {(((sc.itov[10].Y*0.00204799328914)+of.itov[10].Y)+sl.min.itov[10].Y)} {0.0001}
(assert (= (+ (+ (* sc_117 0.00204799328914) of_117) slbot_117) 0.0001))
; 
; =  {(((sc.itov[10].Y*625.)+of.itov[10].Y)+sl.max.itov[10].Y)} {3300.}
(assert (= (+ (+ (* sc_117 625.) of_117) sltop_117) 3300.))
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
; =  {sc.itov[1].Y} {(sc.itov[1].K*sc.itov[1].X)}
(assert (= sc_120 (* sc_119 sc_118)))
; 
; =  {of.itov[1].Y} {0.}
(assert (= of_120 0.))
; 
; >=  {((sc.itov[1].X*4.)+of.itov[1].X)} {10.}
(assert (<= (+ (* sc_118 4.) of_118) 10.))
; 
; <=  {((sc.itov[1].X*4.)+of.itov[1].X)} {0.0001}
(assert (>= (+ (* sc_118 4.) of_118) 0.0001))
(declare-fun slbot_120 () Real)
(declare-fun sltop_120 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_120 3.75903614458) of_120) slbot_120) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_120 62.4) of_120) sltop_120) 3300.))
(declare-fun slbot_119 () Real)
(declare-fun sltop_119 () Real)
; 
; =  {(((sc.itov[1].K*0.939759036145)+of.itov[1].K)+sl.min.itov[1].K)} {1.}
(assert (= (+ (+ (* sc_119 0.939759036145) of_119) slbot_119) 1.))
; 
; =  {(((sc.itov[1].K*15.6)+of.itov[1].K)+sl.max.itov[1].K)} {330.}
(assert (= (+ (+ (* sc_119 15.6) of_119) sltop_119) 330.))
(declare-fun slbot_120 () Real)
(declare-fun sltop_120 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_120 3.75903614458) of_120) slbot_120) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_120 62.4) of_120) sltop_120) 3300.))
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
; 
; =  {sc.iadd[7].A} {sc.iadd[7].B}
(assert (= sc_123 sc_124))
; 
; =  {sc.iadd[7].A} {sc.iadd[7].C} {sc.iadd[7].D}
(assert (and (= sc_123 sc_122) (= sc_123 sc_121)))
; 
; =  {sc.iadd[7].OUT} {sc.iadd[7].A}
(assert (= sc_125 sc_123))
; 
; =  {of.iadd[7].OUT} {((of.iadd[7].A+of.iadd[7].B)-of.iadd[7].C-of.iadd[7].D)}
(assert (= of_125 (- (+ of_123 of_124) (+ of_122 of_121))))
; 
; >=  {((sc.iadd[7].D*0.)+of.iadd[7].D)} {5.}
(assert (<= (+ (* sc_121 0.) of_121) 5.))
; 
; <=  {((sc.iadd[7].D*0.)+of.iadd[7].D)} {0.}
(assert (>= (+ (* sc_121 0.) of_121) 0.))
; 
; >=  {((sc.iadd[7].C*0.)+of.iadd[7].C)} {5.}
(assert (<= (+ (* sc_122 0.) of_122) 5.))
; 
; <=  {((sc.iadd[7].C*0.)+of.iadd[7].C)} {0.}
(assert (>= (+ (* sc_122 0.) of_122) 0.))
(declare-fun slbot_125 () Real)
(declare-fun sltop_125 () Real)
; 
; =  {(((sc.iadd[7].OUT*0.)+of.iadd[7].OUT)+sl.min.iadd[7].OUT)} {-10.}
(assert (= (+ (+ (* sc_125 0.) of_125) slbot_125) -10.))
; 
; =  {(((sc.iadd[7].OUT*1.66666666667)+of.iadd[7].OUT)+sl.max.iadd[7].OUT)} {10.}
(assert (= (+ (+ (* sc_125 1.66666666667) of_125) sltop_125) 10.))
; 
; >=  {((sc.iadd[7].A*0.)+of.iadd[7].A)} {5.}
(assert (<= (+ (* sc_123 0.) of_123) 5.))
; 
; <=  {((sc.iadd[7].A*0.)+of.iadd[7].A)} {0.}
(assert (>= (+ (* sc_123 0.) of_123) 0.))
(declare-fun slbot_124 () Real)
(declare-fun sltop_124 () Real)
; 
; =  {(((sc.iadd[7].B*0.)+of.iadd[7].B)+sl.min.iadd[7].B)} {0.}
(assert (= (+ (+ (* sc_124 0.) of_124) slbot_124) 0.))
; 
; =  {(((sc.iadd[7].B*1.66666666667)+of.iadd[7].B)+sl.max.iadd[7].B)} {5.}
(assert (= (+ (+ (* sc_124 1.66666666667) of_124) sltop_124) 5.))
(declare-fun slbot_125 () Real)
(declare-fun sltop_125 () Real)
; 
; =  {(((sc.iadd[7].OUT*0.)+of.iadd[7].OUT)+sl.min.iadd[7].OUT)} {-10.}
(assert (= (+ (+ (* sc_125 0.) of_125) slbot_125) -10.))
; 
; =  {(((sc.iadd[7].OUT*1.66666666667)+of.iadd[7].OUT)+sl.max.iadd[7].OUT)} {10.}
(assert (= (+ (+ (* sc_125 1.66666666667) of_125) sltop_125) 10.))
(declare-fun sc_126 () Real)
(assert (> sc_126 1e-08))
(declare-fun of_126 () Real)
(declare-fun sc_127 () Real)
(assert (> sc_127 1e-08))
(declare-fun of_127 () Real)
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
(declare-fun sc_130 () Real)
(assert (> sc_130 1e-08))
(declare-fun of_130 () Real)
; 
; =  {sc.iadd[9].A} {sc.iadd[9].B}
(assert (= sc_128 sc_129))
; 
; =  {sc.iadd[9].A} {sc.iadd[9].C} {sc.iadd[9].D}
(assert (and (= sc_128 sc_127) (= sc_128 sc_126)))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[9].A}
(assert (= sc_130 sc_128))
; 
; =  {of.iadd[9].OUT} {((of.iadd[9].A+of.iadd[9].B)-of.iadd[9].C-of.iadd[9].D)}
(assert (= of_130 (- (+ of_128 of_129) (+ of_127 of_126))))
(declare-fun slbot_126 () Real)
(declare-fun sltop_126 () Real)
; 
; =  {(((sc.iadd[9].D*-0.6)+of.iadd[9].D)+sl.min.iadd[9].D)} {0.}
(assert (= (+ (+ (* sc_126 -0.6) of_126) slbot_126) 0.))
; 
; =  {(((sc.iadd[9].D*0.)+of.iadd[9].D)+sl.max.iadd[9].D)} {5.}
(assert (= (+ (+ (* sc_126 0.) of_126) sltop_126) 5.))
; 
; >=  {((sc.iadd[9].C*1.)+of.iadd[9].C)} {5.}
(assert (<= (+ (* sc_127 1.) of_127) 5.))
; 
; <=  {((sc.iadd[9].C*1.)+of.iadd[9].C)} {0.}
(assert (>= (+ (* sc_127 1.) of_127) 0.))
(declare-fun slbot_130 () Real)
(declare-fun sltop_130 () Real)
; 
; =  {(((sc.iadd[9].OUT*-1.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_130 -1.) of_130) slbot_130) -10.))
; 
; =  {(((sc.iadd[9].OUT*-0.4)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_130 -0.4) of_130) sltop_130) 10.))
; 
; >=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {5.}
(assert (<= (+ (* sc_128 0.) of_128) 5.))
; 
; <=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {0.}
(assert (>= (+ (* sc_128 0.) of_128) 0.))
; 
; >=  {((sc.iadd[9].B*0.)+of.iadd[9].B)} {5.}
(assert (<= (+ (* sc_129 0.) of_129) 5.))
; 
; <=  {((sc.iadd[9].B*0.)+of.iadd[9].B)} {0.}
(assert (>= (+ (* sc_129 0.) of_129) 0.))
(declare-fun slbot_130 () Real)
(declare-fun sltop_130 () Real)
; 
; =  {(((sc.iadd[9].OUT*-1.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_130 -1.) of_130) slbot_130) -10.))
; 
; =  {(((sc.iadd[9].OUT*-0.4)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_130 -0.4) of_130) sltop_130) 10.))
(declare-fun sc_131 () Real)
(assert (> sc_131 1e-08))
(declare-fun of_131 () Real)
(declare-fun sc_132 () Real)
(assert (> sc_132 1e-08))
(declare-fun of_132 () Real)
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
(declare-fun sc_135 () Real)
(assert (> sc_135 1e-08))
(declare-fun of_135 () Real)
; 
; =  {sc.iadd[10].A} {sc.iadd[10].B}
(assert (= sc_133 sc_134))
; 
; =  {sc.iadd[10].A} {sc.iadd[10].C} {sc.iadd[10].D}
(assert (and (= sc_133 sc_132) (= sc_133 sc_131)))
; 
; =  {sc.iadd[10].OUT} {sc.iadd[10].A}
(assert (= sc_135 sc_133))
; 
; =  {of.iadd[10].OUT} {((of.iadd[10].A+of.iadd[10].B)-of.iadd[10].C-of.iadd[10].D)}
(assert (= of_135 (- (+ of_133 of_134) (+ of_132 of_131))))
; 
; >=  {((sc.iadd[10].D*0.)+of.iadd[10].D)} {5.}
(assert (<= (+ (* sc_131 0.) of_131) 5.))
; 
; <=  {((sc.iadd[10].D*0.)+of.iadd[10].D)} {0.}
(assert (>= (+ (* sc_131 0.) of_131) 0.))
; 
; >=  {((sc.iadd[10].C*0.)+of.iadd[10].C)} {5.}
(assert (<= (+ (* sc_132 0.) of_132) 5.))
; 
; <=  {((sc.iadd[10].C*0.)+of.iadd[10].C)} {0.}
(assert (>= (+ (* sc_132 0.) of_132) 0.))
(declare-fun slbot_133 () Real)
(declare-fun sltop_133 () Real)
; 
; =  {(((sc.iadd[10].A*0.)+of.iadd[10].A)+sl.min.iadd[10].A)} {0.}
(assert (= (+ (+ (* sc_133 0.) of_133) slbot_133) 0.))
; 
; =  {(((sc.iadd[10].A*15.6)+of.iadd[10].A)+sl.max.iadd[10].A)} {5.}
(assert (= (+ (+ (* sc_133 15.6) of_133) sltop_133) 5.))
; 
; >=  {((sc.iadd[10].B*0.)+of.iadd[10].B)} {5.}
(assert (<= (+ (* sc_134 0.) of_134) 5.))
; 
; <=  {((sc.iadd[10].B*0.)+of.iadd[10].B)} {0.}
(assert (>= (+ (* sc_134 0.) of_134) 0.))
(declare-fun slbot_135 () Real)
(declare-fun sltop_135 () Real)
; 
; =  {(((sc.iadd[10].OUT*0.)+of.iadd[10].OUT)+sl.min.iadd[10].OUT)} {-10.}
(assert (= (+ (+ (* sc_135 0.) of_135) slbot_135) -10.))
; 
; =  {(((sc.iadd[10].OUT*15.6)+of.iadd[10].OUT)+sl.max.iadd[10].OUT)} {10.}
(assert (= (+ (+ (* sc_135 15.6) of_135) sltop_135) 10.))
(declare-fun sc_136 () Real)
(assert (> sc_136 1e-08))
(declare-fun of_136 () Real)
(declare-fun sc_137 () Real)
(assert (> sc_137 1e-08))
(declare-fun of_137 () Real)
(declare-fun sc_138 () Real)
(assert (> sc_138 1e-08))
(declare-fun of_138 () Real)
(declare-fun sc_139 () Real)
(assert (> sc_139 1e-08))
(declare-fun of_139 () Real)
(declare-fun sc_140 () Real)
(assert (> sc_140 1e-08))
(declare-fun of_140 () Real)
; 
; =  {sc.iadd[6].A} {sc.iadd[6].B}
(assert (= sc_138 sc_139))
; 
; =  {sc.iadd[6].A} {sc.iadd[6].C} {sc.iadd[6].D}
(assert (and (= sc_138 sc_137) (= sc_138 sc_136)))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[6].A}
(assert (= sc_140 sc_138))
; 
; =  {of.iadd[6].OUT} {((of.iadd[6].A+of.iadd[6].B)-of.iadd[6].C-of.iadd[6].D)}
(assert (= of_140 (- (+ of_138 of_139) (+ of_137 of_136))))
; 
; >=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {5.}
(assert (<= (+ (* sc_136 0.) of_136) 5.))
; 
; <=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {0.}
(assert (>= (+ (* sc_136 0.) of_136) 0.))
; 
; >=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {5.}
(assert (<= (+ (* sc_137 0.) of_137) 5.))
; 
; <=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {0.}
(assert (>= (+ (* sc_137 0.) of_137) 0.))
(declare-fun slbot_140 () Real)
(declare-fun sltop_140 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_140 0.) of_140) slbot_140) -10.))
; 
; =  {(((sc.iadd[6].OUT*1.66666666667)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_140 1.66666666667) of_140) sltop_140) 10.))
; 
; >=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {5.}
(assert (<= (+ (* sc_138 0.) of_138) 5.))
; 
; <=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {0.}
(assert (>= (+ (* sc_138 0.) of_138) 0.))
(declare-fun slbot_139 () Real)
(declare-fun sltop_139 () Real)
; 
; =  {(((sc.iadd[6].B*0.)+of.iadd[6].B)+sl.min.iadd[6].B)} {0.}
(assert (= (+ (+ (* sc_139 0.) of_139) slbot_139) 0.))
; 
; =  {(((sc.iadd[6].B*1.66666666667)+of.iadd[6].B)+sl.max.iadd[6].B)} {5.}
(assert (= (+ (+ (* sc_139 1.66666666667) of_139) sltop_139) 5.))
(declare-fun slbot_140 () Real)
(declare-fun sltop_140 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_140 0.) of_140) slbot_140) -10.))
; 
; =  {(((sc.iadd[6].OUT*1.66666666667)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_140 1.66666666667) of_140) sltop_140) 10.))
; 
; =  {sc.input.I[6].O} {sc.iadd[7].A}
(assert (= sc_33 sc_123))
; 
; =  {of.input.I[6].O} {of.iadd[7].A}
(assert (= of_33 of_123))
; 
; =  {sc.iadd[6].OUT} {sc.switch[5].Kmod}
(assert (= sc_140 sc_7))
; 
; =  {of.iadd[6].OUT} {of.switch[5].Kmod}
(assert (= of_140 of_7))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].X}
(assert (= sc_64 sc_54))
; 
; =  {of.vadd[2].OUT2} {of.output.V[0].X}
(assert (= of_64 of_54))
; 
; =  {sc.vadd[2].OUT2} {sc.vtoi[0].X}
(assert (= sc_64 sc_78))
; 
; =  {of.vadd[2].OUT2} {of.vtoi[0].X}
(assert (= of_64 of_78))
; 
; =  {sc.input.I[0].O} {sc.switch[4].Vmax}
(assert (= sc_25 sc_3))
; 
; =  {of.input.I[0].O} {of.switch[4].Vmax}
(assert (= of_25 of_3))
; 
; =  {sc.input.V[9].O} {sc.vadd[11].D}
(assert (= sc_98 sc_66))
; 
; =  {of.input.V[9].O} {of.vadd[11].D}
(assert (= of_98 of_66))
; 
; =  {sc.ihill[0].REP} {sc.itov[10].X}
(assert (= sc_77 sc_115))
; 
; =  {of.ihill[0].REP} {of.itov[10].X}
(assert (= of_77 of_115))
; 
; =  {sc.itov[1].Y} {sc.vadd[2].B}
(assert (= sc_120 sc_62))
; 
; =  {of.itov[1].Y} {of.vadd[2].B}
(assert (= of_120 of_62))
; 
; =  {sc.igenebind[8].GE} {sc.iadd[7].B}
(assert (= sc_84 sc_124))
; 
; =  {of.igenebind[8].GE} {of.iadd[7].B}
(assert (= of_84 of_124))
; 
; =  {sc.input.I[18].O} {sc.igenebind[8].K}
(assert (= sc_53 sc_82))
; 
; =  {of.input.I[18].O} {of.igenebind[8].K}
(assert (= of_53 of_82))
; 
; =  {sc.input.I[9].O} {sc.iadd[9].B}
(assert (= sc_23 sc_129))
; 
; =  {of.input.I[9].O} {of.iadd[9].B}
(assert (= of_23 of_129))
; 
; =  {sc.input.I[3].O} {sc.iadd[6].A}
(assert (= sc_41 sc_138))
; 
; =  {of.input.I[3].O} {of.iadd[6].A}
(assert (= of_41 of_138))
; 
; =  {sc.input.I[4].O} {sc.iadd[6].C}
(assert (= sc_43 sc_137))
; 
; =  {of.input.I[4].O} {of.iadd[6].C}
(assert (= of_43 of_137))
; 
; =  {sc.input.I[16].O} {sc.igenebind[8].Vmax}
(assert (= sc_39 sc_83))
; 
; =  {of.input.I[16].O} {of.igenebind[8].Vmax}
(assert (= of_39 of_83))
; 
; =  {sc.input.I[5].O} {sc.iadd[7].D}
(assert (= sc_45 sc_121))
; 
; =  {of.input.I[5].O} {of.iadd[7].D}
(assert (= of_45 of_121))
; 
; =  {sc.vtoi[0].Y} {sc.ihill[0].S}
(assert (= sc_80 sc_73))
; 
; =  {of.vtoi[0].Y} {of.ihill[0].S}
(assert (= of_80 of_73))
; 
; =  {sc.input.I[14].O} {sc.igenebind[3].TF}
(assert (= sc_37 sc_85))
; 
; =  {of.input.I[14].O} {of.igenebind[3].TF}
(assert (= of_37 of_85))
; 
; =  {sc.input.V[11].O} {sc.switch[5].n}
(assert (= sc_102 sc_5))
; 
; =  {of.input.V[11].O} {of.switch[5].n}
(assert (= of_102 of_5))
; 
; =  {sc.input.V[12].O} {sc.vtoi[0].K}
(assert (= sc_96 sc_79))
; 
; =  {of.input.V[12].O} {of.vtoi[0].K}
(assert (= of_96 of_79))
; 
; =  {sc.input.I[2].O} {sc.iadd[6].D}
(assert (= sc_13 sc_136))
; 
; =  {of.input.I[2].O} {of.iadd[6].D}
(assert (= of_13 of_136))
; 
; =  {sc.input.V[8].O} {sc.vadd[2].D}
(assert (= sc_92 sc_59))
; 
; =  {of.input.V[8].O} {of.vadd[2].D}
(assert (= of_92 of_59))
; 
; =  {sc.input.I[20].O} {sc.iadd[10].B}
(assert (= sc_11 sc_134))
; 
; =  {of.input.I[20].O} {of.iadd[10].B}
(assert (= of_11 of_134))
; 
; =  {sc.input.V[2].O} {sc.vadd[2].C}
(assert (= sc_90 sc_60))
; 
; =  {of.input.V[2].O} {of.vadd[2].C}
(assert (= of_90 of_60))
; 
; =  {sc.input.V[3].O} {sc.vadd[11].C}
(assert (= sc_108 sc_67))
; 
; =  {of.input.V[3].O} {of.vadd[11].C}
(assert (= of_108 of_67))
; 
; =  {sc.input.I[15].O} {sc.switch[4].Kmod}
(assert (= sc_31 sc_2))
; 
; =  {of.input.I[15].O} {of.switch[4].Kmod}
(assert (= of_31 of_2))
; 
; =  {sc.input.I[10].O} {sc.switch[5].SUB}
(assert (= sc_29 sc_6))
; 
; =  {of.input.I[10].O} {of.switch[5].SUB}
(assert (= of_29 of_6))
; 
; =  {sc.input.I[12].O} {sc.switch[4].SUB}
(assert (= sc_21 sc_1))
; 
; =  {of.input.I[12].O} {of.switch[4].SUB}
(assert (= of_21 of_1))
; 
; =  {sc.input.I[1].O} {sc.ihill[0].Vmax}
(assert (= sc_47 sc_75))
; 
; =  {of.input.I[1].O} {of.ihill[0].Vmax}
(assert (= of_47 of_75))
; 
; =  {sc.iadd[10].OUT} {sc.igenebind[3].K}
(assert (= sc_135 sc_86))
; 
; =  {of.iadd[10].OUT} {of.igenebind[3].K}
(assert (= of_135 of_86))
; 
; =  {sc.vadd[11].OUT2} {sc.output.V[1].X}
(assert (= sc_71 sc_56))
; 
; =  {of.vadd[11].OUT2} {of.output.V[1].X}
(assert (= of_71 of_56))
; 
; =  {sc.vadd[11].OUT2} {sc.switch[5].Vmax}
(assert (= sc_71 sc_8))
; 
; =  {of.vadd[11].OUT2} {of.switch[5].Vmax}
(assert (= of_71 of_8))
; 
; =  {sc.iadd[7].OUT} {sc.iadd[6].B}
(assert (= sc_125 sc_139))
; 
; =  {of.iadd[7].OUT} {of.iadd[6].B}
(assert (= of_125 of_139))
; 
; =  {sc.input.V[1].O} {sc.vadd[2].A}
(assert (= sc_114 sc_61))
; 
; =  {of.input.V[1].O} {of.vadd[2].A}
(assert (= of_114 of_61))
; 
; =  {sc.input.I[7].O} {sc.iadd[7].C}
(assert (= sc_17 sc_122))
; 
; =  {of.input.I[7].O} {of.iadd[7].C}
(assert (= of_17 of_122))
; 
; =  {sc.input.I[13].O} {sc.itov[1].X}
(assert (= sc_19 sc_118))
; 
; =  {of.input.I[13].O} {of.itov[1].X}
(assert (= of_19 of_118))
; 
; =  {sc.input.V[7].O} {sc.switch[4].n}
(assert (= sc_94 sc_0))
; 
; =  {of.input.V[7].O} {of.switch[4].n}
(assert (= of_94 of_0))
; 
; =  {sc.input.I[17].O} {sc.iadd[9].C}
(assert (= sc_49 sc_127))
; 
; =  {of.input.I[17].O} {of.iadd[9].C}
(assert (= of_49 of_127))
; 
; =  {sc.input.I[8].O} {sc.iadd[9].A}
(assert (= sc_15 sc_128))
; 
; =  {of.input.I[8].O} {of.iadd[9].A}
(assert (= of_15 of_128))
; 
; =  {sc.iadd[9].OUT} {sc.igenebind[8].TF}
(assert (= sc_130 sc_81))
; 
; =  {of.iadd[9].OUT} {of.igenebind[8].TF}
(assert (= of_130 of_81))
; 
; =  {sc.input.I[21].O} {sc.iadd[10].D}
(assert (= sc_35 sc_131))
; 
; =  {of.input.I[21].O} {of.iadd[10].D}
(assert (= of_35 of_131))
; 
; =  {sc.switch[5].PROD} {sc.iadd[10].A}
(assert (= sc_9 sc_133))
; 
; =  {of.switch[5].PROD} {of.iadd[10].A}
(assert (= of_9 of_133))
; 
; =  {sc.switch[4].PROD} {sc.iadd[9].D}
(assert (= sc_4 sc_126))
; 
; =  {of.switch[4].PROD} {of.iadd[9].D}
(assert (= of_4 of_126))
; 
; =  {sc.input.V[0].O} {sc.ihill[0].n}
(assert (= sc_100 sc_72))
; 
; =  {of.input.V[0].O} {of.ihill[0].n}
(assert (= of_100 of_72))
; 
; =  {sc.input.V[10].O} {sc.itov[10].K}
(assert (= sc_104 sc_116))
; 
; =  {of.input.V[10].O} {of.itov[10].K}
(assert (= of_104 of_116))
; 
; =  {sc.igenebind[3].GE} {sc.itov[1].K}
(assert (= sc_88 sc_119))
; 
; =  {of.igenebind[3].GE} {of.itov[1].K}
(assert (= of_88 of_119))
; 
; =  {sc.itov[10].Y} {sc.vadd[11].B}
(assert (= sc_117 sc_69))
; 
; =  {of.itov[10].Y} {of.vadd[11].B}
(assert (= of_117 of_69))
; 
; =  {sc.input.I[19].O} {sc.iadd[10].C}
(assert (= sc_51 sc_132))
; 
; =  {of.input.I[19].O} {of.iadd[10].C}
(assert (= of_51 of_132))
; 
; =  {sc.input.V[4].O} {sc.vadd[11].A}
(assert (= sc_110 sc_68))
; 
; =  {of.input.V[4].O} {of.vadd[11].A}
(assert (= of_110 of_68))
; 
; =  {sc.input.V[5].O} {sc.vadd[11].OUT2_0}
(assert (= sc_112 sc_65))
; 
; =  {of.input.V[5].O} {of.vadd[11].OUT2_0}
(assert (= of_112 of_65))
; 
; =  {sc.input.V[6].O} {sc.vadd[2].OUT2_0}
(assert (= sc_106 sc_58))
; 
; =  {of.input.V[6].O} {of.vadd[2].OUT2_0}
(assert (= of_106 of_58))
; 
; =  {sc.input.I[11].O} {sc.igenebind[3].Vmax}
(assert (= sc_27 sc_87))
; 
; =  {of.input.I[11].O} {of.igenebind[3].Vmax}
(assert (= of_27 of_87))
(assert (<= (* (/ 1. sc_55) 0.001) 0.001))
(assert (<= (* (/ 1. sc_57) 0.001) 0.001))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].O} {sc.vadd[11].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_64 sc_55) (= sc_64 sc_71)) (= sc_64 sc_57)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_77 0.) sltop_77 (- sltop_77)) (ite (>= sltop_130 0.) sltop_130 (- sltop_130))) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= sltop_125 0.) sltop_125 (- sltop_125))) (ite (>= sltop_4 0.) sltop_4 (- sltop_4))) (ite (>= sltop_120 0.) sltop_120 (- sltop_120))) (ite (>= slbot_126 0.) slbot_126 (- slbot_126))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_84 0.) slbot_84 (- slbot_84))) (ite (>= slbot_133 0.) slbot_133 (- slbot_133))) (ite (>= slbot_120 0.) slbot_120 (- slbot_120))) (ite (>= slbot_119 0.) slbot_119 (- slbot_119))) (ite (>= slbot_130 0.) slbot_130 (- slbot_130))) (ite (>= slbot_125 0.) slbot_125 (- slbot_125))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_24 0.) sltop_24 (- sltop_24))) (ite (>= slbot_124 0.) slbot_124 (- slbot_124))) (ite (>= slbot_115 0.) slbot_115 (- slbot_115))) (ite (>= sltop_62 0.) sltop_62 (- sltop_62))) (ite (>= slbot_55 0.) slbot_55 (- slbot_55))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= slbot_54 0.) slbot_54 (- slbot_54))) (ite (>= slbot_56 0.) slbot_56 (- slbot_56))) (ite (>= sltop_133 0.) sltop_133 (- sltop_133))) (ite (>= slbot_81 0.) slbot_81 (- slbot_81))) (ite (>= sltop_115 0.) sltop_115 (- sltop_115))) (ite (>= sltop_64 0.) sltop_64 (- sltop_64))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= sltop_135 0.) sltop_135 (- sltop_135))) (ite (>= slbot_77 0.) slbot_77 (- slbot_77))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_135 0.) slbot_135 (- slbot_135))) (ite (>= slbot_139 0.) slbot_139 (- slbot_139))) (ite (>= slbot_69 0.) slbot_69 (- slbot_69))) (ite (>= sltop_84 0.) sltop_84 (- sltop_84))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= sltop_119 0.) sltop_119 (- sltop_119))) (ite (>= sltop_139 0.) sltop_139 (- sltop_139))) (ite (>= slbot_78 0.) slbot_78 (- slbot_78))) (ite (>= sltop_55 0.) sltop_55 (- sltop_55))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= sltop_70 0.) sltop_70 (- sltop_70))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= sltop_81 0.) sltop_81 (- sltop_81))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= slbot_140 0.) slbot_140 (- slbot_140))) (ite (>= slbot_63 0.) slbot_63 (- slbot_63))) (ite (>= sltop_54 0.) sltop_54 (- sltop_54))) (ite (>= slbot_64 0.) slbot_64 (- slbot_64))) (ite (>= sltop_124 0.) sltop_124 (- sltop_124))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= sltop_71 0.) sltop_71 (- sltop_71))) (ite (>= slbot_117 0.) slbot_117 (- slbot_117))) (ite (>= sltop_117 0.) sltop_117 (- sltop_117))) (ite (>= slbot_71 0.) slbot_71 (- slbot_71))) (ite (>= slbot_25 0.) slbot_25 (- slbot_25))) (ite (>= slbot_24 0.) slbot_24 (- slbot_24))) (ite (>= sltop_57 0.) sltop_57 (- sltop_57))) (ite (>= slbot_4 0.) slbot_4 (- slbot_4))) (ite (>= slbot_57 0.) slbot_57 (- slbot_57))) (ite (>= slbot_62 0.) slbot_62 (- slbot_62))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= sltop_56 0.) sltop_56 (- sltop_56))) (ite (>= sltop_140 0.) sltop_140 (- sltop_140))) (ite (>= slbot_70 0.) slbot_70 (- slbot_70))) (ite (>= slbot_73 0.) slbot_73 (- slbot_73))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= sltop_78 0.) sltop_78 (- sltop_78))) (ite (>= sltop_126 0.) sltop_126 (- sltop_126))) (ite (>= sltop_25 0.) sltop_25 (- sltop_25))) (ite (>= sltop_69 0.) sltop_69 (- sltop_69))) (ite (>= sltop_63 0.) sltop_63 (- sltop_63))) (ite (>= sltop_73 0.) sltop_73 (- sltop_73))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8)))))
(check-sat)
