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
; =  {(sc.switch[6].SUB/sc.switch[6].Kmod)} {1.}
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
; =  {sc.switch[6].PROD} {(sc.switch[6].Vmax/1.)}
(assert (= sc_9 (/ sc_8 1.)))
; 
; =  {of.switch[6].PROD} {0.}
(assert (= of_9 0.))
; 
; >=  {((sc.switch[6].n*-500.)+of.switch[6].n)} {3300.}
(assert (<= (+ (* sc_5 -500.) of_5) 3300.))
; 
; <=  {((sc.switch[6].n*-500.)+of.switch[6].n)} {0.5}
(assert (>= (+ (* sc_5 -500.) of_5) 0.5))
; 
; >=  {((sc.switch[6].SUB*1.)+of.switch[6].SUB)} {10.}
(assert (<= (+ (* sc_6 1.) of_6) 10.))
; 
; <=  {((sc.switch[6].SUB*1.)+of.switch[6].SUB)} {0.0001}
(assert (>= (+ (* sc_6 1.) of_6) 0.0001))
; 
; >=  {((sc.switch[6].Kmod*-0.5)+of.switch[6].Kmod)} {10.}
(assert (<= (+ (* sc_7 -0.5) of_7) 10.))
; 
; <=  {((sc.switch[6].Kmod*-0.5)+of.switch[6].Kmod)} {0.0001}
(assert (>= (+ (* sc_7 -0.5) of_7) 0.0001))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.switch[6].PROD*-0.6)+of.switch[6].PROD)+sl.min.switch[6].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_9 -0.6) of_9) slbot_9) 9.99934002508e-38))
; 
; =  {(((sc.switch[6].PROD*0.)+of.switch[6].PROD)+sl.max.switch[6].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_9 0.) of_9) sltop_9) 9.9999999))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[6].Vmax*0.)+of.switch[6].Vmax)+sl.min.switch[6].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 0.0001))
; 
; =  {(((sc.switch[6].Vmax*0.6)+of.switch[6].Vmax)+sl.max.switch[6].Vmax)} {10.}
(assert (= (+ (+ (* sc_8 0.6) of_8) sltop_8) 10.))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.switch[6].PROD*-0.6)+of.switch[6].PROD)+sl.min.switch[6].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_9 -0.6) of_9) slbot_9) 9.99934002508e-38))
; 
; =  {(((sc.switch[6].PROD*0.)+of.switch[6].PROD)+sl.max.switch[6].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_9 0.) of_9) sltop_9) 9.9999999))
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_11 sc_10))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_11 of_10))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_10 0.) of_10) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_10 0.) of_10) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_11 0.) of_11) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_13 sc_12))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_13 of_12))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_12 0.) of_12) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_13 0.) of_13) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_15 sc_14))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_15 of_14))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_17 sc_16))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_17 of_16))
; 
; >=  {((sc.input.I[13].X*4.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_16 4.) of_16) 10.))
; 
; <=  {((sc.input.I[13].X*4.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_16 4.) of_16) 0.))
; 
; >=  {((sc.input.I[13].O*4.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_17 4.) of_17) 10.))
; 
; <=  {((sc.input.I[13].O*4.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_17 4.) of_17) 0.))
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_19 sc_18))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_19 of_18))
; 
; >=  {((sc.input.I[12].X*4.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_18 4.) of_18) 10.))
; 
; <=  {((sc.input.I[12].X*4.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_18 4.) of_18) 0.))
; 
; >=  {((sc.input.I[12].O*4.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_19 4.) of_19) 10.))
; 
; <=  {((sc.input.I[12].O*4.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_19 4.) of_19) 0.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_21 sc_20))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_21 of_20))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_21 0.) of_21) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_23 sc_22))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_23 of_22))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.input.I[0].X*0.)+of.input.I[0].X)+sl.min.input.I[0].X)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.input.I[0].X*0.6)+of.input.I[0].X)+sl.max.input.I[0].X)} {10.}
(assert (= (+ (+ (* sc_22 0.6) of_22) sltop_22) 10.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.input.I[0].O*0.)+of.input.I[0].O)+sl.min.input.I[0].O)} {0.}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) 0.))
; 
; =  {(((sc.input.I[0].O*0.6)+of.input.I[0].O)+sl.max.input.I[0].O)} {10.}
(assert (= (+ (+ (* sc_23 0.6) of_23) sltop_23) 10.))
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_25 sc_24))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_25 of_24))
; 
; >=  {((sc.input.I[11].X*15.6)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_24 15.6) of_24) 10.))
; 
; <=  {((sc.input.I[11].X*15.6)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_24 15.6) of_24) 0.))
; 
; >=  {((sc.input.I[11].O*15.6)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_25 15.6) of_25) 10.))
; 
; <=  {((sc.input.I[11].O*15.6)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_25 15.6) of_25) 0.))
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_27 sc_26))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_27 of_26))
; 
; >=  {((sc.input.I[10].X*337.632520764)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_26 337.632520764) of_26) 10.))
; 
; <=  {((sc.input.I[10].X*337.632520764)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_26 337.632520764) of_26) 0.))
; 
; >=  {((sc.input.I[10].O*337.632520764)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_27 337.632520764) of_27) 10.))
; 
; <=  {((sc.input.I[10].O*337.632520764)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_27 337.632520764) of_27) 0.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_29 sc_28))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_29 of_28))
; 
; >=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_28 1.) of_28) 10.))
; 
; <=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_28 1.) of_28) 0.))
; 
; >=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_29 1.) of_29) 10.))
; 
; <=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_29 1.) of_29) 0.))
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_31 sc_30))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_31 of_30))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_30 0.) of_30) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_31 0.) of_31) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_33 sc_32))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_33 of_32))
; 
; >=  {((sc.input.I[14].X*-0.5)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_32 -0.5) of_32) 10.))
; 
; <=  {((sc.input.I[14].X*-0.5)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_32 -0.5) of_32) 0.))
; 
; >=  {((sc.input.I[14].O*-0.5)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_33 -0.5) of_33) 10.))
; 
; <=  {((sc.input.I[14].O*-0.5)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_33 -0.5) of_33) 0.))
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; 
; =  {sc.input.I[24].O} {sc.input.I[24].X}
(assert (= sc_35 sc_34))
; 
; =  {of.input.I[24].O} {of.input.I[24].X}
(assert (= of_35 of_34))
; 
; >=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_36 1.) of_36) 10.))
; 
; <=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_36 1.) of_36) 0.))
; 
; >=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_37 1.) of_37) 10.))
; 
; <=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_37 1.) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_38 0.) of_38) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_39 0.) of_39) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_40 0.) of_40) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_41 0.) of_41) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_42 0.) of_42) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_43 0.) of_43) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.I[23].O} {sc.input.I[23].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.I[23].O} {of.input.I[23].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.I[23].X*0.)+of.input.I[23].X)} {10.}
(assert (<= (+ (* sc_44 0.) of_44) 10.))
; 
; <=  {((sc.input.I[23].X*0.)+of.input.I[23].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.I[23].O*0.)+of.input.I[23].O)} {10.}
(assert (<= (+ (* sc_45 0.) of_45) 10.))
; 
; <=  {((sc.input.I[23].O*0.)+of.input.I[23].O)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.I[25].O} {sc.input.I[25].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.I[25].O} {of.input.I[25].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.I[25].X*0.)+of.input.I[25].X)} {10.}
(assert (<= (+ (* sc_46 0.) of_46) 10.))
; 
; <=  {((sc.input.I[25].X*0.)+of.input.I[25].X)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
; 
; >=  {((sc.input.I[25].O*0.)+of.input.I[25].O)} {10.}
(assert (<= (+ (* sc_47 0.) of_47) 10.))
; 
; <=  {((sc.input.I[25].O*0.)+of.input.I[25].O)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_48 156.25) of_48) 10.))
; 
; <=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_48 156.25) of_48) 0.))
; 
; >=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_49 156.25) of_49) 10.))
; 
; <=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_49 156.25) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_50 1.) of_50) 10.))
; 
; <=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_50 1.) of_50) 0.))
; 
; >=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_51 1.) of_51) 10.))
; 
; <=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_51 1.) of_51) 0.))
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
; =  {sc.input.I[19].O} {sc.input.I[19].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.I[19].O} {of.input.I[19].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.I[19].X*1.)+of.input.I[19].X)} {10.}
(assert (<= (+ (* sc_54 1.) of_54) 10.))
; 
; <=  {((sc.input.I[19].X*1.)+of.input.I[19].X)} {0.}
(assert (>= (+ (* sc_54 1.) of_54) 0.))
; 
; >=  {((sc.input.I[19].O*1.)+of.input.I[19].O)} {10.}
(assert (<= (+ (* sc_55 1.) of_55) 10.))
; 
; <=  {((sc.input.I[19].O*1.)+of.input.I[19].O)} {0.}
(assert (>= (+ (* sc_55 1.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_57 sc_56))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_57 of_56))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_56 156.25) of_56) sltop_56) 3300.))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_57 156.25) of_57) sltop_57) 3300.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_59 sc_58))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_59 of_58))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_58 15.6) of_58) sltop_58) 3300.))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_59 15.6) of_59) sltop_59) 3300.))
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
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_63 (* 1. sc_64)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D)}
(assert (and (= sc_63 (* 1. sc_62)) (= sc_63 (* 1. sc_61))))
; no offset
(assert (= (- (+ of_63 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1.)}
(assert (= sc_65 (* sc_63 1.)))
; 
; =  {of.vadd[2].OUT} {0.}
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
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_63 (* 1. sc_64)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D*sc.vadd[2].OUT2)}
(assert (and (= sc_63 (* 1. sc_62)) (= sc_63 (* (* 1. sc_61) sc_66))))
; no offset
(assert (= (- (+ of_63 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1.)}
(assert (= sc_66 (* sc_63 1.)))
; no offset
(assert (= of_66 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1.)}
(assert (= sc_60 (* sc_63 1.)))
; 
; =  {of.vadd[2].OUT2_0} {0.}
(assert (= of_60 0.))
; 
; >=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
; 
; >=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {3300.}
(assert (<= (+ (* sc_61 4.) of_61) 3300.))
; 
; <=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {0.}
(assert (>= (+ (* sc_61 4.) of_61) 0.))
; 
; >=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {3300.}
(assert (<= (+ (* sc_62 0.) of_62) 3300.))
; 
; <=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
; 
; >=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {3300.}
(assert (<= (+ (* sc_63 0.) of_63) 3300.))
; 
; <=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_66 0.) of_66) slbot_66) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_66 156.25) of_66) sltop_66) 3300.))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.vadd[2].B*3.75903614458)+of.vadd[2].B)+sl.min.vadd[2].B)} {0.}
(assert (= (+ (+ (* sc_64 3.75903614458) of_64) slbot_64) 0.))
; 
; =  {(((sc.vadd[2].B*62.4)+of.vadd[2].B)+sl.max.vadd[2].B)} {3300.}
(assert (= (+ (+ (* sc_64 62.4) of_64) sltop_64) 3300.))
(declare-fun slbot_65 () Real)
(declare-fun sltop_65 () Real)
; 
; =  {(((sc.vadd[2].OUT*3.75903614458)+of.vadd[2].OUT)+sl.min.vadd[2].OUT)} {-1650.}
(assert (= (+ (+ (* sc_65 3.75903614458) of_65) slbot_65) -1650.))
; 
; =  {(((sc.vadd[2].OUT*62.4)+of.vadd[2].OUT)+sl.max.vadd[2].OUT)} {1650.}
(assert (= (+ (+ (* sc_65 62.4) of_65) sltop_65) 1650.))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_66 0.) of_66) slbot_66) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_66 156.25) of_66) sltop_66) 3300.))
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
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_68 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_71 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_70 (* 1. sc_71)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_70 (* 1. sc_69)) (= sc_70 (* 1. sc_68))))
; no offset
(assert (= (- (+ of_70 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_72 (* sc_70 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
(assert (= of_72 0.))
; no scale
(assert (= sc_68 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_68 0.))
; no offset
(assert (= of_73 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_71 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_70 (* 1. sc_71)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_70 (* 1. sc_69)) (= sc_70 (* (* 1. sc_68) sc_73))))
; no offset
(assert (= (- (+ of_70 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_73 (* sc_70 1.)))
; no offset
(assert (= of_73 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_67 (* sc_70 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_67 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_67 0.) of_67) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
; 
; >=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {3300.}
(assert (<= (+ (* sc_68 4.) of_68) 3300.))
; 
; <=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {0.}
(assert (>= (+ (* sc_68 4.) of_68) 0.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_69 0.) of_69) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_70 0.) of_70) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_73 15.6) of_73) sltop_73) 3300.))
(declare-fun slbot_71 () Real)
(declare-fun sltop_71 () Real)
; 
; =  {(((sc.vadd[5].B*0.00204799328914)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_71 0.00204799328914) of_71) slbot_71) 0.))
; 
; =  {(((sc.vadd[5].B*625.)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_71 625.) of_71) sltop_71) 3300.))
(declare-fun slbot_72 () Real)
(declare-fun sltop_72 () Real)
; 
; =  {(((sc.vadd[5].OUT*0.00204799328914)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_72 0.00204799328914) of_72) slbot_72) -1650.))
; 
; =  {(((sc.vadd[5].OUT*625.)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_72 625.) of_72) sltop_72) 1650.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_73 15.6) of_73) sltop_73) 3300.))
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
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; no offset
(assert (= of_75 0.))
; no offset
(assert (= of_76 0.))
; no scale
(assert (= (/ sc_75 sc_76) 1.))
; no scale
(assert (= sc_74 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_74 0.))
; no offset
(assert (= of_75 0.))
; no offset
(assert (= of_76 0.))
; no scale
(assert (= (/ sc_75 sc_76) 1.))
; no scale
(assert (= sc_74 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_74 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_77 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_78 (* sc_77 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_78 0.))
; no scale
(assert (= sc_76 1.))
; no scale
(assert (= (* sc_74 1.) 1.))
; no offset
(assert (= of_76 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_76 1.))
; no scale
(assert (= (* sc_74 1.) 1.))
; no offset
(assert (= of_76 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_75 1.))
; no scale
(assert (= sc_74 1.))
; no offset
(assert (= of_75 0.))
; no offset
(assert (= of_74 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_77 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_79 (* sc_77 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_79 0.))
; 
; >=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_74 2.5) of_74) 5.))
; 
; <=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_74 2.5) of_74) 1.))
(declare-fun slbot_75 () Real)
(declare-fun sltop_75 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_75 0.) of_75) slbot_75) 1.))
; 
; =  {(((sc.ihill[0].S*156.25)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_75 156.25) of_75) sltop_75) 10.))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.ihill[0].REP*0.000511998322284)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {9.999900001e-10}
(assert (= (+ (+ (* sc_79 0.000511998322284) of_79) slbot_79) 9.999900001e-10))
; 
; =  {(((sc.ihill[0].REP*156.25)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {5.}
(assert (= (+ (+ (* sc_79 156.25) of_79) sltop_79) 5.))
; 
; >=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_77 156.25) of_77) 10.))
; 
; <=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_77 156.25) of_77) 0.0001))
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
(assert (= 0. 0.))
; no offset
(assert (= of_81 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_80 0.))
; 
; =  {sc.vtoi[0].Y} {((1./sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_82 (* (/ 1. sc_81) sc_80)))
; 
; =  {of.vtoi[0].Y} {0.}
(assert (= of_82 0.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 1.))
; 
; =  {(((sc.vtoi[0].X*156.25)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_80 156.25) of_80) sltop_80) 3300.))
; 
; >=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_81 1.) of_81) 3300.))
; 
; <=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_81 1.) of_81) 1.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*156.25)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_82 156.25) of_82) sltop_82) 3300.))
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
; =  {1.} {(sc.igenebind[10].K*sc.igenebind[10].TF)}
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
; =  {sc.igenebind[10].GE} {(sc.igenebind[10].Vmax*(1./1.))}
(assert (= sc_86 (* sc_85 (/ 1. 1.))))
; 
; =  {of.igenebind[10].GE} {0.}
(assert (= of_86 0.))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.igenebind[10].TF*-1.)+of.igenebind[10].TF)+sl.min.igenebind[10].TF)} {0.0001}
(assert (= (+ (+ (* sc_83 -1.) of_83) slbot_83) 0.0001))
; 
; =  {(((sc.igenebind[10].TF*-0.4)+of.igenebind[10].TF)+sl.max.igenebind[10].TF)} {10.}
(assert (= (+ (+ (* sc_83 -0.4) of_83) sltop_83) 10.))
; 
; >=  {((sc.igenebind[10].K*1.)+of.igenebind[10].K)} {10.}
(assert (<= (+ (* sc_84 1.) of_84) 10.))
; 
; <=  {((sc.igenebind[10].K*1.)+of.igenebind[10].K)} {0.0001}
(assert (>= (+ (* sc_84 1.) of_84) 0.0001))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.igenebind[10].GE*0.)+of.igenebind[10].GE)+sl.min.igenebind[10].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[10].GE*1.66666666667)+of.igenebind[10].GE)+sl.max.igenebind[10].GE)} {9.9999999}
(assert (= (+ (+ (* sc_86 1.66666666667) of_86) sltop_86) 9.9999999))
; 
; >=  {((sc.igenebind[10].Vmax*1.)+of.igenebind[10].Vmax)} {10.}
(assert (<= (+ (* sc_85 1.) of_85) 10.))
; 
; <=  {((sc.igenebind[10].Vmax*1.)+of.igenebind[10].Vmax)} {0.0001}
(assert (>= (+ (* sc_85 1.) of_85) 0.0001))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.igenebind[10].GE*0.)+of.igenebind[10].GE)+sl.min.igenebind[10].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[10].GE*1.66666666667)+of.igenebind[10].GE)+sl.max.igenebind[10].GE)} {9.9999999}
(assert (= (+ (+ (* sc_86 1.66666666667) of_86) sltop_86) 9.9999999))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
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
(assert (= of_88 0.))
; no offset
(assert (= of_87 0.))
; 
; =  {1.} {(sc.igenebind[3].K*sc.igenebind[3].TF)}
(assert (= 1. (* sc_88 sc_87)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_89 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[3].GE} {(sc.igenebind[3].Vmax*(1./1.))}
(assert (= sc_90 (* sc_89 (/ 1. 1.))))
; 
; =  {of.igenebind[3].GE} {0.}
(assert (= of_90 0.))
; 
; >=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {10.}
(assert (<= (+ (* sc_87 1.) of_87) 10.))
; 
; <=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {0.0001}
(assert (>= (+ (* sc_87 1.) of_87) 0.0001))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.igenebind[3].K*0.)+of.igenebind[3].K)+sl.min.igenebind[3].K)} {0.0001}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.0001))
; 
; =  {(((sc.igenebind[3].K*15.6)+of.igenebind[3].K)+sl.max.igenebind[3].K)} {10.}
(assert (= (+ (+ (* sc_88 15.6) of_88) sltop_88) 10.))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.igenebind[3].GE*0.939759036145)+of.igenebind[3].GE)+sl.min.igenebind[3].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_90 0.939759036145) of_90) slbot_90) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[3].GE*15.6)+of.igenebind[3].GE)+sl.max.igenebind[3].GE)} {9.9999999}
(assert (= (+ (+ (* sc_90 15.6) of_90) sltop_90) 9.9999999))
; 
; >=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {10.}
(assert (<= (+ (* sc_89 15.6) of_89) 10.))
; 
; <=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {0.0001}
(assert (>= (+ (* sc_89 15.6) of_89) 0.0001))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_92 sc_91))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_92 of_91))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_91 0.) of_91) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_92 0.) of_92) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_92 0.) of_92) 0.))
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_94 sc_93))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_94 of_93))
; 
; >=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_93 4.) of_93) 3300.))
; 
; <=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_93 4.) of_93) 0.))
; 
; >=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_94 4.) of_94) 3300.))
; 
; <=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_94 4.) of_94) 0.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_96 sc_95))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_96 of_95))
; 
; >=  {((sc.input.V[7].X*-500.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_95 -500.) of_95) 3300.))
; 
; <=  {((sc.input.V[7].X*-500.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_95 -500.) of_95) 0.))
; 
; >=  {((sc.input.V[7].O*-500.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_96 -500.) of_96) 3300.))
; 
; <=  {((sc.input.V[7].O*-500.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_96 -500.) of_96) 0.))
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_98 sc_97))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_98 of_97))
; 
; >=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_97 1.) of_97) 3300.))
; 
; <=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_97 1.) of_97) 0.))
; 
; >=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_98 1.) of_98) 3300.))
; 
; <=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_98 1.) of_98) 0.))
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_100 sc_99))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_100 of_99))
; 
; >=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_99 4.) of_99) 3300.))
; 
; <=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_99 4.) of_99) 0.))
; 
; >=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_100 4.) of_100) 3300.))
; 
; <=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_100 4.) of_100) 0.))
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_102 sc_101))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_102 of_101))
; 
; >=  {((sc.input.V[0].X*2.5)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_101 2.5) of_101) 3300.))
; 
; <=  {((sc.input.V[0].X*2.5)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_101 2.5) of_101) 0.))
; 
; >=  {((sc.input.V[0].O*2.5)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_102 2.5) of_102) 3300.))
; 
; <=  {((sc.input.V[0].O*2.5)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_102 2.5) of_102) 0.))
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
; >=  {((sc.input.V[10].X*1000.75)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_103 1000.75) of_103) 3300.))
; 
; <=  {((sc.input.V[10].X*1000.75)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_103 1000.75) of_103) 0.))
; 
; >=  {((sc.input.V[10].O*1000.75)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_104 1000.75) of_104) 3300.))
; 
; <=  {((sc.input.V[10].O*1000.75)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_104 1000.75) of_104) 0.))
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
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_117 (* sc_116 sc_115)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_117 0.))
; 
; >=  {((sc.itov[4].X*4.)+of.itov[4].X)} {10.}
(assert (<= (+ (* sc_115 4.) of_115) 10.))
; 
; <=  {((sc.itov[4].X*4.)+of.itov[4].X)} {0.0001}
(assert (>= (+ (* sc_115 4.) of_115) 0.0001))
(declare-fun slbot_117 () Real)
(declare-fun sltop_117 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_117 0.00204799328914) of_117) slbot_117) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_117 625.) of_117) sltop_117) 3300.))
(declare-fun slbot_116 () Real)
(declare-fun sltop_116 () Real)
; 
; =  {(((sc.itov[4].K*0.000511998322284)+of.itov[4].K)+sl.min.itov[4].K)} {1.}
(assert (= (+ (+ (* sc_116 0.000511998322284) of_116) slbot_116) 1.))
; 
; =  {(((sc.itov[4].K*156.25)+of.itov[4].K)+sl.max.itov[4].K)} {330.}
(assert (= (+ (+ (* sc_116 156.25) of_116) sltop_116) 330.))
(declare-fun slbot_117 () Real)
(declare-fun sltop_117 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_117 0.00204799328914) of_117) slbot_117) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
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
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_123 sc_124))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_123 sc_122) (= sc_123 sc_121)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_125 sc_123))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_125 (- (+ of_123 of_124) (+ of_122 of_121))))
; 
; >=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {5.}
(assert (<= (+ (* sc_121 0.) of_121) 5.))
; 
; <=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {0.}
(assert (>= (+ (* sc_121 0.) of_121) 0.))
; 
; >=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {5.}
(assert (<= (+ (* sc_122 0.) of_122) 5.))
; 
; <=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {0.}
(assert (>= (+ (* sc_122 0.) of_122) 0.))
(declare-fun slbot_125 () Real)
(declare-fun sltop_125 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_125 0.) of_125) slbot_125) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_125 1.66666666667) of_125) sltop_125) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_123 0.) of_123) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_123 0.) of_123) 0.))
(declare-fun slbot_124 () Real)
(declare-fun sltop_124 () Real)
; 
; =  {(((sc.iadd[8].B*0.)+of.iadd[8].B)+sl.min.iadd[8].B)} {0.}
(assert (= (+ (+ (* sc_124 0.) of_124) slbot_124) 0.))
; 
; =  {(((sc.iadd[8].B*1.66666666667)+of.iadd[8].B)+sl.max.iadd[8].B)} {5.}
(assert (= (+ (+ (* sc_124 1.66666666667) of_124) sltop_124) 5.))
(declare-fun slbot_125 () Real)
(declare-fun sltop_125 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_125 0.) of_125) slbot_125) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
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
; =  {sc.iadd[12].A} {sc.iadd[12].B}
(assert (= sc_128 sc_129))
; 
; =  {sc.iadd[12].A} {sc.iadd[12].C} {sc.iadd[12].D}
(assert (and (= sc_128 sc_127) (= sc_128 sc_126)))
; 
; =  {sc.iadd[12].OUT} {sc.iadd[12].A}
(assert (= sc_130 sc_128))
; 
; =  {of.iadd[12].OUT} {((of.iadd[12].A+of.iadd[12].B)-of.iadd[12].C-of.iadd[12].D)}
(assert (= of_130 (- (+ of_128 of_129) (+ of_127 of_126))))
; 
; >=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {5.}
(assert (<= (+ (* sc_126 0.) of_126) 5.))
; 
; <=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {0.}
(assert (>= (+ (* sc_126 0.) of_126) 0.))
; 
; >=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {5.}
(assert (<= (+ (* sc_127 0.) of_127) 5.))
; 
; <=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {0.}
(assert (>= (+ (* sc_127 0.) of_127) 0.))
; 
; >=  {((sc.iadd[12].A*0.)+of.iadd[12].A)} {5.}
(assert (<= (+ (* sc_128 0.) of_128) 5.))
; 
; <=  {((sc.iadd[12].A*0.)+of.iadd[12].A)} {0.}
(assert (>= (+ (* sc_128 0.) of_128) 0.))
(declare-fun slbot_129 () Real)
(declare-fun sltop_129 () Real)
; 
; =  {(((sc.iadd[12].B*0.)+of.iadd[12].B)+sl.min.iadd[12].B)} {0.}
(assert (= (+ (+ (* sc_129 0.) of_129) slbot_129) 0.))
; 
; =  {(((sc.iadd[12].B*15.6)+of.iadd[12].B)+sl.max.iadd[12].B)} {5.}
(assert (= (+ (+ (* sc_129 15.6) of_129) sltop_129) 5.))
(declare-fun slbot_130 () Real)
(declare-fun sltop_130 () Real)
; 
; =  {(((sc.iadd[12].OUT*0.)+of.iadd[12].OUT)+sl.min.iadd[12].OUT)} {-10.}
(assert (= (+ (+ (* sc_130 0.) of_130) slbot_130) -10.))
; 
; =  {(((sc.iadd[12].OUT*15.6)+of.iadd[12].OUT)+sl.max.iadd[12].OUT)} {10.}
(assert (= (+ (+ (* sc_130 15.6) of_130) sltop_130) 10.))
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
; =  {sc.iadd[9].A} {sc.iadd[9].B}
(assert (= sc_133 sc_134))
; 
; =  {sc.iadd[9].A} {sc.iadd[9].C} {sc.iadd[9].D}
(assert (and (= sc_133 sc_132) (= sc_133 sc_131)))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[9].A}
(assert (= sc_135 sc_133))
; 
; =  {of.iadd[9].OUT} {((of.iadd[9].A+of.iadd[9].B)-of.iadd[9].C-of.iadd[9].D)}
(assert (= of_135 (- (+ of_133 of_134) (+ of_132 of_131))))
; 
; >=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {5.}
(assert (<= (+ (* sc_131 0.) of_131) 5.))
; 
; <=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {0.}
(assert (>= (+ (* sc_131 0.) of_131) 0.))
; 
; >=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {5.}
(assert (<= (+ (* sc_132 0.) of_132) 5.))
; 
; <=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {0.}
(assert (>= (+ (* sc_132 0.) of_132) 0.))
(declare-fun slbot_135 () Real)
(declare-fun sltop_135 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_135 0.) of_135) slbot_135) -10.))
; 
; =  {(((sc.iadd[9].OUT*1.66666666667)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_135 1.66666666667) of_135) sltop_135) 10.))
; 
; >=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {5.}
(assert (<= (+ (* sc_133 0.) of_133) 5.))
; 
; <=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {0.}
(assert (>= (+ (* sc_133 0.) of_133) 0.))
(declare-fun slbot_134 () Real)
(declare-fun sltop_134 () Real)
; 
; =  {(((sc.iadd[9].B*0.)+of.iadd[9].B)+sl.min.iadd[9].B)} {0.}
(assert (= (+ (+ (* sc_134 0.) of_134) slbot_134) 0.))
; 
; =  {(((sc.iadd[9].B*1.66666666667)+of.iadd[9].B)+sl.max.iadd[9].B)} {5.}
(assert (= (+ (+ (* sc_134 1.66666666667) of_134) sltop_134) 5.))
(declare-fun slbot_135 () Real)
(declare-fun sltop_135 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_135 0.) of_135) slbot_135) -10.))
; 
; =  {(((sc.iadd[9].OUT*1.66666666667)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_135 1.66666666667) of_135) sltop_135) 10.))
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
; =  {sc.iadd[11].A} {sc.iadd[11].B}
(assert (= sc_138 sc_139))
; 
; =  {sc.iadd[11].A} {sc.iadd[11].C} {sc.iadd[11].D}
(assert (and (= sc_138 sc_137) (= sc_138 sc_136)))
; 
; =  {sc.iadd[11].OUT} {sc.iadd[11].A}
(assert (= sc_140 sc_138))
; 
; =  {of.iadd[11].OUT} {((of.iadd[11].A+of.iadd[11].B)-of.iadd[11].C-of.iadd[11].D)}
(assert (= of_140 (- (+ of_138 of_139) (+ of_137 of_136))))
(declare-fun slbot_136 () Real)
(declare-fun sltop_136 () Real)
; 
; =  {(((sc.iadd[11].D*-0.6)+of.iadd[11].D)+sl.min.iadd[11].D)} {0.}
(assert (= (+ (+ (* sc_136 -0.6) of_136) slbot_136) 0.))
; 
; =  {(((sc.iadd[11].D*0.)+of.iadd[11].D)+sl.max.iadd[11].D)} {5.}
(assert (= (+ (+ (* sc_136 0.) of_136) sltop_136) 5.))
; 
; >=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {5.}
(assert (<= (+ (* sc_137 1.) of_137) 5.))
; 
; <=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {0.}
(assert (>= (+ (* sc_137 1.) of_137) 0.))
(declare-fun slbot_140 () Real)
(declare-fun sltop_140 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_140 -1.) of_140) slbot_140) -10.))
; 
; =  {(((sc.iadd[11].OUT*-0.4)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_140 -0.4) of_140) sltop_140) 10.))
; 
; >=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {5.}
(assert (<= (+ (* sc_138 0.) of_138) 5.))
; 
; <=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {0.}
(assert (>= (+ (* sc_138 0.) of_138) 0.))
; 
; >=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {5.}
(assert (<= (+ (* sc_139 0.) of_139) 5.))
; 
; <=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {0.}
(assert (>= (+ (* sc_139 0.) of_139) 0.))
(declare-fun slbot_140 () Real)
(declare-fun sltop_140 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_140 -1.) of_140) slbot_140) -10.))
; 
; =  {(((sc.iadd[11].OUT*-0.4)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_140 -0.4) of_140) sltop_140) 10.))
; 
; =  {sc.input.I[6].O} {sc.iadd[9].A}
(assert (= sc_31 sc_133))
; 
; =  {of.input.I[6].O} {of.iadd[9].A}
(assert (= of_31 of_133))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].X}
(assert (= sc_66 sc_56))
; 
; =  {of.vadd[2].OUT2} {of.output.V[0].X}
(assert (= of_66 of_56))
; 
; =  {sc.vadd[2].OUT2} {sc.vtoi[0].X}
(assert (= sc_66 sc_80))
; 
; =  {of.vadd[2].OUT2} {of.vtoi[0].X}
(assert (= of_66 of_80))
; 
; =  {sc.input.I[0].O} {sc.switch[6].Vmax}
(assert (= sc_23 sc_8))
; 
; =  {of.input.I[0].O} {of.switch[6].Vmax}
(assert (= of_23 of_8))
; 
; =  {sc.switch[7].PROD} {sc.iadd[12].B}
(assert (= sc_4 sc_129))
; 
; =  {of.switch[7].PROD} {of.iadd[12].B}
(assert (= of_4 of_129))
; 
; =  {sc.input.V[9].O} {sc.vadd[5].D}
(assert (= sc_100 sc_68))
; 
; =  {of.input.V[9].O} {of.vadd[5].D}
(assert (= of_100 of_68))
; 
; =  {sc.ihill[0].REP} {sc.itov[4].K}
(assert (= sc_79 sc_116))
; 
; =  {of.ihill[0].REP} {of.itov[4].K}
(assert (= of_79 of_116))
; 
; =  {sc.itov[1].Y} {sc.vadd[2].B}
(assert (= sc_120 sc_64))
; 
; =  {of.itov[1].Y} {of.vadd[2].B}
(assert (= of_120 of_64))
; 
; =  {sc.input.I[25].O} {sc.iadd[12].A}
(assert (= sc_47 sc_128))
; 
; =  {of.input.I[25].O} {of.iadd[12].A}
(assert (= of_47 of_128))
; 
; =  {sc.input.I[18].O} {sc.iadd[11].C}
(assert (= sc_53 sc_137))
; 
; =  {of.input.I[18].O} {of.iadd[11].C}
(assert (= of_53 of_137))
; 
; =  {sc.input.I[9].O} {sc.iadd[11].A}
(assert (= sc_21 sc_138))
; 
; =  {of.input.I[9].O} {of.iadd[11].A}
(assert (= of_21 of_138))
; 
; =  {sc.input.I[4].O} {sc.iadd[8].C}
(assert (= sc_41 sc_122))
; 
; =  {of.input.I[4].O} {of.iadd[8].C}
(assert (= of_41 of_122))
; 
; =  {sc.input.I[16].O} {sc.switch[6].SUB}
(assert (= sc_37 sc_6))
; 
; =  {of.input.I[16].O} {of.switch[6].SUB}
(assert (= of_37 of_6))
; 
; =  {sc.input.I[3].O} {sc.iadd[8].A}
(assert (= sc_39 sc_123))
; 
; =  {of.input.I[3].O} {of.iadd[8].A}
(assert (= of_39 of_123))
; 
; =  {sc.igenebind[10].GE} {sc.iadd[9].B}
(assert (= sc_86 sc_134))
; 
; =  {of.igenebind[10].GE} {of.iadd[9].B}
(assert (= of_86 of_134))
; 
; =  {sc.input.I[5].O} {sc.iadd[9].D}
(assert (= sc_43 sc_131))
; 
; =  {of.input.I[5].O} {of.iadd[9].D}
(assert (= of_43 of_131))
; 
; =  {sc.vtoi[0].Y} {sc.ihill[0].S}
(assert (= sc_82 sc_75))
; 
; =  {of.vtoi[0].Y} {of.ihill[0].S}
(assert (= of_82 of_75))
; 
; =  {sc.iadd[12].OUT} {sc.igenebind[3].K}
(assert (= sc_130 sc_88))
; 
; =  {of.iadd[12].OUT} {of.igenebind[3].K}
(assert (= of_130 of_88))
; 
; =  {sc.input.I[14].O} {sc.switch[6].Kmod}
(assert (= sc_33 sc_7))
; 
; =  {of.input.I[14].O} {of.switch[6].Kmod}
(assert (= of_33 of_7))
; 
; =  {sc.input.V[12].O} {sc.vtoi[0].K}
(assert (= sc_98 sc_81))
; 
; =  {of.input.V[12].O} {of.vtoi[0].K}
(assert (= of_98 of_81))
; 
; =  {sc.input.V[8].O} {sc.vadd[2].D}
(assert (= sc_94 sc_61))
; 
; =  {of.input.V[8].O} {of.vadd[2].D}
(assert (= of_94 of_61))
; 
; =  {sc.input.I[2].O} {sc.iadd[8].D}
(assert (= sc_11 sc_121))
; 
; =  {of.input.I[2].O} {of.iadd[8].D}
(assert (= of_11 of_121))
; 
; =  {sc.input.V[2].O} {sc.vadd[2].C}
(assert (= sc_92 sc_62))
; 
; =  {of.input.V[2].O} {of.vadd[2].C}
(assert (= of_92 of_62))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[1].X}
(assert (= sc_73 sc_58))
; 
; =  {of.vadd[5].OUT2} {of.output.V[1].X}
(assert (= of_73 of_58))
; 
; =  {sc.vadd[5].OUT2} {sc.switch[7].Vmax}
(assert (= sc_73 sc_3))
; 
; =  {of.vadd[5].OUT2} {of.switch[7].Vmax}
(assert (= of_73 of_3))
; 
; =  {sc.input.V[3].O} {sc.vadd[5].A}
(assert (= sc_108 sc_70))
; 
; =  {of.input.V[3].O} {of.vadd[5].A}
(assert (= of_108 of_70))
; 
; =  {sc.switch[6].PROD} {sc.iadd[11].D}
(assert (= sc_9 sc_136))
; 
; =  {of.switch[6].PROD} {of.iadd[11].D}
(assert (= of_9 of_136))
; 
; =  {sc.input.I[24].O} {sc.iadd[12].D}
(assert (= sc_35 sc_126))
; 
; =  {of.input.I[24].O} {of.iadd[12].D}
(assert (= of_35 of_126))
; 
; =  {sc.input.I[15].O} {sc.igenebind[3].TF}
(assert (= sc_29 sc_87))
; 
; =  {of.input.I[15].O} {of.igenebind[3].TF}
(assert (= of_29 of_87))
; 
; =  {sc.input.I[10].O} {sc.switch[7].SUB}
(assert (= sc_27 sc_1))
; 
; =  {of.input.I[10].O} {of.switch[7].SUB}
(assert (= of_27 of_1))
; 
; =  {sc.input.I[12].O} {sc.itov[1].X}
(assert (= sc_19 sc_118))
; 
; =  {of.input.I[12].O} {of.itov[1].X}
(assert (= of_19 of_118))
; 
; =  {sc.input.I[1].O} {sc.ihill[0].Vmax}
(assert (= sc_49 sc_77))
; 
; =  {of.input.I[1].O} {of.ihill[0].Vmax}
(assert (= of_49 of_77))
; 
; =  {sc.iadd[11].OUT} {sc.igenebind[10].TF}
(assert (= sc_140 sc_83))
; 
; =  {of.iadd[11].OUT} {of.igenebind[10].TF}
(assert (= of_140 of_83))
; 
; =  {sc.input.I[7].O} {sc.iadd[9].C}
(assert (= sc_15 sc_132))
; 
; =  {of.input.I[7].O} {of.iadd[9].C}
(assert (= of_15 of_132))
; 
; =  {sc.input.V[1].O} {sc.vadd[2].A}
(assert (= sc_114 sc_63))
; 
; =  {of.input.V[1].O} {of.vadd[2].A}
(assert (= of_114 of_63))
; 
; =  {sc.input.I[13].O} {sc.itov[4].X}
(assert (= sc_17 sc_115))
; 
; =  {of.input.I[13].O} {of.itov[4].X}
(assert (= of_17 of_115))
; 
; =  {sc.input.I[17].O} {sc.igenebind[10].Vmax}
(assert (= sc_51 sc_85))
; 
; =  {of.input.I[17].O} {of.igenebind[10].Vmax}
(assert (= of_51 of_85))
; 
; =  {sc.input.V[7].O} {sc.switch[6].n}
(assert (= sc_96 sc_5))
; 
; =  {of.input.V[7].O} {of.switch[6].n}
(assert (= of_96 of_5))
; 
; =  {sc.input.I[8].O} {sc.iadd[11].B}
(assert (= sc_13 sc_139))
; 
; =  {of.input.I[8].O} {of.iadd[11].B}
(assert (= of_13 of_139))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[8].B}
(assert (= sc_135 sc_124))
; 
; =  {of.iadd[9].OUT} {of.iadd[8].B}
(assert (= of_135 of_124))
; 
; =  {sc.input.I[23].O} {sc.iadd[12].C}
(assert (= sc_45 sc_127))
; 
; =  {of.input.I[23].O} {of.iadd[12].C}
(assert (= of_45 of_127))
; 
; =  {sc.input.V[0].O} {sc.ihill[0].n}
(assert (= sc_102 sc_74))
; 
; =  {of.input.V[0].O} {of.ihill[0].n}
(assert (= of_102 of_74))
; 
; =  {sc.igenebind[3].GE} {sc.itov[1].K}
(assert (= sc_90 sc_119))
; 
; =  {of.igenebind[3].GE} {of.itov[1].K}
(assert (= of_90 of_119))
; 
; =  {sc.input.V[10].O} {sc.switch[7].n}
(assert (= sc_104 sc_0))
; 
; =  {of.input.V[10].O} {of.switch[7].n}
(assert (= of_104 of_0))
; 
; =  {sc.itov[4].Y} {sc.vadd[5].B}
(assert (= sc_117 sc_71))
; 
; =  {of.itov[4].Y} {of.vadd[5].B}
(assert (= of_117 of_71))
; 
; =  {sc.iadd[8].OUT} {sc.switch[7].Kmod}
(assert (= sc_125 sc_2))
; 
; =  {of.iadd[8].OUT} {of.switch[7].Kmod}
(assert (= of_125 of_2))
; 
; =  {sc.input.V[4].O} {sc.vadd[5].C}
(assert (= sc_110 sc_69))
; 
; =  {of.input.V[4].O} {of.vadd[5].C}
(assert (= of_110 of_69))
; 
; =  {sc.input.I[19].O} {sc.igenebind[10].K}
(assert (= sc_55 sc_84))
; 
; =  {of.input.I[19].O} {of.igenebind[10].K}
(assert (= of_55 of_84))
; 
; =  {sc.input.V[5].O} {sc.vadd[5].OUT2_0}
(assert (= sc_112 sc_67))
; 
; =  {of.input.V[5].O} {of.vadd[5].OUT2_0}
(assert (= of_112 of_67))
; 
; =  {sc.input.V[6].O} {sc.vadd[2].OUT2_0}
(assert (= sc_106 sc_60))
; 
; =  {of.input.V[6].O} {of.vadd[2].OUT2_0}
(assert (= of_106 of_60))
; 
; =  {sc.input.I[11].O} {sc.igenebind[3].Vmax}
(assert (= sc_25 sc_89))
; 
; =  {of.input.I[11].O} {of.igenebind[3].Vmax}
(assert (= of_25 of_89))
(assert (<= (* (/ 1. sc_57) 0.001) 0.1))
(assert (<= (* (/ 1. sc_59) 0.001) 0.1))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].O} {sc.vadd[5].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_66 sc_57) (= sc_66 sc_73)) (= sc_66 sc_59)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_130 0.) sltop_130 (- sltop_130)) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= slbot_72 0.) slbot_72 (- slbot_72))) (ite (>= sltop_125 0.) sltop_125 (- sltop_125))) (ite (>= sltop_90 0.) sltop_90 (- sltop_90))) (ite (>= sltop_4 0.) sltop_4 (- sltop_4))) (ite (>= sltop_66 0.) sltop_66 (- sltop_66))) (ite (>= sltop_65 0.) sltop_65 (- sltop_65))) (ite (>= sltop_120 0.) sltop_120 (- sltop_120))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_59 0.) slbot_59 (- slbot_59))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_120 0.) slbot_120 (- slbot_120))) (ite (>= slbot_119 0.) slbot_119 (- slbot_119))) (ite (>= slbot_130 0.) slbot_130 (- slbot_130))) (ite (>= sltop_58 0.) sltop_58 (- sltop_58))) (ite (>= sltop_82 0.) sltop_82 (- sltop_82))) (ite (>= sltop_22 0.) sltop_22 (- sltop_22))) (ite (>= slbot_125 0.) slbot_125 (- slbot_125))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= slbot_124 0.) slbot_124 (- slbot_124))) (ite (>= slbot_116 0.) slbot_116 (- slbot_116))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= slbot_56 0.) slbot_56 (- slbot_56))) (ite (>= sltop_136 0.) sltop_136 (- sltop_136))) (ite (>= sltop_64 0.) sltop_64 (- sltop_64))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= sltop_135 0.) sltop_135 (- sltop_135))) (ite (>= sltop_75 0.) sltop_75 (- sltop_75))) (ite (>= slbot_23 0.) slbot_23 (- slbot_23))) (ite (>= slbot_136 0.) slbot_136 (- slbot_136))) (ite (>= slbot_75 0.) slbot_75 (- slbot_75))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_135 0.) slbot_135 (- slbot_135))) (ite (>= sltop_119 0.) sltop_119 (- sltop_119))) (ite (>= slbot_66 0.) slbot_66 (- slbot_66))) (ite (>= sltop_72 0.) sltop_72 (- sltop_72))) (ite (>= slbot_22 0.) slbot_22 (- slbot_22))) (ite (>= sltop_23 0.) sltop_23 (- sltop_23))) (ite (>= slbot_134 0.) slbot_134 (- slbot_134))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= slbot_83 0.) slbot_83 (- slbot_83))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= slbot_140 0.) slbot_140 (- slbot_140))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= sltop_116 0.) sltop_116 (- sltop_116))) (ite (>= slbot_64 0.) slbot_64 (- slbot_64))) (ite (>= sltop_124 0.) sltop_124 (- sltop_124))) (ite (>= sltop_129 0.) sltop_129 (- sltop_129))) (ite (>= sltop_71 0.) sltop_71 (- sltop_71))) (ite (>= slbot_117 0.) slbot_117 (- slbot_117))) (ite (>= sltop_117 0.) sltop_117 (- sltop_117))) (ite (>= slbot_71 0.) slbot_71 (- slbot_71))) (ite (>= slbot_90 0.) slbot_90 (- slbot_90))) (ite (>= slbot_82 0.) slbot_82 (- slbot_82))) (ite (>= slbot_129 0.) slbot_129 (- slbot_129))) (ite (>= sltop_57 0.) sltop_57 (- sltop_57))) (ite (>= slbot_4 0.) slbot_4 (- slbot_4))) (ite (>= slbot_57 0.) slbot_57 (- slbot_57))) (ite (>= slbot_65 0.) slbot_65 (- slbot_65))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= sltop_56 0.) sltop_56 (- sltop_56))) (ite (>= sltop_140 0.) sltop_140 (- sltop_140))) (ite (>= slbot_73 0.) slbot_73 (- slbot_73))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= sltop_134 0.) sltop_134 (- sltop_134))) (ite (>= sltop_83 0.) sltop_83 (- sltop_83))) (ite (>= sltop_73 0.) sltop_73 (- sltop_73))) (ite (>= slbot_58 0.) slbot_58 (- slbot_58))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= sltop_59 0.) sltop_59 (- sltop_59)))))
(check-sat)
