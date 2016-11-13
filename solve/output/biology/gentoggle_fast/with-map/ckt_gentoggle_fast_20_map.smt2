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
; =  {(sc.switch[5].SUB/sc.switch[5].Kmod)} {1.}
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
; =  {sc.switch[5].PROD} {(sc.switch[5].Vmax/1.)}
(assert (= sc_4 (/ sc_3 1.)))
; 
; =  {of.switch[5].PROD} {0.}
(assert (= of_4 0.))
; 
; >=  {((sc.switch[5].n*1000.75)+of.switch[5].n)} {3300.}
(assert (<= (+ (* sc_0 1000.75) of_0) 3300.))
; 
; <=  {((sc.switch[5].n*1000.75)+of.switch[5].n)} {0.5}
(assert (>= (+ (* sc_0 1000.75) of_0) 0.5))
; 
; >=  {((sc.switch[5].SUB*337.632520764)+of.switch[5].SUB)} {10.}
(assert (<= (+ (* sc_1 337.632520764) of_1) 10.))
; 
; <=  {((sc.switch[5].SUB*337.632520764)+of.switch[5].SUB)} {0.0001}
(assert (>= (+ (* sc_1 337.632520764) of_1) 0.0001))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.switch[5].Kmod*0.)+of.switch[5].Kmod)+sl.min.switch[5].Kmod)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.switch[5].Kmod*1.66666666667)+of.switch[5].Kmod)+sl.max.switch[5].Kmod)} {10.}
(assert (= (+ (+ (* sc_2 1.66666666667) of_2) sltop_2) 10.))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.switch[5].PROD*0.)+of.switch[5].PROD)+sl.min.switch[5].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4) 9.99934002508e-38))
; 
; =  {(((sc.switch[5].PROD*15.6)+of.switch[5].PROD)+sl.max.switch[5].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_4 15.6) of_4) sltop_4) 9.9999999))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.switch[5].Vmax*0.)+of.switch[5].Vmax)+sl.min.switch[5].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 0.0001))
; 
; =  {(((sc.switch[5].Vmax*15.6)+of.switch[5].Vmax)+sl.max.switch[5].Vmax)} {10.}
(assert (= (+ (+ (* sc_3 15.6) of_3) sltop_3) 10.))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.switch[5].PROD*0.)+of.switch[5].PROD)+sl.min.switch[5].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4) 9.99934002508e-38))
; 
; =  {(((sc.switch[5].PROD*15.6)+of.switch[5].PROD)+sl.max.switch[5].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_4 15.6) of_4) sltop_4) 9.9999999))
(declare-fun sc_5 () Real)
(assert (> sc_5 1e-08))
(declare-fun of_5 () Real)
(declare-fun sc_6 () Real)
(assert (> sc_6 1e-08))
(declare-fun of_6 () Real)
; 
; =  {sc.input.I[20].O} {sc.input.I[20].X}
(assert (= sc_6 sc_5))
; 
; =  {of.input.I[20].O} {of.input.I[20].X}
(assert (= of_6 of_5))
; 
; >=  {((sc.input.I[20].X*0.)+of.input.I[20].X)} {10.}
(assert (<= (+ (* sc_5 0.) of_5) 10.))
; 
; <=  {((sc.input.I[20].X*0.)+of.input.I[20].X)} {0.}
(assert (>= (+ (* sc_5 0.) of_5) 0.))
; 
; >=  {((sc.input.I[20].O*0.)+of.input.I[20].O)} {10.}
(assert (<= (+ (* sc_6 0.) of_6) 10.))
; 
; <=  {((sc.input.I[20].O*0.)+of.input.I[20].O)} {0.}
(assert (>= (+ (* sc_6 0.) of_6) 0.))
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_8 sc_7))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_8 of_7))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_7 0.) of_7) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_7 0.) of_7) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_8 0.) of_8) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_8 0.) of_8) 0.))
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_10 sc_9))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_10 of_9))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_9 0.) of_9) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_9 0.) of_9) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_10 0.) of_10) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
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
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_11 0.) of_11) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_12 0.) of_12) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_14 sc_13))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_14 of_13))
; 
; >=  {((sc.input.I[13].X*1.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_13 1.) of_13) 10.))
; 
; <=  {((sc.input.I[13].X*1.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_13 1.) of_13) 0.))
; 
; >=  {((sc.input.I[13].O*1.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_14 1.) of_14) 10.))
; 
; <=  {((sc.input.I[13].O*1.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_14 1.) of_14) 0.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[12].X*4.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_15 4.) of_15) 10.))
; 
; <=  {((sc.input.I[12].X*4.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_15 4.) of_15) 0.))
; 
; >=  {((sc.input.I[12].O*4.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_16 4.) of_16) 10.))
; 
; <=  {((sc.input.I[12].O*4.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_16 4.) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[9].X*337.632520764)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_17 337.632520764) of_17) 10.))
; 
; <=  {((sc.input.I[9].X*337.632520764)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_17 337.632520764) of_17) 0.))
; 
; >=  {((sc.input.I[9].O*337.632520764)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_18 337.632520764) of_18) 10.))
; 
; <=  {((sc.input.I[9].O*337.632520764)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_18 337.632520764) of_18) 0.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_19 156.25) of_19) 10.))
; 
; <=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_19 156.25) of_19) 0.))
; 
; >=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_20 156.25) of_20) 10.))
; 
; <=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_20 156.25) of_20) 0.))
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
; >=  {((sc.input.I[11].X*4.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_21 4.) of_21) 10.))
; 
; <=  {((sc.input.I[11].X*4.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_21 4.) of_21) 0.))
; 
; >=  {((sc.input.I[11].O*4.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_22 4.) of_22) 10.))
; 
; <=  {((sc.input.I[11].O*4.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_22 4.) of_22) 0.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_24 sc_23))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_24 of_23))
; 
; >=  {((sc.input.I[10].X*15.6)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_23 15.6) of_23) 10.))
; 
; <=  {((sc.input.I[10].X*15.6)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_23 15.6) of_23) 0.))
; 
; >=  {((sc.input.I[10].O*15.6)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_24 15.6) of_24) 10.))
; 
; <=  {((sc.input.I[10].O*15.6)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_24 15.6) of_24) 0.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_26 sc_25))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_26 of_25))
; 
; >=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_25 1.) of_25) 10.))
; 
; <=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_25 1.) of_25) 0.))
; 
; >=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_26 1.) of_26) 10.))
; 
; <=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {0.}
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
; =  {sc.input.I[21].O} {sc.input.I[21].X}
(assert (= sc_30 sc_29))
; 
; =  {of.input.I[21].O} {of.input.I[21].X}
(assert (= of_30 of_29))
; 
; >=  {((sc.input.I[21].X*0.)+of.input.I[21].X)} {10.}
(assert (<= (+ (* sc_29 0.) of_29) 10.))
; 
; <=  {((sc.input.I[21].X*0.)+of.input.I[21].X)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
; 
; >=  {((sc.input.I[21].O*0.)+of.input.I[21].O)} {10.}
(assert (<= (+ (* sc_30 0.) of_30) 10.))
; 
; <=  {((sc.input.I[21].O*0.)+of.input.I[21].O)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_32 of_31))
; 
; >=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_31 1.) of_31) 10.))
; 
; <=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_31 1.) of_31) 0.))
; 
; >=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_32 1.) of_32) 10.))
; 
; <=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_32 1.) of_32) 0.))
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_33 1.) of_33) 10.))
; 
; <=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_33 1.) of_33) 0.))
; 
; >=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_34 1.) of_34) 10.))
; 
; <=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_34 1.) of_34) 0.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_36 0.) of_36) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_37 0.) of_37) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_38 0.) of_38) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_40 of_39))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_39 0.) of_39) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_40 0.) of_40) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_42 of_41))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_41 0.) of_41) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_42 0.) of_42) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
; 
; =  {sc.input.I[22].O} {sc.input.I[22].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.I[22].O} {of.input.I[22].X}
(assert (= of_44 of_43))
; 
; >=  {((sc.input.I[22].X*0.)+of.input.I[22].X)} {10.}
(assert (<= (+ (* sc_43 0.) of_43) 10.))
; 
; <=  {((sc.input.I[22].X*0.)+of.input.I[22].X)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
; 
; >=  {((sc.input.I[22].O*0.)+of.input.I[22].O)} {10.}
(assert (<= (+ (* sc_44 0.) of_44) 10.))
; 
; <=  {((sc.input.I[22].O*0.)+of.input.I[22].O)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_46 sc_45))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_46 of_45))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_45 156.25) of_45) sltop_45) 3300.))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_46 156.25) of_46) sltop_46) 3300.))
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_48 sc_47))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_48 of_47))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_47 15.6) of_47) sltop_47) 3300.))
(declare-fun slbot_48 () Real)
(declare-fun sltop_48 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_48 15.6) of_48) sltop_48) 3300.))
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
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_50 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_51 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_53 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_52 (* 1. sc_53)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D)}
(assert (and (= sc_52 (* 1. sc_51)) (= sc_52 (* 1. sc_50))))
; no offset
(assert (= (- (+ of_52 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1.)}
(assert (= sc_54 (* sc_52 1.)))
; 
; =  {of.vadd[2].OUT} {0.}
(assert (= of_54 0.))
; no scale
(assert (= sc_50 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_50 0.))
; no offset
(assert (= of_55 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_51 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_53 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_52 (* 1. sc_53)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D*sc.vadd[2].OUT2)}
(assert (and (= sc_52 (* 1. sc_51)) (= sc_52 (* (* 1. sc_50) sc_55))))
; no offset
(assert (= (- (+ of_52 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1.)}
(assert (= sc_55 (* sc_52 1.)))
; no offset
(assert (= of_55 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1.)}
(assert (= sc_49 (* sc_52 1.)))
; 
; =  {of.vadd[2].OUT2_0} {0.}
(assert (= of_49 0.))
; 
; >=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {3300.}
(assert (<= (+ (* sc_49 0.) of_49) 3300.))
; 
; <=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
; 
; >=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {3300.}
(assert (<= (+ (* sc_50 4.) of_50) 3300.))
; 
; <=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {0.}
(assert (>= (+ (* sc_50 4.) of_50) 0.))
; 
; >=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {3300.}
(assert (<= (+ (* sc_51 0.) of_51) 3300.))
; 
; <=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
; 
; >=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {3300.}
(assert (<= (+ (* sc_52 0.) of_52) 3300.))
; 
; <=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_55 156.25) of_55) sltop_55) 3300.))
(declare-fun slbot_53 () Real)
(declare-fun sltop_53 () Real)
; 
; =  {(((sc.vadd[2].B*3.75903614458)+of.vadd[2].B)+sl.min.vadd[2].B)} {0.}
(assert (= (+ (+ (* sc_53 3.75903614458) of_53) slbot_53) 0.))
; 
; =  {(((sc.vadd[2].B*62.4)+of.vadd[2].B)+sl.max.vadd[2].B)} {3300.}
(assert (= (+ (+ (* sc_53 62.4) of_53) sltop_53) 3300.))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.vadd[2].OUT*3.75903614458)+of.vadd[2].OUT)+sl.min.vadd[2].OUT)} {-1650.}
(assert (= (+ (+ (* sc_54 3.75903614458) of_54) slbot_54) -1650.))
; 
; =  {(((sc.vadd[2].OUT*62.4)+of.vadd[2].OUT)+sl.max.vadd[2].OUT)} {1650.}
(assert (= (+ (+ (* sc_54 62.4) of_54) sltop_54) 1650.))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
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
(assert (= 0. 0.))
; no offset
(assert (= of_57 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_58 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_60 0.))
; 
; =  {sc.vadd[11].A} {(1.*sc.vadd[11].B)}
(assert (= sc_59 (* 1. sc_60)))
; 
; =  {sc.vadd[11].A} {(1.*sc.vadd[11].C)} {(1.*sc.vadd[11].D)}
(assert (and (= sc_59 (* 1. sc_58)) (= sc_59 (* 1. sc_57))))
; no offset
(assert (= (- (+ of_59 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[11].OUT} {(sc.vadd[11].A*1.)}
(assert (= sc_61 (* sc_59 1.)))
; 
; =  {of.vadd[11].OUT} {0.}
(assert (= of_61 0.))
; no scale
(assert (= sc_57 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_57 0.))
; no offset
(assert (= of_62 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_58 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_60 0.))
; 
; =  {sc.vadd[11].A} {(1.*sc.vadd[11].B)}
(assert (= sc_59 (* 1. sc_60)))
; 
; =  {sc.vadd[11].A} {(1.*sc.vadd[11].C)} {(1.*sc.vadd[11].D*sc.vadd[11].OUT2)}
(assert (and (= sc_59 (* 1. sc_58)) (= sc_59 (* (* 1. sc_57) sc_62))))
; no offset
(assert (= (- (+ of_59 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[11].OUT2} {(sc.vadd[11].A*1.)}
(assert (= sc_62 (* sc_59 1.)))
; no offset
(assert (= of_62 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[11].OUT2_0} {(sc.vadd[11].A*1.)}
(assert (= sc_56 (* sc_59 1.)))
; 
; =  {of.vadd[11].OUT2_0} {0.}
(assert (= of_56 0.))
; 
; >=  {((sc.vadd[11].OUT2_0*0.)+of.vadd[11].OUT2_0)} {3300.}
(assert (<= (+ (* sc_56 0.) of_56) 3300.))
; 
; <=  {((sc.vadd[11].OUT2_0*0.)+of.vadd[11].OUT2_0)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
; 
; >=  {((sc.vadd[11].D*4.)+of.vadd[11].D)} {3300.}
(assert (<= (+ (* sc_57 4.) of_57) 3300.))
; 
; <=  {((sc.vadd[11].D*4.)+of.vadd[11].D)} {0.}
(assert (>= (+ (* sc_57 4.) of_57) 0.))
; 
; >=  {((sc.vadd[11].C*0.)+of.vadd[11].C)} {3300.}
(assert (<= (+ (* sc_58 0.) of_58) 3300.))
; 
; <=  {((sc.vadd[11].C*0.)+of.vadd[11].C)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
; 
; >=  {((sc.vadd[11].A*0.)+of.vadd[11].A)} {3300.}
(assert (<= (+ (* sc_59 0.) of_59) 3300.))
; 
; <=  {((sc.vadd[11].A*0.)+of.vadd[11].A)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.vadd[11].OUT2*0.)+of.vadd[11].OUT2)+sl.min.vadd[11].OUT2)} {0.}
(assert (= (+ (+ (* sc_62 0.) of_62) slbot_62) 0.))
; 
; =  {(((sc.vadd[11].OUT2*15.6)+of.vadd[11].OUT2)+sl.max.vadd[11].OUT2)} {3300.}
(assert (= (+ (+ (* sc_62 15.6) of_62) sltop_62) 3300.))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.vadd[11].B*0.00204799328914)+of.vadd[11].B)+sl.min.vadd[11].B)} {0.}
(assert (= (+ (+ (* sc_60 0.00204799328914) of_60) slbot_60) 0.))
; 
; =  {(((sc.vadd[11].B*625.)+of.vadd[11].B)+sl.max.vadd[11].B)} {3300.}
(assert (= (+ (+ (* sc_60 625.) of_60) sltop_60) 3300.))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.vadd[11].OUT*0.00204799328914)+of.vadd[11].OUT)+sl.min.vadd[11].OUT)} {-1650.}
(assert (= (+ (+ (* sc_61 0.00204799328914) of_61) slbot_61) -1650.))
; 
; =  {(((sc.vadd[11].OUT*625.)+of.vadd[11].OUT)+sl.max.vadd[11].OUT)} {1650.}
(assert (= (+ (+ (* sc_61 625.) of_61) sltop_61) 1650.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.vadd[11].OUT2*0.)+of.vadd[11].OUT2)+sl.min.vadd[11].OUT2)} {0.}
(assert (= (+ (+ (* sc_62 0.) of_62) slbot_62) 0.))
; 
; =  {(((sc.vadd[11].OUT2*15.6)+of.vadd[11].OUT2)+sl.max.vadd[11].OUT2)} {3300.}
(assert (= (+ (+ (* sc_62 15.6) of_62) sltop_62) 3300.))
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
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
; no offset
(assert (= of_64 0.))
; no offset
(assert (= of_65 0.))
; no scale
(assert (= (/ sc_64 sc_65) 1.))
; no scale
(assert (= sc_63 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_63 0.))
; no offset
(assert (= of_64 0.))
; no offset
(assert (= of_65 0.))
; no scale
(assert (= (/ sc_64 sc_65) 1.))
; no scale
(assert (= sc_63 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_63 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_66 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_67 (* sc_66 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_67 0.))
; no scale
(assert (= sc_65 1.))
; no scale
(assert (= (* sc_63 1.) 1.))
; no offset
(assert (= of_65 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_65 1.))
; no scale
(assert (= (* sc_63 1.) 1.))
; no offset
(assert (= of_65 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_64 1.))
; no scale
(assert (= sc_63 1.))
; no offset
(assert (= of_64 0.))
; no offset
(assert (= of_63 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_66 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_68 (* sc_66 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_68 0.))
; 
; >=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_63 2.5) of_63) 5.))
; 
; <=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_63 2.5) of_63) 1.))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_64 0.) of_64) slbot_64) 1.))
; 
; =  {(((sc.ihill[0].S*156.25)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_64 156.25) of_64) sltop_64) 10.))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.ihill[0].REP*0.000511998322284)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {9.999900001e-10}
(assert (= (+ (+ (* sc_68 0.000511998322284) of_68) slbot_68) 9.999900001e-10))
; 
; =  {(((sc.ihill[0].REP*156.25)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {5.}
(assert (= (+ (+ (* sc_68 156.25) of_68) sltop_68) 5.))
; 
; >=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_66 156.25) of_66) 10.))
; 
; <=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_66 156.25) of_66) 0.0001))
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
(assert (= of_70 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; 
; =  {sc.vtoi[5].Y} {((1./sc.vtoi[5].K)*sc.vtoi[5].X)}
(assert (= sc_71 (* (/ 1. sc_70) sc_69)))
; 
; =  {of.vtoi[5].Y} {0.}
(assert (= of_71 0.))
(declare-fun slbot_69 () Real)
(declare-fun sltop_69 () Real)
; 
; =  {(((sc.vtoi[5].X*0.)+of.vtoi[5].X)+sl.min.vtoi[5].X)} {1.}
(assert (= (+ (+ (* sc_69 0.) of_69) slbot_69) 1.))
; 
; =  {(((sc.vtoi[5].X*156.25)+of.vtoi[5].X)+sl.max.vtoi[5].X)} {3300.}
(assert (= (+ (+ (* sc_69 156.25) of_69) sltop_69) 3300.))
; 
; >=  {((sc.vtoi[5].K*1.)+of.vtoi[5].K)} {3300.}
(assert (<= (+ (* sc_70 1.) of_70) 3300.))
; 
; <=  {((sc.vtoi[5].K*1.)+of.vtoi[5].K)} {1.}
(assert (>= (+ (* sc_70 1.) of_70) 1.))
(declare-fun slbot_71 () Real)
(declare-fun sltop_71 () Real)
; 
; =  {(((sc.vtoi[5].Y*0.)+of.vtoi[5].Y)+sl.min.vtoi[5].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_71 0.) of_71) slbot_71) 0.00030303030303))
; 
; =  {(((sc.vtoi[5].Y*156.25)+of.vtoi[5].Y)+sl.max.vtoi[5].Y)} {3300.}
(assert (= (+ (+ (* sc_71 156.25) of_71) sltop_71) 3300.))
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
(assert (= of_73 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_72 0.))
; 
; =  {sc.vtoi[4].Y} {((1./sc.vtoi[4].K)*sc.vtoi[4].X)}
(assert (= sc_74 (* (/ 1. sc_73) sc_72)))
; 
; =  {of.vtoi[4].Y} {0.}
(assert (= of_74 0.))
(declare-fun slbot_72 () Real)
(declare-fun sltop_72 () Real)
; 
; =  {(((sc.vtoi[4].X*0.)+of.vtoi[4].X)+sl.min.vtoi[4].X)} {1.}
(assert (= (+ (+ (* sc_72 0.) of_72) slbot_72) 1.))
; 
; =  {(((sc.vtoi[4].X*0.6)+of.vtoi[4].X)+sl.max.vtoi[4].X)} {3300.}
(assert (= (+ (+ (* sc_72 0.6) of_72) sltop_72) 3300.))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.vtoi[4].Y*-0.6)+of.vtoi[4].Y)+sl.min.vtoi[4].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_74 -0.6) of_74) slbot_74) 0.00030303030303))
; 
; =  {(((sc.vtoi[4].Y*0.)+of.vtoi[4].Y)+sl.max.vtoi[4].Y)} {3300.}
(assert (= (+ (+ (* sc_74 0.) of_74) sltop_74) 3300.))
; 
; >=  {((sc.vtoi[4].K*-1.)+of.vtoi[4].K)} {3300.}
(assert (<= (+ (* sc_73 -1.) of_73) 3300.))
; 
; <=  {((sc.vtoi[4].K*-1.)+of.vtoi[4].K)} {1.}
(assert (>= (+ (* sc_73 -1.) of_73) 1.))
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
; no offset
(assert (= of_76 0.))
; no offset
(assert (= of_75 0.))
; 
; =  {1.} {(sc.igenebind[8].K*sc.igenebind[8].TF)}
(assert (= 1. (* sc_76 sc_75)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_77 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[8].GE} {(sc.igenebind[8].Vmax*(1./1.))}
(assert (= sc_78 (* sc_77 (/ 1. 1.))))
; 
; =  {of.igenebind[8].GE} {0.}
(assert (= of_78 0.))
(declare-fun slbot_75 () Real)
(declare-fun sltop_75 () Real)
; 
; =  {(((sc.igenebind[8].TF*-1.)+of.igenebind[8].TF)+sl.min.igenebind[8].TF)} {0.0001}
(assert (= (+ (+ (* sc_75 -1.) of_75) slbot_75) 0.0001))
; 
; =  {(((sc.igenebind[8].TF*-0.4)+of.igenebind[8].TF)+sl.max.igenebind[8].TF)} {10.}
(assert (= (+ (+ (* sc_75 -0.4) of_75) sltop_75) 10.))
; 
; >=  {((sc.igenebind[8].K*1.)+of.igenebind[8].K)} {10.}
(assert (<= (+ (* sc_76 1.) of_76) 10.))
; 
; <=  {((sc.igenebind[8].K*1.)+of.igenebind[8].K)} {0.0001}
(assert (>= (+ (* sc_76 1.) of_76) 0.0001))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.igenebind[8].GE*0.)+of.igenebind[8].GE)+sl.min.igenebind[8].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[8].GE*1.66666666667)+of.igenebind[8].GE)+sl.max.igenebind[8].GE)} {9.9999999}
(assert (= (+ (+ (* sc_78 1.66666666667) of_78) sltop_78) 9.9999999))
; 
; >=  {((sc.igenebind[8].Vmax*1.)+of.igenebind[8].Vmax)} {10.}
(assert (<= (+ (* sc_77 1.) of_77) 10.))
; 
; <=  {((sc.igenebind[8].Vmax*1.)+of.igenebind[8].Vmax)} {0.0001}
(assert (>= (+ (* sc_77 1.) of_77) 0.0001))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.igenebind[8].GE*0.)+of.igenebind[8].GE)+sl.min.igenebind[8].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[8].GE*1.66666666667)+of.igenebind[8].GE)+sl.max.igenebind[8].GE)} {9.9999999}
(assert (= (+ (+ (* sc_78 1.66666666667) of_78) sltop_78) 9.9999999))
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
; =  {1.} {(sc.igenebind[3].K*sc.igenebind[3].TF)}
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
; =  {sc.igenebind[3].GE} {(sc.igenebind[3].Vmax*(1./1.))}
(assert (= sc_82 (* sc_81 (/ 1. 1.))))
; 
; =  {of.igenebind[3].GE} {0.}
(assert (= of_82 0.))
; 
; >=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {10.}
(assert (<= (+ (* sc_79 1.) of_79) 10.))
; 
; <=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {0.0001}
(assert (>= (+ (* sc_79 1.) of_79) 0.0001))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.igenebind[3].K*0.)+of.igenebind[3].K)+sl.min.igenebind[3].K)} {0.0001}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 0.0001))
; 
; =  {(((sc.igenebind[3].K*15.6)+of.igenebind[3].K)+sl.max.igenebind[3].K)} {10.}
(assert (= (+ (+ (* sc_80 15.6) of_80) sltop_80) 10.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.igenebind[3].GE*0.939759036145)+of.igenebind[3].GE)+sl.min.igenebind[3].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_82 0.939759036145) of_82) slbot_82) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[3].GE*15.6)+of.igenebind[3].GE)+sl.max.igenebind[3].GE)} {9.9999999}
(assert (= (+ (+ (* sc_82 15.6) of_82) sltop_82) 9.9999999))
; 
; >=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {10.}
(assert (<= (+ (* sc_81 15.6) of_81) 10.))
; 
; <=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {0.0001}
(assert (>= (+ (* sc_81 15.6) of_81) 0.0001))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_84 sc_83))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_84 of_83))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_83 0.) of_83) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_83 0.) of_83) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_84 0.) of_84) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_84 0.) of_84) 0.))
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_86 sc_85))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_86 of_85))
; 
; >=  {((sc.input.V[8].X*-1.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_85 -1.) of_85) 3300.))
; 
; <=  {((sc.input.V[8].X*-1.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_85 -1.) of_85) 0.))
; 
; >=  {((sc.input.V[8].O*-1.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_86 -1.) of_86) 3300.))
; 
; <=  {((sc.input.V[8].O*-1.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_86 -1.) of_86) 0.))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_88 sc_87))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_88 of_87))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_87 0.) of_87) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_87 0.) of_87) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_88 0.) of_88) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_88 0.) of_88) 0.))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_90 sc_89))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_90 of_89))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_89 1.) of_89) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_89 1.) of_89) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_90 1.) of_90) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_90 1.) of_90) 0.))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_92 sc_91))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_92 of_91))
; 
; >=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_91 4.) of_91) 3300.))
; 
; <=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_91 4.) of_91) 0.))
; 
; >=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_92 4.) of_92) 3300.))
; 
; <=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_92 4.) of_92) 0.))
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_94 sc_93))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_94 of_93))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_93 0.6) of_93) sltop_93) 3300.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_94 0.6) of_94) sltop_94) 3300.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_96 sc_95))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_96 of_95))
; 
; >=  {((sc.input.V[11].X*1000.75)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_95 1000.75) of_95) 3300.))
; 
; <=  {((sc.input.V[11].X*1000.75)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_95 1000.75) of_95) 0.))
; 
; >=  {((sc.input.V[11].O*1000.75)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_96 1000.75) of_96) 3300.))
; 
; <=  {((sc.input.V[11].O*1000.75)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_96 1000.75) of_96) 0.))
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_98 sc_97))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_98 of_97))
; 
; >=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_97 4.) of_97) 3300.))
; 
; <=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_97 4.) of_97) 0.))
; 
; >=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_98 4.) of_98) 3300.))
; 
; <=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_98 4.) of_98) 0.))
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_100 sc_99))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_100 of_99))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_99 0.) of_99) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_99 0.) of_99) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_100 0.) of_100) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_100 0.) of_100) 0.))
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_102 sc_101))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_102 of_101))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_101 0.) of_101) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_101 0.) of_101) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_102 0.) of_102) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_102 0.) of_102) 0.))
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_104 sc_103))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_104 of_103))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_103 0.) of_103) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_103 0.) of_103) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_104 0.) of_104) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_104 0.) of_104) 0.))
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_106 sc_105))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_106 of_105))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_105 0.) of_105) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_105 0.) of_105) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_106 0.) of_106) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_106 0.) of_106) 0.))
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_108 sc_107))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_108 of_107))
; 
; >=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_107 2.5) of_107) 3300.))
; 
; <=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_107 2.5) of_107) 0.))
; 
; >=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_108 2.5) of_108) 3300.))
; 
; <=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_108 2.5) of_108) 0.))
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
; no offset
(assert (= of_110 0.))
; no offset
(assert (= of_109 0.))
; 
; =  {sc.itov[10].Y} {(sc.itov[10].K*sc.itov[10].X)}
(assert (= sc_111 (* sc_110 sc_109)))
; 
; =  {of.itov[10].Y} {0.}
(assert (= of_111 0.))
; 
; >=  {((sc.itov[10].X*4.)+of.itov[10].X)} {10.}
(assert (<= (+ (* sc_109 4.) of_109) 10.))
; 
; <=  {((sc.itov[10].X*4.)+of.itov[10].X)} {0.0001}
(assert (>= (+ (* sc_109 4.) of_109) 0.0001))
(declare-fun slbot_111 () Real)
(declare-fun sltop_111 () Real)
; 
; =  {(((sc.itov[10].Y*0.00204799328914)+of.itov[10].Y)+sl.min.itov[10].Y)} {0.0001}
(assert (= (+ (+ (* sc_111 0.00204799328914) of_111) slbot_111) 0.0001))
; 
; =  {(((sc.itov[10].Y*625.)+of.itov[10].Y)+sl.max.itov[10].Y)} {3300.}
(assert (= (+ (+ (* sc_111 625.) of_111) sltop_111) 3300.))
(declare-fun slbot_110 () Real)
(declare-fun sltop_110 () Real)
; 
; =  {(((sc.itov[10].K*0.000511998322284)+of.itov[10].K)+sl.min.itov[10].K)} {1.}
(assert (= (+ (+ (* sc_110 0.000511998322284) of_110) slbot_110) 1.))
; 
; =  {(((sc.itov[10].K*156.25)+of.itov[10].K)+sl.max.itov[10].K)} {330.}
(assert (= (+ (+ (* sc_110 156.25) of_110) sltop_110) 330.))
(declare-fun slbot_111 () Real)
(declare-fun sltop_111 () Real)
; 
; =  {(((sc.itov[10].Y*0.00204799328914)+of.itov[10].Y)+sl.min.itov[10].Y)} {0.0001}
(assert (= (+ (+ (* sc_111 0.00204799328914) of_111) slbot_111) 0.0001))
; 
; =  {(((sc.itov[10].Y*625.)+of.itov[10].Y)+sl.max.itov[10].Y)} {3300.}
(assert (= (+ (+ (* sc_111 625.) of_111) sltop_111) 3300.))
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
; no offset
(assert (= of_113 0.))
; no offset
(assert (= of_112 0.))
; 
; =  {sc.itov[1].Y} {(sc.itov[1].K*sc.itov[1].X)}
(assert (= sc_114 (* sc_113 sc_112)))
; 
; =  {of.itov[1].Y} {0.}
(assert (= of_114 0.))
; 
; >=  {((sc.itov[1].X*4.)+of.itov[1].X)} {10.}
(assert (<= (+ (* sc_112 4.) of_112) 10.))
; 
; <=  {((sc.itov[1].X*4.)+of.itov[1].X)} {0.0001}
(assert (>= (+ (* sc_112 4.) of_112) 0.0001))
(declare-fun slbot_114 () Real)
(declare-fun sltop_114 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_114 3.75903614458) of_114) slbot_114) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_114 62.4) of_114) sltop_114) 3300.))
(declare-fun slbot_113 () Real)
(declare-fun sltop_113 () Real)
; 
; =  {(((sc.itov[1].K*0.939759036145)+of.itov[1].K)+sl.min.itov[1].K)} {1.}
(assert (= (+ (+ (* sc_113 0.939759036145) of_113) slbot_113) 1.))
; 
; =  {(((sc.itov[1].K*15.6)+of.itov[1].K)+sl.max.itov[1].K)} {330.}
(assert (= (+ (+ (* sc_113 15.6) of_113) sltop_113) 330.))
(declare-fun slbot_114 () Real)
(declare-fun sltop_114 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_114 3.75903614458) of_114) slbot_114) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_114 62.4) of_114) sltop_114) 3300.))
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
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
; 
; =  {sc.iadd[7].A} {sc.iadd[7].B}
(assert (= sc_117 sc_118))
; 
; =  {sc.iadd[7].A} {sc.iadd[7].C} {sc.iadd[7].D}
(assert (and (= sc_117 sc_116) (= sc_117 sc_115)))
; 
; =  {sc.iadd[7].OUT} {sc.iadd[7].A}
(assert (= sc_119 sc_117))
; 
; =  {of.iadd[7].OUT} {((of.iadd[7].A+of.iadd[7].B)-of.iadd[7].C-of.iadd[7].D)}
(assert (= of_119 (- (+ of_117 of_118) (+ of_116 of_115))))
; 
; >=  {((sc.iadd[7].D*0.)+of.iadd[7].D)} {5.}
(assert (<= (+ (* sc_115 0.) of_115) 5.))
; 
; <=  {((sc.iadd[7].D*0.)+of.iadd[7].D)} {0.}
(assert (>= (+ (* sc_115 0.) of_115) 0.))
; 
; >=  {((sc.iadd[7].C*0.)+of.iadd[7].C)} {5.}
(assert (<= (+ (* sc_116 0.) of_116) 5.))
; 
; <=  {((sc.iadd[7].C*0.)+of.iadd[7].C)} {0.}
(assert (>= (+ (* sc_116 0.) of_116) 0.))
(declare-fun slbot_119 () Real)
(declare-fun sltop_119 () Real)
; 
; =  {(((sc.iadd[7].OUT*0.)+of.iadd[7].OUT)+sl.min.iadd[7].OUT)} {-10.}
(assert (= (+ (+ (* sc_119 0.) of_119) slbot_119) -10.))
; 
; =  {(((sc.iadd[7].OUT*1.66666666667)+of.iadd[7].OUT)+sl.max.iadd[7].OUT)} {10.}
(assert (= (+ (+ (* sc_119 1.66666666667) of_119) sltop_119) 10.))
; 
; >=  {((sc.iadd[7].A*0.)+of.iadd[7].A)} {5.}
(assert (<= (+ (* sc_117 0.) of_117) 5.))
; 
; <=  {((sc.iadd[7].A*0.)+of.iadd[7].A)} {0.}
(assert (>= (+ (* sc_117 0.) of_117) 0.))
(declare-fun slbot_118 () Real)
(declare-fun sltop_118 () Real)
; 
; =  {(((sc.iadd[7].B*0.)+of.iadd[7].B)+sl.min.iadd[7].B)} {0.}
(assert (= (+ (+ (* sc_118 0.) of_118) slbot_118) 0.))
; 
; =  {(((sc.iadd[7].B*1.66666666667)+of.iadd[7].B)+sl.max.iadd[7].B)} {5.}
(assert (= (+ (+ (* sc_118 1.66666666667) of_118) sltop_118) 5.))
(declare-fun slbot_119 () Real)
(declare-fun sltop_119 () Real)
; 
; =  {(((sc.iadd[7].OUT*0.)+of.iadd[7].OUT)+sl.min.iadd[7].OUT)} {-10.}
(assert (= (+ (+ (* sc_119 0.) of_119) slbot_119) -10.))
; 
; =  {(((sc.iadd[7].OUT*1.66666666667)+of.iadd[7].OUT)+sl.max.iadd[7].OUT)} {10.}
(assert (= (+ (+ (* sc_119 1.66666666667) of_119) sltop_119) 10.))
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
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
; 
; =  {sc.iadd[9].A} {sc.iadd[9].B}
(assert (= sc_122 sc_123))
; 
; =  {sc.iadd[9].A} {sc.iadd[9].C} {sc.iadd[9].D}
(assert (and (= sc_122 sc_121) (= sc_122 sc_120)))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[9].A}
(assert (= sc_124 sc_122))
; 
; =  {of.iadd[9].OUT} {((of.iadd[9].A+of.iadd[9].B)-of.iadd[9].C-of.iadd[9].D)}
(assert (= of_124 (- (+ of_122 of_123) (+ of_121 of_120))))
(declare-fun slbot_120 () Real)
(declare-fun sltop_120 () Real)
; 
; =  {(((sc.iadd[9].D*-0.6)+of.iadd[9].D)+sl.min.iadd[9].D)} {0.}
(assert (= (+ (+ (* sc_120 -0.6) of_120) slbot_120) 0.))
; 
; =  {(((sc.iadd[9].D*0.)+of.iadd[9].D)+sl.max.iadd[9].D)} {5.}
(assert (= (+ (+ (* sc_120 0.) of_120) sltop_120) 5.))
; 
; >=  {((sc.iadd[9].C*1.)+of.iadd[9].C)} {5.}
(assert (<= (+ (* sc_121 1.) of_121) 5.))
; 
; <=  {((sc.iadd[9].C*1.)+of.iadd[9].C)} {0.}
(assert (>= (+ (* sc_121 1.) of_121) 0.))
(declare-fun slbot_124 () Real)
(declare-fun sltop_124 () Real)
; 
; =  {(((sc.iadd[9].OUT*-1.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_124 -1.) of_124) slbot_124) -10.))
; 
; =  {(((sc.iadd[9].OUT*-0.4)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_124 -0.4) of_124) sltop_124) 10.))
; 
; >=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {5.}
(assert (<= (+ (* sc_122 0.) of_122) 5.))
; 
; <=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {0.}
(assert (>= (+ (* sc_122 0.) of_122) 0.))
; 
; >=  {((sc.iadd[9].B*0.)+of.iadd[9].B)} {5.}
(assert (<= (+ (* sc_123 0.) of_123) 5.))
; 
; <=  {((sc.iadd[9].B*0.)+of.iadd[9].B)} {0.}
(assert (>= (+ (* sc_123 0.) of_123) 0.))
(declare-fun slbot_124 () Real)
(declare-fun sltop_124 () Real)
; 
; =  {(((sc.iadd[9].OUT*-1.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_124 -1.) of_124) slbot_124) -10.))
; 
; =  {(((sc.iadd[9].OUT*-0.4)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_124 -0.4) of_124) sltop_124) 10.))
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
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
; 
; =  {sc.iadd[10].A} {sc.iadd[10].B}
(assert (= sc_127 sc_128))
; 
; =  {sc.iadd[10].A} {sc.iadd[10].C} {sc.iadd[10].D}
(assert (and (= sc_127 sc_126) (= sc_127 sc_125)))
; 
; =  {sc.iadd[10].OUT} {sc.iadd[10].A}
(assert (= sc_129 sc_127))
; 
; =  {of.iadd[10].OUT} {((of.iadd[10].A+of.iadd[10].B)-of.iadd[10].C-of.iadd[10].D)}
(assert (= of_129 (- (+ of_127 of_128) (+ of_126 of_125))))
; 
; >=  {((sc.iadd[10].D*0.)+of.iadd[10].D)} {5.}
(assert (<= (+ (* sc_125 0.) of_125) 5.))
; 
; <=  {((sc.iadd[10].D*0.)+of.iadd[10].D)} {0.}
(assert (>= (+ (* sc_125 0.) of_125) 0.))
; 
; >=  {((sc.iadd[10].C*0.)+of.iadd[10].C)} {5.}
(assert (<= (+ (* sc_126 0.) of_126) 5.))
; 
; <=  {((sc.iadd[10].C*0.)+of.iadd[10].C)} {0.}
(assert (>= (+ (* sc_126 0.) of_126) 0.))
; 
; >=  {((sc.iadd[10].A*0.)+of.iadd[10].A)} {5.}
(assert (<= (+ (* sc_127 0.) of_127) 5.))
; 
; <=  {((sc.iadd[10].A*0.)+of.iadd[10].A)} {0.}
(assert (>= (+ (* sc_127 0.) of_127) 0.))
(declare-fun slbot_128 () Real)
(declare-fun sltop_128 () Real)
; 
; =  {(((sc.iadd[10].B*0.)+of.iadd[10].B)+sl.min.iadd[10].B)} {0.}
(assert (= (+ (+ (* sc_128 0.) of_128) slbot_128) 0.))
; 
; =  {(((sc.iadd[10].B*15.6)+of.iadd[10].B)+sl.max.iadd[10].B)} {5.}
(assert (= (+ (+ (* sc_128 15.6) of_128) sltop_128) 5.))
(declare-fun slbot_129 () Real)
(declare-fun sltop_129 () Real)
; 
; =  {(((sc.iadd[10].OUT*0.)+of.iadd[10].OUT)+sl.min.iadd[10].OUT)} {-10.}
(assert (= (+ (+ (* sc_129 0.) of_129) slbot_129) -10.))
; 
; =  {(((sc.iadd[10].OUT*15.6)+of.iadd[10].OUT)+sl.max.iadd[10].OUT)} {10.}
(assert (= (+ (+ (* sc_129 15.6) of_129) sltop_129) 10.))
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
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
; 
; =  {sc.iadd[6].A} {sc.iadd[6].B}
(assert (= sc_132 sc_133))
; 
; =  {sc.iadd[6].A} {sc.iadd[6].C} {sc.iadd[6].D}
(assert (and (= sc_132 sc_131) (= sc_132 sc_130)))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[6].A}
(assert (= sc_134 sc_132))
; 
; =  {of.iadd[6].OUT} {((of.iadd[6].A+of.iadd[6].B)-of.iadd[6].C-of.iadd[6].D)}
(assert (= of_134 (- (+ of_132 of_133) (+ of_131 of_130))))
; 
; >=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {5.}
(assert (<= (+ (* sc_130 0.) of_130) 5.))
; 
; <=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {0.}
(assert (>= (+ (* sc_130 0.) of_130) 0.))
; 
; >=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {5.}
(assert (<= (+ (* sc_131 0.) of_131) 5.))
; 
; <=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {0.}
(assert (>= (+ (* sc_131 0.) of_131) 0.))
(declare-fun slbot_134 () Real)
(declare-fun sltop_134 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_134 0.) of_134) slbot_134) -10.))
; 
; =  {(((sc.iadd[6].OUT*1.66666666667)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_134 1.66666666667) of_134) sltop_134) 10.))
; 
; >=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {5.}
(assert (<= (+ (* sc_132 0.) of_132) 5.))
; 
; <=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {0.}
(assert (>= (+ (* sc_132 0.) of_132) 0.))
(declare-fun slbot_133 () Real)
(declare-fun sltop_133 () Real)
; 
; =  {(((sc.iadd[6].B*0.)+of.iadd[6].B)+sl.min.iadd[6].B)} {0.}
(assert (= (+ (+ (* sc_133 0.) of_133) slbot_133) 0.))
; 
; =  {(((sc.iadd[6].B*1.66666666667)+of.iadd[6].B)+sl.max.iadd[6].B)} {5.}
(assert (= (+ (+ (* sc_133 1.66666666667) of_133) sltop_133) 5.))
(declare-fun slbot_134 () Real)
(declare-fun sltop_134 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_134 0.) of_134) slbot_134) -10.))
; 
; =  {(((sc.iadd[6].OUT*1.66666666667)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_134 1.66666666667) of_134) sltop_134) 10.))
; 
; =  {sc.input.I[6].O} {sc.iadd[7].C}
(assert (= sc_28 sc_116))
; 
; =  {of.input.I[6].O} {of.iadd[7].C}
(assert (= of_28 of_116))
; 
; =  {sc.iadd[6].OUT} {sc.switch[5].Kmod}
(assert (= sc_134 sc_2))
; 
; =  {of.iadd[6].OUT} {of.switch[5].Kmod}
(assert (= of_134 of_2))
; 
; =  {sc.input.I[0].O} {sc.ihill[0].Vmax}
(assert (= sc_20 sc_66))
; 
; =  {of.input.I[0].O} {of.ihill[0].Vmax}
(assert (= of_20 of_66))
; 
; =  {sc.vadd[2].OUT2} {sc.vtoi[5].X}
(assert (= sc_55 sc_69))
; 
; =  {of.vadd[2].OUT2} {of.vtoi[5].X}
(assert (= of_55 of_69))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].X}
(assert (= sc_55 sc_45))
; 
; =  {of.vadd[2].OUT2} {of.output.V[0].X}
(assert (= of_55 of_45))
; 
; =  {sc.ihill[0].REP} {sc.itov[10].K}
(assert (= sc_68 sc_110))
; 
; =  {of.ihill[0].REP} {of.itov[10].K}
(assert (= of_68 of_110))
; 
; =  {sc.input.V[9].O} {sc.vadd[2].D}
(assert (= sc_92 sc_50))
; 
; =  {of.input.V[9].O} {of.vadd[2].D}
(assert (= of_92 of_50))
; 
; =  {sc.itov[1].Y} {sc.vadd[2].B}
(assert (= sc_114 sc_53))
; 
; =  {of.itov[1].Y} {of.vadd[2].B}
(assert (= of_114 of_53))
; 
; =  {sc.input.I[22].O} {sc.iadd[10].A}
(assert (= sc_44 sc_127))
; 
; =  {of.input.I[22].O} {of.iadd[10].A}
(assert (= of_44 of_127))
; 
; =  {sc.igenebind[8].GE} {sc.iadd[7].B}
(assert (= sc_78 sc_118))
; 
; =  {of.igenebind[8].GE} {of.iadd[7].B}
(assert (= of_78 of_118))
; 
; =  {sc.vtoi[5].Y} {sc.ihill[0].S}
(assert (= sc_71 sc_64))
; 
; =  {of.vtoi[5].Y} {of.ihill[0].S}
(assert (= of_71 of_64))
; 
; =  {sc.input.I[9].O} {sc.switch[5].SUB}
(assert (= sc_18 sc_1))
; 
; =  {of.input.I[9].O} {of.switch[5].SUB}
(assert (= of_18 of_1))
; 
; =  {sc.input.V[13].O} {sc.vtoi[5].K}
(assert (= sc_90 sc_70))
; 
; =  {of.input.V[13].O} {of.vtoi[5].K}
(assert (= of_90 of_70))
; 
; =  {sc.input.I[4].O} {sc.iadd[7].D}
(assert (= sc_38 sc_115))
; 
; =  {of.input.I[4].O} {of.iadd[7].D}
(assert (= of_38 of_115))
; 
; =  {sc.input.I[3].O} {sc.iadd[6].C}
(assert (= sc_36 sc_131))
; 
; =  {of.input.I[3].O} {of.iadd[6].C}
(assert (= of_36 of_131))
; 
; =  {sc.input.I[16].O} {sc.igenebind[8].K}
(assert (= sc_34 sc_76))
; 
; =  {of.input.I[16].O} {of.igenebind[8].K}
(assert (= of_34 of_76))
; 
; =  {sc.input.I[5].O} {sc.iadd[7].A}
(assert (= sc_40 sc_117))
; 
; =  {of.input.I[5].O} {of.iadd[7].A}
(assert (= of_40 of_117))
; 
; =  {sc.input.V[11].O} {sc.switch[5].n}
(assert (= sc_96 sc_0))
; 
; =  {of.input.V[11].O} {of.switch[5].n}
(assert (= of_96 of_0))
; 
; =  {sc.input.I[14].O} {sc.igenebind[8].Vmax}
(assert (= sc_32 sc_77))
; 
; =  {of.input.I[14].O} {of.igenebind[8].Vmax}
(assert (= of_32 of_77))
; 
; =  {sc.input.V[8].O} {sc.vtoi[4].K}
(assert (= sc_86 sc_73))
; 
; =  {of.input.V[8].O} {of.vtoi[4].K}
(assert (= of_86 of_73))
; 
; =  {sc.input.I[2].O} {sc.iadd[6].A}
(assert (= sc_8 sc_132))
; 
; =  {of.input.I[2].O} {of.iadd[6].A}
(assert (= of_8 of_132))
; 
; =  {sc.input.I[20].O} {sc.iadd[10].C}
(assert (= sc_6 sc_126))
; 
; =  {of.input.I[20].O} {of.iadd[10].C}
(assert (= of_6 of_126))
; 
; =  {sc.input.V[3].O} {sc.vadd[2].C}
(assert (= sc_102 sc_51))
; 
; =  {of.input.V[3].O} {of.vadd[2].C}
(assert (= of_102 of_51))
; 
; =  {sc.input.V[2].O} {sc.vadd[2].A}
(assert (= sc_84 sc_52))
; 
; =  {of.input.V[2].O} {of.vadd[2].A}
(assert (= of_84 of_52))
; 
; =  {sc.input.I[15].O} {sc.iadd[9].C}
(assert (= sc_26 sc_121))
; 
; =  {of.input.I[15].O} {of.iadd[9].C}
(assert (= of_26 of_121))
; 
; =  {sc.input.I[10].O} {sc.igenebind[3].Vmax}
(assert (= sc_24 sc_81))
; 
; =  {of.input.I[10].O} {of.igenebind[3].Vmax}
(assert (= of_24 of_81))
; 
; =  {sc.input.I[1].O} {sc.iadd[6].D}
(assert (= sc_42 sc_130))
; 
; =  {of.input.I[1].O} {of.iadd[6].D}
(assert (= of_42 of_130))
; 
; =  {sc.input.I[12].O} {sc.itov[10].X}
(assert (= sc_16 sc_109))
; 
; =  {of.input.I[12].O} {of.itov[10].X}
(assert (= of_16 of_109))
; 
; =  {sc.iadd[10].OUT} {sc.igenebind[3].K}
(assert (= sc_129 sc_80))
; 
; =  {of.iadd[10].OUT} {of.igenebind[3].K}
(assert (= of_129 of_80))
; 
; =  {sc.vadd[11].OUT2} {sc.output.V[1].X}
(assert (= sc_62 sc_47))
; 
; =  {of.vadd[11].OUT2} {of.output.V[1].X}
(assert (= of_62 of_47))
; 
; =  {sc.vadd[11].OUT2} {sc.switch[5].Vmax}
(assert (= sc_62 sc_3))
; 
; =  {of.vadd[11].OUT2} {of.switch[5].Vmax}
(assert (= of_62 of_3))
; 
; =  {sc.iadd[7].OUT} {sc.iadd[6].B}
(assert (= sc_119 sc_133))
; 
; =  {of.iadd[7].OUT} {of.iadd[6].B}
(assert (= of_119 of_133))
; 
; =  {sc.input.V[1].O} {sc.ihill[0].n}
(assert (= sc_108 sc_63))
; 
; =  {of.input.V[1].O} {of.ihill[0].n}
(assert (= of_108 of_63))
; 
; =  {sc.input.I[13].O} {sc.igenebind[3].TF}
(assert (= sc_14 sc_79))
; 
; =  {of.input.I[13].O} {of.igenebind[3].TF}
(assert (= of_14 of_79))
; 
; =  {sc.input.I[7].O} {sc.iadd[9].A}
(assert (= sc_12 sc_122))
; 
; =  {of.input.I[7].O} {of.iadd[9].A}
(assert (= of_12 of_122))
; 
; =  {sc.input.V[7].O} {sc.vadd[2].OUT2_0}
(assert (= sc_88 sc_49))
; 
; =  {of.input.V[7].O} {of.vadd[2].OUT2_0}
(assert (= of_88 of_49))
; 
; =  {sc.input.I[8].O} {sc.iadd[9].B}
(assert (= sc_10 sc_123))
; 
; =  {of.input.I[8].O} {of.iadd[9].B}
(assert (= of_10 of_123))
; 
; =  {sc.iadd[9].OUT} {sc.igenebind[8].TF}
(assert (= sc_124 sc_75))
; 
; =  {of.iadd[9].OUT} {of.igenebind[8].TF}
(assert (= of_124 of_75))
; 
; =  {sc.input.I[21].O} {sc.iadd[10].D}
(assert (= sc_30 sc_125))
; 
; =  {of.input.I[21].O} {of.iadd[10].D}
(assert (= of_30 of_125))
; 
; =  {sc.switch[5].PROD} {sc.iadd[10].B}
(assert (= sc_4 sc_128))
; 
; =  {of.switch[5].PROD} {of.iadd[10].B}
(assert (= of_4 of_128))
; 
; =  {sc.input.V[10].O} {sc.vadd[11].D}
(assert (= sc_98 sc_57))
; 
; =  {of.input.V[10].O} {of.vadd[11].D}
(assert (= of_98 of_57))
; 
; =  {sc.input.V[0].O} {sc.vtoi[4].X}
(assert (= sc_94 sc_72))
; 
; =  {of.input.V[0].O} {of.vtoi[4].X}
(assert (= of_94 of_72))
; 
; =  {sc.igenebind[3].GE} {sc.itov[1].K}
(assert (= sc_82 sc_113))
; 
; =  {of.igenebind[3].GE} {of.itov[1].K}
(assert (= of_82 of_113))
; 
; =  {sc.itov[10].Y} {sc.vadd[11].B}
(assert (= sc_111 sc_60))
; 
; =  {of.itov[10].Y} {of.vadd[11].B}
(assert (= of_111 of_60))
; 
; =  {sc.input.V[4].O} {sc.vadd[11].C}
(assert (= sc_104 sc_58))
; 
; =  {of.input.V[4].O} {of.vadd[11].C}
(assert (= of_104 of_58))
; 
; =  {sc.input.V[5].O} {sc.vadd[11].A}
(assert (= sc_106 sc_59))
; 
; =  {of.input.V[5].O} {of.vadd[11].A}
(assert (= of_106 of_59))
; 
; =  {sc.input.V[6].O} {sc.vadd[11].OUT2_0}
(assert (= sc_100 sc_56))
; 
; =  {of.input.V[6].O} {of.vadd[11].OUT2_0}
(assert (= of_100 of_56))
; 
; =  {sc.input.I[11].O} {sc.itov[1].X}
(assert (= sc_22 sc_112))
; 
; =  {of.input.I[11].O} {of.itov[1].X}
(assert (= of_22 of_112))
; 
; =  {sc.vtoi[4].Y} {sc.iadd[9].D}
(assert (= sc_74 sc_120))
; 
; =  {of.vtoi[4].Y} {of.iadd[9].D}
(assert (= of_74 of_120))
(assert (<= (* (/ 1. sc_46) 0.001) 0.1))
(assert (<= (* (/ 1. sc_48) 0.001) 0.1))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].O} {sc.vadd[11].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_55 sc_46) (= sc_55 sc_62)) (= sc_55 sc_48)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_128 0.) slbot_128 (- slbot_128)) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= slbot_72 0.) slbot_72 (- slbot_72))) (ite (>= sltop_4 0.) sltop_4 (- sltop_4))) (ite (>= sltop_120 0.) sltop_120 (- sltop_120))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_46 0.) slbot_46 (- slbot_46))) (ite (>= slbot_53 0.) slbot_53 (- slbot_53))) (ite (>= slbot_133 0.) slbot_133 (- slbot_133))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_119 0.) slbot_119 (- slbot_119))) (ite (>= slbot_120 0.) slbot_120 (- slbot_120))) (ite (>= sltop_82 0.) sltop_82 (- sltop_82))) (ite (>= sltop_111 0.) sltop_111 (- sltop_111))) (ite (>= sltop_128 0.) sltop_128 (- sltop_128))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_94 0.) sltop_94 (- sltop_94))) (ite (>= slbot_111 0.) slbot_111 (- slbot_111))) (ite (>= slbot_124 0.) slbot_124 (- slbot_124))) (ite (>= sltop_62 0.) sltop_62 (- sltop_62))) (ite (>= slbot_55 0.) slbot_55 (- slbot_55))) (ite (>= slbot_54 0.) slbot_54 (- slbot_54))) (ite (>= sltop_74 0.) sltop_74 (- sltop_74))) (ite (>= sltop_133 0.) sltop_133 (- sltop_133))) (ite (>= slbot_45 0.) slbot_45 (- slbot_45))) (ite (>= slbot_68 0.) slbot_68 (- slbot_68))) (ite (>= sltop_110 0.) sltop_110 (- sltop_110))) (ite (>= sltop_45 0.) sltop_45 (- sltop_45))) (ite (>= sltop_64 0.) sltop_64 (- sltop_64))) (ite (>= sltop_68 0.) sltop_68 (- sltop_68))) (ite (>= sltop_75 0.) sltop_75 (- sltop_75))) (ite (>= slbot_114 0.) slbot_114 (- slbot_114))) (ite (>= slbot_75 0.) slbot_75 (- slbot_75))) (ite (>= slbot_110 0.) slbot_110 (- slbot_110))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_69 0.) slbot_69 (- slbot_69))) (ite (>= sltop_119 0.) sltop_119 (- sltop_119))) (ite (>= sltop_72 0.) sltop_72 (- sltop_72))) (ite (>= sltop_118 0.) sltop_118 (- sltop_118))) (ite (>= slbot_78 0.) slbot_78 (- slbot_78))) (ite (>= sltop_55 0.) sltop_55 (- sltop_55))) (ite (>= slbot_134 0.) slbot_134 (- slbot_134))) (ite (>= slbot_60 0.) slbot_60 (- slbot_60))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= sltop_114 0.) sltop_114 (- sltop_114))) (ite (>= sltop_54 0.) sltop_54 (- sltop_54))) (ite (>= slbot_64 0.) slbot_64 (- slbot_64))) (ite (>= slbot_61 0.) slbot_61 (- slbot_61))) (ite (>= sltop_124 0.) sltop_124 (- sltop_124))) (ite (>= sltop_129 0.) sltop_129 (- sltop_129))) (ite (>= sltop_71 0.) sltop_71 (- sltop_71))) (ite (>= slbot_71 0.) slbot_71 (- slbot_71))) (ite (>= slbot_113 0.) slbot_113 (- slbot_113))) (ite (>= slbot_82 0.) slbot_82 (- slbot_82))) (ite (>= slbot_129 0.) slbot_129 (- slbot_129))) (ite (>= slbot_4 0.) slbot_4 (- slbot_4))) (ite (>= slbot_62 0.) slbot_62 (- slbot_62))) (ite (>= slbot_48 0.) slbot_48 (- slbot_48))) (ite (>= sltop_60 0.) sltop_60 (- sltop_60))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= sltop_47 0.) sltop_47 (- sltop_47))) (ite (>= sltop_78 0.) sltop_78 (- sltop_78))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= slbot_94 0.) slbot_94 (- slbot_94))) (ite (>= slbot_118 0.) slbot_118 (- slbot_118))) (ite (>= sltop_53 0.) sltop_53 (- sltop_53))) (ite (>= sltop_134 0.) sltop_134 (- sltop_134))) (ite (>= sltop_48 0.) sltop_48 (- sltop_48))) (ite (>= sltop_46 0.) sltop_46 (- sltop_46))) (ite (>= sltop_61 0.) sltop_61 (- sltop_61))) (ite (>= slbot_74 0.) slbot_74 (- slbot_74))) (ite (>= sltop_69 0.) sltop_69 (- sltop_69))) (ite (>= slbot_47 0.) slbot_47 (- slbot_47))) (ite (>= sltop_113 0.) sltop_113 (- sltop_113)))))
(check-sat)
