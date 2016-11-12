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
; =  {sc.vgain[5].P} {((sc.vgain[5].X/sc.vgain[5].Y)*sc.vgain[5].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[5].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[5].X*2.)+of.vgain[5].X)} {3300.}
(assert (<= (+ (* sc_0 2.) of_0) 3300.))
; 
; <=  {((sc.vgain[5].X*2.)+of.vgain[5].X)} {0.0001}
(assert (>= (+ (* sc_0 2.) of_0) 0.0001))
; 
; >=  {((sc.vgain[5].Y*1.)+of.vgain[5].Y)} {3300.}
(assert (<= (+ (* sc_1 1.) of_1) 3300.))
; 
; <=  {((sc.vgain[5].Y*1.)+of.vgain[5].Y)} {1.}
(assert (>= (+ (* sc_1 1.) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[5].P*0.)+of.vgain[5].P)+sl.min.vgain[5].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[5].P*103.621514368)+of.vgain[5].P)+sl.max.vgain[5].P)} {5445000.}
(assert (= (+ (+ (* sc_3 103.621514368) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[5].Z*0.)+of.vgain[5].Z)+sl.min.vgain[5].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[5].Z*103.621514368)+of.vgain[5].Z)+sl.max.vgain[5].Z)} {3300.}
(assert (= (+ (+ (* sc_2 103.621514368) of_2) sltop_2) 3300.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[5].P*0.)+of.vgain[5].P)+sl.min.vgain[5].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[5].P*103.621514368)+of.vgain[5].P)+sl.max.vgain[5].P)} {5445000.}
(assert (= (+ (+ (* sc_3 103.621514368) of_3) sltop_3) 5445000.))
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
; >=  {((sc.switch[7].n*1250.)+of.switch[7].n)} {3300.}
(assert (<= (+ (* sc_4 1250.) of_4) 3300.))
; 
; <=  {((sc.switch[7].n*1250.)+of.switch[7].n)} {0.5}
(assert (>= (+ (* sc_4 1250.) of_4) 0.5))
(declare-fun slbot_5 () Real)
(declare-fun sltop_5 () Real)
; 
; =  {(((sc.switch[7].SUB*-1.)+of.switch[7].SUB)+sl.min.switch[7].SUB)} {0.0001}
(assert (= (+ (+ (* sc_5 -1.) of_5) slbot_5) 0.0001))
; 
; =  {(((sc.switch[7].SUB*-0.84375)+of.switch[7].SUB)+sl.max.switch[7].SUB)} {10.}
(assert (= (+ (+ (* sc_5 -0.84375) of_5) sltop_5) 10.))
; 
; >=  {((sc.switch[7].Kmod*1.)+of.switch[7].Kmod)} {10.}
(assert (<= (+ (* sc_6 1.) of_6) 10.))
; 
; <=  {((sc.switch[7].Kmod*1.)+of.switch[7].Kmod)} {0.0001}
(assert (>= (+ (* sc_6 1.) of_6) 0.0001))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[7].PROD*0.)+of.switch[7].PROD)+sl.min.switch[7].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[7].PROD*103.621514368)+of.switch[7].PROD)+sl.max.switch[7].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 103.621514368) of_8) sltop_8) 9.9999999))
; 
; >=  {((sc.switch[7].Vmax*1.)+of.switch[7].Vmax)} {10.}
(assert (<= (+ (* sc_7 1.) of_7) 10.))
; 
; <=  {((sc.switch[7].Vmax*1.)+of.switch[7].Vmax)} {0.0001}
(assert (>= (+ (* sc_7 1.) of_7) 0.0001))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[7].PROD*0.)+of.switch[7].PROD)+sl.min.switch[7].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[7].PROD*103.621514368)+of.switch[7].PROD)+sl.max.switch[7].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 103.621514368) of_8) sltop_8) 9.9999999))
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
; >=  {((sc.switch[10].n*1000.75)+of.switch[10].n)} {3300.}
(assert (<= (+ (* sc_9 1000.75) of_9) 3300.))
; 
; <=  {((sc.switch[10].n*1000.75)+of.switch[10].n)} {0.5}
(assert (>= (+ (* sc_9 1000.75) of_9) 0.5))
; 
; >=  {((sc.switch[10].SUB*337.632520764)+of.switch[10].SUB)} {10.}
(assert (<= (+ (* sc_10 337.632520764) of_10) 10.))
; 
; <=  {((sc.switch[10].SUB*337.632520764)+of.switch[10].SUB)} {0.0001}
(assert (>= (+ (* sc_10 337.632520764) of_10) 0.0001))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.switch[10].Kmod*0.)+of.switch[10].Kmod)+sl.min.switch[10].Kmod)} {0.0001}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 0.0001))
; 
; =  {(((sc.switch[10].Kmod*1.66666666667)+of.switch[10].Kmod)+sl.max.switch[10].Kmod)} {10.}
(assert (= (+ (+ (* sc_11 1.66666666667) of_11) sltop_11) 10.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[10].PROD*0.)+of.switch[10].PROD)+sl.min.switch[10].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 9.99934002508e-38))
; 
; =  {(((sc.switch[10].PROD*0.0156)+of.switch[10].PROD)+sl.max.switch[10].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_13 0.0156) of_13) sltop_13) 9.9999999))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.switch[10].Vmax*0.)+of.switch[10].Vmax)+sl.min.switch[10].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.0001))
; 
; =  {(((sc.switch[10].Vmax*0.0156)+of.switch[10].Vmax)+sl.max.switch[10].Vmax)} {10.}
(assert (= (+ (+ (* sc_12 0.0156) of_12) sltop_12) 10.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[10].PROD*0.)+of.switch[10].PROD)+sl.min.switch[10].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 9.99934002508e-38))
; 
; =  {(((sc.switch[10].PROD*0.0156)+of.switch[10].PROD)+sl.max.switch[10].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_13 0.0156) of_13) sltop_13) 9.9999999))
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
; >=  {((sc.input.I[20].X*400.)+of.input.I[20].X)} {10.}
(assert (<= (+ (* sc_16 400.) of_16) 10.))
; 
; <=  {((sc.input.I[20].X*400.)+of.input.I[20].X)} {0.}
(assert (>= (+ (* sc_16 400.) of_16) 0.))
; 
; >=  {((sc.input.I[20].O*400.)+of.input.I[20].O)} {10.}
(assert (<= (+ (* sc_17 400.) of_17) 10.))
; 
; <=  {((sc.input.I[20].O*400.)+of.input.I[20].O)} {0.}
(assert (>= (+ (* sc_17 400.) of_17) 0.))
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; 
; =  {sc.input.I[29].O} {sc.input.I[29].X}
(assert (= sc_19 sc_18))
; 
; =  {of.input.I[29].O} {of.input.I[29].X}
(assert (= of_19 of_18))
; 
; >=  {((sc.input.I[29].X*1.)+of.input.I[29].X)} {10.}
(assert (<= (+ (* sc_18 1.) of_18) 10.))
; 
; <=  {((sc.input.I[29].X*1.)+of.input.I[29].X)} {0.}
(assert (>= (+ (* sc_18 1.) of_18) 0.))
; 
; >=  {((sc.input.I[29].O*1.)+of.input.I[29].O)} {10.}
(assert (<= (+ (* sc_19 1.) of_19) 10.))
; 
; <=  {((sc.input.I[29].O*1.)+of.input.I[29].O)} {0.}
(assert (>= (+ (* sc_19 1.) of_19) 0.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_21 sc_20))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_21 of_20))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_21 0.) of_21) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
; 
; =  {sc.input.I[34].O} {sc.input.I[34].X}
(assert (= sc_23 sc_22))
; 
; =  {of.input.I[34].O} {of.input.I[34].X}
(assert (= of_23 of_22))
; 
; >=  {((sc.input.I[34].X*0.)+of.input.I[34].X)} {10.}
(assert (<= (+ (* sc_22 0.) of_22) 10.))
; 
; <=  {((sc.input.I[34].X*0.)+of.input.I[34].X)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.input.I[34].O*0.)+of.input.I[34].O)} {10.}
(assert (<= (+ (* sc_23 0.) of_23) 10.))
; 
; <=  {((sc.input.I[34].O*0.)+of.input.I[34].O)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_25 sc_24))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_25 of_24))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_24 0.) of_24) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_25 0.) of_25) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_27 sc_26))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_27 of_26))
; 
; >=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_26 0.) of_26) 10.))
; 
; <=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
; 
; >=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_29 sc_28))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_29 of_28))
; 
; >=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
; 
; >=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_29 0.) of_29) 10.))
; 
; <=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_31 sc_30))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_31 of_30))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_30 0.) of_30) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_31 0.) of_31) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; 
; =  {sc.input.I[31].O} {sc.input.I[31].X}
(assert (= sc_33 sc_32))
; 
; =  {of.input.I[31].O} {of.input.I[31].X}
(assert (= of_33 of_32))
; 
; >=  {((sc.input.I[31].X*1.)+of.input.I[31].X)} {10.}
(assert (<= (+ (* sc_32 1.) of_32) 10.))
; 
; <=  {((sc.input.I[31].X*1.)+of.input.I[31].X)} {0.}
(assert (>= (+ (* sc_32 1.) of_32) 0.))
; 
; >=  {((sc.input.I[31].O*1.)+of.input.I[31].O)} {10.}
(assert (<= (+ (* sc_33 1.) of_33) 10.))
; 
; <=  {((sc.input.I[31].O*1.)+of.input.I[31].O)} {0.}
(assert (>= (+ (* sc_33 1.) of_33) 0.))
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_35 sc_34))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_35 of_34))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.input.I[0].X*0.)+of.input.I[0].X)+sl.min.input.I[0].X)} {0.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) 0.))
; 
; =  {(((sc.input.I[0].X*0.6)+of.input.I[0].X)+sl.max.input.I[0].X)} {10.}
(assert (= (+ (+ (* sc_34 0.6) of_34) sltop_34) 10.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.input.I[0].O*0.)+of.input.I[0].O)+sl.min.input.I[0].O)} {0.}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35) 0.))
; 
; =  {(((sc.input.I[0].O*0.6)+of.input.I[0].O)+sl.max.input.I[0].O)} {10.}
(assert (= (+ (+ (* sc_35 0.6) of_35) sltop_35) 10.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_36 0.) of_36) 10.))
; 
; <=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
; 
; >=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_37 0.) of_37) 10.))
; 
; <=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_38 0.) of_38) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_39 0.) of_39) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.I[26].O} {sc.input.I[26].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.I[26].O} {of.input.I[26].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.I[26].X*1.)+of.input.I[26].X)} {10.}
(assert (<= (+ (* sc_40 1.) of_40) 10.))
; 
; <=  {((sc.input.I[26].X*1.)+of.input.I[26].X)} {0.}
(assert (>= (+ (* sc_40 1.) of_40) 0.))
; 
; >=  {((sc.input.I[26].O*1.)+of.input.I[26].O)} {10.}
(assert (<= (+ (* sc_41 1.) of_41) 10.))
; 
; <=  {((sc.input.I[26].O*1.)+of.input.I[26].O)} {0.}
(assert (>= (+ (* sc_41 1.) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.I[27].O} {sc.input.I[27].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.I[27].O} {of.input.I[27].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.I[27].X*1.)+of.input.I[27].X)} {10.}
(assert (<= (+ (* sc_42 1.) of_42) 10.))
; 
; <=  {((sc.input.I[27].X*1.)+of.input.I[27].X)} {0.}
(assert (>= (+ (* sc_42 1.) of_42) 0.))
; 
; >=  {((sc.input.I[27].O*1.)+of.input.I[27].O)} {10.}
(assert (<= (+ (* sc_43 1.) of_43) 10.))
; 
; <=  {((sc.input.I[27].O*1.)+of.input.I[27].O)} {0.}
(assert (>= (+ (* sc_43 1.) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_44 0.) of_44) 10.))
; 
; <=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_45 0.) of_45) 10.))
; 
; <=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_46 0.) of_46) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_47 0.) of_47) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.I[33].O} {sc.input.I[33].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.I[33].O} {of.input.I[33].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.I[33].X*0.)+of.input.I[33].X)} {10.}
(assert (<= (+ (* sc_48 0.) of_48) 10.))
; 
; <=  {((sc.input.I[33].X*0.)+of.input.I[33].X)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.input.I[33].O*0.)+of.input.I[33].O)} {10.}
(assert (<= (+ (* sc_49 0.) of_49) 10.))
; 
; <=  {((sc.input.I[33].O*0.)+of.input.I[33].O)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.I[14].X*0.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_50 0.) of_50) 10.))
; 
; <=  {((sc.input.I[14].X*0.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.I[14].O*0.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_51 0.) of_51) 10.))
; 
; <=  {((sc.input.I[14].O*0.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.I[21].O} {sc.input.I[21].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.I[21].O} {of.input.I[21].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.I[21].X*337.632520764)+of.input.I[21].X)} {10.}
(assert (<= (+ (* sc_52 337.632520764) of_52) 10.))
; 
; <=  {((sc.input.I[21].X*337.632520764)+of.input.I[21].X)} {0.}
(assert (>= (+ (* sc_52 337.632520764) of_52) 0.))
; 
; >=  {((sc.input.I[21].O*337.632520764)+of.input.I[21].O)} {10.}
(assert (<= (+ (* sc_53 337.632520764) of_53) 10.))
; 
; <=  {((sc.input.I[21].O*337.632520764)+of.input.I[21].O)} {0.}
(assert (>= (+ (* sc_53 337.632520764) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.I[16].X*0.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_54 0.) of_54) 10.))
; 
; <=  {((sc.input.I[16].X*0.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
; 
; >=  {((sc.input.I[16].O*0.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_55 0.) of_55) 10.))
; 
; <=  {((sc.input.I[16].O*0.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.I[24].O} {sc.input.I[24].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.I[24].O} {of.input.I[24].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.I[24].X*1.)+of.input.I[24].X)} {10.}
(assert (<= (+ (* sc_56 1.) of_56) 10.))
; 
; <=  {((sc.input.I[24].X*1.)+of.input.I[24].X)} {0.}
(assert (>= (+ (* sc_56 1.) of_56) 0.))
; 
; >=  {((sc.input.I[24].O*1.)+of.input.I[24].O)} {10.}
(assert (<= (+ (* sc_57 1.) of_57) 10.))
; 
; <=  {((sc.input.I[24].O*1.)+of.input.I[24].O)} {0.}
(assert (>= (+ (* sc_57 1.) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_58 0.) of_58) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_59 0.) of_59) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.I[30].O} {sc.input.I[30].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.I[30].O} {of.input.I[30].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.I[30].X*1.)+of.input.I[30].X)} {10.}
(assert (<= (+ (* sc_60 1.) of_60) 10.))
; 
; <=  {((sc.input.I[30].X*1.)+of.input.I[30].X)} {0.}
(assert (>= (+ (* sc_60 1.) of_60) 0.))
; 
; >=  {((sc.input.I[30].O*1.)+of.input.I[30].O)} {10.}
(assert (<= (+ (* sc_61 1.) of_61) 10.))
; 
; <=  {((sc.input.I[30].O*1.)+of.input.I[30].O)} {0.}
(assert (>= (+ (* sc_61 1.) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_62 0.) of_62) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_63 0.) of_63) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_64 0.) of_64) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_65 0.) of_65) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.I[23].O} {sc.input.I[23].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.I[23].O} {of.input.I[23].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.I[23].X*1.5625)+of.input.I[23].X)} {10.}
(assert (<= (+ (* sc_66 1.5625) of_66) 10.))
; 
; <=  {((sc.input.I[23].X*1.5625)+of.input.I[23].X)} {0.}
(assert (>= (+ (* sc_66 1.5625) of_66) 0.))
; 
; >=  {((sc.input.I[23].O*1.5625)+of.input.I[23].O)} {10.}
(assert (<= (+ (* sc_67 1.5625) of_67) 10.))
; 
; <=  {((sc.input.I[23].O*1.5625)+of.input.I[23].O)} {0.}
(assert (>= (+ (* sc_67 1.5625) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.I[25].O} {sc.input.I[25].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.I[25].O} {of.input.I[25].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.I[25].X*1.)+of.input.I[25].X)} {10.}
(assert (<= (+ (* sc_68 1.) of_68) 10.))
; 
; <=  {((sc.input.I[25].X*1.)+of.input.I[25].X)} {0.}
(assert (>= (+ (* sc_68 1.) of_68) 0.))
; 
; >=  {((sc.input.I[25].O*1.)+of.input.I[25].O)} {10.}
(assert (<= (+ (* sc_69 1.) of_69) 10.))
; 
; <=  {((sc.input.I[25].O*1.)+of.input.I[25].O)} {0.}
(assert (>= (+ (* sc_69 1.) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_70 0.) of_70) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_71 0.) of_71) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_71 0.) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.input.I[28].O} {sc.input.I[28].X}
(assert (= sc_73 sc_72))
; 
; =  {of.input.I[28].O} {of.input.I[28].X}
(assert (= of_73 of_72))
; 
; >=  {((sc.input.I[28].X*1.)+of.input.I[28].X)} {10.}
(assert (<= (+ (* sc_72 1.) of_72) 10.))
; 
; <=  {((sc.input.I[28].X*1.)+of.input.I[28].X)} {0.}
(assert (>= (+ (* sc_72 1.) of_72) 0.))
; 
; >=  {((sc.input.I[28].O*1.)+of.input.I[28].O)} {10.}
(assert (<= (+ (* sc_73 1.) of_73) 10.))
; 
; <=  {((sc.input.I[28].O*1.)+of.input.I[28].O)} {0.}
(assert (>= (+ (* sc_73 1.) of_73) 0.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_75 sc_74))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_75 of_74))
; 
; >=  {((sc.input.I[17].X*0.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_74 0.) of_74) 10.))
; 
; <=  {((sc.input.I[17].X*0.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
; 
; >=  {((sc.input.I[17].O*0.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_75 0.) of_75) 10.))
; 
; <=  {((sc.input.I[17].O*0.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; 
; =  {sc.input.I[32].O} {sc.input.I[32].X}
(assert (= sc_77 sc_76))
; 
; =  {of.input.I[32].O} {of.input.I[32].X}
(assert (= of_77 of_76))
; 
; >=  {((sc.input.I[32].X*0.)+of.input.I[32].X)} {10.}
(assert (<= (+ (* sc_76 0.) of_76) 10.))
; 
; <=  {((sc.input.I[32].X*0.)+of.input.I[32].X)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
; 
; >=  {((sc.input.I[32].O*0.)+of.input.I[32].O)} {10.}
(assert (<= (+ (* sc_77 0.) of_77) 10.))
; 
; <=  {((sc.input.I[32].O*0.)+of.input.I[32].O)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; 
; =  {sc.input.I[18].O} {sc.input.I[18].X}
(assert (= sc_79 sc_78))
; 
; =  {of.input.I[18].O} {of.input.I[18].X}
(assert (= of_79 of_78))
; 
; >=  {((sc.input.I[18].X*0.)+of.input.I[18].X)} {10.}
(assert (<= (+ (* sc_78 0.) of_78) 10.))
; 
; <=  {((sc.input.I[18].X*0.)+of.input.I[18].X)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
; 
; >=  {((sc.input.I[18].O*0.)+of.input.I[18].O)} {10.}
(assert (<= (+ (* sc_79 0.) of_79) 10.))
; 
; <=  {((sc.input.I[18].O*0.)+of.input.I[18].O)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
; 
; =  {sc.input.I[19].O} {sc.input.I[19].X}
(assert (= sc_81 sc_80))
; 
; =  {of.input.I[19].O} {of.input.I[19].X}
(assert (= of_81 of_80))
; 
; >=  {((sc.input.I[19].X*0.)+of.input.I[19].X)} {10.}
(assert (<= (+ (* sc_80 0.) of_80) 10.))
; 
; <=  {((sc.input.I[19].X*0.)+of.input.I[19].X)} {0.}
(assert (>= (+ (* sc_80 0.) of_80) 0.))
; 
; >=  {((sc.input.I[19].O*0.)+of.input.I[19].O)} {10.}
(assert (<= (+ (* sc_81 0.) of_81) 10.))
; 
; <=  {((sc.input.I[19].O*0.)+of.input.I[19].O)} {0.}
(assert (>= (+ (* sc_81 0.) of_81) 0.))
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
; 
; =  {sc.input.I[22].O} {sc.input.I[22].X}
(assert (= sc_83 sc_82))
; 
; =  {of.input.I[22].O} {of.input.I[22].X}
(assert (= of_83 of_82))
; 
; >=  {((sc.input.I[22].X*0.156)+of.input.I[22].X)} {10.}
(assert (<= (+ (* sc_82 0.156) of_82) 10.))
; 
; <=  {((sc.input.I[22].X*0.156)+of.input.I[22].X)} {0.}
(assert (>= (+ (* sc_82 0.156) of_82) 0.))
; 
; >=  {((sc.input.I[22].O*0.156)+of.input.I[22].O)} {10.}
(assert (<= (+ (* sc_83 0.156) of_83) 10.))
; 
; <=  {((sc.input.I[22].O*0.156)+of.input.I[22].O)} {0.}
(assert (>= (+ (* sc_83 0.156) of_83) 0.))
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_85 sc_84))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_85 of_84))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84) 0.0001))
; 
; =  {(((sc.output.V[0].X*0.15625)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_84 0.15625) of_84) sltop_84) 3300.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.15625)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_85 0.15625) of_85) sltop_85) 3300.))
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_87 sc_86))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_87 of_86))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 0.0001))
; 
; =  {(((sc.output.V[1].X*0.0156)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_86 0.0156) of_86) sltop_86) 3300.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.0156)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_87 0.0156) of_87) sltop_87) 3300.))
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
(assert (= 0. 0.))
; no offset
(assert (= of_89 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_90 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_92 0.))
; 
; =  {sc.vadd[16].A} {(1.*sc.vadd[16].B)}
(assert (= sc_91 (* 1. sc_92)))
; 
; =  {sc.vadd[16].A} {(1.*sc.vadd[16].C)} {(1.*sc.vadd[16].D)}
(assert (and (= sc_91 (* 1. sc_90)) (= sc_91 (* 1. sc_89))))
; no offset
(assert (= (- (+ of_91 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[16].OUT} {(sc.vadd[16].A*1.)}
(assert (= sc_93 (* sc_91 1.)))
; 
; =  {of.vadd[16].OUT} {0.}
(assert (= of_93 0.))
; no scale
(assert (= sc_89 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_89 0.))
; no offset
(assert (= of_94 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_90 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_92 0.))
; 
; =  {sc.vadd[16].A} {(1.*sc.vadd[16].B)}
(assert (= sc_91 (* 1. sc_92)))
; 
; =  {sc.vadd[16].A} {(1.*sc.vadd[16].C)} {(1.*sc.vadd[16].D*sc.vadd[16].OUT2)}
(assert (and (= sc_91 (* 1. sc_90)) (= sc_91 (* (* 1. sc_89) sc_94))))
; no offset
(assert (= (- (+ of_91 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[16].OUT2} {(sc.vadd[16].A*1.)}
(assert (= sc_94 (* sc_91 1.)))
; no offset
(assert (= of_94 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[16].OUT2_0} {(sc.vadd[16].A*1.)}
(assert (= sc_88 (* sc_91 1.)))
; 
; =  {of.vadd[16].OUT2_0} {0.}
(assert (= of_88 0.))
; 
; >=  {((sc.vadd[16].OUT2_0*0.)+of.vadd[16].OUT2_0)} {3300.}
(assert (<= (+ (* sc_88 0.) of_88) 3300.))
; 
; <=  {((sc.vadd[16].OUT2_0*0.)+of.vadd[16].OUT2_0)} {0.}
(assert (>= (+ (* sc_88 0.) of_88) 0.))
; 
; >=  {((sc.vadd[16].D*4.)+of.vadd[16].D)} {3300.}
(assert (<= (+ (* sc_89 4.) of_89) 3300.))
; 
; <=  {((sc.vadd[16].D*4.)+of.vadd[16].D)} {0.}
(assert (>= (+ (* sc_89 4.) of_89) 0.))
; 
; >=  {((sc.vadd[16].C*0.)+of.vadd[16].C)} {3300.}
(assert (<= (+ (* sc_90 0.) of_90) 3300.))
; 
; <=  {((sc.vadd[16].C*0.)+of.vadd[16].C)} {0.}
(assert (>= (+ (* sc_90 0.) of_90) 0.))
; 
; >=  {((sc.vadd[16].A*0.)+of.vadd[16].A)} {3300.}
(assert (<= (+ (* sc_91 0.) of_91) 3300.))
; 
; <=  {((sc.vadd[16].A*0.)+of.vadd[16].A)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.vadd[16].OUT2*0.)+of.vadd[16].OUT2)+sl.min.vadd[16].OUT2)} {0.}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94) 0.))
; 
; =  {(((sc.vadd[16].OUT2*0.0156)+of.vadd[16].OUT2)+sl.max.vadd[16].OUT2)} {3300.}
(assert (= (+ (+ (* sc_94 0.0156) of_94) sltop_94) 3300.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.vadd[16].B*619.026085325)+of.vadd[16].B)+sl.min.vadd[16].B)} {0.}
(assert (= (+ (+ (* sc_92 619.026085325) of_92) slbot_92) 0.))
; 
; =  {(((sc.vadd[16].B*625.)+of.vadd[16].B)+sl.max.vadd[16].B)} {3300.}
(assert (= (+ (+ (* sc_92 625.) of_92) sltop_92) 3300.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.vadd[16].OUT*619.026085325)+of.vadd[16].OUT)+sl.min.vadd[16].OUT)} {-1650.}
(assert (= (+ (+ (* sc_93 619.026085325) of_93) slbot_93) -1650.))
; 
; =  {(((sc.vadd[16].OUT*625.)+of.vadd[16].OUT)+sl.max.vadd[16].OUT)} {1650.}
(assert (= (+ (+ (* sc_93 625.) of_93) sltop_93) 1650.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.vadd[16].OUT2*0.)+of.vadd[16].OUT2)+sl.min.vadd[16].OUT2)} {0.}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94) 0.))
; 
; =  {(((sc.vadd[16].OUT2*0.0156)+of.vadd[16].OUT2)+sl.max.vadd[16].OUT2)} {3300.}
(assert (= (+ (+ (* sc_94 0.0156) of_94) sltop_94) 3300.))
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
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_96 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_97 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_99 0.))
; 
; =  {sc.vadd[18].A} {(1.*sc.vadd[18].B)}
(assert (= sc_98 (* 1. sc_99)))
; 
; =  {sc.vadd[18].A} {(1.*sc.vadd[18].C)} {(1.*sc.vadd[18].D)}
(assert (and (= sc_98 (* 1. sc_97)) (= sc_98 (* 1. sc_96))))
; no offset
(assert (= (- (+ of_98 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[18].OUT} {(sc.vadd[18].A*1.)}
(assert (= sc_100 (* sc_98 1.)))
; 
; =  {of.vadd[18].OUT} {0.}
(assert (= of_100 0.))
; no scale
(assert (= sc_96 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_96 0.))
; no offset
(assert (= of_101 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_97 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_99 0.))
; 
; =  {sc.vadd[18].A} {(1.*sc.vadd[18].B)}
(assert (= sc_98 (* 1. sc_99)))
; 
; =  {sc.vadd[18].A} {(1.*sc.vadd[18].C)} {(1.*sc.vadd[18].D*sc.vadd[18].OUT2)}
(assert (and (= sc_98 (* 1. sc_97)) (= sc_98 (* (* 1. sc_96) sc_101))))
; no offset
(assert (= (- (+ of_98 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[18].OUT2} {(sc.vadd[18].A*1.)}
(assert (= sc_101 (* sc_98 1.)))
; no offset
(assert (= of_101 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[18].OUT2_0} {(sc.vadd[18].A*1.)}
(assert (= sc_95 (* sc_98 1.)))
; 
; =  {of.vadd[18].OUT2_0} {0.}
(assert (= of_95 0.))
; 
; >=  {((sc.vadd[18].OUT2_0*0.)+of.vadd[18].OUT2_0)} {3300.}
(assert (<= (+ (* sc_95 0.) of_95) 3300.))
; 
; <=  {((sc.vadd[18].OUT2_0*0.)+of.vadd[18].OUT2_0)} {0.}
(assert (>= (+ (* sc_95 0.) of_95) 0.))
; 
; >=  {((sc.vadd[18].D*4.)+of.vadd[18].D)} {3300.}
(assert (<= (+ (* sc_96 4.) of_96) 3300.))
; 
; <=  {((sc.vadd[18].D*4.)+of.vadd[18].D)} {0.}
(assert (>= (+ (* sc_96 4.) of_96) 0.))
; 
; >=  {((sc.vadd[18].C*0.)+of.vadd[18].C)} {3300.}
(assert (<= (+ (* sc_97 0.) of_97) 3300.))
; 
; <=  {((sc.vadd[18].C*0.)+of.vadd[18].C)} {0.}
(assert (>= (+ (* sc_97 0.) of_97) 0.))
; 
; >=  {((sc.vadd[18].A*0.)+of.vadd[18].A)} {3300.}
(assert (<= (+ (* sc_98 0.) of_98) 3300.))
; 
; <=  {((sc.vadd[18].A*0.)+of.vadd[18].A)} {0.}
(assert (>= (+ (* sc_98 0.) of_98) 0.))
(declare-fun slbot_101 () Real)
(declare-fun sltop_101 () Real)
; 
; =  {(((sc.vadd[18].OUT2*0.)+of.vadd[18].OUT2)+sl.min.vadd[18].OUT2)} {0.}
(assert (= (+ (+ (* sc_101 0.) of_101) slbot_101) 0.))
; 
; =  {(((sc.vadd[18].OUT2*0.15625)+of.vadd[18].OUT2)+sl.max.vadd[18].OUT2)} {3300.}
(assert (= (+ (+ (* sc_101 0.15625) of_101) sltop_101) 3300.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.vadd[18].B*61.4415124065)+of.vadd[18].B)+sl.min.vadd[18].B)} {0.}
(assert (= (+ (+ (* sc_99 61.4415124065) of_99) slbot_99) 0.))
; 
; =  {(((sc.vadd[18].B*62.4)+of.vadd[18].B)+sl.max.vadd[18].B)} {3300.}
(assert (= (+ (+ (* sc_99 62.4) of_99) sltop_99) 3300.))
(declare-fun slbot_100 () Real)
(declare-fun sltop_100 () Real)
; 
; =  {(((sc.vadd[18].OUT*61.4415124065)+of.vadd[18].OUT)+sl.min.vadd[18].OUT)} {-1650.}
(assert (= (+ (+ (* sc_100 61.4415124065) of_100) slbot_100) -1650.))
; 
; =  {(((sc.vadd[18].OUT*62.4)+of.vadd[18].OUT)+sl.max.vadd[18].OUT)} {1650.}
(assert (= (+ (+ (* sc_100 62.4) of_100) sltop_100) 1650.))
(declare-fun slbot_101 () Real)
(declare-fun sltop_101 () Real)
; 
; =  {(((sc.vadd[18].OUT2*0.)+of.vadd[18].OUT2)+sl.min.vadd[18].OUT2)} {0.}
(assert (= (+ (+ (* sc_101 0.) of_101) slbot_101) 0.))
; 
; =  {(((sc.vadd[18].OUT2*0.15625)+of.vadd[18].OUT2)+sl.max.vadd[18].OUT2)} {3300.}
(assert (= (+ (+ (* sc_101 0.15625) of_101) sltop_101) 3300.))
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
; =  {sc.vtoi[0].Y} {((1./sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_104 (* (/ 1. sc_103) sc_102)))
; 
; =  {of.vtoi[0].Y} {0.}
(assert (= of_104 0.))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_102 0.) of_102) slbot_102) 1.))
; 
; =  {(((sc.vtoi[0].X*0.15625)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_102 0.15625) of_102) sltop_102) 3300.))
(declare-fun slbot_104 () Real)
(declare-fun sltop_104 () Real)
; 
; =  {(((sc.vtoi[0].Y*-0.15625)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_104 -0.15625) of_104) slbot_104) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_104 0.) of_104) sltop_104) 3300.))
; 
; >=  {((sc.vtoi[0].K*-1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_103 -1.) of_103) 3300.))
; 
; <=  {((sc.vtoi[0].K*-1.)+of.vtoi[0].K)} {1.}
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_106 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_105 0.))
; 
; =  {sc.vtoi[4].Y} {((1./sc.vtoi[4].K)*sc.vtoi[4].X)}
(assert (= sc_107 (* (/ 1. sc_106) sc_105)))
; 
; =  {of.vtoi[4].Y} {0.}
(assert (= of_107 0.))
; 
; >=  {((sc.vtoi[4].X*1.)+of.vtoi[4].X)} {3300.}
(assert (<= (+ (* sc_105 1.) of_105) 3300.))
; 
; <=  {((sc.vtoi[4].X*1.)+of.vtoi[4].X)} {1.}
(assert (>= (+ (* sc_105 1.) of_105) 1.))
(declare-fun slbot_107 () Real)
(declare-fun sltop_107 () Real)
; 
; =  {(((sc.vtoi[4].Y*0.)+of.vtoi[4].Y)+sl.min.vtoi[4].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_107 0.) of_107) slbot_107) 0.00030303030303))
; 
; =  {(((sc.vtoi[4].Y*0.00965050555471)+of.vtoi[4].Y)+sl.max.vtoi[4].Y)} {3300.}
(assert (= (+ (+ (* sc_107 0.00965050555471) of_107) sltop_107) 3300.))
(declare-fun slbot_106 () Real)
(declare-fun sltop_106 () Real)
; 
; =  {(((sc.vtoi[4].K*0.)+of.vtoi[4].K)+sl.min.vtoi[4].K)} {1.}
(assert (= (+ (+ (* sc_106 0.) of_106) slbot_106) 1.))
; 
; =  {(((sc.vtoi[4].K*103.621514368)+of.vtoi[4].K)+sl.max.vtoi[4].K)} {3300.}
(assert (= (+ (+ (* sc_106 103.621514368) of_106) sltop_106) 3300.))
(declare-fun slbot_107 () Real)
(declare-fun sltop_107 () Real)
; 
; =  {(((sc.vtoi[4].Y*0.)+of.vtoi[4].Y)+sl.min.vtoi[4].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_107 0.) of_107) slbot_107) 0.00030303030303))
; 
; =  {(((sc.vtoi[4].Y*0.00965050555471)+of.vtoi[4].Y)+sl.max.vtoi[4].Y)} {3300.}
(assert (= (+ (+ (* sc_107 0.00965050555471) of_107) sltop_107) 3300.))
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
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
(assert (= of_109 0.))
; no offset
(assert (= of_108 0.))
; 
; =  {1.} {(sc.igenebind[13].K*sc.igenebind[13].TF)}
(assert (= 1. (* sc_109 sc_108)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_110 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[13].GE} {(sc.igenebind[13].Vmax*(1./1.))}
(assert (= sc_111 (* sc_110 (/ 1. 1.))))
; 
; =  {of.igenebind[13].GE} {0.}
(assert (= of_111 0.))
(declare-fun slbot_108 () Real)
(declare-fun sltop_108 () Real)
; 
; =  {(((sc.igenebind[13].TF*-1.)+of.igenebind[13].TF)+sl.min.igenebind[13].TF)} {0.0001}
(assert (= (+ (+ (* sc_108 -1.) of_108) slbot_108) 0.0001))
; 
; =  {(((sc.igenebind[13].TF*-0.4)+of.igenebind[13].TF)+sl.max.igenebind[13].TF)} {10.}
(assert (= (+ (+ (* sc_108 -0.4) of_108) sltop_108) 10.))
; 
; >=  {((sc.igenebind[13].K*1.)+of.igenebind[13].K)} {10.}
(assert (<= (+ (* sc_109 1.) of_109) 10.))
; 
; <=  {((sc.igenebind[13].K*1.)+of.igenebind[13].K)} {0.0001}
(assert (>= (+ (* sc_109 1.) of_109) 0.0001))
(declare-fun slbot_111 () Real)
(declare-fun sltop_111 () Real)
; 
; =  {(((sc.igenebind[13].GE*0.)+of.igenebind[13].GE)+sl.min.igenebind[13].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_111 0.) of_111) slbot_111) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[13].GE*1.66666666667)+of.igenebind[13].GE)+sl.max.igenebind[13].GE)} {9.9999999}
(assert (= (+ (+ (* sc_111 1.66666666667) of_111) sltop_111) 9.9999999))
; 
; >=  {((sc.igenebind[13].Vmax*1.)+of.igenebind[13].Vmax)} {10.}
(assert (<= (+ (* sc_110 1.) of_110) 10.))
; 
; <=  {((sc.igenebind[13].Vmax*1.)+of.igenebind[13].Vmax)} {0.0001}
(assert (>= (+ (* sc_110 1.) of_110) 0.0001))
(declare-fun slbot_111 () Real)
(declare-fun sltop_111 () Real)
; 
; =  {(((sc.igenebind[13].GE*0.)+of.igenebind[13].GE)+sl.min.igenebind[13].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_111 0.) of_111) slbot_111) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[13].GE*1.66666666667)+of.igenebind[13].GE)+sl.max.igenebind[13].GE)} {9.9999999}
(assert (= (+ (+ (* sc_111 1.66666666667) of_111) sltop_111) 9.9999999))
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
; no offset
(assert (= of_113 0.))
; no offset
(assert (= of_112 0.))
; 
; =  {1.} {(sc.igenebind[1].K*sc.igenebind[1].TF)}
(assert (= 1. (* sc_113 sc_112)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_114 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[1].GE} {(sc.igenebind[1].Vmax*(1./1.))}
(assert (= sc_115 (* sc_114 (/ 1. 1.))))
; 
; =  {of.igenebind[1].GE} {0.}
(assert (= of_115 0.))
(declare-fun slbot_112 () Real)
(declare-fun sltop_112 () Real)
; 
; =  {(((sc.igenebind[1].TF*0.)+of.igenebind[1].TF)+sl.min.igenebind[1].TF)} {0.0001}
(assert (= (+ (+ (* sc_112 0.) of_112) slbot_112) 0.0001))
; 
; =  {(((sc.igenebind[1].TF*0.00965050555471)+of.igenebind[1].TF)+sl.max.igenebind[1].TF)} {10.}
(assert (= (+ (+ (* sc_112 0.00965050555471) of_112) sltop_112) 10.))
; 
; >=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {10.}
(assert (<= (+ (* sc_113 1.) of_113) 10.))
; 
; <=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {0.0001}
(assert (>= (+ (* sc_113 1.) of_113) 0.0001))
(declare-fun slbot_115 () Real)
(declare-fun sltop_115 () Real)
; 
; =  {(((sc.igenebind[1].GE*1.54756521331)+of.igenebind[1].GE)+sl.min.igenebind[1].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_115 1.54756521331) of_115) slbot_115) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[1].GE*1.5625)+of.igenebind[1].GE)+sl.max.igenebind[1].GE)} {9.9999999}
(assert (= (+ (+ (* sc_115 1.5625) of_115) sltop_115) 9.9999999))
; 
; >=  {((sc.igenebind[1].Vmax*1.5625)+of.igenebind[1].Vmax)} {10.}
(assert (<= (+ (* sc_114 1.5625) of_114) 10.))
; 
; <=  {((sc.igenebind[1].Vmax*1.5625)+of.igenebind[1].Vmax)} {0.0001}
(assert (>= (+ (* sc_114 1.5625) of_114) 0.0001))
(declare-fun slbot_115 () Real)
(declare-fun sltop_115 () Real)
; 
; =  {(((sc.igenebind[1].GE*1.54756521331)+of.igenebind[1].GE)+sl.min.igenebind[1].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_115 1.54756521331) of_115) slbot_115) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[1].GE*1.5625)+of.igenebind[1].GE)+sl.max.igenebind[1].GE)} {9.9999999}
(assert (= (+ (+ (* sc_115 1.5625) of_115) sltop_115) 9.9999999))
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
; no offset
(assert (= of_117 0.))
; no offset
(assert (= of_116 0.))
; 
; =  {1.} {(sc.igenebind[19].K*sc.igenebind[19].TF)}
(assert (= 1. (* sc_117 sc_116)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_118 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[19].GE} {(sc.igenebind[19].Vmax*(1./1.))}
(assert (= sc_119 (* sc_118 (/ 1. 1.))))
; 
; =  {of.igenebind[19].GE} {0.}
(assert (= of_119 0.))
; 
; >=  {((sc.igenebind[19].TF*1.)+of.igenebind[19].TF)} {10.}
(assert (<= (+ (* sc_116 1.) of_116) 10.))
; 
; <=  {((sc.igenebind[19].TF*1.)+of.igenebind[19].TF)} {0.0001}
(assert (>= (+ (* sc_116 1.) of_116) 0.0001))
(declare-fun slbot_117 () Real)
(declare-fun sltop_117 () Real)
; 
; =  {(((sc.igenebind[19].K*0.)+of.igenebind[19].K)+sl.min.igenebind[19].K)} {0.0001}
(assert (= (+ (+ (* sc_117 0.) of_117) slbot_117) 0.0001))
; 
; =  {(((sc.igenebind[19].K*0.0156)+of.igenebind[19].K)+sl.max.igenebind[19].K)} {10.}
(assert (= (+ (+ (* sc_117 0.0156) of_117) sltop_117) 10.))
(declare-fun slbot_119 () Real)
(declare-fun sltop_119 () Real)
; 
; =  {(((sc.igenebind[19].GE*0.153603781016)+of.igenebind[19].GE)+sl.min.igenebind[19].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_119 0.153603781016) of_119) slbot_119) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[19].GE*0.156)+of.igenebind[19].GE)+sl.max.igenebind[19].GE)} {9.9999999}
(assert (= (+ (+ (* sc_119 0.156) of_119) sltop_119) 9.9999999))
; 
; >=  {((sc.igenebind[19].Vmax*0.156)+of.igenebind[19].Vmax)} {10.}
(assert (<= (+ (* sc_118 0.156) of_118) 10.))
; 
; <=  {((sc.igenebind[19].Vmax*0.156)+of.igenebind[19].Vmax)} {0.0001}
(assert (>= (+ (* sc_118 0.156) of_118) 0.0001))
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_121 sc_120))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_121 of_120))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_120 0.) of_120) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_120 0.) of_120) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_121 0.) of_121) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_121 0.) of_121) 0.))
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_123 sc_122))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_123 of_122))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_122 0.) of_122) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_122 0.) of_122) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_123 0.) of_123) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_123 0.) of_123) 0.))
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_125 sc_124))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_125 of_124))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_124 0.) of_124) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_124 0.) of_124) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_125 0.) of_125) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_125 0.) of_125) 0.))
(declare-fun sc_126 () Real)
(assert (> sc_126 1e-08))
(declare-fun of_126 () Real)
(declare-fun sc_127 () Real)
(assert (> sc_127 1e-08))
(declare-fun of_127 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_127 sc_126))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_127 of_126))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_126 1.) of_126) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_126 1.) of_126) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_127 1.) of_127) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_127 1.) of_127) 0.))
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_129 sc_128))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_129 of_128))
; 
; >=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_128 1000.75) of_128) 3300.))
; 
; <=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_128 1000.75) of_128) 0.))
; 
; >=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_129 1000.75) of_129) 3300.))
; 
; <=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_129 1000.75) of_129) 0.))
(declare-fun sc_130 () Real)
(assert (> sc_130 1e-08))
(declare-fun of_130 () Real)
(declare-fun sc_131 () Real)
(assert (> sc_131 1e-08))
(declare-fun of_131 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_131 sc_130))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_131 of_130))
; 
; >=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_130 -1.) of_130) 3300.))
; 
; <=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_130 -1.) of_130) 0.))
; 
; >=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_131 -1.) of_131) 3300.))
; 
; <=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_131 -1.) of_131) 0.))
(declare-fun sc_132 () Real)
(assert (> sc_132 1e-08))
(declare-fun of_132 () Real)
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_133 sc_132))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_133 of_132))
; 
; >=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_132 2.) of_132) 3300.))
; 
; <=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_132 2.) of_132) 0.))
; 
; >=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_133 2.) of_133) 3300.))
; 
; <=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_133 2.) of_133) 0.))
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
(declare-fun sc_135 () Real)
(assert (> sc_135 1e-08))
(declare-fun of_135 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_135 sc_134))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_135 of_134))
; 
; >=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_134 4.) of_134) 3300.))
; 
; <=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_134 4.) of_134) 0.))
; 
; >=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_135 4.) of_135) 3300.))
; 
; <=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_135 4.) of_135) 0.))
(declare-fun sc_136 () Real)
(assert (> sc_136 1e-08))
(declare-fun of_136 () Real)
(declare-fun sc_137 () Real)
(assert (> sc_137 1e-08))
(declare-fun of_137 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_137 sc_136))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_137 of_136))
; 
; >=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_136 4.) of_136) 3300.))
; 
; <=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_136 4.) of_136) 0.))
; 
; >=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_137 4.) of_137) 3300.))
; 
; <=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_137 4.) of_137) 0.))
(declare-fun sc_138 () Real)
(assert (> sc_138 1e-08))
(declare-fun of_138 () Real)
(declare-fun sc_139 () Real)
(assert (> sc_139 1e-08))
(declare-fun of_139 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_139 sc_138))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_139 of_138))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_138 1.) of_138) 3300.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_138 1.) of_138) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_139 1.) of_139) 3300.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_139 1.) of_139) 0.))
(declare-fun sc_140 () Real)
(assert (> sc_140 1e-08))
(declare-fun of_140 () Real)
(declare-fun sc_141 () Real)
(assert (> sc_141 1e-08))
(declare-fun of_141 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_141 sc_140))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_141 of_140))
; 
; >=  {((sc.input.V[6].X*400.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_140 400.) of_140) 3300.))
; 
; <=  {((sc.input.V[6].X*400.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_140 400.) of_140) 0.))
; 
; >=  {((sc.input.V[6].O*400.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_141 400.) of_141) 3300.))
; 
; <=  {((sc.input.V[6].O*400.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_141 400.) of_141) 0.))
(declare-fun sc_142 () Real)
(assert (> sc_142 1e-08))
(declare-fun of_142 () Real)
(declare-fun sc_143 () Real)
(assert (> sc_143 1e-08))
(declare-fun of_143 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_143 sc_142))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_143 of_142))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_142 1.) of_142) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_142 1.) of_142) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_143 1.) of_143) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_143 1.) of_143) 0.))
(declare-fun sc_144 () Real)
(assert (> sc_144 1e-08))
(declare-fun of_144 () Real)
(declare-fun sc_145 () Real)
(assert (> sc_145 1e-08))
(declare-fun of_145 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_145 sc_144))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_145 of_144))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_144 0.) of_144) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_144 0.) of_144) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_145 0.) of_145) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_145 0.) of_145) 0.))
(declare-fun sc_146 () Real)
(assert (> sc_146 1e-08))
(declare-fun of_146 () Real)
(declare-fun sc_147 () Real)
(assert (> sc_147 1e-08))
(declare-fun of_147 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_147 sc_146))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_147 of_146))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_146 0.) of_146) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_146 0.) of_146) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_147 0.) of_147) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_147 0.) of_147) 0.))
(declare-fun sc_148 () Real)
(assert (> sc_148 1e-08))
(declare-fun of_148 () Real)
(declare-fun sc_149 () Real)
(assert (> sc_149 1e-08))
(declare-fun of_149 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_149 sc_148))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_149 of_148))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_148 0.) of_148) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_148 0.) of_148) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_149 0.) of_149) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_149 0.) of_149) 0.))
(declare-fun sc_150 () Real)
(assert (> sc_150 1e-08))
(declare-fun of_150 () Real)
(declare-fun sc_151 () Real)
(assert (> sc_151 1e-08))
(declare-fun of_151 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_151 sc_150))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_151 of_150))
; 
; >=  {((sc.input.V[1].X*1250.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_150 1250.) of_150) 3300.))
; 
; <=  {((sc.input.V[1].X*1250.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_150 1250.) of_150) 0.))
; 
; >=  {((sc.input.V[1].O*1250.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_151 1250.) of_151) 3300.))
; 
; <=  {((sc.input.V[1].O*1250.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_151 1250.) of_151) 0.))
(declare-fun sc_152 () Real)
(assert (> sc_152 1e-08))
(declare-fun of_152 () Real)
(declare-fun sc_153 () Real)
(assert (> sc_153 1e-08))
(declare-fun of_153 () Real)
(declare-fun sc_154 () Real)
(assert (> sc_154 1e-08))
(declare-fun of_154 () Real)
; no offset
(assert (= of_153 0.))
; no offset
(assert (= of_152 0.))
; 
; =  {sc.itov[15].Y} {(sc.itov[15].K*sc.itov[15].X)}
(assert (= sc_154 (* sc_153 sc_152)))
; 
; =  {of.itov[15].Y} {0.}
(assert (= of_154 0.))
(declare-fun slbot_152 () Real)
(declare-fun sltop_152 () Real)
; 
; =  {(((sc.itov[15].X*1.54756521331)+of.itov[15].X)+sl.min.itov[15].X)} {0.0001}
(assert (= (+ (+ (* sc_152 1.54756521331) of_152) slbot_152) 0.0001))
; 
; =  {(((sc.itov[15].X*1.5625)+of.itov[15].X)+sl.max.itov[15].X)} {10.}
(assert (= (+ (+ (* sc_152 1.5625) of_152) sltop_152) 10.))
(declare-fun slbot_154 () Real)
(declare-fun sltop_154 () Real)
; 
; =  {(((sc.itov[15].Y*619.026085325)+of.itov[15].Y)+sl.min.itov[15].Y)} {0.0001}
(assert (= (+ (+ (* sc_154 619.026085325) of_154) slbot_154) 0.0001))
; 
; =  {(((sc.itov[15].Y*625.)+of.itov[15].Y)+sl.max.itov[15].Y)} {3300.}
(assert (= (+ (+ (* sc_154 625.) of_154) sltop_154) 3300.))
; 
; >=  {((sc.itov[15].K*400.)+of.itov[15].K)} {330.}
(assert (<= (+ (* sc_153 400.) of_153) 330.))
; 
; <=  {((sc.itov[15].K*400.)+of.itov[15].K)} {1.}
(assert (>= (+ (* sc_153 400.) of_153) 1.))
(declare-fun slbot_154 () Real)
(declare-fun sltop_154 () Real)
; 
; =  {(((sc.itov[15].Y*619.026085325)+of.itov[15].Y)+sl.min.itov[15].Y)} {0.0001}
(assert (= (+ (+ (* sc_154 619.026085325) of_154) slbot_154) 0.0001))
; 
; =  {(((sc.itov[15].Y*625.)+of.itov[15].Y)+sl.max.itov[15].Y)} {3300.}
(assert (= (+ (+ (* sc_154 625.) of_154) sltop_154) 3300.))
(declare-fun sc_155 () Real)
(assert (> sc_155 1e-08))
(declare-fun of_155 () Real)
(declare-fun sc_156 () Real)
(assert (> sc_156 1e-08))
(declare-fun of_156 () Real)
(declare-fun sc_157 () Real)
(assert (> sc_157 1e-08))
(declare-fun of_157 () Real)
; no offset
(assert (= of_156 0.))
; no offset
(assert (= of_155 0.))
; 
; =  {sc.itov[6].Y} {(sc.itov[6].K*sc.itov[6].X)}
(assert (= sc_157 (* sc_156 sc_155)))
; 
; =  {of.itov[6].Y} {0.}
(assert (= of_157 0.))
(declare-fun slbot_155 () Real)
(declare-fun sltop_155 () Real)
; 
; =  {(((sc.itov[6].X*0.)+of.itov[6].X)+sl.min.itov[6].X)} {0.0001}
(assert (= (+ (+ (* sc_155 0.) of_155) slbot_155) 0.0001))
; 
; =  {(((sc.itov[6].X*103.621514368)+of.itov[6].X)+sl.max.itov[6].X)} {10.}
(assert (= (+ (+ (* sc_155 103.621514368) of_155) sltop_155) 10.))
(declare-fun slbot_157 () Real)
(declare-fun sltop_157 () Real)
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_157 0.) of_157) slbot_157) 0.0001))
; 
; =  {(((sc.itov[6].Y*103.621514368)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_157 103.621514368) of_157) sltop_157) 3300.))
; 
; >=  {((sc.itov[6].K*1.)+of.itov[6].K)} {330.}
(assert (<= (+ (* sc_156 1.) of_156) 330.))
; 
; <=  {((sc.itov[6].K*1.)+of.itov[6].K)} {1.}
(assert (>= (+ (* sc_156 1.) of_156) 1.))
(declare-fun slbot_157 () Real)
(declare-fun sltop_157 () Real)
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_157 0.) of_157) slbot_157) 0.0001))
; 
; =  {(((sc.itov[6].Y*103.621514368)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_157 103.621514368) of_157) sltop_157) 3300.))
(declare-fun sc_158 () Real)
(assert (> sc_158 1e-08))
(declare-fun of_158 () Real)
(declare-fun sc_159 () Real)
(assert (> sc_159 1e-08))
(declare-fun of_159 () Real)
(declare-fun sc_160 () Real)
(assert (> sc_160 1e-08))
(declare-fun of_160 () Real)
; no offset
(assert (= of_159 0.))
; no offset
(assert (= of_158 0.))
; 
; =  {sc.itov[17].Y} {(sc.itov[17].K*sc.itov[17].X)}
(assert (= sc_160 (* sc_159 sc_158)))
; 
; =  {of.itov[17].Y} {0.}
(assert (= of_160 0.))
; 
; >=  {((sc.itov[17].X*400.)+of.itov[17].X)} {10.}
(assert (<= (+ (* sc_158 400.) of_158) 10.))
; 
; <=  {((sc.itov[17].X*400.)+of.itov[17].X)} {0.0001}
(assert (>= (+ (* sc_158 400.) of_158) 0.0001))
(declare-fun slbot_160 () Real)
(declare-fun sltop_160 () Real)
; 
; =  {(((sc.itov[17].Y*61.4415124065)+of.itov[17].Y)+sl.min.itov[17].Y)} {0.0001}
(assert (= (+ (+ (* sc_160 61.4415124065) of_160) slbot_160) 0.0001))
; 
; =  {(((sc.itov[17].Y*62.4)+of.itov[17].Y)+sl.max.itov[17].Y)} {3300.}
(assert (= (+ (+ (* sc_160 62.4) of_160) sltop_160) 3300.))
(declare-fun slbot_159 () Real)
(declare-fun sltop_159 () Real)
; 
; =  {(((sc.itov[17].K*0.153603781016)+of.itov[17].K)+sl.min.itov[17].K)} {1.}
(assert (= (+ (+ (* sc_159 0.153603781016) of_159) slbot_159) 1.))
; 
; =  {(((sc.itov[17].K*0.156)+of.itov[17].K)+sl.max.itov[17].K)} {330.}
(assert (= (+ (+ (* sc_159 0.156) of_159) sltop_159) 330.))
(declare-fun slbot_160 () Real)
(declare-fun sltop_160 () Real)
; 
; =  {(((sc.itov[17].Y*61.4415124065)+of.itov[17].Y)+sl.min.itov[17].Y)} {0.0001}
(assert (= (+ (+ (* sc_160 61.4415124065) of_160) slbot_160) 0.0001))
; 
; =  {(((sc.itov[17].Y*62.4)+of.itov[17].Y)+sl.max.itov[17].Y)} {3300.}
(assert (= (+ (+ (* sc_160 62.4) of_160) sltop_160) 3300.))
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
(declare-fun sc_165 () Real)
(assert (> sc_165 1e-08))
(declare-fun of_165 () Real)
; 
; =  {sc.iadd[2].A} {sc.iadd[2].B}
(assert (= sc_163 sc_164))
; 
; =  {sc.iadd[2].A} {sc.iadd[2].C} {sc.iadd[2].D}
(assert (and (= sc_163 sc_162) (= sc_163 sc_161)))
; 
; =  {sc.iadd[2].OUT} {sc.iadd[2].A}
(assert (= sc_165 sc_163))
; 
; =  {of.iadd[2].OUT} {((of.iadd[2].A+of.iadd[2].B)-of.iadd[2].C-of.iadd[2].D)}
(assert (= of_165 (- (+ of_163 of_164) (+ of_162 of_161))))
; 
; >=  {((sc.iadd[2].D*0.)+of.iadd[2].D)} {5.}
(assert (<= (+ (* sc_161 0.) of_161) 5.))
; 
; <=  {((sc.iadd[2].D*0.)+of.iadd[2].D)} {0.}
(assert (>= (+ (* sc_161 0.) of_161) 0.))
; 
; >=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {5.}
(assert (<= (+ (* sc_162 0.) of_162) 5.))
; 
; <=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {0.}
(assert (>= (+ (* sc_162 0.) of_162) 0.))
(declare-fun slbot_165 () Real)
(declare-fun sltop_165 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_165 0.) of_165) slbot_165) -10.))
; 
; =  {(((sc.iadd[2].OUT*0.00965050555471)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_165 0.00965050555471) of_165) sltop_165) 10.))
; 
; >=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {5.}
(assert (<= (+ (* sc_163 0.) of_163) 5.))
; 
; <=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {0.}
(assert (>= (+ (* sc_163 0.) of_163) 0.))
(declare-fun slbot_164 () Real)
(declare-fun sltop_164 () Real)
; 
; =  {(((sc.iadd[2].B*0.)+of.iadd[2].B)+sl.min.iadd[2].B)} {0.}
(assert (= (+ (+ (* sc_164 0.) of_164) slbot_164) 0.))
; 
; =  {(((sc.iadd[2].B*0.00965050555471)+of.iadd[2].B)+sl.max.iadd[2].B)} {5.}
(assert (= (+ (+ (* sc_164 0.00965050555471) of_164) sltop_164) 5.))
(declare-fun slbot_165 () Real)
(declare-fun sltop_165 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_165 0.) of_165) slbot_165) -10.))
; 
; =  {(((sc.iadd[2].OUT*0.00965050555471)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_165 0.00965050555471) of_165) sltop_165) 10.))
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
(declare-fun sc_170 () Real)
(assert (> sc_170 1e-08))
(declare-fun of_170 () Real)
; 
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_168 sc_169))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_168 sc_167) (= sc_168 sc_166)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_170 sc_168))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_170 (- (+ of_168 of_169) (+ of_167 of_166))))
(declare-fun slbot_166 () Real)
(declare-fun sltop_166 () Real)
; 
; =  {(((sc.iadd[8].D*-0.15625)+of.iadd[8].D)+sl.min.iadd[8].D)} {0.}
(assert (= (+ (+ (* sc_166 -0.15625) of_166) slbot_166) 0.))
; 
; =  {(((sc.iadd[8].D*0.)+of.iadd[8].D)+sl.max.iadd[8].D)} {5.}
(assert (= (+ (+ (* sc_166 0.) of_166) sltop_166) 5.))
; 
; >=  {((sc.iadd[8].C*1.)+of.iadd[8].C)} {5.}
(assert (<= (+ (* sc_167 1.) of_167) 5.))
; 
; <=  {((sc.iadd[8].C*1.)+of.iadd[8].C)} {0.}
(assert (>= (+ (* sc_167 1.) of_167) 0.))
(declare-fun slbot_170 () Real)
(declare-fun sltop_170 () Real)
; 
; =  {(((sc.iadd[8].OUT*-1.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_170 -1.) of_170) slbot_170) -10.))
; 
; =  {(((sc.iadd[8].OUT*-0.84375)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_170 -0.84375) of_170) sltop_170) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_168 0.) of_168) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_168 0.) of_168) 0.))
; 
; >=  {((sc.iadd[8].B*0.)+of.iadd[8].B)} {5.}
(assert (<= (+ (* sc_169 0.) of_169) 5.))
; 
; <=  {((sc.iadd[8].B*0.)+of.iadd[8].B)} {0.}
(assert (>= (+ (* sc_169 0.) of_169) 0.))
(declare-fun slbot_170 () Real)
(declare-fun sltop_170 () Real)
; 
; =  {(((sc.iadd[8].OUT*-1.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_170 -1.) of_170) slbot_170) -10.))
; 
; =  {(((sc.iadd[8].OUT*-0.84375)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_170 -0.84375) of_170) sltop_170) 10.))
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
(declare-fun sc_175 () Real)
(assert (> sc_175 1e-08))
(declare-fun of_175 () Real)
; 
; =  {sc.iadd[12].A} {sc.iadd[12].B}
(assert (= sc_173 sc_174))
; 
; =  {sc.iadd[12].A} {sc.iadd[12].C} {sc.iadd[12].D}
(assert (and (= sc_173 sc_172) (= sc_173 sc_171)))
; 
; =  {sc.iadd[12].OUT} {sc.iadd[12].A}
(assert (= sc_175 sc_173))
; 
; =  {of.iadd[12].OUT} {((of.iadd[12].A+of.iadd[12].B)-of.iadd[12].C-of.iadd[12].D)}
(assert (= of_175 (- (+ of_173 of_174) (+ of_172 of_171))))
; 
; >=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {5.}
(assert (<= (+ (* sc_171 0.) of_171) 5.))
; 
; <=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {0.}
(assert (>= (+ (* sc_171 0.) of_171) 0.))
; 
; >=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {5.}
(assert (<= (+ (* sc_172 0.) of_172) 5.))
; 
; <=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {0.}
(assert (>= (+ (* sc_172 0.) of_172) 0.))
(declare-fun slbot_175 () Real)
(declare-fun sltop_175 () Real)
; 
; =  {(((sc.iadd[12].OUT*0.)+of.iadd[12].OUT)+sl.min.iadd[12].OUT)} {-10.}
(assert (= (+ (+ (* sc_175 0.) of_175) slbot_175) -10.))
; 
; =  {(((sc.iadd[12].OUT*1.66666666667)+of.iadd[12].OUT)+sl.max.iadd[12].OUT)} {10.}
(assert (= (+ (+ (* sc_175 1.66666666667) of_175) sltop_175) 10.))
; 
; >=  {((sc.iadd[12].A*0.)+of.iadd[12].A)} {5.}
(assert (<= (+ (* sc_173 0.) of_173) 5.))
; 
; <=  {((sc.iadd[12].A*0.)+of.iadd[12].A)} {0.}
(assert (>= (+ (* sc_173 0.) of_173) 0.))
(declare-fun slbot_174 () Real)
(declare-fun sltop_174 () Real)
; 
; =  {(((sc.iadd[12].B*0.)+of.iadd[12].B)+sl.min.iadd[12].B)} {0.}
(assert (= (+ (+ (* sc_174 0.) of_174) slbot_174) 0.))
; 
; =  {(((sc.iadd[12].B*1.66666666667)+of.iadd[12].B)+sl.max.iadd[12].B)} {5.}
(assert (= (+ (+ (* sc_174 1.66666666667) of_174) sltop_174) 5.))
(declare-fun slbot_175 () Real)
(declare-fun sltop_175 () Real)
; 
; =  {(((sc.iadd[12].OUT*0.)+of.iadd[12].OUT)+sl.min.iadd[12].OUT)} {-10.}
(assert (= (+ (+ (* sc_175 0.) of_175) slbot_175) -10.))
; 
; =  {(((sc.iadd[12].OUT*1.66666666667)+of.iadd[12].OUT)+sl.max.iadd[12].OUT)} {10.}
(assert (= (+ (+ (* sc_175 1.66666666667) of_175) sltop_175) 10.))
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
(declare-fun sc_180 () Real)
(assert (> sc_180 1e-08))
(declare-fun of_180 () Real)
; 
; =  {sc.iadd[9].A} {sc.iadd[9].B}
(assert (= sc_178 sc_179))
; 
; =  {sc.iadd[9].A} {sc.iadd[9].C} {sc.iadd[9].D}
(assert (and (= sc_178 sc_177) (= sc_178 sc_176)))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[9].A}
(assert (= sc_180 sc_178))
; 
; =  {of.iadd[9].OUT} {((of.iadd[9].A+of.iadd[9].B)-of.iadd[9].C-of.iadd[9].D)}
(assert (= of_180 (- (+ of_178 of_179) (+ of_177 of_176))))
(declare-fun slbot_176 () Real)
(declare-fun sltop_176 () Real)
; 
; =  {(((sc.iadd[9].D*0.)+of.iadd[9].D)+sl.min.iadd[9].D)} {0.}
(assert (= (+ (+ (* sc_176 0.) of_176) slbot_176) 0.))
; 
; =  {(((sc.iadd[9].D*0.6)+of.iadd[9].D)+sl.max.iadd[9].D)} {5.}
(assert (= (+ (+ (* sc_176 0.6) of_176) sltop_176) 5.))
; 
; >=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {5.}
(assert (<= (+ (* sc_177 0.) of_177) 5.))
; 
; <=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {0.}
(assert (>= (+ (* sc_177 0.) of_177) 0.))
(declare-fun slbot_180 () Real)
(declare-fun sltop_180 () Real)
; 
; =  {(((sc.iadd[9].OUT*-0.6)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_180 -0.6) of_180) slbot_180) -10.))
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_180 0.) of_180) sltop_180) 10.))
; 
; >=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {5.}
(assert (<= (+ (* sc_178 0.) of_178) 5.))
; 
; <=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {0.}
(assert (>= (+ (* sc_178 0.) of_178) 0.))
; 
; >=  {((sc.iadd[9].B*0.)+of.iadd[9].B)} {5.}
(assert (<= (+ (* sc_179 0.) of_179) 5.))
; 
; <=  {((sc.iadd[9].B*0.)+of.iadd[9].B)} {0.}
(assert (>= (+ (* sc_179 0.) of_179) 0.))
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
(declare-fun sc_185 () Real)
(assert (> sc_185 1e-08))
(declare-fun of_185 () Real)
; 
; =  {sc.iadd[11].A} {sc.iadd[11].B}
(assert (= sc_183 sc_184))
; 
; =  {sc.iadd[11].A} {sc.iadd[11].C} {sc.iadd[11].D}
(assert (and (= sc_183 sc_182) (= sc_183 sc_181)))
; 
; =  {sc.iadd[11].OUT} {sc.iadd[11].A}
(assert (= sc_185 sc_183))
; 
; =  {of.iadd[11].OUT} {((of.iadd[11].A+of.iadd[11].B)-of.iadd[11].C-of.iadd[11].D)}
(assert (= of_185 (- (+ of_183 of_184) (+ of_182 of_181))))
; 
; >=  {((sc.iadd[11].D*0.)+of.iadd[11].D)} {5.}
(assert (<= (+ (* sc_181 0.) of_181) 5.))
; 
; <=  {((sc.iadd[11].D*0.)+of.iadd[11].D)} {0.}
(assert (>= (+ (* sc_181 0.) of_181) 0.))
; 
; >=  {((sc.iadd[11].C*0.)+of.iadd[11].C)} {5.}
(assert (<= (+ (* sc_182 0.) of_182) 5.))
; 
; <=  {((sc.iadd[11].C*0.)+of.iadd[11].C)} {0.}
(assert (>= (+ (* sc_182 0.) of_182) 0.))
(declare-fun slbot_185 () Real)
(declare-fun sltop_185 () Real)
; 
; =  {(((sc.iadd[11].OUT*0.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_185 0.) of_185) slbot_185) -10.))
; 
; =  {(((sc.iadd[11].OUT*1.66666666667)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_185 1.66666666667) of_185) sltop_185) 10.))
; 
; >=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {5.}
(assert (<= (+ (* sc_183 0.) of_183) 5.))
; 
; <=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {0.}
(assert (>= (+ (* sc_183 0.) of_183) 0.))
(declare-fun slbot_184 () Real)
(declare-fun sltop_184 () Real)
; 
; =  {(((sc.iadd[11].B*0.)+of.iadd[11].B)+sl.min.iadd[11].B)} {0.}
(assert (= (+ (+ (* sc_184 0.) of_184) slbot_184) 0.))
; 
; =  {(((sc.iadd[11].B*1.66666666667)+of.iadd[11].B)+sl.max.iadd[11].B)} {5.}
(assert (= (+ (+ (* sc_184 1.66666666667) of_184) sltop_184) 5.))
(declare-fun slbot_185 () Real)
(declare-fun sltop_185 () Real)
; 
; =  {(((sc.iadd[11].OUT*0.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_185 0.) of_185) slbot_185) -10.))
; 
; =  {(((sc.iadd[11].OUT*1.66666666667)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_185 1.66666666667) of_185) sltop_185) 10.))
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
(declare-fun sc_190 () Real)
(assert (> sc_190 1e-08))
(declare-fun of_190 () Real)
; 
; =  {sc.iadd[15].A} {sc.iadd[15].B}
(assert (= sc_188 sc_189))
; 
; =  {sc.iadd[15].A} {sc.iadd[15].C} {sc.iadd[15].D}
(assert (and (= sc_188 sc_187) (= sc_188 sc_186)))
; 
; =  {sc.iadd[15].OUT} {sc.iadd[15].A}
(assert (= sc_190 sc_188))
; 
; =  {of.iadd[15].OUT} {((of.iadd[15].A+of.iadd[15].B)-of.iadd[15].C-of.iadd[15].D)}
(assert (= of_190 (- (+ of_188 of_189) (+ of_187 of_186))))
; 
; >=  {((sc.iadd[15].D*0.)+of.iadd[15].D)} {5.}
(assert (<= (+ (* sc_186 0.) of_186) 5.))
; 
; <=  {((sc.iadd[15].D*0.)+of.iadd[15].D)} {0.}
(assert (>= (+ (* sc_186 0.) of_186) 0.))
; 
; >=  {((sc.iadd[15].C*0.)+of.iadd[15].C)} {5.}
(assert (<= (+ (* sc_187 0.) of_187) 5.))
; 
; <=  {((sc.iadd[15].C*0.)+of.iadd[15].C)} {0.}
(assert (>= (+ (* sc_187 0.) of_187) 0.))
; 
; >=  {((sc.iadd[15].A*0.)+of.iadd[15].A)} {5.}
(assert (<= (+ (* sc_188 0.) of_188) 5.))
; 
; <=  {((sc.iadd[15].A*0.)+of.iadd[15].A)} {0.}
(assert (>= (+ (* sc_188 0.) of_188) 0.))
(declare-fun slbot_189 () Real)
(declare-fun sltop_189 () Real)
; 
; =  {(((sc.iadd[15].B*0.)+of.iadd[15].B)+sl.min.iadd[15].B)} {0.}
(assert (= (+ (+ (* sc_189 0.) of_189) slbot_189) 0.))
; 
; =  {(((sc.iadd[15].B*0.0156)+of.iadd[15].B)+sl.max.iadd[15].B)} {5.}
(assert (= (+ (+ (* sc_189 0.0156) of_189) sltop_189) 5.))
(declare-fun slbot_190 () Real)
(declare-fun sltop_190 () Real)
; 
; =  {(((sc.iadd[15].OUT*0.)+of.iadd[15].OUT)+sl.min.iadd[15].OUT)} {-10.}
(assert (= (+ (+ (* sc_190 0.) of_190) slbot_190) -10.))
; 
; =  {(((sc.iadd[15].OUT*0.0156)+of.iadd[15].OUT)+sl.max.iadd[15].OUT)} {10.}
(assert (= (+ (+ (* sc_190 0.0156) of_190) sltop_190) 10.))
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
(declare-fun sc_195 () Real)
(assert (> sc_195 1e-08))
(declare-fun of_195 () Real)
; 
; =  {sc.iadd[14].A} {sc.iadd[14].B}
(assert (= sc_193 sc_194))
; 
; =  {sc.iadd[14].A} {sc.iadd[14].C} {sc.iadd[14].D}
(assert (and (= sc_193 sc_192) (= sc_193 sc_191)))
; 
; =  {sc.iadd[14].OUT} {sc.iadd[14].A}
(assert (= sc_195 sc_193))
; 
; =  {of.iadd[14].OUT} {((of.iadd[14].A+of.iadd[14].B)-of.iadd[14].C-of.iadd[14].D)}
(assert (= of_195 (- (+ of_193 of_194) (+ of_192 of_191))))
(declare-fun slbot_191 () Real)
(declare-fun sltop_191 () Real)
; 
; =  {(((sc.iadd[14].D*-0.6)+of.iadd[14].D)+sl.min.iadd[14].D)} {0.}
(assert (= (+ (+ (* sc_191 -0.6) of_191) slbot_191) 0.))
; 
; =  {(((sc.iadd[14].D*0.)+of.iadd[14].D)+sl.max.iadd[14].D)} {5.}
(assert (= (+ (+ (* sc_191 0.) of_191) sltop_191) 5.))
; 
; >=  {((sc.iadd[14].C*1.)+of.iadd[14].C)} {5.}
(assert (<= (+ (* sc_192 1.) of_192) 5.))
; 
; <=  {((sc.iadd[14].C*1.)+of.iadd[14].C)} {0.}
(assert (>= (+ (* sc_192 1.) of_192) 0.))
(declare-fun slbot_195 () Real)
(declare-fun sltop_195 () Real)
; 
; =  {(((sc.iadd[14].OUT*-1.)+of.iadd[14].OUT)+sl.min.iadd[14].OUT)} {-10.}
(assert (= (+ (+ (* sc_195 -1.) of_195) slbot_195) -10.))
; 
; =  {(((sc.iadd[14].OUT*-0.4)+of.iadd[14].OUT)+sl.max.iadd[14].OUT)} {10.}
(assert (= (+ (+ (* sc_195 -0.4) of_195) sltop_195) 10.))
; 
; >=  {((sc.iadd[14].A*0.)+of.iadd[14].A)} {5.}
(assert (<= (+ (* sc_193 0.) of_193) 5.))
; 
; <=  {((sc.iadd[14].A*0.)+of.iadd[14].A)} {0.}
(assert (>= (+ (* sc_193 0.) of_193) 0.))
; 
; >=  {((sc.iadd[14].B*0.)+of.iadd[14].B)} {5.}
(assert (<= (+ (* sc_194 0.) of_194) 5.))
; 
; <=  {((sc.iadd[14].B*0.)+of.iadd[14].B)} {0.}
(assert (>= (+ (* sc_194 0.) of_194) 0.))
(declare-fun slbot_195 () Real)
(declare-fun sltop_195 () Real)
; 
; =  {(((sc.iadd[14].OUT*-1.)+of.iadd[14].OUT)+sl.min.iadd[14].OUT)} {-10.}
(assert (= (+ (+ (* sc_195 -1.) of_195) slbot_195) -10.))
; 
; =  {(((sc.iadd[14].OUT*-0.4)+of.iadd[14].OUT)+sl.max.iadd[14].OUT)} {10.}
(assert (= (+ (+ (* sc_195 -0.4) of_195) sltop_195) 10.))
(declare-fun sc_196 () Real)
(assert (> sc_196 1e-08))
(declare-fun of_196 () Real)
(declare-fun sc_197 () Real)
(assert (> sc_197 1e-08))
(declare-fun of_197 () Real)
(declare-fun sc_198 () Real)
(assert (> sc_198 1e-08))
(declare-fun of_198 () Real)
(declare-fun sc_199 () Real)
(assert (> sc_199 1e-08))
(declare-fun of_199 () Real)
(declare-fun sc_200 () Real)
(assert (> sc_200 1e-08))
(declare-fun of_200 () Real)
; 
; =  {sc.iadd[3].A} {sc.iadd[3].B}
(assert (= sc_198 sc_199))
; 
; =  {sc.iadd[3].A} {sc.iadd[3].C} {sc.iadd[3].D}
(assert (and (= sc_198 sc_197) (= sc_198 sc_196)))
; 
; =  {sc.iadd[3].OUT} {sc.iadd[3].A}
(assert (= sc_200 sc_198))
; 
; =  {of.iadd[3].OUT} {((of.iadd[3].A+of.iadd[3].B)-of.iadd[3].C-of.iadd[3].D)}
(assert (= of_200 (- (+ of_198 of_199) (+ of_197 of_196))))
; 
; >=  {((sc.iadd[3].D*0.)+of.iadd[3].D)} {5.}
(assert (<= (+ (* sc_196 0.) of_196) 5.))
; 
; <=  {((sc.iadd[3].D*0.)+of.iadd[3].D)} {0.}
(assert (>= (+ (* sc_196 0.) of_196) 0.))
; 
; >=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {5.}
(assert (<= (+ (* sc_197 0.) of_197) 5.))
; 
; <=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {0.}
(assert (>= (+ (* sc_197 0.) of_197) 0.))
(declare-fun slbot_200 () Real)
(declare-fun sltop_200 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_200 0.) of_200) slbot_200) -10.))
; 
; =  {(((sc.iadd[3].OUT*0.00965050555471)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_200 0.00965050555471) of_200) sltop_200) 10.))
; 
; >=  {((sc.iadd[3].A*0.)+of.iadd[3].A)} {5.}
(assert (<= (+ (* sc_198 0.) of_198) 5.))
; 
; <=  {((sc.iadd[3].A*0.)+of.iadd[3].A)} {0.}
(assert (>= (+ (* sc_198 0.) of_198) 0.))
(declare-fun slbot_199 () Real)
(declare-fun sltop_199 () Real)
; 
; =  {(((sc.iadd[3].B*0.)+of.iadd[3].B)+sl.min.iadd[3].B)} {0.}
(assert (= (+ (+ (* sc_199 0.) of_199) slbot_199) 0.))
; 
; =  {(((sc.iadd[3].B*0.00965050555471)+of.iadd[3].B)+sl.max.iadd[3].B)} {5.}
(assert (= (+ (+ (* sc_199 0.00965050555471) of_199) sltop_199) 5.))
(declare-fun slbot_200 () Real)
(declare-fun sltop_200 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_200 0.) of_200) slbot_200) -10.))
; 
; =  {(((sc.iadd[3].OUT*0.00965050555471)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_200 0.00965050555471) of_200) sltop_200) 10.))
; 
; =  {sc.iadd[15].OUT} {sc.igenebind[19].K}
(assert (= sc_190 sc_117))
; 
; =  {of.iadd[15].OUT} {of.igenebind[19].K}
(assert (= of_190 of_117))
; 
; =  {sc.input.I[0].O} {sc.iadd[9].D}
(assert (= sc_35 sc_176))
; 
; =  {of.input.I[0].O} {of.iadd[9].D}
(assert (= of_35 of_176))
; 
; =  {sc.input.V[15].O} {sc.itov[6].K}
(assert (= sc_139 sc_156))
; 
; =  {of.input.V[15].O} {of.itov[6].K}
(assert (= of_139 of_156))
; 
; =  {sc.input.I[22].O} {sc.igenebind[19].Vmax}
(assert (= sc_83 sc_118))
; 
; =  {of.input.I[22].O} {of.igenebind[19].Vmax}
(assert (= of_83 of_118))
; 
; =  {sc.input.I[32].O} {sc.iadd[15].C}
(assert (= sc_77 sc_187))
; 
; =  {of.input.I[32].O} {of.iadd[15].C}
(assert (= of_77 of_187))
; 
; =  {sc.input.I[26].O} {sc.switch[7].Vmax}
(assert (= sc_41 sc_7))
; 
; =  {of.input.I[26].O} {of.switch[7].Vmax}
(assert (= of_41 of_7))
; 
; =  {sc.input.I[25].O} {sc.switch[7].Kmod}
(assert (= sc_69 sc_6))
; 
; =  {of.input.I[25].O} {of.switch[7].Kmod}
(assert (= of_69 of_6))
; 
; =  {sc.input.V[13].O} {sc.vtoi[4].X}
(assert (= sc_127 sc_105))
; 
; =  {of.input.V[13].O} {of.vtoi[4].X}
(assert (= of_127 of_105))
; 
; =  {sc.input.V[14].O} {sc.vgain[5].Y}
(assert (= sc_143 sc_1))
; 
; =  {of.input.V[14].O} {of.vgain[5].Y}
(assert (= of_143 of_1))
; 
; =  {sc.vtoi[0].Y} {sc.iadd[8].D}
(assert (= sc_104 sc_166))
; 
; =  {of.vtoi[0].Y} {of.iadd[8].D}
(assert (= of_104 of_166))
; 
; =  {sc.iadd[12].OUT} {sc.iadd[11].B}
(assert (= sc_175 sc_184))
; 
; =  {of.iadd[12].OUT} {of.iadd[11].B}
(assert (= of_175 of_184))
; 
; =  {sc.input.I[30].O} {sc.igenebind[19].TF}
(assert (= sc_61 sc_116))
; 
; =  {of.input.I[30].O} {of.igenebind[19].TF}
(assert (= of_61 of_116))
; 
; =  {sc.input.I[14].O} {sc.iadd[11].C}
(assert (= sc_51 sc_182))
; 
; =  {of.input.I[14].O} {of.iadd[11].C}
(assert (= of_51 of_182))
; 
; =  {sc.input.V[11].O} {sc.vadd[16].D}
(assert (= sc_135 sc_89))
; 
; =  {of.input.V[11].O} {of.vadd[16].D}
(assert (= of_135 of_89))
; 
; =  {sc.itov[15].Y} {sc.vadd[16].B}
(assert (= sc_154 sc_92))
; 
; =  {of.itov[15].Y} {of.vadd[16].B}
(assert (= of_154 of_92))
; 
; =  {sc.input.I[24].O} {sc.igenebind[1].K}
(assert (= sc_57 sc_113))
; 
; =  {of.input.I[24].O} {of.igenebind[1].K}
(assert (= of_57 of_113))
; 
; =  {sc.vadd[16].OUT2} {sc.output.V[1].X}
(assert (= sc_94 sc_86))
; 
; =  {of.vadd[16].OUT2} {of.output.V[1].X}
(assert (= of_94 of_86))
; 
; =  {sc.vadd[16].OUT2} {sc.switch[10].Vmax}
(assert (= sc_94 sc_12))
; 
; =  {of.vadd[16].OUT2} {of.switch[10].Vmax}
(assert (= of_94 of_12))
; 
; =  {sc.input.I[10].O} {sc.iadd[9].B}
(assert (= sc_39 sc_179))
; 
; =  {of.input.I[10].O} {of.iadd[9].B}
(assert (= of_39 of_179))
; 
; =  {sc.input.I[12].O} {sc.iadd[11].D}
(assert (= sc_29 sc_181))
; 
; =  {of.input.I[12].O} {of.iadd[11].D}
(assert (= of_29 of_181))
; 
; =  {sc.iadd[11].OUT} {sc.switch[10].Kmod}
(assert (= sc_185 sc_11))
; 
; =  {of.iadd[11].OUT} {of.switch[10].Kmod}
(assert (= of_185 of_11))
; 
; =  {sc.input.I[7].O} {sc.iadd[8].A}
(assert (= sc_25 sc_168))
; 
; =  {of.input.I[7].O} {of.iadd[8].A}
(assert (= of_25 of_168))
; 
; =  {sc.iadd[3].OUT} {sc.iadd[2].B}
(assert (= sc_200 sc_164))
; 
; =  {of.iadd[3].OUT} {of.iadd[2].B}
(assert (= of_200 of_164))
; 
; =  {sc.iadd[2].OUT} {sc.igenebind[1].TF}
(assert (= sc_165 sc_112))
; 
; =  {of.iadd[2].OUT} {of.igenebind[1].TF}
(assert (= of_165 of_112))
; 
; =  {sc.input.I[8].O} {sc.iadd[8].B}
(assert (= sc_21 sc_169))
; 
; =  {of.input.I[8].O} {of.iadd[8].B}
(assert (= of_21 of_169))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[14].D}
(assert (= sc_180 sc_191))
; 
; =  {of.iadd[9].OUT} {of.iadd[14].D}
(assert (= of_180 of_191))
; 
; =  {sc.itov[6].Y} {sc.vgain[5].Z}
(assert (= sc_157 sc_2))
; 
; =  {of.itov[6].Y} {of.vgain[5].Z}
(assert (= of_157 of_2))
; 
; =  {sc.input.I[21].O} {sc.switch[10].SUB}
(assert (= sc_53 sc_10))
; 
; =  {of.input.I[21].O} {of.switch[10].SUB}
(assert (= of_53 of_10))
; 
; =  {sc.input.I[23].O} {sc.igenebind[1].Vmax}
(assert (= sc_67 sc_114))
; 
; =  {of.input.I[23].O} {of.igenebind[1].Vmax}
(assert (= of_67 of_114))
; 
; =  {sc.iadd[8].OUT} {sc.switch[7].SUB}
(assert (= sc_170 sc_5))
; 
; =  {of.iadd[8].OUT} {of.switch[7].SUB}
(assert (= of_170 of_5))
; 
; =  {sc.switch[10].PROD} {sc.iadd[15].B}
(assert (= sc_13 sc_189))
; 
; =  {of.switch[10].PROD} {of.iadd[15].B}
(assert (= of_13 of_189))
; 
; =  {sc.input.V[5].O} {sc.vadd[18].A}
(assert (= sc_149 sc_98))
; 
; =  {of.input.V[5].O} {of.vadd[18].A}
(assert (= of_149 of_98))
; 
; =  {sc.input.V[6].O} {sc.itov[15].K}
(assert (= sc_141 sc_153))
; 
; =  {of.input.V[6].O} {of.itov[15].K}
(assert (= of_141 of_153))
; 
; =  {sc.iadd[14].OUT} {sc.igenebind[13].TF}
(assert (= sc_195 sc_108))
; 
; =  {of.iadd[14].OUT} {of.igenebind[13].TF}
(assert (= of_195 of_108))
; 
; =  {sc.input.I[11].O} {sc.iadd[9].C}
(assert (= sc_37 sc_177))
; 
; =  {of.input.I[11].O} {of.iadd[9].C}
(assert (= of_37 of_177))
; 
; =  {sc.input.I[28].O} {sc.igenebind[13].Vmax}
(assert (= sc_73 sc_110))
; 
; =  {of.input.I[28].O} {of.igenebind[13].Vmax}
(assert (= of_73 of_110))
; 
; =  {sc.vtoi[4].Y} {sc.iadd[3].B}
(assert (= sc_107 sc_199))
; 
; =  {of.vtoi[4].Y} {of.iadd[3].B}
(assert (= of_107 of_199))
; 
; =  {sc.input.I[6].O} {sc.iadd[3].C}
(assert (= sc_47 sc_197))
; 
; =  {of.input.I[6].O} {of.iadd[3].C}
(assert (= of_47 of_197))
; 
; =  {sc.itov[17].Y} {sc.vadd[18].B}
(assert (= sc_160 sc_99))
; 
; =  {of.itov[17].Y} {of.vadd[18].B}
(assert (= of_160 of_99))
; 
; =  {sc.input.I[31].O} {sc.iadd[14].C}
(assert (= sc_33 sc_192))
; 
; =  {of.input.I[31].O} {of.iadd[14].C}
(assert (= of_33 of_192))
; 
; =  {sc.input.V[9].O} {sc.vtoi[0].K}
(assert (= sc_131 sc_103))
; 
; =  {of.input.V[9].O} {of.vtoi[0].K}
(assert (= of_131 of_103))
; 
; =  {sc.switch[7].PROD} {sc.itov[6].X}
(assert (= sc_8 sc_155))
; 
; =  {of.switch[7].PROD} {of.itov[6].X}
(assert (= of_8 of_155))
; 
; =  {sc.vadd[18].OUT2} {sc.output.V[0].X}
(assert (= sc_101 sc_84))
; 
; =  {of.vadd[18].OUT2} {of.output.V[0].X}
(assert (= of_101 of_84))
; 
; =  {sc.vadd[18].OUT2} {sc.vtoi[0].X}
(assert (= sc_101 sc_102))
; 
; =  {of.vadd[18].OUT2} {of.vtoi[0].X}
(assert (= of_101 of_102))
; 
; =  {sc.input.I[18].O} {sc.iadd[14].A}
(assert (= sc_79 sc_193))
; 
; =  {of.input.I[18].O} {of.iadd[14].A}
(assert (= of_79 of_193))
; 
; =  {sc.igenebind[19].GE} {sc.itov[17].K}
(assert (= sc_119 sc_159))
; 
; =  {of.igenebind[19].GE} {of.itov[17].K}
(assert (= of_119 of_159))
; 
; =  {sc.input.I[9].O} {sc.iadd[9].A}
(assert (= sc_31 sc_178))
; 
; =  {of.input.I[9].O} {of.iadd[9].A}
(assert (= of_31 of_178))
; 
; =  {sc.input.I[3].O} {sc.iadd[2].C}
(assert (= sc_59 sc_162))
; 
; =  {of.input.I[3].O} {of.iadd[2].C}
(assert (= of_59 of_162))
; 
; =  {sc.input.I[4].O} {sc.iadd[3].D}
(assert (= sc_63 sc_196))
; 
; =  {of.input.I[4].O} {of.iadd[3].D}
(assert (= of_63 of_196))
; 
; =  {sc.input.I[16].O} {sc.iadd[12].A}
(assert (= sc_55 sc_173))
; 
; =  {of.input.I[16].O} {of.iadd[12].A}
(assert (= of_55 of_173))
; 
; =  {sc.input.I[5].O} {sc.iadd[3].A}
(assert (= sc_65 sc_198))
; 
; =  {of.input.I[5].O} {of.iadd[3].A}
(assert (= of_65 of_198))
; 
; =  {sc.input.V[12].O} {sc.switch[10].n}
(assert (= sc_129 sc_9))
; 
; =  {of.input.V[12].O} {of.switch[10].n}
(assert (= of_129 of_9))
; 
; =  {sc.input.V[8].O} {sc.vadd[16].OUT2_0}
(assert (= sc_123 sc_88))
; 
; =  {of.input.V[8].O} {of.vadd[16].OUT2_0}
(assert (= of_123 of_88))
; 
; =  {sc.input.I[2].O} {sc.iadd[2].A}
(assert (= sc_15 sc_163))
; 
; =  {of.input.I[2].O} {of.iadd[2].A}
(assert (= of_15 of_163))
; 
; =  {sc.input.V[3].O} {sc.vadd[16].C}
(assert (= sc_145 sc_90))
; 
; =  {of.input.V[3].O} {of.vadd[16].C}
(assert (= of_145 of_90))
; 
; =  {sc.input.V[2].O} {sc.vadd[16].A}
(assert (= sc_121 sc_91))
; 
; =  {of.input.V[2].O} {of.vadd[16].A}
(assert (= of_121 of_91))
; 
; =  {sc.input.I[29].O} {sc.igenebind[13].K}
(assert (= sc_19 sc_109))
; 
; =  {of.input.I[29].O} {of.igenebind[13].K}
(assert (= of_19 of_109))
; 
; =  {sc.input.I[20].O} {sc.itov[17].X}
(assert (= sc_17 sc_158))
; 
; =  {of.input.I[20].O} {of.itov[17].X}
(assert (= of_17 of_158))
; 
; =  {sc.input.I[34].O} {sc.iadd[15].A}
(assert (= sc_23 sc_188))
; 
; =  {of.input.I[34].O} {of.iadd[15].A}
(assert (= of_23 of_188))
; 
; =  {sc.input.I[15].O} {sc.iadd[12].D}
(assert (= sc_45 sc_171))
; 
; =  {of.input.I[15].O} {of.iadd[12].D}
(assert (= of_45 of_171))
; 
; =  {sc.input.I[1].O} {sc.iadd[2].D}
(assert (= sc_71 sc_161))
; 
; =  {of.input.I[1].O} {of.iadd[2].D}
(assert (= of_71 of_161))
; 
; =  {sc.input.I[33].O} {sc.iadd[15].D}
(assert (= sc_49 sc_186))
; 
; =  {of.input.I[33].O} {of.iadd[15].D}
(assert (= of_49 of_186))
; 
; =  {sc.input.V[1].O} {sc.switch[7].n}
(assert (= sc_151 sc_4))
; 
; =  {of.input.V[1].O} {of.switch[7].n}
(assert (= of_151 of_4))
; 
; =  {sc.input.I[13].O} {sc.iadd[11].A}
(assert (= sc_27 sc_183))
; 
; =  {of.input.I[13].O} {of.iadd[11].A}
(assert (= of_27 of_183))
; 
; =  {sc.input.I[17].O} {sc.iadd[12].C}
(assert (= sc_75 sc_172))
; 
; =  {of.input.I[17].O} {of.iadd[12].C}
(assert (= of_75 of_172))
; 
; =  {sc.input.V[7].O} {sc.vadd[18].OUT2_0}
(assert (= sc_125 sc_95))
; 
; =  {of.input.V[7].O} {of.vadd[18].OUT2_0}
(assert (= of_125 of_95))
; 
; =  {sc.igenebind[13].GE} {sc.iadd[12].B}
(assert (= sc_111 sc_174))
; 
; =  {of.igenebind[13].GE} {of.iadd[12].B}
(assert (= of_111 of_174))
; 
; =  {sc.igenebind[1].GE} {sc.itov[15].X}
(assert (= sc_115 sc_152))
; 
; =  {of.igenebind[1].GE} {of.itov[15].X}
(assert (= of_115 of_152))
; 
; =  {sc.input.V[0].O} {sc.vgain[5].X}
(assert (= sc_133 sc_0))
; 
; =  {of.input.V[0].O} {of.vgain[5].X}
(assert (= of_133 of_0))
; 
; =  {sc.input.V[10].O} {sc.vadd[18].D}
(assert (= sc_137 sc_96))
; 
; =  {of.input.V[10].O} {of.vadd[18].D}
(assert (= of_137 of_96))
; 
; =  {sc.input.I[27].O} {sc.iadd[8].C}
(assert (= sc_43 sc_167))
; 
; =  {of.input.I[27].O} {of.iadd[8].C}
(assert (= of_43 of_167))
; 
; =  {sc.input.I[19].O} {sc.iadd[14].B}
(assert (= sc_81 sc_194))
; 
; =  {of.input.I[19].O} {of.iadd[14].B}
(assert (= of_81 of_194))
; 
; =  {sc.input.V[4].O} {sc.vadd[18].C}
(assert (= sc_147 sc_97))
; 
; =  {of.input.V[4].O} {of.vadd[18].C}
(assert (= of_147 of_97))
; 
; =  {sc.vgain[5].P} {sc.vtoi[4].K}
(assert (= sc_3 sc_106))
; 
; =  {of.vgain[5].P} {of.vtoi[4].K}
(assert (= of_3 of_106))
(assert (<= (* (/ 1. sc_85) 0.001) 0.001))
(assert (<= (* (/ 1. sc_87) 0.001) 0.001))
; 
; =  {sc.vadd[18].OUT2} {sc.output.V[0].O} {sc.vadd[16].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_101 sc_85) (= sc_101 sc_94)) (= sc_101 sc_87)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_92 0.) slbot_92 (- slbot_92)) (ite (>= sltop_199 0.) sltop_199 (- sltop_199))) (ite (>= sltop_87 0.) sltop_87 (- sltop_87))) (ite (>= slbot_175 0.) slbot_175 (- slbot_175))) (ite (>= slbot_35 0.) slbot_35 (- slbot_35))) (ite (>= slbot_189 0.) slbot_189 (- slbot_189))) (ite (>= slbot_107 0.) slbot_107 (- slbot_107))) (ite (>= slbot_157 0.) slbot_157 (- slbot_157))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_84 0.) slbot_84 (- slbot_84))) (ite (>= sltop_104 0.) sltop_104 (- sltop_104))) (ite (>= sltop_164 0.) sltop_164 (- sltop_164))) (ite (>= sltop_190 0.) sltop_190 (- sltop_190))) (ite (>= slbot_191 0.) slbot_191 (- slbot_191))) (ite (>= slbot_159 0.) slbot_159 (- slbot_159))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_119 0.) slbot_119 (- slbot_119))) (ite (>= sltop_112 0.) sltop_112 (- sltop_112))) (ite (>= slbot_199 0.) slbot_199 (- slbot_199))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= sltop_166 0.) sltop_166 (- sltop_166))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_111 0.) sltop_111 (- sltop_111))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_94 0.) sltop_94 (- sltop_94))) (ite (>= slbot_111 0.) slbot_111 (- slbot_111))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= slbot_115 0.) slbot_115 (- slbot_115))) (ite (>= slbot_166 0.) slbot_166 (- slbot_166))) (ite (>= sltop_100 0.) sltop_100 (- sltop_100))) (ite (>= slbot_104 0.) slbot_104 (- slbot_104))) (ite (>= sltop_152 0.) sltop_152 (- sltop_152))) (ite (>= sltop_157 0.) sltop_157 (- sltop_157))) (ite (>= slbot_190 0.) slbot_190 (- slbot_190))) (ite (>= slbot_200 0.) slbot_200 (- slbot_200))) (ite (>= sltop_189 0.) sltop_189 (- sltop_189))) (ite (>= sltop_34 0.) sltop_34 (- sltop_34))) (ite (>= slbot_108 0.) slbot_108 (- slbot_108))) (ite (>= sltop_154 0.) sltop_154 (- sltop_154))) (ite (>= slbot_174 0.) slbot_174 (- slbot_174))) (ite (>= slbot_5 0.) slbot_5 (- slbot_5))) (ite (>= slbot_170 0.) slbot_170 (- slbot_170))) (ite (>= slbot_176 0.) slbot_176 (- slbot_176))) (ite (>= slbot_87 0.) slbot_87 (- slbot_87))) (ite (>= sltop_115 0.) sltop_115 (- sltop_115))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= sltop_180 0.) sltop_180 (- sltop_180))) (ite (>= sltop_195 0.) sltop_195 (- sltop_195))) (ite (>= sltop_165 0.) sltop_165 (- sltop_165))) (ite (>= slbot_152 0.) slbot_152 (- slbot_152))) (ite (>= sltop_200 0.) sltop_200 (- sltop_200))) (ite (>= slbot_34 0.) slbot_34 (- slbot_34))) (ite (>= sltop_159 0.) sltop_159 (- sltop_159))) (ite (>= slbot_185 0.) slbot_185 (- slbot_185))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_35 0.) sltop_35 (- sltop_35))) (ite (>= sltop_84 0.) sltop_84 (- sltop_84))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99))) (ite (>= sltop_119 0.) sltop_119 (- sltop_119))) (ite (>= slbot_155 0.) slbot_155 (- slbot_155))) (ite (>= sltop_175 0.) sltop_175 (- sltop_175))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= sltop_101 0.) sltop_101 (- sltop_101))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= slbot_101 0.) slbot_101 (- slbot_101))) (ite (>= slbot_165 0.) slbot_165 (- slbot_165))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= slbot_112 0.) slbot_112 (- slbot_112))) (ite (>= sltop_184 0.) sltop_184 (- sltop_184))) (ite (>= slbot_160 0.) slbot_160 (- slbot_160))) (ite (>= sltop_107 0.) sltop_107 (- sltop_107))) (ite (>= slbot_154 0.) slbot_154 (- slbot_154))) (ite (>= sltop_92 0.) sltop_92 (- sltop_92))) (ite (>= slbot_117 0.) slbot_117 (- slbot_117))) (ite (>= sltop_117 0.) sltop_117 (- sltop_117))) (ite (>= sltop_174 0.) sltop_174 (- sltop_174))) (ite (>= slbot_180 0.) slbot_180 (- slbot_180))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_106 0.) slbot_106 (- slbot_106))) (ite (>= slbot_195 0.) slbot_195 (- slbot_195))) (ite (>= sltop_5 0.) sltop_5 (- sltop_5))) (ite (>= slbot_184 0.) slbot_184 (- slbot_184))) (ite (>= slbot_164 0.) slbot_164 (- slbot_164))) (ite (>= sltop_102 0.) sltop_102 (- sltop_102))) (ite (>= sltop_155 0.) sltop_155 (- sltop_155))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= slbot_94 0.) slbot_94 (- slbot_94))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= slbot_100 0.) slbot_100 (- slbot_100))) (ite (>= sltop_176 0.) sltop_176 (- sltop_176))) (ite (>= sltop_106 0.) sltop_106 (- sltop_106))) (ite (>= sltop_160 0.) sltop_160 (- sltop_160))) (ite (>= sltop_185 0.) sltop_185 (- sltop_185))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_102 0.) slbot_102 (- slbot_102))) (ite (>= sltop_108 0.) sltop_108 (- sltop_108))) (ite (>= sltop_191 0.) sltop_191 (- sltop_191))) (ite (>= sltop_170 0.) sltop_170 (- sltop_170)))))
(check-sat)