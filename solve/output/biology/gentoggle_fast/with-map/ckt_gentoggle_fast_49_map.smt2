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
; =  {sc.vgain[8].P} {((sc.vgain[8].X/sc.vgain[8].Y)*sc.vgain[8].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[8].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[8].X*2.)+of.vgain[8].X)} {3300.}
(assert (<= (+ (* sc_0 2.) of_0) 3300.))
; 
; <=  {((sc.vgain[8].X*2.)+of.vgain[8].X)} {0.0001}
(assert (>= (+ (* sc_0 2.) of_0) 0.0001))
; 
; >=  {((sc.vgain[8].Y*1.)+of.vgain[8].Y)} {3300.}
(assert (<= (+ (* sc_1 1.) of_1) 3300.))
; 
; <=  {((sc.vgain[8].Y*1.)+of.vgain[8].Y)} {1.}
(assert (>= (+ (* sc_1 1.) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[8].P*0.)+of.vgain[8].P)+sl.min.vgain[8].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[8].P*3.2768e-06)+of.vgain[8].P)+sl.max.vgain[8].P)} {5445000.}
(assert (= (+ (+ (* sc_3 3.2768e-06) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[8].Z*0.)+of.vgain[8].Z)+sl.min.vgain[8].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[8].Z*3.2768e-06)+of.vgain[8].Z)+sl.max.vgain[8].Z)} {3300.}
(assert (= (+ (+ (* sc_2 3.2768e-06) of_2) sltop_2) 3300.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[8].P*0.)+of.vgain[8].P)+sl.min.vgain[8].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[8].P*3.2768e-06)+of.vgain[8].P)+sl.max.vgain[8].P)} {5445000.}
(assert (= (+ (+ (* sc_3 3.2768e-06) of_3) sltop_3) 5445000.))
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
; =  {(sc.switch[13].SUB/sc.switch[13].Kmod)} {1.}
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
; =  {sc.switch[13].PROD} {(sc.switch[13].Vmax/1.)}
(assert (= sc_8 (/ sc_7 1.)))
; 
; =  {of.switch[13].PROD} {0.}
(assert (= of_8 0.))
; 
; >=  {((sc.switch[13].n*1000.75)+of.switch[13].n)} {3300.}
(assert (<= (+ (* sc_4 1000.75) of_4) 3300.))
; 
; <=  {((sc.switch[13].n*1000.75)+of.switch[13].n)} {0.5}
(assert (>= (+ (* sc_4 1000.75) of_4) 0.5))
; 
; >=  {((sc.switch[13].SUB*337.632520764)+of.switch[13].SUB)} {10.}
(assert (<= (+ (* sc_5 337.632520764) of_5) 10.))
; 
; <=  {((sc.switch[13].SUB*337.632520764)+of.switch[13].SUB)} {0.0001}
(assert (>= (+ (* sc_5 337.632520764) of_5) 0.0001))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.switch[13].Kmod*0.)+of.switch[13].Kmod)+sl.min.switch[13].Kmod)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.switch[13].Kmod*1.66666666667)+of.switch[13].Kmod)+sl.max.switch[13].Kmod)} {10.}
(assert (= (+ (+ (* sc_6 1.66666666667) of_6) sltop_6) 10.))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[13].PROD*0.)+of.switch[13].PROD)+sl.min.switch[13].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[13].PROD*15.6)+of.switch[13].PROD)+sl.max.switch[13].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 15.6) of_8) sltop_8) 9.9999999))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.switch[13].Vmax*0.)+of.switch[13].Vmax)+sl.min.switch[13].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 0.0001))
; 
; =  {(((sc.switch[13].Vmax*15.6)+of.switch[13].Vmax)+sl.max.switch[13].Vmax)} {10.}
(assert (= (+ (+ (* sc_7 15.6) of_7) sltop_7) 10.))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[13].PROD*0.)+of.switch[13].PROD)+sl.min.switch[13].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[13].PROD*15.6)+of.switch[13].PROD)+sl.max.switch[13].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 15.6) of_8) sltop_8) 9.9999999))
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
; no offset
(assert (= of_9 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_10 0.))
; no offset
(assert (= of_11 0.))
; 
; =  {(sc.switch[10].SUB/sc.switch[10].Kmod)} {1.}
(assert (= (/ sc_10 sc_11) 1.))
; no scale
(assert (= (/ sc_10 sc_11) 1.))
; no scale
(assert (= (/ sc_9 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_12 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[10].PROD} {(sc.switch[10].Vmax/1.)}
(assert (= sc_13 (/ sc_12 1.)))
; 
; =  {of.switch[10].PROD} {0.}
(assert (= of_13 0.))
; 
; >=  {((sc.switch[10].n*1250.)+of.switch[10].n)} {3300.}
(assert (<= (+ (* sc_9 1250.) of_9) 3300.))
; 
; <=  {((sc.switch[10].n*1250.)+of.switch[10].n)} {0.5}
(assert (>= (+ (* sc_9 1250.) of_9) 0.5))
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.switch[10].SUB*-1.)+of.switch[10].SUB)+sl.min.switch[10].SUB)} {0.0001}
(assert (= (+ (+ (* sc_10 -1.) of_10) slbot_10) 0.0001))
; 
; =  {(((sc.switch[10].SUB*155.25)+of.switch[10].SUB)+sl.max.switch[10].SUB)} {10.}
(assert (= (+ (+ (* sc_10 155.25) of_10) sltop_10) 10.))
; 
; >=  {((sc.switch[10].Kmod*1.)+of.switch[10].Kmod)} {10.}
(assert (<= (+ (* sc_11 1.) of_11) 10.))
; 
; <=  {((sc.switch[10].Kmod*1.)+of.switch[10].Kmod)} {0.0001}
(assert (>= (+ (* sc_11 1.) of_11) 0.0001))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[10].PROD*0.)+of.switch[10].PROD)+sl.min.switch[10].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 9.99934002508e-38))
; 
; =  {(((sc.switch[10].PROD*3.2768e-06)+of.switch[10].PROD)+sl.max.switch[10].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_13 3.2768e-06) of_13) sltop_13) 9.9999999))
; 
; >=  {((sc.switch[10].Vmax*1.)+of.switch[10].Vmax)} {10.}
(assert (<= (+ (* sc_12 1.) of_12) 10.))
; 
; <=  {((sc.switch[10].Vmax*1.)+of.switch[10].Vmax)} {0.0001}
(assert (>= (+ (* sc_12 1.) of_12) 0.0001))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[10].PROD*0.)+of.switch[10].PROD)+sl.min.switch[10].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 9.99934002508e-38))
; 
; =  {(((sc.switch[10].PROD*3.2768e-06)+of.switch[10].PROD)+sl.max.switch[10].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_13 3.2768e-06) of_13) sltop_13) 9.9999999))
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_15 sc_14))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_15 of_14))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; 
; =  {sc.input.I[20].O} {sc.input.I[20].X}
(assert (= sc_17 sc_16))
; 
; =  {of.input.I[20].O} {of.input.I[20].X}
(assert (= of_17 of_16))
; 
; >=  {((sc.input.I[20].X*4.)+of.input.I[20].X)} {10.}
(assert (<= (+ (* sc_16 4.) of_16) 10.))
; 
; <=  {((sc.input.I[20].X*4.)+of.input.I[20].X)} {0.}
(assert (>= (+ (* sc_16 4.) of_16) 0.))
; 
; >=  {((sc.input.I[20].O*4.)+of.input.I[20].O)} {10.}
(assert (<= (+ (* sc_17 4.) of_17) 10.))
; 
; <=  {((sc.input.I[20].O*4.)+of.input.I[20].O)} {0.}
(assert (>= (+ (* sc_17 4.) of_17) 0.))
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_19 sc_18))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_19 of_18))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_18 0.) of_18) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
; 
; =  {sc.input.I[34].O} {sc.input.I[34].X}
(assert (= sc_21 sc_20))
; 
; =  {of.input.I[34].O} {of.input.I[34].X}
(assert (= of_21 of_20))
; 
; >=  {((sc.input.I[34].X*0.)+of.input.I[34].X)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[34].X*0.)+of.input.I[34].X)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
; 
; >=  {((sc.input.I[34].O*0.)+of.input.I[34].O)} {10.}
(assert (<= (+ (* sc_21 0.) of_21) 10.))
; 
; <=  {((sc.input.I[34].O*0.)+of.input.I[34].O)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_23 sc_22))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_23 of_22))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_22 0.) of_22) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_23 0.) of_23) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_25 sc_24))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_25 of_24))
; 
; >=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_24 0.) of_24) 10.))
; 
; <=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_25 0.) of_25) 10.))
; 
; <=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_27 sc_26))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_27 of_26))
; 
; >=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_26 0.) of_26) 10.))
; 
; <=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
; 
; >=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_29 sc_28))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_29 of_28))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_29 0.) of_29) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_31 sc_30))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_31 of_30))
; 
; >=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_30 156.25) of_30) 10.))
; 
; <=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_30 156.25) of_30) 0.))
; 
; >=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_31 156.25) of_31) 10.))
; 
; <=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_31 156.25) of_31) 0.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_33 sc_32))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_33 of_32))
; 
; >=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_32 0.) of_32) 10.))
; 
; <=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
; 
; >=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_33 0.) of_33) 10.))
; 
; <=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_35 sc_34))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_35 of_34))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.I[26].O} {sc.input.I[26].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.I[26].O} {of.input.I[26].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.I[26].X*1.)+of.input.I[26].X)} {10.}
(assert (<= (+ (* sc_36 1.) of_36) 10.))
; 
; <=  {((sc.input.I[26].X*1.)+of.input.I[26].X)} {0.}
(assert (>= (+ (* sc_36 1.) of_36) 0.))
; 
; >=  {((sc.input.I[26].O*1.)+of.input.I[26].O)} {10.}
(assert (<= (+ (* sc_37 1.) of_37) 10.))
; 
; <=  {((sc.input.I[26].O*1.)+of.input.I[26].O)} {0.}
(assert (>= (+ (* sc_37 1.) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.I[27].O} {sc.input.I[27].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.I[27].O} {of.input.I[27].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.I[27].X*1.)+of.input.I[27].X)} {10.}
(assert (<= (+ (* sc_38 1.) of_38) 10.))
; 
; <=  {((sc.input.I[27].X*1.)+of.input.I[27].X)} {0.}
(assert (>= (+ (* sc_38 1.) of_38) 0.))
; 
; >=  {((sc.input.I[27].O*1.)+of.input.I[27].O)} {10.}
(assert (<= (+ (* sc_39 1.) of_39) 10.))
; 
; <=  {((sc.input.I[27].O*1.)+of.input.I[27].O)} {0.}
(assert (>= (+ (* sc_39 1.) of_39) 0.))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_40 0.) of_40) 10.))
; 
; <=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_41 0.) of_41) 10.))
; 
; <=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_42 0.) of_42) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_43 0.) of_43) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.I[33].O} {sc.input.I[33].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.I[33].O} {of.input.I[33].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.I[33].X*0.)+of.input.I[33].X)} {10.}
(assert (<= (+ (* sc_44 0.) of_44) 10.))
; 
; <=  {((sc.input.I[33].X*0.)+of.input.I[33].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.I[33].O*0.)+of.input.I[33].O)} {10.}
(assert (<= (+ (* sc_45 0.) of_45) 10.))
; 
; <=  {((sc.input.I[33].O*0.)+of.input.I[33].O)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.I[14].X*0.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_46 0.) of_46) 10.))
; 
; <=  {((sc.input.I[14].X*0.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
; 
; >=  {((sc.input.I[14].O*0.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_47 0.) of_47) 10.))
; 
; <=  {((sc.input.I[14].O*0.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.I[21].O} {sc.input.I[21].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.I[21].O} {of.input.I[21].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.I[21].X*1.)+of.input.I[21].X)} {10.}
(assert (<= (+ (* sc_48 1.) of_48) 10.))
; 
; <=  {((sc.input.I[21].X*1.)+of.input.I[21].X)} {0.}
(assert (>= (+ (* sc_48 1.) of_48) 0.))
; 
; >=  {((sc.input.I[21].O*1.)+of.input.I[21].O)} {10.}
(assert (<= (+ (* sc_49 1.) of_49) 10.))
; 
; <=  {((sc.input.I[21].O*1.)+of.input.I[21].O)} {0.}
(assert (>= (+ (* sc_49 1.) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.I[16].X*0.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_50 0.) of_50) 10.))
; 
; <=  {((sc.input.I[16].X*0.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.I[16].O*0.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_51 0.) of_51) 10.))
; 
; <=  {((sc.input.I[16].O*0.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.I[24].O} {sc.input.I[24].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.I[24].O} {of.input.I[24].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.I[24].X*1.)+of.input.I[24].X)} {10.}
(assert (<= (+ (* sc_52 1.) of_52) 10.))
; 
; <=  {((sc.input.I[24].X*1.)+of.input.I[24].X)} {0.}
(assert (>= (+ (* sc_52 1.) of_52) 0.))
; 
; >=  {((sc.input.I[24].O*1.)+of.input.I[24].O)} {10.}
(assert (<= (+ (* sc_53 1.) of_53) 10.))
; 
; <=  {((sc.input.I[24].O*1.)+of.input.I[24].O)} {0.}
(assert (>= (+ (* sc_53 1.) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_54 0.) of_54) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_55 0.) of_55) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_56 0.) of_56) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_57 0.) of_57) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_58 0.) of_58) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_59 0.) of_59) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.I[23].O} {sc.input.I[23].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.I[23].O} {of.input.I[23].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.I[23].X*1.)+of.input.I[23].X)} {10.}
(assert (<= (+ (* sc_60 1.) of_60) 10.))
; 
; <=  {((sc.input.I[23].X*1.)+of.input.I[23].X)} {0.}
(assert (>= (+ (* sc_60 1.) of_60) 0.))
; 
; >=  {((sc.input.I[23].O*1.)+of.input.I[23].O)} {10.}
(assert (<= (+ (* sc_61 1.) of_61) 10.))
; 
; <=  {((sc.input.I[23].O*1.)+of.input.I[23].O)} {0.}
(assert (>= (+ (* sc_61 1.) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.I[25].O} {sc.input.I[25].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.I[25].O} {of.input.I[25].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.I[25].X*1.)+of.input.I[25].X)} {10.}
(assert (<= (+ (* sc_62 1.) of_62) 10.))
; 
; <=  {((sc.input.I[25].X*1.)+of.input.I[25].X)} {0.}
(assert (>= (+ (* sc_62 1.) of_62) 0.))
; 
; >=  {((sc.input.I[25].O*1.)+of.input.I[25].O)} {10.}
(assert (<= (+ (* sc_63 1.) of_63) 10.))
; 
; <=  {((sc.input.I[25].O*1.)+of.input.I[25].O)} {0.}
(assert (>= (+ (* sc_63 1.) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_64 0.) of_64) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_65 0.) of_65) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.I[28].O} {sc.input.I[28].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.I[28].O} {of.input.I[28].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.I[28].X*1.)+of.input.I[28].X)} {10.}
(assert (<= (+ (* sc_66 1.) of_66) 10.))
; 
; <=  {((sc.input.I[28].X*1.)+of.input.I[28].X)} {0.}
(assert (>= (+ (* sc_66 1.) of_66) 0.))
; 
; >=  {((sc.input.I[28].O*1.)+of.input.I[28].O)} {10.}
(assert (<= (+ (* sc_67 1.) of_67) 10.))
; 
; <=  {((sc.input.I[28].O*1.)+of.input.I[28].O)} {0.}
(assert (>= (+ (* sc_67 1.) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.I[17].X*337.632520764)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_68 337.632520764) of_68) 10.))
; 
; <=  {((sc.input.I[17].X*337.632520764)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_68 337.632520764) of_68) 0.))
; 
; >=  {((sc.input.I[17].O*337.632520764)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_69 337.632520764) of_69) 10.))
; 
; <=  {((sc.input.I[17].O*337.632520764)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_69 337.632520764) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.I[32].O} {sc.input.I[32].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.I[32].O} {of.input.I[32].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.I[32].X*0.)+of.input.I[32].X)} {10.}
(assert (<= (+ (* sc_70 0.) of_70) 10.))
; 
; <=  {((sc.input.I[32].X*0.)+of.input.I[32].X)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
; 
; >=  {((sc.input.I[32].O*0.)+of.input.I[32].O)} {10.}
(assert (<= (+ (* sc_71 0.) of_71) 10.))
; 
; <=  {((sc.input.I[32].O*0.)+of.input.I[32].O)} {0.}
(assert (>= (+ (* sc_71 0.) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.input.I[18].O} {sc.input.I[18].X}
(assert (= sc_73 sc_72))
; 
; =  {of.input.I[18].O} {of.input.I[18].X}
(assert (= of_73 of_72))
; 
; >=  {((sc.input.I[18].X*15.6)+of.input.I[18].X)} {10.}
(assert (<= (+ (* sc_72 15.6) of_72) 10.))
; 
; <=  {((sc.input.I[18].X*15.6)+of.input.I[18].X)} {0.}
(assert (>= (+ (* sc_72 15.6) of_72) 0.))
; 
; >=  {((sc.input.I[18].O*15.6)+of.input.I[18].O)} {10.}
(assert (<= (+ (* sc_73 15.6) of_73) 10.))
; 
; <=  {((sc.input.I[18].O*15.6)+of.input.I[18].O)} {0.}
(assert (>= (+ (* sc_73 15.6) of_73) 0.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; 
; =  {sc.input.I[19].O} {sc.input.I[19].X}
(assert (= sc_75 sc_74))
; 
; =  {of.input.I[19].O} {of.input.I[19].X}
(assert (= of_75 of_74))
; 
; >=  {((sc.input.I[19].X*4.)+of.input.I[19].X)} {10.}
(assert (<= (+ (* sc_74 4.) of_74) 10.))
; 
; <=  {((sc.input.I[19].X*4.)+of.input.I[19].X)} {0.}
(assert (>= (+ (* sc_74 4.) of_74) 0.))
; 
; >=  {((sc.input.I[19].O*4.)+of.input.I[19].O)} {10.}
(assert (<= (+ (* sc_75 4.) of_75) 10.))
; 
; <=  {((sc.input.I[19].O*4.)+of.input.I[19].O)} {0.}
(assert (>= (+ (* sc_75 4.) of_75) 0.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; 
; =  {sc.input.I[22].O} {sc.input.I[22].X}
(assert (= sc_77 sc_76))
; 
; =  {of.input.I[22].O} {of.input.I[22].X}
(assert (= of_77 of_76))
; 
; >=  {((sc.input.I[22].X*1.)+of.input.I[22].X)} {10.}
(assert (<= (+ (* sc_76 1.) of_76) 10.))
; 
; <=  {((sc.input.I[22].X*1.)+of.input.I[22].X)} {0.}
(assert (>= (+ (* sc_76 1.) of_76) 0.))
; 
; >=  {((sc.input.I[22].O*1.)+of.input.I[22].O)} {10.}
(assert (<= (+ (* sc_77 1.) of_77) 10.))
; 
; <=  {((sc.input.I[22].O*1.)+of.input.I[22].O)} {0.}
(assert (>= (+ (* sc_77 1.) of_77) 0.))
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_79 sc_78))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_79 of_78))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_78 156.25) of_78) sltop_78) 3300.))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_79 156.25) of_79) sltop_79) 3300.))
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_81 sc_80))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_81 of_80))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_80 15.6) of_80) sltop_80) 3300.))
(declare-fun slbot_81 () Real)
(declare-fun sltop_81 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_81 0.) of_81) slbot_81) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_81 15.6) of_81) sltop_81) 3300.))
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
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
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_83 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_84 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_86 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_85 (* 1. sc_86)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_85 (* 1. sc_84)) (= sc_85 (* 1. sc_83))))
; no offset
(assert (= (- (+ of_85 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_87 (* sc_85 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_87 0.))
; no scale
(assert (= sc_83 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_83 0.))
; no offset
(assert (= of_88 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_84 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_86 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_85 (* 1. sc_86)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_85 (* 1. sc_84)) (= sc_85 (* (* 1. sc_83) sc_88))))
; no offset
(assert (= (- (+ of_85 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_88 (* sc_85 1.)))
; no offset
(assert (= of_88 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_82 (* sc_85 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_82 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_82 0.) of_82) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_82 0.) of_82) 0.))
; 
; >=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_83 4.) of_83) 3300.))
; 
; <=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_83 4.) of_83) 0.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_84 0.) of_84) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_84 0.) of_84) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_85 0.) of_85) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_85 0.) of_85) 0.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_88 156.25) of_88) sltop_88) 3300.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.vadd[1].B*3.75903614458)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_86 3.75903614458) of_86) slbot_86) 0.))
; 
; =  {(((sc.vadd[1].B*62.4)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_86 62.4) of_86) sltop_86) 3300.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.vadd[1].OUT*3.75903614458)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_87 3.75903614458) of_87) slbot_87) -1650.))
; 
; =  {(((sc.vadd[1].OUT*62.4)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_87 62.4) of_87) sltop_87) 1650.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_88 156.25) of_88) sltop_88) 3300.))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
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
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_90 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_91 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_93 0.))
; 
; =  {sc.vadd[19].A} {(1.*sc.vadd[19].B)}
(assert (= sc_92 (* 1. sc_93)))
; 
; =  {sc.vadd[19].A} {(1.*sc.vadd[19].C)} {(1.*sc.vadd[19].D)}
(assert (and (= sc_92 (* 1. sc_91)) (= sc_92 (* 1. sc_90))))
; no offset
(assert (= (- (+ of_92 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[19].OUT} {(sc.vadd[19].A*1.)}
(assert (= sc_94 (* sc_92 1.)))
; 
; =  {of.vadd[19].OUT} {0.}
(assert (= of_94 0.))
; no scale
(assert (= sc_90 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_90 0.))
; no offset
(assert (= of_95 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_91 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_93 0.))
; 
; =  {sc.vadd[19].A} {(1.*sc.vadd[19].B)}
(assert (= sc_92 (* 1. sc_93)))
; 
; =  {sc.vadd[19].A} {(1.*sc.vadd[19].C)} {(1.*sc.vadd[19].D*sc.vadd[19].OUT2)}
(assert (and (= sc_92 (* 1. sc_91)) (= sc_92 (* (* 1. sc_90) sc_95))))
; no offset
(assert (= (- (+ of_92 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[19].OUT2} {(sc.vadd[19].A*1.)}
(assert (= sc_95 (* sc_92 1.)))
; no offset
(assert (= of_95 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[19].OUT2_0} {(sc.vadd[19].A*1.)}
(assert (= sc_89 (* sc_92 1.)))
; 
; =  {of.vadd[19].OUT2_0} {0.}
(assert (= of_89 0.))
; 
; >=  {((sc.vadd[19].OUT2_0*0.)+of.vadd[19].OUT2_0)} {3300.}
(assert (<= (+ (* sc_89 0.) of_89) 3300.))
; 
; <=  {((sc.vadd[19].OUT2_0*0.)+of.vadd[19].OUT2_0)} {0.}
(assert (>= (+ (* sc_89 0.) of_89) 0.))
; 
; >=  {((sc.vadd[19].D*4.)+of.vadd[19].D)} {3300.}
(assert (<= (+ (* sc_90 4.) of_90) 3300.))
; 
; <=  {((sc.vadd[19].D*4.)+of.vadd[19].D)} {0.}
(assert (>= (+ (* sc_90 4.) of_90) 0.))
; 
; >=  {((sc.vadd[19].C*0.)+of.vadd[19].C)} {3300.}
(assert (<= (+ (* sc_91 0.) of_91) 3300.))
; 
; <=  {((sc.vadd[19].C*0.)+of.vadd[19].C)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
; 
; >=  {((sc.vadd[19].A*0.)+of.vadd[19].A)} {3300.}
(assert (<= (+ (* sc_92 0.) of_92) 3300.))
; 
; <=  {((sc.vadd[19].A*0.)+of.vadd[19].A)} {0.}
(assert (>= (+ (* sc_92 0.) of_92) 0.))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.vadd[19].OUT2*0.)+of.vadd[19].OUT2)+sl.min.vadd[19].OUT2)} {0.}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95) 0.))
; 
; =  {(((sc.vadd[19].OUT2*15.6)+of.vadd[19].OUT2)+sl.max.vadd[19].OUT2)} {3300.}
(assert (= (+ (+ (* sc_95 15.6) of_95) sltop_95) 3300.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.vadd[19].B*0.00204799328914)+of.vadd[19].B)+sl.min.vadd[19].B)} {0.}
(assert (= (+ (+ (* sc_93 0.00204799328914) of_93) slbot_93) 0.))
; 
; =  {(((sc.vadd[19].B*625.)+of.vadd[19].B)+sl.max.vadd[19].B)} {3300.}
(assert (= (+ (+ (* sc_93 625.) of_93) sltop_93) 3300.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.vadd[19].OUT*0.00204799328914)+of.vadd[19].OUT)+sl.min.vadd[19].OUT)} {-1650.}
(assert (= (+ (+ (* sc_94 0.00204799328914) of_94) slbot_94) -1650.))
; 
; =  {(((sc.vadd[19].OUT*625.)+of.vadd[19].OUT)+sl.max.vadd[19].OUT)} {1650.}
(assert (= (+ (+ (* sc_94 625.) of_94) sltop_94) 1650.))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.vadd[19].OUT2*0.)+of.vadd[19].OUT2)+sl.min.vadd[19].OUT2)} {0.}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95) 0.))
; 
; =  {(((sc.vadd[19].OUT2*15.6)+of.vadd[19].OUT2)+sl.max.vadd[19].OUT2)} {3300.}
(assert (= (+ (+ (* sc_95 15.6) of_95) sltop_95) 3300.))
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_97 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_96 0.))
; 
; =  {sc.vtoi[7].Y} {((1./sc.vtoi[7].K)*sc.vtoi[7].X)}
(assert (= sc_98 (* (/ 1. sc_97) sc_96)))
; 
; =  {of.vtoi[7].Y} {0.}
(assert (= of_98 0.))
; 
; >=  {((sc.vtoi[7].X*1.)+of.vtoi[7].X)} {3300.}
(assert (<= (+ (* sc_96 1.) of_96) 3300.))
; 
; <=  {((sc.vtoi[7].X*1.)+of.vtoi[7].X)} {1.}
(assert (>= (+ (* sc_96 1.) of_96) 1.))
(declare-fun slbot_98 () Real)
(declare-fun sltop_98 () Real)
; 
; =  {(((sc.vtoi[7].Y*0.)+of.vtoi[7].Y)+sl.min.vtoi[7].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98) 0.00030303030303))
; 
; =  {(((sc.vtoi[7].Y*305175.78125)+of.vtoi[7].Y)+sl.max.vtoi[7].Y)} {3300.}
(assert (= (+ (+ (* sc_98 305175.78125) of_98) sltop_98) 3300.))
(declare-fun slbot_97 () Real)
(declare-fun sltop_97 () Real)
; 
; =  {(((sc.vtoi[7].K*0.)+of.vtoi[7].K)+sl.min.vtoi[7].K)} {1.}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97) 1.))
; 
; =  {(((sc.vtoi[7].K*3.2768e-06)+of.vtoi[7].K)+sl.max.vtoi[7].K)} {3300.}
(assert (= (+ (+ (* sc_97 3.2768e-06) of_97) sltop_97) 3300.))
(declare-fun slbot_98 () Real)
(declare-fun sltop_98 () Real)
; 
; =  {(((sc.vtoi[7].Y*0.)+of.vtoi[7].Y)+sl.min.vtoi[7].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98) 0.00030303030303))
; 
; =  {(((sc.vtoi[7].Y*305175.78125)+of.vtoi[7].Y)+sl.max.vtoi[7].Y)} {3300.}
(assert (= (+ (+ (* sc_98 305175.78125) of_98) sltop_98) 3300.))
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_100 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_99 0.))
; 
; =  {sc.vtoi[12].Y} {((1./sc.vtoi[12].K)*sc.vtoi[12].X)}
(assert (= sc_101 (* (/ 1. sc_100) sc_99)))
; 
; =  {of.vtoi[12].Y} {0.}
(assert (= of_101 0.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.vtoi[12].X*0.)+of.vtoi[12].X)+sl.min.vtoi[12].X)} {1.}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 1.))
; 
; =  {(((sc.vtoi[12].X*0.6)+of.vtoi[12].X)+sl.max.vtoi[12].X)} {3300.}
(assert (= (+ (+ (* sc_99 0.6) of_99) sltop_99) 3300.))
(declare-fun slbot_101 () Real)
(declare-fun sltop_101 () Real)
; 
; =  {(((sc.vtoi[12].Y*-0.6)+of.vtoi[12].Y)+sl.min.vtoi[12].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_101 -0.6) of_101) slbot_101) 0.00030303030303))
; 
; =  {(((sc.vtoi[12].Y*0.)+of.vtoi[12].Y)+sl.max.vtoi[12].Y)} {3300.}
(assert (= (+ (+ (* sc_101 0.) of_101) sltop_101) 3300.))
; 
; >=  {((sc.vtoi[12].K*-1.)+of.vtoi[12].K)} {3300.}
(assert (<= (+ (* sc_100 -1.) of_100) 3300.))
; 
; <=  {((sc.vtoi[12].K*-1.)+of.vtoi[12].K)} {1.}
(assert (>= (+ (* sc_100 -1.) of_100) 1.))
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_103 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_102 0.))
; 
; =  {sc.vtoi[3].Y} {((1./sc.vtoi[3].K)*sc.vtoi[3].X)}
(assert (= sc_104 (* (/ 1. sc_103) sc_102)))
; 
; =  {of.vtoi[3].Y} {0.}
(assert (= of_104 0.))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.vtoi[3].X*0.)+of.vtoi[3].X)+sl.min.vtoi[3].X)} {1.}
(assert (= (+ (+ (* sc_102 0.) of_102) slbot_102) 1.))
; 
; =  {(((sc.vtoi[3].X*156.25)+of.vtoi[3].X)+sl.max.vtoi[3].X)} {3300.}
(assert (= (+ (+ (* sc_102 156.25) of_102) sltop_102) 3300.))
(declare-fun slbot_104 () Real)
(declare-fun sltop_104 () Real)
; 
; =  {(((sc.vtoi[3].Y*-156.25)+of.vtoi[3].Y)+sl.min.vtoi[3].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_104 -156.25) of_104) slbot_104) 0.00030303030303))
; 
; =  {(((sc.vtoi[3].Y*0.)+of.vtoi[3].Y)+sl.max.vtoi[3].Y)} {3300.}
(assert (= (+ (+ (* sc_104 0.) of_104) sltop_104) 3300.))
; 
; >=  {((sc.vtoi[3].K*-1.)+of.vtoi[3].K)} {3300.}
(assert (<= (+ (* sc_103 -1.) of_103) 3300.))
; 
; <=  {((sc.vtoi[3].K*-1.)+of.vtoi[3].K)} {1.}
(assert (>= (+ (* sc_103 -1.) of_103) 1.))
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
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
(assert (= of_106 0.))
; no offset
(assert (= of_105 0.))
; 
; =  {1.} {(sc.igenebind[2].K*sc.igenebind[2].TF)}
(assert (= 1. (* sc_106 sc_105)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_107 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[2].GE} {(sc.igenebind[2].Vmax*(1./1.))}
(assert (= sc_108 (* sc_107 (/ 1. 1.))))
; 
; =  {of.igenebind[2].GE} {0.}
(assert (= of_108 0.))
; 
; >=  {((sc.igenebind[2].TF*1.)+of.igenebind[2].TF)} {10.}
(assert (<= (+ (* sc_105 1.) of_105) 10.))
; 
; <=  {((sc.igenebind[2].TF*1.)+of.igenebind[2].TF)} {0.0001}
(assert (>= (+ (* sc_105 1.) of_105) 0.0001))
(declare-fun slbot_106 () Real)
(declare-fun sltop_106 () Real)
; 
; =  {(((sc.igenebind[2].K*0.)+of.igenebind[2].K)+sl.min.igenebind[2].K)} {0.0001}
(assert (= (+ (+ (* sc_106 0.) of_106) slbot_106) 0.0001))
; 
; =  {(((sc.igenebind[2].K*15.6)+of.igenebind[2].K)+sl.max.igenebind[2].K)} {10.}
(assert (= (+ (+ (* sc_106 15.6) of_106) sltop_106) 10.))
(declare-fun slbot_108 () Real)
(declare-fun sltop_108 () Real)
; 
; =  {(((sc.igenebind[2].GE*0.939759036145)+of.igenebind[2].GE)+sl.min.igenebind[2].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_108 0.939759036145) of_108) slbot_108) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[2].GE*15.6)+of.igenebind[2].GE)+sl.max.igenebind[2].GE)} {9.9999999}
(assert (= (+ (+ (* sc_108 15.6) of_108) sltop_108) 9.9999999))
; 
; >=  {((sc.igenebind[2].Vmax*15.6)+of.igenebind[2].Vmax)} {10.}
(assert (<= (+ (* sc_107 15.6) of_107) 10.))
; 
; <=  {((sc.igenebind[2].Vmax*15.6)+of.igenebind[2].Vmax)} {0.0001}
(assert (>= (+ (* sc_107 15.6) of_107) 0.0001))
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
; no offset
(assert (= of_110 0.))
; no offset
(assert (= of_109 0.))
; 
; =  {1.} {(sc.igenebind[16].K*sc.igenebind[16].TF)}
(assert (= 1. (* sc_110 sc_109)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_111 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[16].GE} {(sc.igenebind[16].Vmax*(1./1.))}
(assert (= sc_112 (* sc_111 (/ 1. 1.))))
; 
; =  {of.igenebind[16].GE} {0.}
(assert (= of_112 0.))
(declare-fun slbot_109 () Real)
(declare-fun sltop_109 () Real)
; 
; =  {(((sc.igenebind[16].TF*-1.)+of.igenebind[16].TF)+sl.min.igenebind[16].TF)} {0.0001}
(assert (= (+ (+ (* sc_109 -1.) of_109) slbot_109) 0.0001))
; 
; =  {(((sc.igenebind[16].TF*-0.4)+of.igenebind[16].TF)+sl.max.igenebind[16].TF)} {10.}
(assert (= (+ (+ (* sc_109 -0.4) of_109) sltop_109) 10.))
; 
; >=  {((sc.igenebind[16].K*1.)+of.igenebind[16].K)} {10.}
(assert (<= (+ (* sc_110 1.) of_110) 10.))
; 
; <=  {((sc.igenebind[16].K*1.)+of.igenebind[16].K)} {0.0001}
(assert (>= (+ (* sc_110 1.) of_110) 0.0001))
(declare-fun slbot_112 () Real)
(declare-fun sltop_112 () Real)
; 
; =  {(((sc.igenebind[16].GE*0.)+of.igenebind[16].GE)+sl.min.igenebind[16].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_112 0.) of_112) slbot_112) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[16].GE*1.66666666667)+of.igenebind[16].GE)+sl.max.igenebind[16].GE)} {9.9999999}
(assert (= (+ (+ (* sc_112 1.66666666667) of_112) sltop_112) 9.9999999))
; 
; >=  {((sc.igenebind[16].Vmax*1.)+of.igenebind[16].Vmax)} {10.}
(assert (<= (+ (* sc_111 1.) of_111) 10.))
; 
; <=  {((sc.igenebind[16].Vmax*1.)+of.igenebind[16].Vmax)} {0.0001}
(assert (>= (+ (* sc_111 1.) of_111) 0.0001))
(declare-fun slbot_112 () Real)
(declare-fun sltop_112 () Real)
; 
; =  {(((sc.igenebind[16].GE*0.)+of.igenebind[16].GE)+sl.min.igenebind[16].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_112 0.) of_112) slbot_112) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[16].GE*1.66666666667)+of.igenebind[16].GE)+sl.max.igenebind[16].GE)} {9.9999999}
(assert (= (+ (+ (* sc_112 1.66666666667) of_112) sltop_112) 9.9999999))
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
; no offset
(assert (= of_114 0.))
; no offset
(assert (= of_113 0.))
; 
; =  {1.} {(sc.igenebind[4].K*sc.igenebind[4].TF)}
(assert (= 1. (* sc_114 sc_113)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_115 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[4].GE} {(sc.igenebind[4].Vmax*(1./1.))}
(assert (= sc_116 (* sc_115 (/ 1. 1.))))
; 
; =  {of.igenebind[4].GE} {0.}
(assert (= of_116 0.))
(declare-fun slbot_113 () Real)
(declare-fun sltop_113 () Real)
; 
; =  {(((sc.igenebind[4].TF*0.)+of.igenebind[4].TF)+sl.min.igenebind[4].TF)} {0.0001}
(assert (= (+ (+ (* sc_113 0.) of_113) slbot_113) 0.0001))
; 
; =  {(((sc.igenebind[4].TF*305175.78125)+of.igenebind[4].TF)+sl.max.igenebind[4].TF)} {10.}
(assert (= (+ (+ (* sc_113 305175.78125) of_113) sltop_113) 10.))
; 
; >=  {((sc.igenebind[4].K*1.)+of.igenebind[4].K)} {10.}
(assert (<= (+ (* sc_114 1.) of_114) 10.))
; 
; <=  {((sc.igenebind[4].K*1.)+of.igenebind[4].K)} {0.0001}
(assert (>= (+ (* sc_114 1.) of_114) 0.0001))
(declare-fun slbot_116 () Real)
(declare-fun sltop_116 () Real)
; 
; =  {(((sc.igenebind[4].GE*0.000511998322284)+of.igenebind[4].GE)+sl.min.igenebind[4].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_116 0.000511998322284) of_116) slbot_116) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[4].GE*156.25)+of.igenebind[4].GE)+sl.max.igenebind[4].GE)} {9.9999999}
(assert (= (+ (+ (* sc_116 156.25) of_116) sltop_116) 9.9999999))
; 
; >=  {((sc.igenebind[4].Vmax*156.25)+of.igenebind[4].Vmax)} {10.}
(assert (<= (+ (* sc_115 156.25) of_115) 10.))
; 
; <=  {((sc.igenebind[4].Vmax*156.25)+of.igenebind[4].Vmax)} {0.0001}
(assert (>= (+ (* sc_115 156.25) of_115) 0.0001))
(declare-fun slbot_116 () Real)
(declare-fun sltop_116 () Real)
; 
; =  {(((sc.igenebind[4].GE*0.000511998322284)+of.igenebind[4].GE)+sl.min.igenebind[4].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_116 0.000511998322284) of_116) slbot_116) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[4].GE*156.25)+of.igenebind[4].GE)+sl.max.igenebind[4].GE)} {9.9999999}
(assert (= (+ (+ (* sc_116 156.25) of_116) sltop_116) 9.9999999))
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_118 sc_117))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_118 of_117))
; 
; >=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_117 1250.) of_117) 3300.))
; 
; <=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_117 1250.) of_117) 0.))
; 
; >=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_118 1250.) of_118) 3300.))
; 
; <=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_118 1250.) of_118) 0.))
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_120 sc_119))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_120 of_119))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_119 0.) of_119) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_119 0.) of_119) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_120 0.) of_120) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_120 0.) of_120) 0.))
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_122 sc_121))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_122 of_121))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_121 0.) of_121) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_121 0.) of_121) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_122 0.) of_122) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_122 0.) of_122) 0.))
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_124 sc_123))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_124 of_123))
; 
; >=  {((sc.input.V[13].X*1000.75)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_123 1000.75) of_123) 3300.))
; 
; <=  {((sc.input.V[13].X*1000.75)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_123 1000.75) of_123) 0.))
; 
; >=  {((sc.input.V[13].O*1000.75)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_124 1000.75) of_124) 3300.))
; 
; <=  {((sc.input.V[13].O*1000.75)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_124 1000.75) of_124) 0.))
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
(declare-fun sc_126 () Real)
(assert (> sc_126 1e-08))
(declare-fun of_126 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_126 sc_125))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_126 of_125))
; 
; >=  {((sc.input.V[12].X*4.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_125 4.) of_125) 3300.))
; 
; <=  {((sc.input.V[12].X*4.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_125 4.) of_125) 0.))
; 
; >=  {((sc.input.V[12].O*4.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_126 4.) of_126) 3300.))
; 
; <=  {((sc.input.V[12].O*4.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_126 4.) of_126) 0.))
(declare-fun sc_127 () Real)
(assert (> sc_127 1e-08))
(declare-fun of_127 () Real)
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_128 sc_127))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_128 of_127))
; 
; >=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_127 -1.) of_127) 3300.))
; 
; <=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_127 -1.) of_127) 0.))
; 
; >=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_128 -1.) of_128) 3300.))
; 
; <=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_128 -1.) of_128) 0.))
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
(declare-fun sc_130 () Real)
(assert (> sc_130 1e-08))
(declare-fun of_130 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_130 sc_129))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_130 of_129))
(declare-fun slbot_129 () Real)
(declare-fun sltop_129 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_129 0.) of_129) slbot_129) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_129 0.6) of_129) sltop_129) 3300.))
(declare-fun slbot_130 () Real)
(declare-fun sltop_130 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_130 0.) of_130) slbot_130) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_130 0.6) of_130) sltop_130) 3300.))
(declare-fun sc_131 () Real)
(assert (> sc_131 1e-08))
(declare-fun of_131 () Real)
(declare-fun sc_132 () Real)
(assert (> sc_132 1e-08))
(declare-fun of_132 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_132 sc_131))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_132 of_131))
; 
; >=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_131 4.) of_131) 3300.))
; 
; <=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_131 4.) of_131) 0.))
; 
; >=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_132 4.) of_132) 3300.))
; 
; <=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_132 4.) of_132) 0.))
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_134 sc_133))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_134 of_133))
; 
; >=  {((sc.input.V[10].X*-1.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_133 -1.) of_133) 3300.))
; 
; <=  {((sc.input.V[10].X*-1.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_133 -1.) of_133) 0.))
; 
; >=  {((sc.input.V[10].O*-1.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_134 -1.) of_134) 3300.))
; 
; <=  {((sc.input.V[10].O*-1.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_134 -1.) of_134) 0.))
(declare-fun sc_135 () Real)
(assert (> sc_135 1e-08))
(declare-fun of_135 () Real)
(declare-fun sc_136 () Real)
(assert (> sc_136 1e-08))
(declare-fun of_136 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_136 sc_135))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_136 of_135))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_135 1.) of_135) 3300.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_135 1.) of_135) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_136 1.) of_136) 3300.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_136 1.) of_136) 0.))
(declare-fun sc_137 () Real)
(assert (> sc_137 1e-08))
(declare-fun of_137 () Real)
(declare-fun sc_138 () Real)
(assert (> sc_138 1e-08))
(declare-fun of_138 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_138 sc_137))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_138 of_137))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_137 0.) of_137) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_137 0.) of_137) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_138 0.) of_138) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_138 0.) of_138) 0.))
(declare-fun sc_139 () Real)
(assert (> sc_139 1e-08))
(declare-fun of_139 () Real)
(declare-fun sc_140 () Real)
(assert (> sc_140 1e-08))
(declare-fun of_140 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_140 sc_139))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_140 of_139))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_139 1.) of_139) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_139 1.) of_139) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_140 1.) of_140) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_140 1.) of_140) 0.))
(declare-fun sc_141 () Real)
(assert (> sc_141 1e-08))
(declare-fun of_141 () Real)
(declare-fun sc_142 () Real)
(assert (> sc_142 1e-08))
(declare-fun of_142 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_142 sc_141))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_142 of_141))
; 
; >=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_141 1.) of_141) 3300.))
; 
; <=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_141 1.) of_141) 0.))
; 
; >=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_142 1.) of_142) 3300.))
; 
; <=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_142 1.) of_142) 0.))
(declare-fun sc_143 () Real)
(assert (> sc_143 1e-08))
(declare-fun of_143 () Real)
(declare-fun sc_144 () Real)
(assert (> sc_144 1e-08))
(declare-fun of_144 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_144 sc_143))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_144 of_143))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_143 0.) of_143) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_143 0.) of_143) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_144 0.) of_144) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_144 0.) of_144) 0.))
(declare-fun sc_145 () Real)
(assert (> sc_145 1e-08))
(declare-fun of_145 () Real)
(declare-fun sc_146 () Real)
(assert (> sc_146 1e-08))
(declare-fun of_146 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_146 sc_145))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_146 of_145))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_145 0.) of_145) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_145 0.) of_145) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_146 0.) of_146) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_146 0.) of_146) 0.))
(declare-fun sc_147 () Real)
(assert (> sc_147 1e-08))
(declare-fun of_147 () Real)
(declare-fun sc_148 () Real)
(assert (> sc_148 1e-08))
(declare-fun of_148 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_148 sc_147))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_148 of_147))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_147 0.) of_147) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_147 0.) of_147) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_148 0.) of_148) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_148 0.) of_148) 0.))
(declare-fun sc_149 () Real)
(assert (> sc_149 1e-08))
(declare-fun of_149 () Real)
(declare-fun sc_150 () Real)
(assert (> sc_150 1e-08))
(declare-fun of_150 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_150 sc_149))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_150 of_149))
; 
; >=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_149 2.) of_149) 3300.))
; 
; <=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_149 2.) of_149) 0.))
; 
; >=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_150 2.) of_150) 3300.))
; 
; <=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_150 2.) of_150) 0.))
(declare-fun sc_151 () Real)
(assert (> sc_151 1e-08))
(declare-fun of_151 () Real)
(declare-fun sc_152 () Real)
(assert (> sc_152 1e-08))
(declare-fun of_152 () Real)
(declare-fun sc_153 () Real)
(assert (> sc_153 1e-08))
(declare-fun of_153 () Real)
; no offset
(assert (= of_152 0.))
; no offset
(assert (= of_151 0.))
; 
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_153 (* sc_152 sc_151)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_153 0.))
(declare-fun slbot_151 () Real)
(declare-fun sltop_151 () Real)
; 
; =  {(((sc.itov[9].X*0.)+of.itov[9].X)+sl.min.itov[9].X)} {0.0001}
(assert (= (+ (+ (* sc_151 0.) of_151) slbot_151) 0.0001))
; 
; =  {(((sc.itov[9].X*3.2768e-06)+of.itov[9].X)+sl.max.itov[9].X)} {10.}
(assert (= (+ (+ (* sc_151 3.2768e-06) of_151) sltop_151) 10.))
(declare-fun slbot_153 () Real)
(declare-fun sltop_153 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_153 0.) of_153) slbot_153) 0.0001))
; 
; =  {(((sc.itov[9].Y*3.2768e-06)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_153 3.2768e-06) of_153) sltop_153) 3300.))
; 
; >=  {((sc.itov[9].K*1.)+of.itov[9].K)} {330.}
(assert (<= (+ (* sc_152 1.) of_152) 330.))
; 
; <=  {((sc.itov[9].K*1.)+of.itov[9].K)} {1.}
(assert (>= (+ (* sc_152 1.) of_152) 1.))
(declare-fun slbot_153 () Real)
(declare-fun sltop_153 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_153 0.) of_153) slbot_153) 0.0001))
; 
; =  {(((sc.itov[9].Y*3.2768e-06)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_153 3.2768e-06) of_153) sltop_153) 3300.))
(declare-fun sc_154 () Real)
(assert (> sc_154 1e-08))
(declare-fun of_154 () Real)
(declare-fun sc_155 () Real)
(assert (> sc_155 1e-08))
(declare-fun of_155 () Real)
(declare-fun sc_156 () Real)
(assert (> sc_156 1e-08))
(declare-fun of_156 () Real)
; no offset
(assert (= of_155 0.))
; no offset
(assert (= of_154 0.))
; 
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_156 (* sc_155 sc_154)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_156 0.))
; 
; >=  {((sc.itov[0].X*4.)+of.itov[0].X)} {10.}
(assert (<= (+ (* sc_154 4.) of_154) 10.))
; 
; <=  {((sc.itov[0].X*4.)+of.itov[0].X)} {0.0001}
(assert (>= (+ (* sc_154 4.) of_154) 0.0001))
(declare-fun slbot_156 () Real)
(declare-fun sltop_156 () Real)
; 
; =  {(((sc.itov[0].Y*3.75903614458)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_156 3.75903614458) of_156) slbot_156) 0.0001))
; 
; =  {(((sc.itov[0].Y*62.4)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_156 62.4) of_156) sltop_156) 3300.))
(declare-fun slbot_155 () Real)
(declare-fun sltop_155 () Real)
; 
; =  {(((sc.itov[0].K*0.939759036145)+of.itov[0].K)+sl.min.itov[0].K)} {1.}
(assert (= (+ (+ (* sc_155 0.939759036145) of_155) slbot_155) 1.))
; 
; =  {(((sc.itov[0].K*15.6)+of.itov[0].K)+sl.max.itov[0].K)} {330.}
(assert (= (+ (+ (* sc_155 15.6) of_155) sltop_155) 330.))
(declare-fun slbot_156 () Real)
(declare-fun sltop_156 () Real)
; 
; =  {(((sc.itov[0].Y*3.75903614458)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_156 3.75903614458) of_156) slbot_156) 0.0001))
; 
; =  {(((sc.itov[0].Y*62.4)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_156 62.4) of_156) sltop_156) 3300.))
(declare-fun sc_157 () Real)
(assert (> sc_157 1e-08))
(declare-fun of_157 () Real)
(declare-fun sc_158 () Real)
(assert (> sc_158 1e-08))
(declare-fun of_158 () Real)
(declare-fun sc_159 () Real)
(assert (> sc_159 1e-08))
(declare-fun of_159 () Real)
; no offset
(assert (= of_158 0.))
; no offset
(assert (= of_157 0.))
; 
; =  {sc.itov[18].Y} {(sc.itov[18].K*sc.itov[18].X)}
(assert (= sc_159 (* sc_158 sc_157)))
; 
; =  {of.itov[18].Y} {0.}
(assert (= of_159 0.))
; 
; >=  {((sc.itov[18].X*4.)+of.itov[18].X)} {10.}
(assert (<= (+ (* sc_157 4.) of_157) 10.))
; 
; <=  {((sc.itov[18].X*4.)+of.itov[18].X)} {0.0001}
(assert (>= (+ (* sc_157 4.) of_157) 0.0001))
(declare-fun slbot_159 () Real)
(declare-fun sltop_159 () Real)
; 
; =  {(((sc.itov[18].Y*0.00204799328914)+of.itov[18].Y)+sl.min.itov[18].Y)} {0.0001}
(assert (= (+ (+ (* sc_159 0.00204799328914) of_159) slbot_159) 0.0001))
; 
; =  {(((sc.itov[18].Y*625.)+of.itov[18].Y)+sl.max.itov[18].Y)} {3300.}
(assert (= (+ (+ (* sc_159 625.) of_159) sltop_159) 3300.))
(declare-fun slbot_158 () Real)
(declare-fun sltop_158 () Real)
; 
; =  {(((sc.itov[18].K*0.000511998322284)+of.itov[18].K)+sl.min.itov[18].K)} {1.}
(assert (= (+ (+ (* sc_158 0.000511998322284) of_158) slbot_158) 1.))
; 
; =  {(((sc.itov[18].K*156.25)+of.itov[18].K)+sl.max.itov[18].K)} {330.}
(assert (= (+ (+ (* sc_158 156.25) of_158) sltop_158) 330.))
(declare-fun slbot_159 () Real)
(declare-fun sltop_159 () Real)
; 
; =  {(((sc.itov[18].Y*0.00204799328914)+of.itov[18].Y)+sl.min.itov[18].Y)} {0.0001}
(assert (= (+ (+ (* sc_159 0.00204799328914) of_159) slbot_159) 0.0001))
; 
; =  {(((sc.itov[18].Y*625.)+of.itov[18].Y)+sl.max.itov[18].Y)} {3300.}
(assert (= (+ (+ (* sc_159 625.) of_159) sltop_159) 3300.))
(declare-fun sc_160 () Real)
(assert (> sc_160 1e-08))
(declare-fun of_160 () Real)
(declare-fun sc_161 () Real)
(assert (> sc_161 1e-08))
(declare-fun of_161 () Real)
(declare-fun sc_162 () Real)
(assert (> sc_162 1e-08))
(declare-fun of_162 () Real)
(declare-fun sc_163 () Real)
(assert (> sc_163 1e-08))
(declare-fun of_163 () Real)
(declare-fun sc_164 () Real)
(assert (> sc_164 1e-08))
(declare-fun of_164 () Real)
; 
; =  {sc.iadd[11].A} {sc.iadd[11].B}
(assert (= sc_162 sc_163))
; 
; =  {sc.iadd[11].A} {sc.iadd[11].C} {sc.iadd[11].D}
(assert (and (= sc_162 sc_161) (= sc_162 sc_160)))
; 
; =  {sc.iadd[11].OUT} {sc.iadd[11].A}
(assert (= sc_164 sc_162))
; 
; =  {of.iadd[11].OUT} {((of.iadd[11].A+of.iadd[11].B)-of.iadd[11].C-of.iadd[11].D)}
(assert (= of_164 (- (+ of_162 of_163) (+ of_161 of_160))))
(declare-fun slbot_160 () Real)
(declare-fun sltop_160 () Real)
; 
; =  {(((sc.iadd[11].D*-156.25)+of.iadd[11].D)+sl.min.iadd[11].D)} {0.}
(assert (= (+ (+ (* sc_160 -156.25) of_160) slbot_160) 0.))
; 
; =  {(((sc.iadd[11].D*0.)+of.iadd[11].D)+sl.max.iadd[11].D)} {5.}
(assert (= (+ (+ (* sc_160 0.) of_160) sltop_160) 5.))
; 
; >=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {5.}
(assert (<= (+ (* sc_161 1.) of_161) 5.))
; 
; <=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {0.}
(assert (>= (+ (* sc_161 1.) of_161) 0.))
(declare-fun slbot_164 () Real)
(declare-fun sltop_164 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_164 -1.) of_164) slbot_164) -10.))
; 
; =  {(((sc.iadd[11].OUT*155.25)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_164 155.25) of_164) sltop_164) 10.))
; 
; >=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {5.}
(assert (<= (+ (* sc_162 0.) of_162) 5.))
; 
; <=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {0.}
(assert (>= (+ (* sc_162 0.) of_162) 0.))
; 
; >=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {5.}
(assert (<= (+ (* sc_163 0.) of_163) 5.))
; 
; <=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {0.}
(assert (>= (+ (* sc_163 0.) of_163) 0.))
(declare-fun slbot_164 () Real)
(declare-fun sltop_164 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_164 -1.) of_164) slbot_164) -10.))
; 
; =  {(((sc.iadd[11].OUT*155.25)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_164 155.25) of_164) sltop_164) 10.))
(declare-fun sc_165 () Real)
(assert (> sc_165 1e-08))
(declare-fun of_165 () Real)
(declare-fun sc_166 () Real)
(assert (> sc_166 1e-08))
(declare-fun of_166 () Real)
(declare-fun sc_167 () Real)
(assert (> sc_167 1e-08))
(declare-fun of_167 () Real)
(declare-fun sc_168 () Real)
(assert (> sc_168 1e-08))
(declare-fun of_168 () Real)
(declare-fun sc_169 () Real)
(assert (> sc_169 1e-08))
(declare-fun of_169 () Real)
; 
; =  {sc.iadd[15].A} {sc.iadd[15].B}
(assert (= sc_167 sc_168))
; 
; =  {sc.iadd[15].A} {sc.iadd[15].C} {sc.iadd[15].D}
(assert (and (= sc_167 sc_166) (= sc_167 sc_165)))
; 
; =  {sc.iadd[15].OUT} {sc.iadd[15].A}
(assert (= sc_169 sc_167))
; 
; =  {of.iadd[15].OUT} {((of.iadd[15].A+of.iadd[15].B)-of.iadd[15].C-of.iadd[15].D)}
(assert (= of_169 (- (+ of_167 of_168) (+ of_166 of_165))))
; 
; >=  {((sc.iadd[15].D*0.)+of.iadd[15].D)} {5.}
(assert (<= (+ (* sc_165 0.) of_165) 5.))
; 
; <=  {((sc.iadd[15].D*0.)+of.iadd[15].D)} {0.}
(assert (>= (+ (* sc_165 0.) of_165) 0.))
; 
; >=  {((sc.iadd[15].C*0.)+of.iadd[15].C)} {5.}
(assert (<= (+ (* sc_166 0.) of_166) 5.))
; 
; <=  {((sc.iadd[15].C*0.)+of.iadd[15].C)} {0.}
(assert (>= (+ (* sc_166 0.) of_166) 0.))
(declare-fun slbot_169 () Real)
(declare-fun sltop_169 () Real)
; 
; =  {(((sc.iadd[15].OUT*0.)+of.iadd[15].OUT)+sl.min.iadd[15].OUT)} {-10.}
(assert (= (+ (+ (* sc_169 0.) of_169) slbot_169) -10.))
; 
; =  {(((sc.iadd[15].OUT*1.66666666667)+of.iadd[15].OUT)+sl.max.iadd[15].OUT)} {10.}
(assert (= (+ (+ (* sc_169 1.66666666667) of_169) sltop_169) 10.))
; 
; >=  {((sc.iadd[15].A*0.)+of.iadd[15].A)} {5.}
(assert (<= (+ (* sc_167 0.) of_167) 5.))
; 
; <=  {((sc.iadd[15].A*0.)+of.iadd[15].A)} {0.}
(assert (>= (+ (* sc_167 0.) of_167) 0.))
(declare-fun slbot_168 () Real)
(declare-fun sltop_168 () Real)
; 
; =  {(((sc.iadd[15].B*0.)+of.iadd[15].B)+sl.min.iadd[15].B)} {0.}
(assert (= (+ (+ (* sc_168 0.) of_168) slbot_168) 0.))
; 
; =  {(((sc.iadd[15].B*1.66666666667)+of.iadd[15].B)+sl.max.iadd[15].B)} {5.}
(assert (= (+ (+ (* sc_168 1.66666666667) of_168) sltop_168) 5.))
(declare-fun slbot_169 () Real)
(declare-fun sltop_169 () Real)
; 
; =  {(((sc.iadd[15].OUT*0.)+of.iadd[15].OUT)+sl.min.iadd[15].OUT)} {-10.}
(assert (= (+ (+ (* sc_169 0.) of_169) slbot_169) -10.))
; 
; =  {(((sc.iadd[15].OUT*1.66666666667)+of.iadd[15].OUT)+sl.max.iadd[15].OUT)} {10.}
(assert (= (+ (+ (* sc_169 1.66666666667) of_169) sltop_169) 10.))
(declare-fun sc_170 () Real)
(assert (> sc_170 1e-08))
(declare-fun of_170 () Real)
(declare-fun sc_171 () Real)
(assert (> sc_171 1e-08))
(declare-fun of_171 () Real)
(declare-fun sc_172 () Real)
(assert (> sc_172 1e-08))
(declare-fun of_172 () Real)
(declare-fun sc_173 () Real)
(assert (> sc_173 1e-08))
(declare-fun of_173 () Real)
(declare-fun sc_174 () Real)
(assert (> sc_174 1e-08))
(declare-fun of_174 () Real)
; 
; =  {sc.iadd[6].A} {sc.iadd[6].B}
(assert (= sc_172 sc_173))
; 
; =  {sc.iadd[6].A} {sc.iadd[6].C} {sc.iadd[6].D}
(assert (and (= sc_172 sc_171) (= sc_172 sc_170)))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[6].A}
(assert (= sc_174 sc_172))
; 
; =  {of.iadd[6].OUT} {((of.iadd[6].A+of.iadd[6].B)-of.iadd[6].C-of.iadd[6].D)}
(assert (= of_174 (- (+ of_172 of_173) (+ of_171 of_170))))
; 
; >=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {5.}
(assert (<= (+ (* sc_170 0.) of_170) 5.))
; 
; <=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {0.}
(assert (>= (+ (* sc_170 0.) of_170) 0.))
; 
; >=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {5.}
(assert (<= (+ (* sc_171 0.) of_171) 5.))
; 
; <=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {0.}
(assert (>= (+ (* sc_171 0.) of_171) 0.))
(declare-fun slbot_174 () Real)
(declare-fun sltop_174 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_174 0.) of_174) slbot_174) -10.))
; 
; =  {(((sc.iadd[6].OUT*305175.78125)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_174 305175.78125) of_174) sltop_174) 10.))
; 
; >=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {5.}
(assert (<= (+ (* sc_172 0.) of_172) 5.))
; 
; <=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {0.}
(assert (>= (+ (* sc_172 0.) of_172) 0.))
(declare-fun slbot_173 () Real)
(declare-fun sltop_173 () Real)
; 
; =  {(((sc.iadd[6].B*0.)+of.iadd[6].B)+sl.min.iadd[6].B)} {0.}
(assert (= (+ (+ (* sc_173 0.) of_173) slbot_173) 0.))
; 
; =  {(((sc.iadd[6].B*305175.78125)+of.iadd[6].B)+sl.max.iadd[6].B)} {5.}
(assert (= (+ (+ (* sc_173 305175.78125) of_173) sltop_173) 5.))
(declare-fun slbot_174 () Real)
(declare-fun sltop_174 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_174 0.) of_174) slbot_174) -10.))
; 
; =  {(((sc.iadd[6].OUT*305175.78125)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_174 305175.78125) of_174) sltop_174) 10.))
(declare-fun sc_175 () Real)
(assert (> sc_175 1e-08))
(declare-fun of_175 () Real)
(declare-fun sc_176 () Real)
(assert (> sc_176 1e-08))
(declare-fun of_176 () Real)
(declare-fun sc_177 () Real)
(assert (> sc_177 1e-08))
(declare-fun of_177 () Real)
(declare-fun sc_178 () Real)
(assert (> sc_178 1e-08))
(declare-fun of_178 () Real)
(declare-fun sc_179 () Real)
(assert (> sc_179 1e-08))
(declare-fun of_179 () Real)
; 
; =  {sc.iadd[14].A} {sc.iadd[14].B}
(assert (= sc_177 sc_178))
; 
; =  {sc.iadd[14].A} {sc.iadd[14].C} {sc.iadd[14].D}
(assert (and (= sc_177 sc_176) (= sc_177 sc_175)))
; 
; =  {sc.iadd[14].OUT} {sc.iadd[14].A}
(assert (= sc_179 sc_177))
; 
; =  {of.iadd[14].OUT} {((of.iadd[14].A+of.iadd[14].B)-of.iadd[14].C-of.iadd[14].D)}
(assert (= of_179 (- (+ of_177 of_178) (+ of_176 of_175))))
; 
; >=  {((sc.iadd[14].D*0.)+of.iadd[14].D)} {5.}
(assert (<= (+ (* sc_175 0.) of_175) 5.))
; 
; <=  {((sc.iadd[14].D*0.)+of.iadd[14].D)} {0.}
(assert (>= (+ (* sc_175 0.) of_175) 0.))
; 
; >=  {((sc.iadd[14].C*0.)+of.iadd[14].C)} {5.}
(assert (<= (+ (* sc_176 0.) of_176) 5.))
; 
; <=  {((sc.iadd[14].C*0.)+of.iadd[14].C)} {0.}
(assert (>= (+ (* sc_176 0.) of_176) 0.))
(declare-fun slbot_179 () Real)
(declare-fun sltop_179 () Real)
; 
; =  {(((sc.iadd[14].OUT*0.)+of.iadd[14].OUT)+sl.min.iadd[14].OUT)} {-10.}
(assert (= (+ (+ (* sc_179 0.) of_179) slbot_179) -10.))
; 
; =  {(((sc.iadd[14].OUT*1.66666666667)+of.iadd[14].OUT)+sl.max.iadd[14].OUT)} {10.}
(assert (= (+ (+ (* sc_179 1.66666666667) of_179) sltop_179) 10.))
; 
; >=  {((sc.iadd[14].A*0.)+of.iadd[14].A)} {5.}
(assert (<= (+ (* sc_177 0.) of_177) 5.))
; 
; <=  {((sc.iadd[14].A*0.)+of.iadd[14].A)} {0.}
(assert (>= (+ (* sc_177 0.) of_177) 0.))
(declare-fun slbot_178 () Real)
(declare-fun sltop_178 () Real)
; 
; =  {(((sc.iadd[14].B*0.)+of.iadd[14].B)+sl.min.iadd[14].B)} {0.}
(assert (= (+ (+ (* sc_178 0.) of_178) slbot_178) 0.))
; 
; =  {(((sc.iadd[14].B*1.66666666667)+of.iadd[14].B)+sl.max.iadd[14].B)} {5.}
(assert (= (+ (+ (* sc_178 1.66666666667) of_178) sltop_178) 5.))
(declare-fun slbot_179 () Real)
(declare-fun sltop_179 () Real)
; 
; =  {(((sc.iadd[14].OUT*0.)+of.iadd[14].OUT)+sl.min.iadd[14].OUT)} {-10.}
(assert (= (+ (+ (* sc_179 0.) of_179) slbot_179) -10.))
; 
; =  {(((sc.iadd[14].OUT*1.66666666667)+of.iadd[14].OUT)+sl.max.iadd[14].OUT)} {10.}
(assert (= (+ (+ (* sc_179 1.66666666667) of_179) sltop_179) 10.))
(declare-fun sc_180 () Real)
(assert (> sc_180 1e-08))
(declare-fun of_180 () Real)
(declare-fun sc_181 () Real)
(assert (> sc_181 1e-08))
(declare-fun of_181 () Real)
(declare-fun sc_182 () Real)
(assert (> sc_182 1e-08))
(declare-fun of_182 () Real)
(declare-fun sc_183 () Real)
(assert (> sc_183 1e-08))
(declare-fun of_183 () Real)
(declare-fun sc_184 () Real)
(assert (> sc_184 1e-08))
(declare-fun of_184 () Real)
; 
; =  {sc.iadd[5].A} {sc.iadd[5].B}
(assert (= sc_182 sc_183))
; 
; =  {sc.iadd[5].A} {sc.iadd[5].C} {sc.iadd[5].D}
(assert (and (= sc_182 sc_181) (= sc_182 sc_180)))
; 
; =  {sc.iadd[5].OUT} {sc.iadd[5].A}
(assert (= sc_184 sc_182))
; 
; =  {of.iadd[5].OUT} {((of.iadd[5].A+of.iadd[5].B)-of.iadd[5].C-of.iadd[5].D)}
(assert (= of_184 (- (+ of_182 of_183) (+ of_181 of_180))))
; 
; >=  {((sc.iadd[5].D*0.)+of.iadd[5].D)} {5.}
(assert (<= (+ (* sc_180 0.) of_180) 5.))
; 
; <=  {((sc.iadd[5].D*0.)+of.iadd[5].D)} {0.}
(assert (>= (+ (* sc_180 0.) of_180) 0.))
; 
; >=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {5.}
(assert (<= (+ (* sc_181 0.) of_181) 5.))
; 
; <=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {0.}
(assert (>= (+ (* sc_181 0.) of_181) 0.))
(declare-fun slbot_184 () Real)
(declare-fun sltop_184 () Real)
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_184 0.) of_184) slbot_184) -10.))
; 
; =  {(((sc.iadd[5].OUT*305175.78125)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_184 305175.78125) of_184) sltop_184) 10.))
; 
; >=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {5.}
(assert (<= (+ (* sc_182 0.) of_182) 5.))
; 
; <=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {0.}
(assert (>= (+ (* sc_182 0.) of_182) 0.))
(declare-fun slbot_183 () Real)
(declare-fun sltop_183 () Real)
; 
; =  {(((sc.iadd[5].B*0.)+of.iadd[5].B)+sl.min.iadd[5].B)} {0.}
(assert (= (+ (+ (* sc_183 0.) of_183) slbot_183) 0.))
; 
; =  {(((sc.iadd[5].B*305175.78125)+of.iadd[5].B)+sl.max.iadd[5].B)} {5.}
(assert (= (+ (+ (* sc_183 305175.78125) of_183) sltop_183) 5.))
(declare-fun slbot_184 () Real)
(declare-fun sltop_184 () Real)
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_184 0.) of_184) slbot_184) -10.))
; 
; =  {(((sc.iadd[5].OUT*305175.78125)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_184 305175.78125) of_184) sltop_184) 10.))
(declare-fun sc_185 () Real)
(assert (> sc_185 1e-08))
(declare-fun of_185 () Real)
(declare-fun sc_186 () Real)
(assert (> sc_186 1e-08))
(declare-fun of_186 () Real)
(declare-fun sc_187 () Real)
(assert (> sc_187 1e-08))
(declare-fun of_187 () Real)
(declare-fun sc_188 () Real)
(assert (> sc_188 1e-08))
(declare-fun of_188 () Real)
(declare-fun sc_189 () Real)
(assert (> sc_189 1e-08))
(declare-fun of_189 () Real)
; 
; =  {sc.iadd[17].A} {sc.iadd[17].B}
(assert (= sc_187 sc_188))
; 
; =  {sc.iadd[17].A} {sc.iadd[17].C} {sc.iadd[17].D}
(assert (and (= sc_187 sc_186) (= sc_187 sc_185)))
; 
; =  {sc.iadd[17].OUT} {sc.iadd[17].A}
(assert (= sc_189 sc_187))
; 
; =  {of.iadd[17].OUT} {((of.iadd[17].A+of.iadd[17].B)-of.iadd[17].C-of.iadd[17].D)}
(assert (= of_189 (- (+ of_187 of_188) (+ of_186 of_185))))
(declare-fun slbot_185 () Real)
(declare-fun sltop_185 () Real)
; 
; =  {(((sc.iadd[17].D*-0.6)+of.iadd[17].D)+sl.min.iadd[17].D)} {0.}
(assert (= (+ (+ (* sc_185 -0.6) of_185) slbot_185) 0.))
; 
; =  {(((sc.iadd[17].D*0.)+of.iadd[17].D)+sl.max.iadd[17].D)} {5.}
(assert (= (+ (+ (* sc_185 0.) of_185) sltop_185) 5.))
; 
; >=  {((sc.iadd[17].C*1.)+of.iadd[17].C)} {5.}
(assert (<= (+ (* sc_186 1.) of_186) 5.))
; 
; <=  {((sc.iadd[17].C*1.)+of.iadd[17].C)} {0.}
(assert (>= (+ (* sc_186 1.) of_186) 0.))
(declare-fun slbot_189 () Real)
(declare-fun sltop_189 () Real)
; 
; =  {(((sc.iadd[17].OUT*-1.)+of.iadd[17].OUT)+sl.min.iadd[17].OUT)} {-10.}
(assert (= (+ (+ (* sc_189 -1.) of_189) slbot_189) -10.))
; 
; =  {(((sc.iadd[17].OUT*-0.4)+of.iadd[17].OUT)+sl.max.iadd[17].OUT)} {10.}
(assert (= (+ (+ (* sc_189 -0.4) of_189) sltop_189) 10.))
; 
; >=  {((sc.iadd[17].A*0.)+of.iadd[17].A)} {5.}
(assert (<= (+ (* sc_187 0.) of_187) 5.))
; 
; <=  {((sc.iadd[17].A*0.)+of.iadd[17].A)} {0.}
(assert (>= (+ (* sc_187 0.) of_187) 0.))
; 
; >=  {((sc.iadd[17].B*0.)+of.iadd[17].B)} {5.}
(assert (<= (+ (* sc_188 0.) of_188) 5.))
; 
; <=  {((sc.iadd[17].B*0.)+of.iadd[17].B)} {0.}
(assert (>= (+ (* sc_188 0.) of_188) 0.))
(declare-fun slbot_189 () Real)
(declare-fun sltop_189 () Real)
; 
; =  {(((sc.iadd[17].OUT*-1.)+of.iadd[17].OUT)+sl.min.iadd[17].OUT)} {-10.}
(assert (= (+ (+ (* sc_189 -1.) of_189) slbot_189) -10.))
; 
; =  {(((sc.iadd[17].OUT*-0.4)+of.iadd[17].OUT)+sl.max.iadd[17].OUT)} {10.}
(assert (= (+ (+ (* sc_189 -0.4) of_189) sltop_189) 10.))
(declare-fun sc_190 () Real)
(assert (> sc_190 1e-08))
(declare-fun of_190 () Real)
(declare-fun sc_191 () Real)
(assert (> sc_191 1e-08))
(declare-fun of_191 () Real)
(declare-fun sc_192 () Real)
(assert (> sc_192 1e-08))
(declare-fun of_192 () Real)
(declare-fun sc_193 () Real)
(assert (> sc_193 1e-08))
(declare-fun of_193 () Real)
(declare-fun sc_194 () Real)
(assert (> sc_194 1e-08))
(declare-fun of_194 () Real)
; 
; =  {sc.iadd[18].A} {sc.iadd[18].B}
(assert (= sc_192 sc_193))
; 
; =  {sc.iadd[18].A} {sc.iadd[18].C} {sc.iadd[18].D}
(assert (and (= sc_192 sc_191) (= sc_192 sc_190)))
; 
; =  {sc.iadd[18].OUT} {sc.iadd[18].A}
(assert (= sc_194 sc_192))
; 
; =  {of.iadd[18].OUT} {((of.iadd[18].A+of.iadd[18].B)-of.iadd[18].C-of.iadd[18].D)}
(assert (= of_194 (- (+ of_192 of_193) (+ of_191 of_190))))
; 
; >=  {((sc.iadd[18].D*0.)+of.iadd[18].D)} {5.}
(assert (<= (+ (* sc_190 0.) of_190) 5.))
; 
; <=  {((sc.iadd[18].D*0.)+of.iadd[18].D)} {0.}
(assert (>= (+ (* sc_190 0.) of_190) 0.))
; 
; >=  {((sc.iadd[18].C*0.)+of.iadd[18].C)} {5.}
(assert (<= (+ (* sc_191 0.) of_191) 5.))
; 
; <=  {((sc.iadd[18].C*0.)+of.iadd[18].C)} {0.}
(assert (>= (+ (* sc_191 0.) of_191) 0.))
(declare-fun slbot_192 () Real)
(declare-fun sltop_192 () Real)
; 
; =  {(((sc.iadd[18].A*0.)+of.iadd[18].A)+sl.min.iadd[18].A)} {0.}
(assert (= (+ (+ (* sc_192 0.) of_192) slbot_192) 0.))
; 
; =  {(((sc.iadd[18].A*15.6)+of.iadd[18].A)+sl.max.iadd[18].A)} {5.}
(assert (= (+ (+ (* sc_192 15.6) of_192) sltop_192) 5.))
; 
; >=  {((sc.iadd[18].B*0.)+of.iadd[18].B)} {5.}
(assert (<= (+ (* sc_193 0.) of_193) 5.))
; 
; <=  {((sc.iadd[18].B*0.)+of.iadd[18].B)} {0.}
(assert (>= (+ (* sc_193 0.) of_193) 0.))
(declare-fun slbot_194 () Real)
(declare-fun sltop_194 () Real)
; 
; =  {(((sc.iadd[18].OUT*0.)+of.iadd[18].OUT)+sl.min.iadd[18].OUT)} {-10.}
(assert (= (+ (+ (* sc_194 0.) of_194) slbot_194) -10.))
; 
; =  {(((sc.iadd[18].OUT*15.6)+of.iadd[18].OUT)+sl.max.iadd[18].OUT)} {10.}
(assert (= (+ (+ (* sc_194 15.6) of_194) sltop_194) 10.))
; 
; =  {sc.igenebind[2].GE} {sc.itov[0].K}
(assert (= sc_108 sc_155))
; 
; =  {of.igenebind[2].GE} {of.itov[0].K}
(assert (= of_108 of_155))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[5].B}
(assert (= sc_174 sc_183))
; 
; =  {of.iadd[6].OUT} {of.iadd[5].B}
(assert (= of_174 of_183))
; 
; =  {sc.vadd[1].OUT2} {sc.vtoi[3].X}
(assert (= sc_88 sc_102))
; 
; =  {of.vadd[1].OUT2} {of.vtoi[3].X}
(assert (= of_88 of_102))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].X}
(assert (= sc_88 sc_78))
; 
; =  {of.vadd[1].OUT2} {of.output.V[0].X}
(assert (= of_88 of_78))
; 
; =  {sc.input.I[0].O} {sc.igenebind[4].Vmax}
(assert (= sc_31 sc_115))
; 
; =  {of.input.I[0].O} {of.igenebind[4].Vmax}
(assert (= of_31 of_115))
; 
; =  {sc.vtoi[3].Y} {sc.iadd[11].D}
(assert (= sc_104 sc_160))
; 
; =  {of.vtoi[3].Y} {of.iadd[11].D}
(assert (= of_104 of_160))
; 
; =  {sc.vtoi[12].Y} {sc.iadd[17].D}
(assert (= sc_101 sc_185))
; 
; =  {of.vtoi[12].Y} {of.iadd[17].D}
(assert (= of_101 of_185))
; 
; =  {sc.iadd[15].OUT} {sc.iadd[14].B}
(assert (= sc_169 sc_178))
; 
; =  {of.iadd[15].OUT} {of.iadd[14].B}
(assert (= of_169 of_178))
; 
; =  {sc.input.I[22].O} {sc.igenebind[4].K}
(assert (= sc_77 sc_114))
; 
; =  {of.input.I[22].O} {of.igenebind[4].K}
(assert (= of_77 of_114))
; 
; =  {sc.input.V[15].O} {sc.vgain[8].Y}
(assert (= sc_136 sc_1))
; 
; =  {of.input.V[15].O} {of.vgain[8].Y}
(assert (= of_136 of_1))
; 
; =  {sc.input.I[32].O} {sc.iadd[18].C}
(assert (= sc_71 sc_191))
; 
; =  {of.input.I[32].O} {of.iadd[18].C}
(assert (= of_71 of_191))
; 
; =  {sc.input.I[26].O} {sc.igenebind[16].Vmax}
(assert (= sc_37 sc_111))
; 
; =  {of.input.I[26].O} {of.igenebind[16].Vmax}
(assert (= of_37 of_111))
; 
; =  {sc.input.I[25].O} {sc.iadd[11].C}
(assert (= sc_63 sc_161))
; 
; =  {of.input.I[25].O} {of.iadd[11].C}
(assert (= of_63 of_161))
; 
; =  {sc.input.V[13].O} {sc.switch[13].n}
(assert (= sc_124 sc_4))
; 
; =  {of.input.V[13].O} {of.switch[13].n}
(assert (= of_124 of_4))
; 
; =  {sc.vtoi[7].Y} {sc.iadd[6].B}
(assert (= sc_98 sc_173))
; 
; =  {of.vtoi[7].Y} {of.iadd[6].B}
(assert (= of_98 of_173))
; 
; =  {sc.input.V[14].O} {sc.vtoi[7].X}
(assert (= sc_140 sc_96))
; 
; =  {of.input.V[14].O} {of.vtoi[7].X}
(assert (= of_140 of_96))
; 
; =  {sc.input.V[11].O} {sc.vadd[1].D}
(assert (= sc_132 sc_83))
; 
; =  {of.input.V[11].O} {of.vadd[1].D}
(assert (= of_132 of_83))
; 
; =  {sc.input.I[14].O} {sc.iadd[15].C}
(assert (= sc_47 sc_166))
; 
; =  {of.input.I[14].O} {of.iadd[15].C}
(assert (= of_47 of_166))
; 
; =  {sc.iadd[5].OUT} {sc.igenebind[4].TF}
(assert (= sc_184 sc_113))
; 
; =  {of.iadd[5].OUT} {of.igenebind[4].TF}
(assert (= of_184 of_113))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_156 sc_86))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_156 of_86))
; 
; =  {sc.input.I[24].O} {sc.switch[10].Vmax}
(assert (= sc_53 sc_12))
; 
; =  {of.input.I[24].O} {of.switch[10].Vmax}
(assert (= of_53 of_12))
; 
; =  {sc.input.I[12].O} {sc.iadd[15].D}
(assert (= sc_27 sc_165))
; 
; =  {of.input.I[12].O} {of.iadd[15].D}
(assert (= of_27 of_165))
; 
; =  {sc.input.I[10].O} {sc.iadd[14].A}
(assert (= sc_35 sc_177))
; 
; =  {of.input.I[10].O} {of.iadd[14].A}
(assert (= of_35 of_177))
; 
; =  {sc.iadd[11].OUT} {sc.switch[10].SUB}
(assert (= sc_164 sc_10))
; 
; =  {of.iadd[11].OUT} {of.switch[10].SUB}
(assert (= of_164 of_10))
; 
; =  {sc.input.I[7].O} {sc.iadd[11].A}
(assert (= sc_23 sc_162))
; 
; =  {of.input.I[7].O} {of.iadd[11].A}
(assert (= of_23 of_162))
; 
; =  {sc.iadd[17].OUT} {sc.igenebind[16].TF}
(assert (= sc_189 sc_109))
; 
; =  {of.iadd[17].OUT} {of.igenebind[16].TF}
(assert (= of_189 of_109))
; 
; =  {sc.iadd[18].OUT} {sc.igenebind[2].K}
(assert (= sc_194 sc_106))
; 
; =  {of.iadd[18].OUT} {of.igenebind[2].K}
(assert (= of_194 of_106))
; 
; =  {sc.input.I[8].O} {sc.iadd[11].B}
(assert (= sc_19 sc_163))
; 
; =  {of.input.I[8].O} {of.iadd[11].B}
(assert (= of_19 of_163))
; 
; =  {sc.input.I[23].O} {sc.switch[10].Kmod}
(assert (= sc_61 sc_11))
; 
; =  {of.input.I[23].O} {of.switch[10].Kmod}
(assert (= of_61 of_11))
; 
; =  {sc.input.I[21].O} {sc.igenebind[2].TF}
(assert (= sc_49 sc_105))
; 
; =  {of.input.I[21].O} {of.igenebind[2].TF}
(assert (= of_49 of_105))
; 
; =  {sc.input.V[16].O} {sc.itov[9].K}
(assert (= sc_142 sc_152))
; 
; =  {of.input.V[16].O} {of.itov[9].K}
(assert (= of_142 of_152))
; 
; =  {sc.input.V[5].O} {sc.vadd[19].C}
(assert (= sc_148 sc_91))
; 
; =  {of.input.V[5].O} {of.vadd[19].C}
(assert (= of_148 of_91))
; 
; =  {sc.switch[10].PROD} {sc.itov[9].X}
(assert (= sc_13 sc_151))
; 
; =  {of.switch[10].PROD} {of.itov[9].X}
(assert (= of_13 of_151))
; 
; =  {sc.igenebind[16].GE} {sc.iadd[15].B}
(assert (= sc_112 sc_168))
; 
; =  {of.igenebind[16].GE} {of.iadd[15].B}
(assert (= of_112 of_168))
; 
; =  {sc.input.V[6].O} {sc.vadd[19].A}
(assert (= sc_138 sc_92))
; 
; =  {of.input.V[6].O} {of.vadd[19].A}
(assert (= of_138 of_92))
; 
; =  {sc.iadd[14].OUT} {sc.switch[13].Kmod}
(assert (= sc_179 sc_6))
; 
; =  {of.iadd[14].OUT} {of.switch[13].Kmod}
(assert (= of_179 of_6))
; 
; =  {sc.input.I[28].O} {sc.igenebind[16].K}
(assert (= sc_67 sc_110))
; 
; =  {of.input.I[28].O} {of.igenebind[16].K}
(assert (= of_67 of_110))
; 
; =  {sc.input.I[11].O} {sc.iadd[14].C}
(assert (= sc_33 sc_176))
; 
; =  {of.input.I[11].O} {of.iadd[14].C}
(assert (= of_33 of_176))
; 
; =  {sc.igenebind[4].GE} {sc.itov[18].K}
(assert (= sc_116 sc_158))
; 
; =  {of.igenebind[4].GE} {of.itov[18].K}
(assert (= of_116 of_158))
; 
; =  {sc.input.I[6].O} {sc.iadd[6].C}
(assert (= sc_43 sc_171))
; 
; =  {of.input.I[6].O} {of.iadd[6].C}
(assert (= of_43 of_171))
; 
; =  {sc.vgain[8].P} {sc.vtoi[7].K}
(assert (= sc_3 sc_97))
; 
; =  {of.vgain[8].P} {of.vtoi[7].K}
(assert (= of_3 of_97))
; 
; =  {sc.input.V[9].O} {sc.vtoi[12].K}
(assert (= sc_128 sc_100))
; 
; =  {of.input.V[9].O} {of.vtoi[12].K}
(assert (= of_128 of_100))
; 
; =  {sc.input.I[18].O} {sc.igenebind[2].Vmax}
(assert (= sc_73 sc_107))
; 
; =  {of.input.I[18].O} {of.igenebind[2].Vmax}
(assert (= of_73 of_107))
; 
; =  {sc.input.I[9].O} {sc.iadd[14].D}
(assert (= sc_29 sc_175))
; 
; =  {of.input.I[9].O} {of.iadd[14].D}
(assert (= of_29 of_175))
; 
; =  {sc.input.I[16].O} {sc.iadd[17].B}
(assert (= sc_51 sc_188))
; 
; =  {of.input.I[16].O} {of.iadd[17].B}
(assert (= of_51 of_188))
; 
; =  {sc.input.I[3].O} {sc.iadd[5].C}
(assert (= sc_55 sc_181))
; 
; =  {of.input.I[3].O} {of.iadd[5].C}
(assert (= of_55 of_181))
; 
; =  {sc.input.I[4].O} {sc.iadd[6].D}
(assert (= sc_57 sc_170))
; 
; =  {of.input.I[4].O} {of.iadd[6].D}
(assert (= of_57 of_170))
; 
; =  {sc.input.I[5].O} {sc.iadd[6].A}
(assert (= sc_59 sc_172))
; 
; =  {of.input.I[5].O} {of.iadd[6].A}
(assert (= of_59 of_172))
; 
; =  {sc.vadd[19].OUT2} {sc.output.V[1].X}
(assert (= sc_95 sc_80))
; 
; =  {of.vadd[19].OUT2} {of.output.V[1].X}
(assert (= of_95 of_80))
; 
; =  {sc.vadd[19].OUT2} {sc.switch[13].Vmax}
(assert (= sc_95 sc_7))
; 
; =  {of.vadd[19].OUT2} {of.switch[13].Vmax}
(assert (= of_95 of_7))
; 
; =  {sc.input.V[12].O} {sc.vadd[19].D}
(assert (= sc_126 sc_90))
; 
; =  {of.input.V[12].O} {of.vadd[19].D}
(assert (= of_126 of_90))
; 
; =  {sc.input.I[2].O} {sc.iadd[5].A}
(assert (= sc_15 sc_182))
; 
; =  {of.input.I[2].O} {of.iadd[5].A}
(assert (= of_15 of_182))
; 
; =  {sc.input.V[8].O} {sc.vadd[1].OUT2_0}
(assert (= sc_120 sc_82))
; 
; =  {of.input.V[8].O} {of.vadd[1].OUT2_0}
(assert (= of_120 of_82))
; 
; =  {sc.input.I[20].O} {sc.itov[18].X}
(assert (= sc_17 sc_157))
; 
; =  {of.input.I[20].O} {of.itov[18].X}
(assert (= of_17 of_157))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_144 sc_85))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_144 of_85))
; 
; =  {sc.input.V[2].O} {sc.switch[10].n}
(assert (= sc_118 sc_9))
; 
; =  {of.input.V[2].O} {of.switch[10].n}
(assert (= of_118 of_9))
; 
; =  {sc.input.I[34].O} {sc.iadd[18].D}
(assert (= sc_21 sc_190))
; 
; =  {of.input.I[34].O} {of.iadd[18].D}
(assert (= of_21 of_190))
; 
; =  {sc.input.I[15].O} {sc.iadd[17].A}
(assert (= sc_41 sc_187))
; 
; =  {of.input.I[15].O} {of.iadd[17].A}
(assert (= of_41 of_187))
; 
; =  {sc.input.I[1].O} {sc.iadd[5].D}
(assert (= sc_65 sc_180))
; 
; =  {of.input.I[1].O} {of.iadd[5].D}
(assert (= of_65 of_180))
; 
; =  {sc.input.I[33].O} {sc.iadd[18].B}
(assert (= sc_45 sc_193))
; 
; =  {of.input.I[33].O} {of.iadd[18].B}
(assert (= of_45 of_193))
; 
; =  {sc.input.I[13].O} {sc.iadd[15].A}
(assert (= sc_25 sc_167))
; 
; =  {of.input.I[13].O} {of.iadd[15].A}
(assert (= of_25 of_167))
; 
; =  {sc.input.V[1].O} {sc.vgain[8].X}
(assert (= sc_150 sc_0))
; 
; =  {of.input.V[1].O} {of.vgain[8].X}
(assert (= of_150 of_0))
; 
; =  {sc.switch[13].PROD} {sc.iadd[18].A}
(assert (= sc_8 sc_192))
; 
; =  {of.switch[13].PROD} {of.iadd[18].A}
(assert (= of_8 of_192))
; 
; =  {sc.input.V[7].O} {sc.vadd[19].OUT2_0}
(assert (= sc_122 sc_89))
; 
; =  {of.input.V[7].O} {of.vadd[19].OUT2_0}
(assert (= of_122 of_89))
; 
; =  {sc.input.I[17].O} {sc.switch[13].SUB}
(assert (= sc_69 sc_5))
; 
; =  {of.input.I[17].O} {of.switch[13].SUB}
(assert (= of_69 of_5))
; 
; =  {sc.itov[18].Y} {sc.vadd[19].B}
(assert (= sc_159 sc_93))
; 
; =  {of.itov[18].Y} {of.vadd[19].B}
(assert (= of_159 of_93))
; 
; =  {sc.input.V[10].O} {sc.vtoi[3].K}
(assert (= sc_134 sc_103))
; 
; =  {of.input.V[10].O} {of.vtoi[3].K}
(assert (= of_134 of_103))
; 
; =  {sc.input.I[27].O} {sc.iadd[17].C}
(assert (= sc_39 sc_186))
; 
; =  {of.input.I[27].O} {of.iadd[17].C}
(assert (= of_39 of_186))
; 
; =  {sc.input.V[0].O} {sc.vtoi[12].X}
(assert (= sc_130 sc_99))
; 
; =  {of.input.V[0].O} {of.vtoi[12].X}
(assert (= of_130 of_99))
; 
; =  {sc.itov[9].Y} {sc.vgain[8].Z}
(assert (= sc_153 sc_2))
; 
; =  {of.itov[9].Y} {of.vgain[8].Z}
(assert (= of_153 of_2))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].C}
(assert (= sc_146 sc_84))
; 
; =  {of.input.V[4].O} {of.vadd[1].C}
(assert (= of_146 of_84))
; 
; =  {sc.input.I[19].O} {sc.itov[0].X}
(assert (= sc_75 sc_154))
; 
; =  {of.input.I[19].O} {of.itov[0].X}
(assert (= of_75 of_154))
(assert (<= (* (/ 1. sc_79) 0.001) 0.1))
(assert (<= (* (/ 1. sc_81) 0.001) 0.1))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].O} {sc.vadd[19].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_88 sc_79) (= sc_88 sc_95)) (= sc_88 sc_81)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_130 0.) sltop_130 (- sltop_130)) (ite (>= sltop_158 0.) sltop_158 (- sltop_158))) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= sltop_87 0.) sltop_87 (- sltop_87))) (ite (>= sltop_183 0.) sltop_183 (- sltop_183))) (ite (>= slbot_183 0.) slbot_183 (- slbot_183))) (ite (>= slbot_10 0.) slbot_10 (- slbot_10))) (ite (>= slbot_189 0.) slbot_189 (- slbot_189))) (ite (>= slbot_179 0.) slbot_179 (- slbot_179))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_104 0.) sltop_104 (- sltop_104))) (ite (>= slbot_151 0.) slbot_151 (- slbot_151))) (ite (>= sltop_164 0.) sltop_164 (- sltop_164))) (ite (>= slbot_159 0.) slbot_159 (- slbot_159))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= sltop_10 0.) sltop_10 (- sltop_10))) (ite (>= sltop_112 0.) sltop_112 (- sltop_112))) (ite (>= slbot_130 0.) slbot_130 (- slbot_130))) (ite (>= sltop_109 0.) sltop_109 (- sltop_109))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= slbot_95 0.) slbot_95 (- slbot_95))) (ite (>= sltop_94 0.) sltop_94 (- sltop_94))) (ite (>= slbot_116 0.) slbot_116 (- slbot_116))) (ite (>= slbot_104 0.) slbot_104 (- slbot_104))) (ite (>= slbot_192 0.) slbot_192 (- slbot_192))) (ite (>= slbot_81 0.) slbot_81 (- slbot_81))) (ite (>= slbot_98 0.) slbot_98 (- slbot_98))) (ite (>= sltop_189 0.) sltop_189 (- sltop_189))) (ite (>= slbot_108 0.) slbot_108 (- slbot_108))) (ite (>= slbot_174 0.) slbot_174 (- slbot_174))) (ite (>= slbot_87 0.) slbot_87 (- slbot_87))) (ite (>= slbot_156 0.) slbot_156 (- slbot_156))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= slbot_158 0.) slbot_158 (- slbot_158))) (ite (>= sltop_153 0.) sltop_153 (- sltop_153))) (ite (>= sltop_151 0.) sltop_151 (- sltop_151))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= sltop_159 0.) sltop_159 (- sltop_159))) (ite (>= slbot_185 0.) slbot_185 (- slbot_185))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_179 0.) sltop_179 (- sltop_179))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99))) (ite (>= slbot_153 0.) slbot_153 (- slbot_153))) (ite (>= slbot_155 0.) slbot_155 (- slbot_155))) (ite (>= slbot_194 0.) slbot_194 (- slbot_194))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= slbot_78 0.) slbot_78 (- slbot_78))) (ite (>= sltop_101 0.) sltop_101 (- sltop_101))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= slbot_101 0.) slbot_101 (- slbot_101))) (ite (>= slbot_168 0.) slbot_168 (- slbot_168))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= sltop_81 0.) sltop_81 (- sltop_81))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= slbot_112 0.) slbot_112 (- slbot_112))) (ite (>= sltop_168 0.) sltop_168 (- sltop_168))) (ite (>= sltop_173 0.) sltop_173 (- sltop_173))) (ite (>= sltop_178 0.) sltop_178 (- sltop_178))) (ite (>= sltop_184 0.) sltop_184 (- sltop_184))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= slbot_109 0.) slbot_109 (- slbot_109))) (ite (>= sltop_116 0.) sltop_116 (- sltop_116))) (ite (>= slbot_160 0.) slbot_160 (- slbot_160))) (ite (>= sltop_129 0.) sltop_129 (- sltop_129))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= slbot_169 0.) slbot_169 (- slbot_169))) (ite (>= sltop_174 0.) sltop_174 (- sltop_174))) (ite (>= slbot_113 0.) slbot_113 (- slbot_113))) (ite (>= slbot_178 0.) slbot_178 (- slbot_178))) (ite (>= slbot_106 0.) slbot_106 (- slbot_106))) (ite (>= sltop_156 0.) sltop_156 (- sltop_156))) (ite (>= slbot_173 0.) slbot_173 (- slbot_173))) (ite (>= slbot_129 0.) slbot_129 (- slbot_129))) (ite (>= slbot_184 0.) slbot_184 (- slbot_184))) (ite (>= sltop_98 0.) sltop_98 (- sltop_98))) (ite (>= slbot_164 0.) slbot_164 (- slbot_164))) (ite (>= sltop_102 0.) sltop_102 (- sltop_102))) (ite (>= sltop_95 0.) sltop_95 (- sltop_95))) (ite (>= sltop_155 0.) sltop_155 (- sltop_155))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= sltop_97 0.) sltop_97 (- sltop_97))) (ite (>= sltop_78 0.) sltop_78 (- sltop_78))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= slbot_94 0.) slbot_94 (- slbot_94))) (ite (>= sltop_194 0.) sltop_194 (- sltop_194))) (ite (>= sltop_169 0.) sltop_169 (- sltop_169))) (ite (>= sltop_106 0.) sltop_106 (- sltop_106))) (ite (>= sltop_160 0.) sltop_160 (- sltop_160))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= sltop_185 0.) sltop_185 (- sltop_185))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_97 0.) slbot_97 (- slbot_97))) (ite (>= slbot_102 0.) slbot_102 (- slbot_102))) (ite (>= sltop_108 0.) sltop_108 (- sltop_108))) (ite (>= sltop_113 0.) sltop_113 (- sltop_113))) (ite (>= sltop_192 0.) sltop_192 (- sltop_192)))))
(check-sat)
