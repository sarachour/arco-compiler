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
; =  {sc.vgain[6].P} {((sc.vgain[6].X/sc.vgain[6].Y)*sc.vgain[6].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[6].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[6].X*1.)+of.vgain[6].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[6].X*1.)+of.vgain[6].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[6].Y*0.000125)+of.vgain[6].Y)} {3300.}
(assert (<= (+ (* sc_1 0.000125) of_1) 3300.))
; 
; <=  {((sc.vgain[6].Y*0.000125)+of.vgain[6].Y)} {1.}
(assert (>= (+ (* sc_1 0.000125) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[6].P*61.4415124065)+of.vgain[6].P)+sl.min.vgain[6].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 61.4415124065) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[6].P*62.4)+of.vgain[6].P)+sl.max.vgain[6].P)} {5445000.}
(assert (= (+ (+ (* sc_3 62.4) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[6].Z*0.0153603781016)+of.vgain[6].Z)+sl.min.vgain[6].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.0153603781016) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[6].Z*0.0156)+of.vgain[6].Z)+sl.max.vgain[6].Z)} {3300.}
(assert (= (+ (+ (* sc_2 0.0156) of_2) sltop_2) 3300.))
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
; no offset
(assert (= of_4 0.))
; no offset
(assert (= of_5 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_6 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[14].P} {((sc.vgain[14].X/sc.vgain[14].Y)*sc.vgain[14].Z*1.)}
(assert (= sc_7 (* (* (/ sc_4 sc_5) sc_6) 1.)))
; 
; =  {of.vgain[14].P} {0.}
(assert (= of_7 0.))
; 
; >=  {((sc.vgain[14].X*2.)+of.vgain[14].X)} {3300.}
(assert (<= (+ (* sc_4 2.) of_4) 3300.))
; 
; <=  {((sc.vgain[14].X*2.)+of.vgain[14].X)} {0.0001}
(assert (>= (+ (* sc_4 2.) of_4) 0.0001))
; 
; >=  {((sc.vgain[14].Y*1.)+of.vgain[14].Y)} {3300.}
(assert (<= (+ (* sc_5 1.) of_5) 3300.))
; 
; <=  {((sc.vgain[14].Y*1.)+of.vgain[14].Y)} {1.}
(assert (>= (+ (* sc_5 1.) of_5) 1.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[14].P*0.)+of.vgain[14].P)+sl.min.vgain[14].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[14].P*103.621514368)+of.vgain[14].P)+sl.max.vgain[14].P)} {5445000.}
(assert (= (+ (+ (* sc_7 103.621514368) of_7) sltop_7) 5445000.))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.vgain[14].Z*0.)+of.vgain[14].Z)+sl.min.vgain[14].Z)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.vgain[14].Z*103.621514368)+of.vgain[14].Z)+sl.max.vgain[14].Z)} {3300.}
(assert (= (+ (+ (* sc_6 103.621514368) of_6) sltop_6) 3300.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[14].P*0.)+of.vgain[14].P)+sl.min.vgain[14].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[14].P*103.621514368)+of.vgain[14].P)+sl.max.vgain[14].P)} {5445000.}
(assert (= (+ (+ (* sc_7 103.621514368) of_7) sltop_7) 5445000.))
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
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
; no offset
(assert (= of_8 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_9 0.))
; no offset
(assert (= of_10 0.))
; 
; =  {(sc.switch[16].SUB/sc.switch[16].Kmod)} {1.}
(assert (= (/ sc_9 sc_10) 1.))
; no scale
(assert (= (/ sc_9 sc_10) 1.))
; no scale
(assert (= (/ sc_8 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_11 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[16].PROD} {(sc.switch[16].Vmax/1.)}
(assert (= sc_12 (/ sc_11 1.)))
; 
; =  {of.switch[16].PROD} {0.}
(assert (= of_12 0.))
; 
; >=  {((sc.switch[16].n*1250.)+of.switch[16].n)} {3300.}
(assert (<= (+ (* sc_8 1250.) of_8) 3300.))
; 
; <=  {((sc.switch[16].n*1250.)+of.switch[16].n)} {0.5}
(assert (>= (+ (* sc_8 1250.) of_8) 0.5))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.switch[16].SUB*-1.)+of.switch[16].SUB)+sl.min.switch[16].SUB)} {0.0001}
(assert (= (+ (+ (* sc_9 -1.) of_9) slbot_9) 0.0001))
; 
; =  {(((sc.switch[16].SUB*-0.84375)+of.switch[16].SUB)+sl.max.switch[16].SUB)} {10.}
(assert (= (+ (+ (* sc_9 -0.84375) of_9) sltop_9) 10.))
; 
; >=  {((sc.switch[16].Kmod*1.)+of.switch[16].Kmod)} {10.}
(assert (<= (+ (* sc_10 1.) of_10) 10.))
; 
; <=  {((sc.switch[16].Kmod*1.)+of.switch[16].Kmod)} {0.0001}
(assert (>= (+ (* sc_10 1.) of_10) 0.0001))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.switch[16].PROD*0.)+of.switch[16].PROD)+sl.min.switch[16].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 9.99934002508e-38))
; 
; =  {(((sc.switch[16].PROD*103.621514368)+of.switch[16].PROD)+sl.max.switch[16].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_12 103.621514368) of_12) sltop_12) 9.9999999))
; 
; >=  {((sc.switch[16].Vmax*1.)+of.switch[16].Vmax)} {10.}
(assert (<= (+ (* sc_11 1.) of_11) 10.))
; 
; <=  {((sc.switch[16].Vmax*1.)+of.switch[16].Vmax)} {0.0001}
(assert (>= (+ (* sc_11 1.) of_11) 0.0001))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.switch[16].PROD*0.)+of.switch[16].PROD)+sl.min.switch[16].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 9.99934002508e-38))
; 
; =  {(((sc.switch[16].PROD*103.621514368)+of.switch[16].PROD)+sl.max.switch[16].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_12 103.621514368) of_12) sltop_12) 9.9999999))
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; no offset
(assert (= of_13 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= of_15 0.))
; 
; =  {(sc.switch[1].SUB/sc.switch[1].Kmod)} {1.}
(assert (= (/ sc_14 sc_15) 1.))
; no scale
(assert (= (/ sc_14 sc_15) 1.))
; no scale
(assert (= (/ sc_13 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[1].PROD} {(sc.switch[1].Vmax/1.)}
(assert (= sc_17 (/ sc_16 1.)))
; 
; =  {of.switch[1].PROD} {0.}
(assert (= of_17 0.))
; 
; >=  {((sc.switch[1].n*1000.75)+of.switch[1].n)} {3300.}
(assert (<= (+ (* sc_13 1000.75) of_13) 3300.))
; 
; <=  {((sc.switch[1].n*1000.75)+of.switch[1].n)} {0.5}
(assert (>= (+ (* sc_13 1000.75) of_13) 0.5))
; 
; >=  {((sc.switch[1].SUB*337.632520764)+of.switch[1].SUB)} {10.}
(assert (<= (+ (* sc_14 337.632520764) of_14) 10.))
; 
; <=  {((sc.switch[1].SUB*337.632520764)+of.switch[1].SUB)} {0.0001}
(assert (>= (+ (* sc_14 337.632520764) of_14) 0.0001))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.switch[1].Kmod*0.)+of.switch[1].Kmod)+sl.min.switch[1].Kmod)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.0001))
; 
; =  {(((sc.switch[1].Kmod*1.66666666667)+of.switch[1].Kmod)+sl.max.switch[1].Kmod)} {10.}
(assert (= (+ (+ (* sc_15 1.66666666667) of_15) sltop_15) 10.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.switch[1].PROD*0.)+of.switch[1].PROD)+sl.min.switch[1].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 9.99934002508e-38))
; 
; =  {(((sc.switch[1].PROD*0.0156)+of.switch[1].PROD)+sl.max.switch[1].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_17 0.0156) of_17) sltop_17) 9.9999999))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.switch[1].Vmax*0.)+of.switch[1].Vmax)+sl.min.switch[1].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) 0.0001))
; 
; =  {(((sc.switch[1].Vmax*0.0156)+of.switch[1].Vmax)+sl.max.switch[1].Vmax)} {10.}
(assert (= (+ (+ (* sc_16 0.0156) of_16) sltop_16) 10.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.switch[1].PROD*0.)+of.switch[1].PROD)+sl.min.switch[1].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 9.99934002508e-38))
; 
; =  {(((sc.switch[1].PROD*0.0156)+of.switch[1].PROD)+sl.max.switch[1].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_17 0.0156) of_17) sltop_17) 9.9999999))
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_19 sc_18))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_19 of_18))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_18 0.) of_18) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
; 
; =  {sc.input.I[20].O} {sc.input.I[20].X}
(assert (= sc_21 sc_20))
; 
; =  {of.input.I[20].O} {of.input.I[20].X}
(assert (= of_21 of_20))
; 
; >=  {((sc.input.I[20].X*1.)+of.input.I[20].X)} {10.}
(assert (<= (+ (* sc_20 1.) of_20) 10.))
; 
; <=  {((sc.input.I[20].X*1.)+of.input.I[20].X)} {0.}
(assert (>= (+ (* sc_20 1.) of_20) 0.))
; 
; >=  {((sc.input.I[20].O*1.)+of.input.I[20].O)} {10.}
(assert (<= (+ (* sc_21 1.) of_21) 10.))
; 
; <=  {((sc.input.I[20].O*1.)+of.input.I[20].O)} {0.}
(assert (>= (+ (* sc_21 1.) of_21) 0.))
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
; 
; =  {sc.input.I[29].O} {sc.input.I[29].X}
(assert (= sc_23 sc_22))
; 
; =  {of.input.I[29].O} {of.input.I[29].X}
(assert (= of_23 of_22))
; 
; >=  {((sc.input.I[29].X*0.)+of.input.I[29].X)} {10.}
(assert (<= (+ (* sc_22 0.) of_22) 10.))
; 
; <=  {((sc.input.I[29].X*0.)+of.input.I[29].X)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.input.I[29].O*0.)+of.input.I[29].O)} {10.}
(assert (<= (+ (* sc_23 0.) of_23) 10.))
; 
; <=  {((sc.input.I[29].O*0.)+of.input.I[29].O)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_25 sc_24))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_25 of_24))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_24 0.) of_24) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_25 0.) of_25) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_27 sc_26))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_27 of_26))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_26 0.) of_26) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_29 sc_28))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_29 of_28))
; 
; >=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
; 
; >=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_29 0.) of_29) 10.))
; 
; <=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_31 sc_30))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_31 of_30))
; 
; >=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_30 0.) of_30) 10.))
; 
; <=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
; 
; >=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_31 0.) of_31) 10.))
; 
; <=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {0.}
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
; >=  {((sc.input.I[31].X*0.)+of.input.I[31].X)} {10.}
(assert (<= (+ (* sc_32 0.) of_32) 10.))
; 
; <=  {((sc.input.I[31].X*0.)+of.input.I[31].X)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
; 
; >=  {((sc.input.I[31].O*0.)+of.input.I[31].O)} {10.}
(assert (<= (+ (* sc_33 0.) of_33) 10.))
; 
; <=  {((sc.input.I[31].O*0.)+of.input.I[31].O)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_35 sc_34))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_35 of_34))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.I[0].X*0.15625)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_36 0.15625) of_36) 10.))
; 
; <=  {((sc.input.I[0].X*0.15625)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_36 0.15625) of_36) 0.))
; 
; >=  {((sc.input.I[0].O*0.15625)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_37 0.15625) of_37) 10.))
; 
; <=  {((sc.input.I[0].O*0.15625)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_37 0.15625) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_38 0.) of_38) 10.))
; 
; <=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_39 0.) of_39) 10.))
; 
; <=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_40 0.) of_40) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_41 0.) of_41) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_42 0.) of_42) 10.))
; 
; <=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
; 
; >=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_43 0.) of_43) 10.))
; 
; <=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_44 0.) of_44) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_45 0.) of_45) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
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
; >=  {((sc.input.I[16].X*337.632520764)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_50 337.632520764) of_50) 10.))
; 
; <=  {((sc.input.I[16].X*337.632520764)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_50 337.632520764) of_50) 0.))
; 
; >=  {((sc.input.I[16].O*337.632520764)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_51 337.632520764) of_51) 10.))
; 
; <=  {((sc.input.I[16].O*337.632520764)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_51 337.632520764) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.I[30].O} {sc.input.I[30].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.I[30].O} {of.input.I[30].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.I[30].X*0.)+of.input.I[30].X)} {10.}
(assert (<= (+ (* sc_52 0.) of_52) 10.))
; 
; <=  {((sc.input.I[30].X*0.)+of.input.I[30].X)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.input.I[30].O*0.)+of.input.I[30].O)} {10.}
(assert (<= (+ (* sc_53 0.) of_53) 10.))
; 
; <=  {((sc.input.I[30].O*0.)+of.input.I[30].O)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
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
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.I[1].X*0.0156)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_60 0.0156) of_60) 10.))
; 
; <=  {((sc.input.I[1].X*0.0156)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_60 0.0156) of_60) 0.))
; 
; >=  {((sc.input.I[1].O*0.0156)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_61 0.0156) of_61) 10.))
; 
; <=  {((sc.input.I[1].O*0.0156)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_61 0.0156) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.I[17].X*4000.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_62 4000.) of_62) 10.))
; 
; <=  {((sc.input.I[17].X*4000.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_62 4000.) of_62) 0.))
; 
; >=  {((sc.input.I[17].O*4000.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_63 4000.) of_63) 10.))
; 
; <=  {((sc.input.I[17].O*4000.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_63 4000.) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.I[32].O} {sc.input.I[32].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.I[32].O} {of.input.I[32].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.I[32].X*1.)+of.input.I[32].X)} {10.}
(assert (<= (+ (* sc_64 1.) of_64) 10.))
; 
; <=  {((sc.input.I[32].X*1.)+of.input.I[32].X)} {0.}
(assert (>= (+ (* sc_64 1.) of_64) 0.))
; 
; >=  {((sc.input.I[32].O*1.)+of.input.I[32].O)} {10.}
(assert (<= (+ (* sc_65 1.) of_65) 10.))
; 
; <=  {((sc.input.I[32].O*1.)+of.input.I[32].O)} {0.}
(assert (>= (+ (* sc_65 1.) of_65) 0.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.I[18].O} {sc.input.I[18].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.I[18].O} {of.input.I[18].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {10.}
(assert (<= (+ (* sc_66 1.) of_66) 10.))
; 
; <=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {0.}
(assert (>= (+ (* sc_66 1.) of_66) 0.))
; 
; >=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {10.}
(assert (<= (+ (* sc_67 1.) of_67) 10.))
; 
; <=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {0.}
(assert (>= (+ (* sc_67 1.) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.I[19].O} {sc.input.I[19].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.I[19].O} {of.input.I[19].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.I[19].X*1.)+of.input.I[19].X)} {10.}
(assert (<= (+ (* sc_68 1.) of_68) 10.))
; 
; <=  {((sc.input.I[19].X*1.)+of.input.I[19].X)} {0.}
(assert (>= (+ (* sc_68 1.) of_68) 0.))
; 
; >=  {((sc.input.I[19].O*1.)+of.input.I[19].O)} {10.}
(assert (<= (+ (* sc_69 1.) of_69) 10.))
; 
; <=  {((sc.input.I[19].O*1.)+of.input.I[19].O)} {0.}
(assert (>= (+ (* sc_69 1.) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.I[22].O} {sc.input.I[22].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.I[22].O} {of.input.I[22].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.I[22].X*1.)+of.input.I[22].X)} {10.}
(assert (<= (+ (* sc_70 1.) of_70) 10.))
; 
; <=  {((sc.input.I[22].X*1.)+of.input.I[22].X)} {0.}
(assert (>= (+ (* sc_70 1.) of_70) 0.))
; 
; >=  {((sc.input.I[22].O*1.)+of.input.I[22].O)} {10.}
(assert (<= (+ (* sc_71 1.) of_71) 10.))
; 
; <=  {((sc.input.I[22].O*1.)+of.input.I[22].O)} {0.}
(assert (>= (+ (* sc_71 1.) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_73 sc_72))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_73 of_72))
(declare-fun slbot_72 () Real)
(declare-fun sltop_72 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_72 0.) of_72) slbot_72) 0.0001))
; 
; =  {(((sc.output.V[0].X*0.15625)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_72 0.15625) of_72) sltop_72) 3300.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.15625)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_73 0.15625) of_73) sltop_73) 3300.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_75 sc_74))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_75 of_74))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_74 0.) of_74) slbot_74) 0.0001))
; 
; =  {(((sc.output.V[1].X*0.0156)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_74 0.0156) of_74) sltop_74) 3300.))
(declare-fun slbot_75 () Real)
(declare-fun sltop_75 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_75 0.) of_75) slbot_75) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.0156)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_75 0.0156) of_75) sltop_75) 3300.))
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
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_77 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_78 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_80 0.))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].B)}
(assert (= sc_79 (* 1. sc_80)))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].C)} {(1.*sc.vadd[7].D)}
(assert (and (= sc_79 (* 1. sc_78)) (= sc_79 (* 1. sc_77))))
; no offset
(assert (= (- (+ of_79 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT} {(sc.vadd[7].A*1.)}
(assert (= sc_81 (* sc_79 1.)))
; 
; =  {of.vadd[7].OUT} {0.}
(assert (= of_81 0.))
; no scale
(assert (= sc_77 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_77 0.))
; no offset
(assert (= of_82 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_78 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_80 0.))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].B)}
(assert (= sc_79 (* 1. sc_80)))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].C)} {(1.*sc.vadd[7].D*sc.vadd[7].OUT2)}
(assert (and (= sc_79 (* 1. sc_78)) (= sc_79 (* (* 1. sc_77) sc_82))))
; no offset
(assert (= (- (+ of_79 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT2} {(sc.vadd[7].A*1.)}
(assert (= sc_82 (* sc_79 1.)))
; no offset
(assert (= of_82 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT2_0} {(sc.vadd[7].A*1.)}
(assert (= sc_76 (* sc_79 1.)))
; 
; =  {of.vadd[7].OUT2_0} {0.}
(assert (= of_76 0.))
; 
; >=  {((sc.vadd[7].OUT2_0*0.)+of.vadd[7].OUT2_0)} {3300.}
(assert (<= (+ (* sc_76 0.) of_76) 3300.))
; 
; <=  {((sc.vadd[7].OUT2_0*0.)+of.vadd[7].OUT2_0)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
; 
; >=  {((sc.vadd[7].D*4.)+of.vadd[7].D)} {3300.}
(assert (<= (+ (* sc_77 4.) of_77) 3300.))
; 
; <=  {((sc.vadd[7].D*4.)+of.vadd[7].D)} {0.}
(assert (>= (+ (* sc_77 4.) of_77) 0.))
; 
; >=  {((sc.vadd[7].C*0.)+of.vadd[7].C)} {3300.}
(assert (<= (+ (* sc_78 0.) of_78) 3300.))
; 
; <=  {((sc.vadd[7].C*0.)+of.vadd[7].C)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
; 
; >=  {((sc.vadd[7].A*0.)+of.vadd[7].A)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.vadd[7].A*0.)+of.vadd[7].A)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.vadd[7].OUT2*0.)+of.vadd[7].OUT2)+sl.min.vadd[7].OUT2)} {0.}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) 0.))
; 
; =  {(((sc.vadd[7].OUT2*0.15625)+of.vadd[7].OUT2)+sl.max.vadd[7].OUT2)} {3300.}
(assert (= (+ (+ (* sc_82 0.15625) of_82) sltop_82) 3300.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.vadd[7].B*61.4415124065)+of.vadd[7].B)+sl.min.vadd[7].B)} {0.}
(assert (= (+ (+ (* sc_80 61.4415124065) of_80) slbot_80) 0.))
; 
; =  {(((sc.vadd[7].B*62.4)+of.vadd[7].B)+sl.max.vadd[7].B)} {3300.}
(assert (= (+ (+ (* sc_80 62.4) of_80) sltop_80) 3300.))
(declare-fun slbot_81 () Real)
(declare-fun sltop_81 () Real)
; 
; =  {(((sc.vadd[7].OUT*61.4415124065)+of.vadd[7].OUT)+sl.min.vadd[7].OUT)} {-1650.}
(assert (= (+ (+ (* sc_81 61.4415124065) of_81) slbot_81) -1650.))
; 
; =  {(((sc.vadd[7].OUT*62.4)+of.vadd[7].OUT)+sl.max.vadd[7].OUT)} {1650.}
(assert (= (+ (+ (* sc_81 62.4) of_81) sltop_81) 1650.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.vadd[7].OUT2*0.)+of.vadd[7].OUT2)+sl.min.vadd[7].OUT2)} {0.}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) 0.))
; 
; =  {(((sc.vadd[7].OUT2*0.15625)+of.vadd[7].OUT2)+sl.max.vadd[7].OUT2)} {3300.}
(assert (= (+ (+ (* sc_82 0.15625) of_82) sltop_82) 3300.))
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
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_84 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_85 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_87 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_86 (* 1. sc_87)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_86 (* 1. sc_85)) (= sc_86 (* 1. sc_84))))
; no offset
(assert (= (- (+ of_86 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_88 (* sc_86 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
(assert (= of_88 0.))
; no scale
(assert (= sc_84 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_84 0.))
; no offset
(assert (= of_89 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_85 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_87 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_86 (* 1. sc_87)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_86 (* 1. sc_85)) (= sc_86 (* (* 1. sc_84) sc_89))))
; no offset
(assert (= (- (+ of_86 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_89 (* sc_86 1.)))
; no offset
(assert (= of_89 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_83 (* sc_86 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_83 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_83 0.) of_83) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_83 0.) of_83) 0.))
; 
; >=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {3300.}
(assert (<= (+ (* sc_84 4.) of_84) 3300.))
; 
; <=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {0.}
(assert (>= (+ (* sc_84 4.) of_84) 0.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_85 0.) of_85) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_85 0.) of_85) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_86 0.) of_86) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_86 0.) of_86) 0.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 0.))
; 
; =  {(((sc.vadd[5].OUT2*0.0156)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_89 0.0156) of_89) sltop_89) 3300.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.vadd[5].B*619.026085325)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_87 619.026085325) of_87) slbot_87) 0.))
; 
; =  {(((sc.vadd[5].B*625.)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_87 625.) of_87) sltop_87) 3300.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.vadd[5].OUT*619.026085325)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_88 619.026085325) of_88) slbot_88) -1650.))
; 
; =  {(((sc.vadd[5].OUT*625.)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_88 625.) of_88) sltop_88) 1650.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 0.))
; 
; =  {(((sc.vadd[5].OUT2*0.0156)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_89 0.0156) of_89) sltop_89) 3300.))
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_91 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_90 0.))
; 
; =  {sc.vtoi[13].Y} {((1./sc.vtoi[13].K)*sc.vtoi[13].X)}
(assert (= sc_92 (* (/ 1. sc_91) sc_90)))
; 
; =  {of.vtoi[13].Y} {0.}
(assert (= of_92 0.))
; 
; >=  {((sc.vtoi[13].X*1.)+of.vtoi[13].X)} {3300.}
(assert (<= (+ (* sc_90 1.) of_90) 3300.))
; 
; <=  {((sc.vtoi[13].X*1.)+of.vtoi[13].X)} {1.}
(assert (>= (+ (* sc_90 1.) of_90) 1.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.vtoi[13].Y*0.)+of.vtoi[13].Y)+sl.min.vtoi[13].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 0.00030303030303))
; 
; =  {(((sc.vtoi[13].Y*0.00965050555471)+of.vtoi[13].Y)+sl.max.vtoi[13].Y)} {3300.}
(assert (= (+ (+ (* sc_92 0.00965050555471) of_92) sltop_92) 3300.))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.vtoi[13].K*0.)+of.vtoi[13].K)+sl.min.vtoi[13].K)} {1.}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91) 1.))
; 
; =  {(((sc.vtoi[13].K*103.621514368)+of.vtoi[13].K)+sl.max.vtoi[13].K)} {3300.}
(assert (= (+ (+ (* sc_91 103.621514368) of_91) sltop_91) 3300.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.vtoi[13].Y*0.)+of.vtoi[13].Y)+sl.min.vtoi[13].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 0.00030303030303))
; 
; =  {(((sc.vtoi[13].Y*0.00965050555471)+of.vtoi[13].Y)+sl.max.vtoi[13].Y)} {3300.}
(assert (= (+ (+ (* sc_92 0.00965050555471) of_92) sltop_92) 3300.))
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
(assert (= of_94 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_93 0.))
; 
; =  {sc.vtoi[9].Y} {((1./sc.vtoi[9].K)*sc.vtoi[9].X)}
(assert (= sc_95 (* (/ 1. sc_94) sc_93)))
; 
; =  {of.vtoi[9].Y} {0.}
(assert (= of_95 0.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.vtoi[9].X*0.)+of.vtoi[9].X)+sl.min.vtoi[9].X)} {1.}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 1.))
; 
; =  {(((sc.vtoi[9].X*0.15625)+of.vtoi[9].X)+sl.max.vtoi[9].X)} {3300.}
(assert (= (+ (+ (* sc_93 0.15625) of_93) sltop_93) 3300.))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.vtoi[9].Y*-0.15625)+of.vtoi[9].Y)+sl.min.vtoi[9].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_95 -0.15625) of_95) slbot_95) 0.00030303030303))
; 
; =  {(((sc.vtoi[9].Y*0.)+of.vtoi[9].Y)+sl.max.vtoi[9].Y)} {3300.}
(assert (= (+ (+ (* sc_95 0.) of_95) sltop_95) 3300.))
; 
; >=  {((sc.vtoi[9].K*-1.)+of.vtoi[9].K)} {3300.}
(assert (<= (+ (* sc_94 -1.) of_94) 3300.))
; 
; <=  {((sc.vtoi[9].K*-1.)+of.vtoi[9].K)} {1.}
(assert (>= (+ (* sc_94 -1.) of_94) 1.))
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
; =  {sc.vtoi[0].Y} {((1./sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_98 (* (/ 1. sc_97) sc_96)))
; 
; =  {of.vtoi[0].Y} {0.}
(assert (= of_98 0.))
; 
; >=  {((sc.vtoi[0].X*1.)+of.vtoi[0].X)} {3300.}
(assert (<= (+ (* sc_96 1.) of_96) 3300.))
; 
; <=  {((sc.vtoi[0].X*1.)+of.vtoi[0].X)} {1.}
(assert (>= (+ (* sc_96 1.) of_96) 1.))
(declare-fun slbot_98 () Real)
(declare-fun sltop_98 () Real)
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*1.66666666667)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_98 1.66666666667) of_98) sltop_98) 3300.))
(declare-fun slbot_97 () Real)
(declare-fun sltop_97 () Real)
; 
; =  {(((sc.vtoi[0].K*0.)+of.vtoi[0].K)+sl.min.vtoi[0].K)} {1.}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97) 1.))
; 
; =  {(((sc.vtoi[0].K*0.6)+of.vtoi[0].K)+sl.max.vtoi[0].K)} {3300.}
(assert (= (+ (+ (* sc_97 0.6) of_97) sltop_97) 3300.))
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; no offset
(assert (= of_100 0.))
; no offset
(assert (= of_99 0.))
; 
; =  {1.} {(sc.igenebind[8].K*sc.igenebind[8].TF)}
(assert (= 1. (* sc_100 sc_99)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_101 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[8].GE} {(sc.igenebind[8].Vmax*(1./1.))}
(assert (= sc_102 (* sc_101 (/ 1. 1.))))
; 
; =  {of.igenebind[8].GE} {0.}
(assert (= of_102 0.))
; 
; >=  {((sc.igenebind[8].TF*1.)+of.igenebind[8].TF)} {10.}
(assert (<= (+ (* sc_99 1.) of_99) 10.))
; 
; <=  {((sc.igenebind[8].TF*1.)+of.igenebind[8].TF)} {0.0001}
(assert (>= (+ (* sc_99 1.) of_99) 0.0001))
(declare-fun slbot_100 () Real)
(declare-fun sltop_100 () Real)
; 
; =  {(((sc.igenebind[8].K*0.)+of.igenebind[8].K)+sl.min.igenebind[8].K)} {0.0001}
(assert (= (+ (+ (* sc_100 0.) of_100) slbot_100) 0.0001))
; 
; =  {(((sc.igenebind[8].K*0.0156)+of.igenebind[8].K)+sl.max.igenebind[8].K)} {10.}
(assert (= (+ (+ (* sc_100 0.0156) of_100) sltop_100) 10.))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.igenebind[8].GE*0.0153603781016)+of.igenebind[8].GE)+sl.min.igenebind[8].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_102 0.0153603781016) of_102) slbot_102) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[8].GE*0.0156)+of.igenebind[8].GE)+sl.max.igenebind[8].GE)} {9.9999999}
(assert (= (+ (+ (* sc_102 0.0156) of_102) sltop_102) 9.9999999))
; 
; >=  {((sc.igenebind[8].Vmax*0.0156)+of.igenebind[8].Vmax)} {10.}
(assert (<= (+ (* sc_101 0.0156) of_101) 10.))
; 
; <=  {((sc.igenebind[8].Vmax*0.0156)+of.igenebind[8].Vmax)} {0.0001}
(assert (>= (+ (* sc_101 0.0156) of_101) 0.0001))
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
; no offset
(assert (= of_104 0.))
; no offset
(assert (= of_103 0.))
; 
; =  {1.} {(sc.igenebind[10].K*sc.igenebind[10].TF)}
(assert (= 1. (* sc_104 sc_103)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_105 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[10].GE} {(sc.igenebind[10].Vmax*(1./1.))}
(assert (= sc_106 (* sc_105 (/ 1. 1.))))
; 
; =  {of.igenebind[10].GE} {0.}
(assert (= of_106 0.))
(declare-fun slbot_103 () Real)
(declare-fun sltop_103 () Real)
; 
; =  {(((sc.igenebind[10].TF*0.)+of.igenebind[10].TF)+sl.min.igenebind[10].TF)} {0.0001}
(assert (= (+ (+ (* sc_103 0.) of_103) slbot_103) 0.0001))
; 
; =  {(((sc.igenebind[10].TF*0.00965050555471)+of.igenebind[10].TF)+sl.max.igenebind[10].TF)} {10.}
(assert (= (+ (+ (* sc_103 0.00965050555471) of_103) sltop_103) 10.))
; 
; >=  {((sc.igenebind[10].K*1.)+of.igenebind[10].K)} {10.}
(assert (<= (+ (* sc_104 1.) of_104) 10.))
; 
; <=  {((sc.igenebind[10].K*1.)+of.igenebind[10].K)} {0.0001}
(assert (>= (+ (* sc_104 1.) of_104) 0.0001))
(declare-fun slbot_106 () Real)
(declare-fun sltop_106 () Real)
; 
; =  {(((sc.igenebind[10].GE*0.154756521331)+of.igenebind[10].GE)+sl.min.igenebind[10].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_106 0.154756521331) of_106) slbot_106) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[10].GE*0.15625)+of.igenebind[10].GE)+sl.max.igenebind[10].GE)} {9.9999999}
(assert (= (+ (+ (* sc_106 0.15625) of_106) sltop_106) 9.9999999))
; 
; >=  {((sc.igenebind[10].Vmax*0.15625)+of.igenebind[10].Vmax)} {10.}
(assert (<= (+ (* sc_105 0.15625) of_105) 10.))
; 
; <=  {((sc.igenebind[10].Vmax*0.15625)+of.igenebind[10].Vmax)} {0.0001}
(assert (>= (+ (* sc_105 0.15625) of_105) 0.0001))
(declare-fun slbot_106 () Real)
(declare-fun sltop_106 () Real)
; 
; =  {(((sc.igenebind[10].GE*0.154756521331)+of.igenebind[10].GE)+sl.min.igenebind[10].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_106 0.154756521331) of_106) slbot_106) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[10].GE*0.15625)+of.igenebind[10].GE)+sl.max.igenebind[10].GE)} {9.9999999}
(assert (= (+ (+ (* sc_106 0.15625) of_106) sltop_106) 9.9999999))
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_108 sc_107))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_108 of_107))
; 
; >=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_107 1250.) of_107) 3300.))
; 
; <=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_107 1250.) of_107) 0.))
; 
; >=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_108 1250.) of_108) 3300.))
; 
; <=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_108 1250.) of_108) 0.))
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_110 sc_109))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_110 of_109))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_109 0.) of_109) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_109 0.) of_109) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_110 0.) of_110) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_110 0.) of_110) 0.))
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_112 sc_111))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_112 of_111))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_111 0.) of_111) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_111 0.) of_111) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_112 0.) of_112) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_112 0.) of_112) 0.))
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_114 sc_113))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_114 of_113))
; 
; >=  {((sc.input.V[13].X*0.000125)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_113 0.000125) of_113) 3300.))
; 
; <=  {((sc.input.V[13].X*0.000125)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_113 0.000125) of_113) 0.))
; 
; >=  {((sc.input.V[13].O*0.000125)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_114 0.000125) of_114) 3300.))
; 
; <=  {((sc.input.V[13].O*0.000125)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_114 0.000125) of_114) 0.))
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_116 sc_115))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_116 of_115))
; 
; >=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_115 1000.75) of_115) 3300.))
; 
; <=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_115 1000.75) of_115) 0.))
; 
; >=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_116 1000.75) of_116) 3300.))
; 
; <=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_116 1000.75) of_116) 0.))
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_118 sc_117))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_118 of_117))
; 
; >=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_117 -1.) of_117) 3300.))
; 
; <=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_117 -1.) of_117) 0.))
; 
; >=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_118 -1.) of_118) 3300.))
; 
; <=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_118 -1.) of_118) 0.))
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_120 sc_119))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_120 of_119))
(declare-fun slbot_119 () Real)
(declare-fun sltop_119 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_119 0.) of_119) slbot_119) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_119 0.6) of_119) sltop_119) 3300.))
(declare-fun slbot_120 () Real)
(declare-fun sltop_120 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_120 0.) of_120) slbot_120) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_120 0.6) of_120) sltop_120) 3300.))
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_122 sc_121))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_122 of_121))
; 
; >=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_121 4.) of_121) 3300.))
; 
; <=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_121 4.) of_121) 0.))
; 
; >=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_122 4.) of_122) 3300.))
; 
; <=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_122 4.) of_122) 0.))
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_124 sc_123))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_124 of_123))
; 
; >=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_123 4.) of_123) 3300.))
; 
; <=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_123 4.) of_123) 0.))
; 
; >=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_124 4.) of_124) 3300.))
; 
; <=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_124 4.) of_124) 0.))
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
(declare-fun sc_126 () Real)
(assert (> sc_126 1e-08))
(declare-fun of_126 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_126 sc_125))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_126 of_125))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_125 1.) of_125) 3300.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_125 1.) of_125) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_126 1.) of_126) 3300.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_126 1.) of_126) 0.))
(declare-fun sc_127 () Real)
(assert (> sc_127 1e-08))
(declare-fun of_127 () Real)
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_128 sc_127))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_128 of_127))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_127 0.) of_127) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_127 0.) of_127) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_128 0.) of_128) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_128 0.) of_128) 0.))
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
(declare-fun sc_130 () Real)
(assert (> sc_130 1e-08))
(declare-fun of_130 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_130 sc_129))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_130 of_129))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_129 1.) of_129) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_129 1.) of_129) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_130 1.) of_130) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_130 1.) of_130) 0.))
(declare-fun sc_131 () Real)
(assert (> sc_131 1e-08))
(declare-fun of_131 () Real)
(declare-fun sc_132 () Real)
(assert (> sc_132 1e-08))
(declare-fun of_132 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_132 sc_131))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_132 of_131))
; 
; >=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_131 1.) of_131) 3300.))
; 
; <=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_131 1.) of_131) 0.))
; 
; >=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_132 1.) of_132) 3300.))
; 
; <=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_132 1.) of_132) 0.))
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_134 sc_133))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_134 of_133))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_133 0.) of_133) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_133 0.) of_133) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_134 0.) of_134) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_134 0.) of_134) 0.))
(declare-fun sc_135 () Real)
(assert (> sc_135 1e-08))
(declare-fun of_135 () Real)
(declare-fun sc_136 () Real)
(assert (> sc_136 1e-08))
(declare-fun of_136 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_136 sc_135))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_136 of_135))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_135 0.) of_135) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_135 0.) of_135) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_136 0.) of_136) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_136 0.) of_136) 0.))
(declare-fun sc_137 () Real)
(assert (> sc_137 1e-08))
(declare-fun of_137 () Real)
(declare-fun sc_138 () Real)
(assert (> sc_138 1e-08))
(declare-fun of_138 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_138 sc_137))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_138 of_137))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_137 0.) of_137) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_137 0.) of_137) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_138 0.) of_138) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_138 0.) of_138) 0.))
(declare-fun sc_139 () Real)
(assert (> sc_139 1e-08))
(declare-fun of_139 () Real)
(declare-fun sc_140 () Real)
(assert (> sc_140 1e-08))
(declare-fun of_140 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_140 sc_139))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_140 of_139))
; 
; >=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_139 2.) of_139) 3300.))
; 
; <=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_139 2.) of_139) 0.))
; 
; >=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_140 2.) of_140) 3300.))
; 
; <=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_140 2.) of_140) 0.))
(declare-fun sc_141 () Real)
(assert (> sc_141 1e-08))
(declare-fun of_141 () Real)
(declare-fun sc_142 () Real)
(assert (> sc_142 1e-08))
(declare-fun of_142 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_142 sc_141))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_142 of_141))
; 
; >=  {((sc.input.V[17].X*1.)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_141 1.) of_141) 3300.))
; 
; <=  {((sc.input.V[17].X*1.)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_141 1.) of_141) 0.))
; 
; >=  {((sc.input.V[17].O*1.)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_142 1.) of_142) 3300.))
; 
; <=  {((sc.input.V[17].O*1.)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_142 1.) of_142) 0.))
(declare-fun sc_143 () Real)
(assert (> sc_143 1e-08))
(declare-fun of_143 () Real)
(declare-fun sc_144 () Real)
(assert (> sc_144 1e-08))
(declare-fun of_144 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_144 sc_143))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_144 of_143))
; 
; >=  {((sc.input.V[18].X*1.)+of.input.V[18].X)} {3300.}
(assert (<= (+ (* sc_143 1.) of_143) 3300.))
; 
; <=  {((sc.input.V[18].X*1.)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_143 1.) of_143) 0.))
; 
; >=  {((sc.input.V[18].O*1.)+of.input.V[18].O)} {3300.}
(assert (<= (+ (* sc_144 1.) of_144) 3300.))
; 
; <=  {((sc.input.V[18].O*1.)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_144 1.) of_144) 0.))
(declare-fun sc_145 () Real)
(assert (> sc_145 1e-08))
(declare-fun of_145 () Real)
(declare-fun sc_146 () Real)
(assert (> sc_146 1e-08))
(declare-fun of_146 () Real)
(declare-fun sc_147 () Real)
(assert (> sc_147 1e-08))
(declare-fun of_147 () Real)
; no offset
(assert (= of_146 0.))
; no offset
(assert (= of_145 0.))
; 
; =  {sc.itov[15].Y} {(sc.itov[15].K*sc.itov[15].X)}
(assert (= sc_147 (* sc_146 sc_145)))
; 
; =  {of.itov[15].Y} {0.}
(assert (= of_147 0.))
(declare-fun slbot_145 () Real)
(declare-fun sltop_145 () Real)
; 
; =  {(((sc.itov[15].X*0.)+of.itov[15].X)+sl.min.itov[15].X)} {0.0001}
(assert (= (+ (+ (* sc_145 0.) of_145) slbot_145) 0.0001))
; 
; =  {(((sc.itov[15].X*103.621514368)+of.itov[15].X)+sl.max.itov[15].X)} {10.}
(assert (= (+ (+ (* sc_145 103.621514368) of_145) sltop_145) 10.))
(declare-fun slbot_147 () Real)
(declare-fun sltop_147 () Real)
; 
; =  {(((sc.itov[15].Y*0.)+of.itov[15].Y)+sl.min.itov[15].Y)} {0.0001}
(assert (= (+ (+ (* sc_147 0.) of_147) slbot_147) 0.0001))
; 
; =  {(((sc.itov[15].Y*103.621514368)+of.itov[15].Y)+sl.max.itov[15].Y)} {3300.}
(assert (= (+ (+ (* sc_147 103.621514368) of_147) sltop_147) 3300.))
; 
; >=  {((sc.itov[15].K*1.)+of.itov[15].K)} {330.}
(assert (<= (+ (* sc_146 1.) of_146) 330.))
; 
; <=  {((sc.itov[15].K*1.)+of.itov[15].K)} {1.}
(assert (>= (+ (* sc_146 1.) of_146) 1.))
(declare-fun slbot_147 () Real)
(declare-fun sltop_147 () Real)
; 
; =  {(((sc.itov[15].Y*0.)+of.itov[15].Y)+sl.min.itov[15].Y)} {0.0001}
(assert (= (+ (+ (* sc_147 0.) of_147) slbot_147) 0.0001))
; 
; =  {(((sc.itov[15].Y*103.621514368)+of.itov[15].Y)+sl.max.itov[15].Y)} {3300.}
(assert (= (+ (+ (* sc_147 103.621514368) of_147) sltop_147) 3300.))
(declare-fun sc_148 () Real)
(assert (> sc_148 1e-08))
(declare-fun of_148 () Real)
(declare-fun sc_149 () Real)
(assert (> sc_149 1e-08))
(declare-fun of_149 () Real)
(declare-fun sc_150 () Real)
(assert (> sc_150 1e-08))
(declare-fun of_150 () Real)
; no offset
(assert (= of_149 0.))
; no offset
(assert (= of_148 0.))
; 
; =  {sc.itov[16].Y} {(sc.itov[16].K*sc.itov[16].X)}
(assert (= sc_150 (* sc_149 sc_148)))
; 
; =  {of.itov[16].Y} {0.}
(assert (= of_150 0.))
; 
; >=  {((sc.itov[16].X*1.)+of.itov[16].X)} {10.}
(assert (<= (+ (* sc_148 1.) of_148) 10.))
; 
; <=  {((sc.itov[16].X*1.)+of.itov[16].X)} {0.0001}
(assert (>= (+ (* sc_148 1.) of_148) 0.0001))
(declare-fun slbot_149 () Real)
(declare-fun sltop_149 () Real)
; 
; =  {(((sc.itov[16].K*0.0153603781016)+of.itov[16].K)+sl.min.itov[16].K)} {1.}
(assert (= (+ (+ (* sc_149 0.0153603781016) of_149) slbot_149) 1.))
; 
; =  {(((sc.itov[16].K*0.0156)+of.itov[16].K)+sl.max.itov[16].K)} {330.}
(assert (= (+ (+ (* sc_149 0.0156) of_149) sltop_149) 330.))
(declare-fun slbot_150 () Real)
(declare-fun sltop_150 () Real)
; 
; =  {(((sc.itov[16].Y*0.0153603781016)+of.itov[16].Y)+sl.min.itov[16].Y)} {0.0001}
(assert (= (+ (+ (* sc_150 0.0153603781016) of_150) slbot_150) 0.0001))
; 
; =  {(((sc.itov[16].Y*0.0156)+of.itov[16].Y)+sl.max.itov[16].Y)} {3300.}
(assert (= (+ (+ (* sc_150 0.0156) of_150) sltop_150) 3300.))
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
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_153 (* sc_152 sc_151)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_153 0.))
; 
; >=  {((sc.itov[4].X*4000.)+of.itov[4].X)} {10.}
(assert (<= (+ (* sc_151 4000.) of_151) 10.))
; 
; <=  {((sc.itov[4].X*4000.)+of.itov[4].X)} {0.0001}
(assert (>= (+ (* sc_151 4000.) of_151) 0.0001))
(declare-fun slbot_153 () Real)
(declare-fun sltop_153 () Real)
; 
; =  {(((sc.itov[4].Y*619.026085325)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_153 619.026085325) of_153) slbot_153) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_153 625.) of_153) sltop_153) 3300.))
(declare-fun slbot_152 () Real)
(declare-fun sltop_152 () Real)
; 
; =  {(((sc.itov[4].K*0.154756521331)+of.itov[4].K)+sl.min.itov[4].K)} {1.}
(assert (= (+ (+ (* sc_152 0.154756521331) of_152) slbot_152) 1.))
; 
; =  {(((sc.itov[4].K*0.15625)+of.itov[4].K)+sl.max.itov[4].K)} {330.}
(assert (= (+ (+ (* sc_152 0.15625) of_152) sltop_152) 330.))
(declare-fun slbot_153 () Real)
(declare-fun sltop_153 () Real)
; 
; =  {(((sc.itov[4].Y*619.026085325)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_153 619.026085325) of_153) slbot_153) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_153 625.) of_153) sltop_153) 3300.))
(declare-fun sc_154 () Real)
(assert (> sc_154 1e-08))
(declare-fun of_154 () Real)
(declare-fun sc_155 () Real)
(assert (> sc_155 1e-08))
(declare-fun of_155 () Real)
(declare-fun sc_156 () Real)
(assert (> sc_156 1e-08))
(declare-fun of_156 () Real)
(declare-fun sc_157 () Real)
(assert (> sc_157 1e-08))
(declare-fun of_157 () Real)
(declare-fun sc_158 () Real)
(assert (> sc_158 1e-08))
(declare-fun of_158 () Real)
; 
; =  {sc.iadd[2].A} {sc.iadd[2].B}
(assert (= sc_156 sc_157))
; 
; =  {sc.iadd[2].A} {sc.iadd[2].C} {sc.iadd[2].D}
(assert (and (= sc_156 sc_155) (= sc_156 sc_154)))
; 
; =  {sc.iadd[2].OUT} {sc.iadd[2].A}
(assert (= sc_158 sc_156))
; 
; =  {of.iadd[2].OUT} {((of.iadd[2].A+of.iadd[2].B)-of.iadd[2].C-of.iadd[2].D)}
(assert (= of_158 (- (+ of_156 of_157) (+ of_155 of_154))))
; 
; >=  {((sc.iadd[2].D*0.)+of.iadd[2].D)} {5.}
(assert (<= (+ (* sc_154 0.) of_154) 5.))
; 
; <=  {((sc.iadd[2].D*0.)+of.iadd[2].D)} {0.}
(assert (>= (+ (* sc_154 0.) of_154) 0.))
; 
; >=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {5.}
(assert (<= (+ (* sc_155 0.) of_155) 5.))
; 
; <=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {0.}
(assert (>= (+ (* sc_155 0.) of_155) 0.))
(declare-fun slbot_158 () Real)
(declare-fun sltop_158 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_158 0.) of_158) slbot_158) -10.))
; 
; =  {(((sc.iadd[2].OUT*1.66666666667)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_158 1.66666666667) of_158) sltop_158) 10.))
; 
; >=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {5.}
(assert (<= (+ (* sc_156 0.) of_156) 5.))
; 
; <=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {0.}
(assert (>= (+ (* sc_156 0.) of_156) 0.))
(declare-fun slbot_157 () Real)
(declare-fun sltop_157 () Real)
; 
; =  {(((sc.iadd[2].B*0.)+of.iadd[2].B)+sl.min.iadd[2].B)} {0.}
(assert (= (+ (+ (* sc_157 0.) of_157) slbot_157) 0.))
; 
; =  {(((sc.iadd[2].B*1.66666666667)+of.iadd[2].B)+sl.max.iadd[2].B)} {5.}
(assert (= (+ (+ (* sc_157 1.66666666667) of_157) sltop_157) 5.))
(declare-fun slbot_158 () Real)
(declare-fun sltop_158 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_158 0.) of_158) slbot_158) -10.))
; 
; =  {(((sc.iadd[2].OUT*1.66666666667)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_158 1.66666666667) of_158) sltop_158) 10.))
(declare-fun sc_159 () Real)
(assert (> sc_159 1e-08))
(declare-fun of_159 () Real)
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
; 
; =  {sc.iadd[12].A} {sc.iadd[12].B}
(assert (= sc_161 sc_162))
; 
; =  {sc.iadd[12].A} {sc.iadd[12].C} {sc.iadd[12].D}
(assert (and (= sc_161 sc_160) (= sc_161 sc_159)))
; 
; =  {sc.iadd[12].OUT} {sc.iadd[12].A}
(assert (= sc_163 sc_161))
; 
; =  {of.iadd[12].OUT} {((of.iadd[12].A+of.iadd[12].B)-of.iadd[12].C-of.iadd[12].D)}
(assert (= of_163 (- (+ of_161 of_162) (+ of_160 of_159))))
; 
; >=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {5.}
(assert (<= (+ (* sc_159 0.) of_159) 5.))
; 
; <=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {0.}
(assert (>= (+ (* sc_159 0.) of_159) 0.))
; 
; >=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {5.}
(assert (<= (+ (* sc_160 0.) of_160) 5.))
; 
; <=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {0.}
(assert (>= (+ (* sc_160 0.) of_160) 0.))
(declare-fun slbot_163 () Real)
(declare-fun sltop_163 () Real)
; 
; =  {(((sc.iadd[12].OUT*0.)+of.iadd[12].OUT)+sl.min.iadd[12].OUT)} {-10.}
(assert (= (+ (+ (* sc_163 0.) of_163) slbot_163) -10.))
; 
; =  {(((sc.iadd[12].OUT*0.00965050555471)+of.iadd[12].OUT)+sl.max.iadd[12].OUT)} {10.}
(assert (= (+ (+ (* sc_163 0.00965050555471) of_163) sltop_163) 10.))
; 
; >=  {((sc.iadd[12].A*0.)+of.iadd[12].A)} {5.}
(assert (<= (+ (* sc_161 0.) of_161) 5.))
; 
; <=  {((sc.iadd[12].A*0.)+of.iadd[12].A)} {0.}
(assert (>= (+ (* sc_161 0.) of_161) 0.))
(declare-fun slbot_162 () Real)
(declare-fun sltop_162 () Real)
; 
; =  {(((sc.iadd[12].B*0.)+of.iadd[12].B)+sl.min.iadd[12].B)} {0.}
(assert (= (+ (+ (* sc_162 0.) of_162) slbot_162) 0.))
; 
; =  {(((sc.iadd[12].B*0.00965050555471)+of.iadd[12].B)+sl.max.iadd[12].B)} {5.}
(assert (= (+ (+ (* sc_162 0.00965050555471) of_162) sltop_162) 5.))
(declare-fun slbot_163 () Real)
(declare-fun sltop_163 () Real)
; 
; =  {(((sc.iadd[12].OUT*0.)+of.iadd[12].OUT)+sl.min.iadd[12].OUT)} {-10.}
(assert (= (+ (+ (* sc_163 0.) of_163) slbot_163) -10.))
; 
; =  {(((sc.iadd[12].OUT*0.00965050555471)+of.iadd[12].OUT)+sl.max.iadd[12].OUT)} {10.}
(assert (= (+ (+ (* sc_163 0.00965050555471) of_163) sltop_163) 10.))
(declare-fun sc_164 () Real)
(assert (> sc_164 1e-08))
(declare-fun of_164 () Real)
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
; 
; =  {sc.iadd[11].A} {sc.iadd[11].B}
(assert (= sc_166 sc_167))
; 
; =  {sc.iadd[11].A} {sc.iadd[11].C} {sc.iadd[11].D}
(assert (and (= sc_166 sc_165) (= sc_166 sc_164)))
; 
; =  {sc.iadd[11].OUT} {sc.iadd[11].A}
(assert (= sc_168 sc_166))
; 
; =  {of.iadd[11].OUT} {((of.iadd[11].A+of.iadd[11].B)-of.iadd[11].C-of.iadd[11].D)}
(assert (= of_168 (- (+ of_166 of_167) (+ of_165 of_164))))
; 
; >=  {((sc.iadd[11].D*0.)+of.iadd[11].D)} {5.}
(assert (<= (+ (* sc_164 0.) of_164) 5.))
; 
; <=  {((sc.iadd[11].D*0.)+of.iadd[11].D)} {0.}
(assert (>= (+ (* sc_164 0.) of_164) 0.))
; 
; >=  {((sc.iadd[11].C*0.)+of.iadd[11].C)} {5.}
(assert (<= (+ (* sc_165 0.) of_165) 5.))
; 
; <=  {((sc.iadd[11].C*0.)+of.iadd[11].C)} {0.}
(assert (>= (+ (* sc_165 0.) of_165) 0.))
(declare-fun slbot_168 () Real)
(declare-fun sltop_168 () Real)
; 
; =  {(((sc.iadd[11].OUT*0.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_168 0.) of_168) slbot_168) -10.))
; 
; =  {(((sc.iadd[11].OUT*0.00965050555471)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_168 0.00965050555471) of_168) sltop_168) 10.))
; 
; >=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {5.}
(assert (<= (+ (* sc_166 0.) of_166) 5.))
; 
; <=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {0.}
(assert (>= (+ (* sc_166 0.) of_166) 0.))
(declare-fun slbot_167 () Real)
(declare-fun sltop_167 () Real)
; 
; =  {(((sc.iadd[11].B*0.)+of.iadd[11].B)+sl.min.iadd[11].B)} {0.}
(assert (= (+ (+ (* sc_167 0.) of_167) slbot_167) 0.))
; 
; =  {(((sc.iadd[11].B*0.00965050555471)+of.iadd[11].B)+sl.max.iadd[11].B)} {5.}
(assert (= (+ (+ (* sc_167 0.00965050555471) of_167) sltop_167) 5.))
(declare-fun slbot_168 () Real)
(declare-fun sltop_168 () Real)
; 
; =  {(((sc.iadd[11].OUT*0.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_168 0.) of_168) slbot_168) -10.))
; 
; =  {(((sc.iadd[11].OUT*0.00965050555471)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_168 0.00965050555471) of_168) sltop_168) 10.))
(declare-fun sc_169 () Real)
(assert (> sc_169 1e-08))
(declare-fun of_169 () Real)
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
; 
; =  {sc.iadd[3].A} {sc.iadd[3].B}
(assert (= sc_171 sc_172))
; 
; =  {sc.iadd[3].A} {sc.iadd[3].C} {sc.iadd[3].D}
(assert (and (= sc_171 sc_170) (= sc_171 sc_169)))
; 
; =  {sc.iadd[3].OUT} {sc.iadd[3].A}
(assert (= sc_173 sc_171))
; 
; =  {of.iadd[3].OUT} {((of.iadd[3].A+of.iadd[3].B)-of.iadd[3].C-of.iadd[3].D)}
(assert (= of_173 (- (+ of_171 of_172) (+ of_170 of_169))))
; 
; >=  {((sc.iadd[3].D*0.)+of.iadd[3].D)} {5.}
(assert (<= (+ (* sc_169 0.) of_169) 5.))
; 
; <=  {((sc.iadd[3].D*0.)+of.iadd[3].D)} {0.}
(assert (>= (+ (* sc_169 0.) of_169) 0.))
; 
; >=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {5.}
(assert (<= (+ (* sc_170 0.) of_170) 5.))
; 
; <=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {0.}
(assert (>= (+ (* sc_170 0.) of_170) 0.))
(declare-fun slbot_173 () Real)
(declare-fun sltop_173 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_173 0.) of_173) slbot_173) -10.))
; 
; =  {(((sc.iadd[3].OUT*1.66666666667)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_173 1.66666666667) of_173) sltop_173) 10.))
; 
; >=  {((sc.iadd[3].A*0.)+of.iadd[3].A)} {5.}
(assert (<= (+ (* sc_171 0.) of_171) 5.))
; 
; <=  {((sc.iadd[3].A*0.)+of.iadd[3].A)} {0.}
(assert (>= (+ (* sc_171 0.) of_171) 0.))
(declare-fun slbot_172 () Real)
(declare-fun sltop_172 () Real)
; 
; =  {(((sc.iadd[3].B*0.)+of.iadd[3].B)+sl.min.iadd[3].B)} {0.}
(assert (= (+ (+ (* sc_172 0.) of_172) slbot_172) 0.))
; 
; =  {(((sc.iadd[3].B*1.66666666667)+of.iadd[3].B)+sl.max.iadd[3].B)} {5.}
(assert (= (+ (+ (* sc_172 1.66666666667) of_172) sltop_172) 5.))
(declare-fun slbot_173 () Real)
(declare-fun sltop_173 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_173 0.) of_173) slbot_173) -10.))
; 
; =  {(((sc.iadd[3].OUT*1.66666666667)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_173 1.66666666667) of_173) sltop_173) 10.))
(declare-fun sc_174 () Real)
(assert (> sc_174 1e-08))
(declare-fun of_174 () Real)
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
; 
; =  {sc.iadd[17].A} {sc.iadd[17].B}
(assert (= sc_176 sc_177))
; 
; =  {sc.iadd[17].A} {sc.iadd[17].C} {sc.iadd[17].D}
(assert (and (= sc_176 sc_175) (= sc_176 sc_174)))
; 
; =  {sc.iadd[17].OUT} {sc.iadd[17].A}
(assert (= sc_178 sc_176))
; 
; =  {of.iadd[17].OUT} {((of.iadd[17].A+of.iadd[17].B)-of.iadd[17].C-of.iadd[17].D)}
(assert (= of_178 (- (+ of_176 of_177) (+ of_175 of_174))))
(declare-fun slbot_174 () Real)
(declare-fun sltop_174 () Real)
; 
; =  {(((sc.iadd[17].D*-0.15625)+of.iadd[17].D)+sl.min.iadd[17].D)} {0.}
(assert (= (+ (+ (* sc_174 -0.15625) of_174) slbot_174) 0.))
; 
; =  {(((sc.iadd[17].D*0.)+of.iadd[17].D)+sl.max.iadd[17].D)} {5.}
(assert (= (+ (+ (* sc_174 0.) of_174) sltop_174) 5.))
; 
; >=  {((sc.iadd[17].C*1.)+of.iadd[17].C)} {5.}
(assert (<= (+ (* sc_175 1.) of_175) 5.))
; 
; <=  {((sc.iadd[17].C*1.)+of.iadd[17].C)} {0.}
(assert (>= (+ (* sc_175 1.) of_175) 0.))
(declare-fun slbot_178 () Real)
(declare-fun sltop_178 () Real)
; 
; =  {(((sc.iadd[17].OUT*-1.)+of.iadd[17].OUT)+sl.min.iadd[17].OUT)} {-10.}
(assert (= (+ (+ (* sc_178 -1.) of_178) slbot_178) -10.))
; 
; =  {(((sc.iadd[17].OUT*-0.84375)+of.iadd[17].OUT)+sl.max.iadd[17].OUT)} {10.}
(assert (= (+ (+ (* sc_178 -0.84375) of_178) sltop_178) 10.))
; 
; >=  {((sc.iadd[17].A*0.)+of.iadd[17].A)} {5.}
(assert (<= (+ (* sc_176 0.) of_176) 5.))
; 
; <=  {((sc.iadd[17].A*0.)+of.iadd[17].A)} {0.}
(assert (>= (+ (* sc_176 0.) of_176) 0.))
; 
; >=  {((sc.iadd[17].B*0.)+of.iadd[17].B)} {5.}
(assert (<= (+ (* sc_177 0.) of_177) 5.))
; 
; <=  {((sc.iadd[17].B*0.)+of.iadd[17].B)} {0.}
(assert (>= (+ (* sc_177 0.) of_177) 0.))
(declare-fun slbot_178 () Real)
(declare-fun sltop_178 () Real)
; 
; =  {(((sc.iadd[17].OUT*-1.)+of.iadd[17].OUT)+sl.min.iadd[17].OUT)} {-10.}
(assert (= (+ (+ (* sc_178 -1.) of_178) slbot_178) -10.))
; 
; =  {(((sc.iadd[17].OUT*-0.84375)+of.iadd[17].OUT)+sl.max.iadd[17].OUT)} {10.}
(assert (= (+ (+ (* sc_178 -0.84375) of_178) sltop_178) 10.))
(declare-fun sc_179 () Real)
(assert (> sc_179 1e-08))
(declare-fun of_179 () Real)
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
; 
; =  {sc.iadd[18].A} {sc.iadd[18].B}
(assert (= sc_181 sc_182))
; 
; =  {sc.iadd[18].A} {sc.iadd[18].C} {sc.iadd[18].D}
(assert (and (= sc_181 sc_180) (= sc_181 sc_179)))
; 
; =  {sc.iadd[18].OUT} {sc.iadd[18].A}
(assert (= sc_183 sc_181))
; 
; =  {of.iadd[18].OUT} {((of.iadd[18].A+of.iadd[18].B)-of.iadd[18].C-of.iadd[18].D)}
(assert (= of_183 (- (+ of_181 of_182) (+ of_180 of_179))))
; 
; >=  {((sc.iadd[18].D*0.)+of.iadd[18].D)} {5.}
(assert (<= (+ (* sc_179 0.) of_179) 5.))
; 
; <=  {((sc.iadd[18].D*0.)+of.iadd[18].D)} {0.}
(assert (>= (+ (* sc_179 0.) of_179) 0.))
; 
; >=  {((sc.iadd[18].C*0.)+of.iadd[18].C)} {5.}
(assert (<= (+ (* sc_180 0.) of_180) 5.))
; 
; <=  {((sc.iadd[18].C*0.)+of.iadd[18].C)} {0.}
(assert (>= (+ (* sc_180 0.) of_180) 0.))
(declare-fun slbot_181 () Real)
(declare-fun sltop_181 () Real)
; 
; =  {(((sc.iadd[18].A*0.)+of.iadd[18].A)+sl.min.iadd[18].A)} {0.}
(assert (= (+ (+ (* sc_181 0.) of_181) slbot_181) 0.))
; 
; =  {(((sc.iadd[18].A*0.0156)+of.iadd[18].A)+sl.max.iadd[18].A)} {5.}
(assert (= (+ (+ (* sc_181 0.0156) of_181) sltop_181) 5.))
; 
; >=  {((sc.iadd[18].B*0.)+of.iadd[18].B)} {5.}
(assert (<= (+ (* sc_182 0.) of_182) 5.))
; 
; <=  {((sc.iadd[18].B*0.)+of.iadd[18].B)} {0.}
(assert (>= (+ (* sc_182 0.) of_182) 0.))
(declare-fun slbot_183 () Real)
(declare-fun sltop_183 () Real)
; 
; =  {(((sc.iadd[18].OUT*0.)+of.iadd[18].OUT)+sl.min.iadd[18].OUT)} {-10.}
(assert (= (+ (+ (* sc_183 0.) of_183) slbot_183) -10.))
; 
; =  {(((sc.iadd[18].OUT*0.0156)+of.iadd[18].OUT)+sl.max.iadd[18].OUT)} {10.}
(assert (= (+ (+ (* sc_183 0.0156) of_183) sltop_183) 10.))
; 
; =  {sc.switch[1].PROD} {sc.iadd[18].A}
(assert (= sc_17 sc_181))
; 
; =  {of.switch[1].PROD} {of.iadd[18].A}
(assert (= of_17 of_181))
; 
; =  {sc.input.I[0].O} {sc.igenebind[10].Vmax}
(assert (= sc_37 sc_105))
; 
; =  {of.input.I[0].O} {of.igenebind[10].Vmax}
(assert (= of_37 of_105))
; 
; =  {sc.input.I[22].O} {sc.switch[16].Vmax}
(assert (= sc_71 sc_11))
; 
; =  {of.input.I[22].O} {of.switch[16].Vmax}
(assert (= of_71 of_11))
; 
; =  {sc.input.V[15].O} {sc.vgain[6].X}
(assert (= sc_126 sc_0))
; 
; =  {of.input.V[15].O} {of.vgain[6].X}
(assert (= of_126 of_0))
; 
; =  {sc.input.I[32].O} {sc.itov[16].X}
(assert (= sc_65 sc_148))
; 
; =  {of.input.I[32].O} {of.itov[16].X}
(assert (= of_65 of_148))
; 
; =  {sc.input.V[13].O} {sc.vgain[6].Y}
(assert (= sc_114 sc_1))
; 
; =  {of.input.V[13].O} {of.vgain[6].Y}
(assert (= of_114 of_1))
; 
; =  {sc.vgain[14].P} {sc.vtoi[13].K}
(assert (= sc_7 sc_91))
; 
; =  {of.vgain[14].P} {of.vtoi[13].K}
(assert (= of_7 of_91))
; 
; =  {sc.input.V[14].O} {sc.vtoi[0].X}
(assert (= sc_130 sc_96))
; 
; =  {of.input.V[14].O} {of.vtoi[0].X}
(assert (= of_130 of_96))
; 
; =  {sc.vtoi[0].Y} {sc.iadd[3].B}
(assert (= sc_98 sc_172))
; 
; =  {of.vtoi[0].Y} {of.iadd[3].B}
(assert (= of_98 of_172))
; 
; =  {sc.iadd[12].OUT} {sc.iadd[11].B}
(assert (= sc_163 sc_167))
; 
; =  {of.iadd[12].OUT} {of.iadd[11].B}
(assert (= of_163 of_167))
; 
; =  {sc.input.I[30].O} {sc.iadd[18].B}
(assert (= sc_53 sc_182))
; 
; =  {of.input.I[30].O} {of.iadd[18].B}
(assert (= of_53 of_182))
; 
; =  {sc.input.V[11].O} {sc.vadd[5].D}
(assert (= sc_122 sc_84))
; 
; =  {of.input.V[11].O} {of.vadd[5].D}
(assert (= of_122 of_84))
; 
; =  {sc.input.I[14].O} {sc.iadd[17].B}
(assert (= sc_47 sc_177))
; 
; =  {of.input.I[14].O} {of.iadd[17].B}
(assert (= of_47 of_177))
; 
; =  {sc.itov[15].Y} {sc.vgain[14].Z}
(assert (= sc_147 sc_6))
; 
; =  {of.itov[15].Y} {of.vgain[14].Z}
(assert (= of_147 of_6))
; 
; =  {sc.switch[16].PROD} {sc.itov[15].X}
(assert (= sc_12 sc_145))
; 
; =  {of.switch[16].PROD} {of.itov[15].X}
(assert (= of_12 of_145))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[1].X}
(assert (= sc_89 sc_74))
; 
; =  {of.vadd[5].OUT2} {of.output.V[1].X}
(assert (= of_89 of_74))
; 
; =  {sc.vadd[5].OUT2} {sc.switch[1].Vmax}
(assert (= sc_89 sc_16))
; 
; =  {of.vadd[5].OUT2} {of.switch[1].Vmax}
(assert (= of_89 of_16))
; 
; =  {sc.input.I[10].O} {sc.iadd[11].C}
(assert (= sc_41 sc_165))
; 
; =  {of.input.I[10].O} {of.iadd[11].C}
(assert (= of_41 of_165))
; 
; =  {sc.input.I[12].O} {sc.iadd[12].A}
(assert (= sc_31 sc_161))
; 
; =  {of.input.I[12].O} {of.iadd[12].A}
(assert (= of_31 of_161))
; 
; =  {sc.iadd[11].OUT} {sc.igenebind[10].TF}
(assert (= sc_168 sc_103))
; 
; =  {of.iadd[11].OUT} {of.igenebind[10].TF}
(assert (= of_168 of_103))
; 
; =  {sc.input.I[7].O} {sc.iadd[3].C}
(assert (= sc_27 sc_170))
; 
; =  {of.input.I[7].O} {of.iadd[3].C}
(assert (= of_27 of_170))
; 
; =  {sc.iadd[3].OUT} {sc.iadd[2].B}
(assert (= sc_173 sc_157))
; 
; =  {of.iadd[3].OUT} {of.iadd[2].B}
(assert (= of_173 of_157))
; 
; =  {sc.iadd[17].OUT} {sc.switch[16].SUB}
(assert (= sc_178 sc_9))
; 
; =  {of.iadd[17].OUT} {of.switch[16].SUB}
(assert (= of_178 of_9))
; 
; =  {sc.iadd[18].OUT} {sc.igenebind[8].K}
(assert (= sc_183 sc_100))
; 
; =  {of.iadd[18].OUT} {of.igenebind[8].K}
(assert (= of_183 of_100))
; 
; =  {sc.iadd[2].OUT} {sc.switch[1].Kmod}
(assert (= sc_158 sc_15))
; 
; =  {of.iadd[2].OUT} {of.switch[1].Kmod}
(assert (= of_158 of_15))
; 
; =  {sc.input.I[8].O} {sc.iadd[11].D}
(assert (= sc_25 sc_164))
; 
; =  {of.input.I[8].O} {of.iadd[11].D}
(assert (= of_25 of_164))
; 
; =  {sc.input.I[21].O} {sc.iadd[17].C}
(assert (= sc_49 sc_175))
; 
; =  {of.input.I[21].O} {of.iadd[17].C}
(assert (= of_49 of_175))
; 
; =  {sc.itov[16].Y} {sc.vgain[6].Z}
(assert (= sc_150 sc_2))
; 
; =  {of.itov[16].Y} {of.vgain[6].Z}
(assert (= of_150 of_2))
; 
; =  {sc.input.V[16].O} {sc.vtoi[13].X}
(assert (= sc_132 sc_90))
; 
; =  {of.input.V[16].O} {of.vtoi[13].X}
(assert (= of_132 of_90))
; 
; =  {sc.input.V[5].O} {sc.vadd[7].A}
(assert (= sc_138 sc_79))
; 
; =  {of.input.V[5].O} {of.vadd[7].A}
(assert (= of_138 of_79))
; 
; =  {sc.vtoi[9].Y} {sc.iadd[17].D}
(assert (= sc_95 sc_174))
; 
; =  {of.vtoi[9].Y} {of.iadd[17].D}
(assert (= of_95 of_174))
; 
; =  {sc.input.V[6].O} {sc.vadd[7].C}
(assert (= sc_128 sc_78))
; 
; =  {of.input.V[6].O} {of.vadd[7].C}
(assert (= of_128 of_78))
; 
; =  {sc.input.I[11].O} {sc.iadd[12].D}
(assert (= sc_39 sc_159))
; 
; =  {of.input.I[11].O} {of.iadd[12].D}
(assert (= of_39 of_159))
; 
; =  {sc.vadd[7].OUT2} {sc.output.V[0].X}
(assert (= sc_82 sc_72))
; 
; =  {of.vadd[7].OUT2} {of.output.V[0].X}
(assert (= of_82 of_72))
; 
; =  {sc.vadd[7].OUT2} {sc.vtoi[9].X}
(assert (= sc_82 sc_93))
; 
; =  {of.vadd[7].OUT2} {of.vtoi[9].X}
(assert (= of_82 of_93))
; 
; =  {sc.input.V[17].O} {sc.vgain[14].Y}
(assert (= sc_142 sc_5))
; 
; =  {of.input.V[17].O} {of.vgain[14].Y}
(assert (= of_142 of_5))
; 
; =  {sc.input.I[6].O} {sc.iadd[3].A}
(assert (= sc_45 sc_171))
; 
; =  {of.input.I[6].O} {of.iadd[3].A}
(assert (= of_45 of_171))
; 
; =  {sc.input.I[31].O} {sc.iadd[18].D}
(assert (= sc_33 sc_179))
; 
; =  {of.input.I[31].O} {of.iadd[18].D}
(assert (= of_33 of_179))
; 
; =  {sc.input.V[9].O} {sc.vtoi[9].K}
(assert (= sc_118 sc_94))
; 
; =  {of.input.V[9].O} {of.vtoi[9].K}
(assert (= of_118 of_94))
; 
; =  {sc.vtoi[13].Y} {sc.iadd[12].B}
(assert (= sc_92 sc_162))
; 
; =  {of.vtoi[13].Y} {of.iadd[12].B}
(assert (= of_92 of_162))
; 
; =  {sc.igenebind[8].GE} {sc.itov[16].K}
(assert (= sc_102 sc_149))
; 
; =  {of.igenebind[8].GE} {of.itov[16].K}
(assert (= of_102 of_149))
; 
; =  {sc.input.I[18].O} {sc.igenebind[8].TF}
(assert (= sc_67 sc_99))
; 
; =  {of.input.I[18].O} {of.igenebind[8].TF}
(assert (= of_67 of_99))
; 
; =  {sc.input.I[9].O} {sc.iadd[11].A}
(assert (= sc_35 sc_166))
; 
; =  {of.input.I[9].O} {of.iadd[11].A}
(assert (= of_35 of_166))
; 
; =  {sc.input.I[4].O} {sc.iadd[2].C}
(assert (= sc_57 sc_155))
; 
; =  {of.input.I[4].O} {of.iadd[2].C}
(assert (= of_57 of_155))
; 
; =  {sc.igenebind[10].GE} {sc.itov[4].K}
(assert (= sc_106 sc_152))
; 
; =  {of.igenebind[10].GE} {of.itov[4].K}
(assert (= of_106 of_152))
; 
; =  {sc.input.I[16].O} {sc.switch[1].SUB}
(assert (= sc_51 sc_14))
; 
; =  {of.input.I[16].O} {of.switch[1].SUB}
(assert (= of_51 of_14))
; 
; =  {sc.input.I[3].O} {sc.iadd[2].A}
(assert (= sc_55 sc_156))
; 
; =  {of.input.I[3].O} {of.iadd[2].A}
(assert (= of_55 of_156))
; 
; =  {sc.vgain[6].P} {sc.vadd[7].B}
(assert (= sc_3 sc_80))
; 
; =  {of.vgain[6].P} {of.vadd[7].B}
(assert (= of_3 of_80))
; 
; =  {sc.input.I[5].O} {sc.iadd[3].D}
(assert (= sc_59 sc_169))
; 
; =  {of.input.I[5].O} {of.iadd[3].D}
(assert (= of_59 of_169))
; 
; =  {sc.input.V[8].O} {sc.vadd[5].OUT2_0}
(assert (= sc_110 sc_83))
; 
; =  {of.input.V[8].O} {of.vadd[5].OUT2_0}
(assert (= of_110 of_83))
; 
; =  {sc.input.I[2].O} {sc.iadd[2].D}
(assert (= sc_19 sc_154))
; 
; =  {of.input.I[2].O} {of.iadd[2].D}
(assert (= of_19 of_154))
; 
; =  {sc.input.V[12].O} {sc.switch[1].n}
(assert (= sc_116 sc_13))
; 
; =  {of.input.V[12].O} {of.switch[1].n}
(assert (= of_116 of_13))
; 
; =  {sc.input.I[29].O} {sc.iadd[18].C}
(assert (= sc_23 sc_180))
; 
; =  {of.input.I[29].O} {of.iadd[18].C}
(assert (= of_23 of_180))
; 
; =  {sc.input.I[20].O} {sc.switch[16].Kmod}
(assert (= sc_21 sc_10))
; 
; =  {of.input.I[20].O} {of.switch[16].Kmod}
(assert (= of_21 of_10))
; 
; =  {sc.input.V[3].O} {sc.vadd[5].A}
(assert (= sc_134 sc_86))
; 
; =  {of.input.V[3].O} {of.vadd[5].A}
(assert (= of_134 of_86))
; 
; =  {sc.input.V[2].O} {sc.switch[16].n}
(assert (= sc_108 sc_8))
; 
; =  {of.input.V[2].O} {of.switch[16].n}
(assert (= of_108 of_8))
; 
; =  {sc.input.I[15].O} {sc.iadd[17].A}
(assert (= sc_43 sc_176))
; 
; =  {of.input.I[15].O} {of.iadd[17].A}
(assert (= of_43 of_176))
; 
; =  {sc.input.I[1].O} {sc.igenebind[8].Vmax}
(assert (= sc_61 sc_101))
; 
; =  {of.input.I[1].O} {of.igenebind[8].Vmax}
(assert (= of_61 of_101))
; 
; =  {sc.input.I[13].O} {sc.iadd[12].C}
(assert (= sc_29 sc_160))
; 
; =  {of.input.I[13].O} {of.iadd[12].C}
(assert (= of_29 of_160))
; 
; =  {sc.input.V[1].O} {sc.vgain[14].X}
(assert (= sc_140 sc_4))
; 
; =  {of.input.V[1].O} {of.vgain[14].X}
(assert (= of_140 of_4))
; 
; =  {sc.input.I[17].O} {sc.itov[4].X}
(assert (= sc_63 sc_151))
; 
; =  {of.input.I[17].O} {of.itov[4].X}
(assert (= of_63 of_151))
; 
; =  {sc.input.V[7].O} {sc.vadd[7].OUT2_0}
(assert (= sc_112 sc_76))
; 
; =  {of.input.V[7].O} {of.vadd[7].OUT2_0}
(assert (= of_112 of_76))
; 
; =  {sc.input.V[10].O} {sc.vadd[7].D}
(assert (= sc_124 sc_77))
; 
; =  {of.input.V[10].O} {of.vadd[7].D}
(assert (= of_124 of_77))
; 
; =  {sc.input.V[0].O} {sc.vtoi[0].K}
(assert (= sc_120 sc_97))
; 
; =  {of.input.V[0].O} {of.vtoi[0].K}
(assert (= of_120 of_97))
; 
; =  {sc.input.V[18].O} {sc.itov[15].K}
(assert (= sc_144 sc_146))
; 
; =  {of.input.V[18].O} {of.itov[15].K}
(assert (= of_144 of_146))
; 
; =  {sc.itov[4].Y} {sc.vadd[5].B}
(assert (= sc_153 sc_87))
; 
; =  {of.itov[4].Y} {of.vadd[5].B}
(assert (= of_153 of_87))
; 
; =  {sc.input.I[19].O} {sc.igenebind[10].K}
(assert (= sc_69 sc_104))
; 
; =  {of.input.I[19].O} {of.igenebind[10].K}
(assert (= of_69 of_104))
; 
; =  {sc.input.V[4].O} {sc.vadd[5].C}
(assert (= sc_136 sc_85))
; 
; =  {of.input.V[4].O} {of.vadd[5].C}
(assert (= of_136 of_85))
(assert (<= (* sc_73 0.001) 0.001))
(assert (<= (* sc_75 0.001) 0.001))
; 
; =  {sc.vadd[7].OUT2} {sc.output.V[0].O} {sc.vadd[5].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_82 sc_73) (= sc_82 sc_89)) (= sc_82 sc_75)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_92 0.) slbot_92 (- slbot_92)) (ite (>= sltop_172 0.) sltop_172 (- sltop_172))) (ite (>= sltop_158 0.) sltop_158 (- sltop_158))) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= sltop_87 0.) sltop_87 (- sltop_87))) (ite (>= sltop_183 0.) sltop_183 (- sltop_183))) (ite (>= slbot_16 0.) slbot_16 (- slbot_16))) (ite (>= slbot_72 0.) slbot_72 (- slbot_72))) (ite (>= sltop_91 0.) sltop_91 (- sltop_91))) (ite (>= slbot_183 0.) slbot_183 (- slbot_183))) (ite (>= sltop_149 0.) sltop_149 (- sltop_149))) (ite (>= slbot_103 0.) slbot_103 (- slbot_103))) (ite (>= sltop_120 0.) sltop_120 (- sltop_120))) (ite (>= slbot_157 0.) slbot_157 (- slbot_157))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_119 0.) slbot_119 (- slbot_119))) (ite (>= slbot_120 0.) slbot_120 (- slbot_120))) (ite (>= slbot_150 0.) slbot_150 (- slbot_150))) (ite (>= sltop_150 0.) sltop_150 (- sltop_150))) (ite (>= sltop_82 0.) sltop_82 (- sltop_82))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= slbot_95 0.) slbot_95 (- slbot_95))) (ite (>= sltop_100 0.) sltop_100 (- sltop_100))) (ite (>= sltop_152 0.) sltop_152 (- sltop_152))) (ite (>= sltop_157 0.) sltop_157 (- sltop_157))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= sltop_74 0.) sltop_74 (- sltop_74))) (ite (>= slbot_81 0.) slbot_81 (- slbot_81))) (ite (>= slbot_91 0.) slbot_91 (- slbot_91))) (ite (>= slbot_98 0.) slbot_98 (- slbot_98))) (ite (>= slbot_174 0.) slbot_174 (- slbot_174))) (ite (>= slbot_162 0.) slbot_162 (- slbot_162))) (ite (>= slbot_87 0.) slbot_87 (- slbot_87))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= slbot_158 0.) slbot_158 (- slbot_158))) (ite (>= sltop_153 0.) sltop_153 (- sltop_153))) (ite (>= sltop_181 0.) sltop_181 (- sltop_181))) (ite (>= sltop_75 0.) sltop_75 (- sltop_75))) (ite (>= slbot_152 0.) slbot_152 (- slbot_152))) (ite (>= sltop_17 0.) sltop_17 (- sltop_17))) (ite (>= slbot_75 0.) slbot_75 (- slbot_75))) (ite (>= sltop_162 0.) sltop_162 (- sltop_162))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_163 0.) sltop_163 (- sltop_163))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= sltop_119 0.) sltop_119 (- sltop_119))) (ite (>= slbot_153 0.) slbot_153 (- slbot_153))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= slbot_89 0.) slbot_89 (- slbot_89))) (ite (>= sltop_72 0.) sltop_72 (- sltop_72))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= slbot_163 0.) slbot_163 (- slbot_163))) (ite (>= slbot_168 0.) slbot_168 (- slbot_168))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= sltop_81 0.) sltop_81 (- sltop_81))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= sltop_168 0.) sltop_168 (- sltop_168))) (ite (>= sltop_173 0.) sltop_173 (- sltop_173))) (ite (>= sltop_178 0.) sltop_178 (- sltop_178))) (ite (>= sltop_147 0.) sltop_147 (- sltop_147))) (ite (>= slbot_172 0.) slbot_172 (- slbot_172))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= slbot_17 0.) slbot_17 (- slbot_17))) (ite (>= sltop_89 0.) sltop_89 (- sltop_89))) (ite (>= sltop_92 0.) sltop_92 (- sltop_92))) (ite (>= sltop_174 0.) sltop_174 (- sltop_174))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_178 0.) slbot_178 (- slbot_178))) (ite (>= slbot_82 0.) slbot_82 (- slbot_82))) (ite (>= slbot_106 0.) slbot_106 (- slbot_106))) (ite (>= slbot_173 0.) slbot_173 (- slbot_173))) (ite (>= sltop_103 0.) sltop_103 (- sltop_103))) (ite (>= sltop_167 0.) sltop_167 (- sltop_167))) (ite (>= sltop_98 0.) sltop_98 (- sltop_98))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= sltop_16 0.) sltop_16 (- sltop_16))) (ite (>= sltop_102 0.) sltop_102 (- sltop_102))) (ite (>= sltop_95 0.) sltop_95 (- sltop_95))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= slbot_167 0.) slbot_167 (- slbot_167))) (ite (>= slbot_73 0.) slbot_73 (- slbot_73))) (ite (>= sltop_97 0.) sltop_97 (- sltop_97))) (ite (>= sltop_145 0.) sltop_145 (- sltop_145))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= slbot_100 0.) slbot_100 (- slbot_100))) (ite (>= slbot_147 0.) slbot_147 (- slbot_147))) (ite (>= slbot_145 0.) slbot_145 (- slbot_145))) (ite (>= slbot_74 0.) slbot_74 (- slbot_74))) (ite (>= sltop_73 0.) sltop_73 (- sltop_73))) (ite (>= sltop_106 0.) sltop_106 (- sltop_106))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= slbot_181 0.) slbot_181 (- slbot_181))) (ite (>= slbot_97 0.) slbot_97 (- slbot_97))) (ite (>= slbot_102 0.) slbot_102 (- slbot_102))) (ite (>= slbot_149 0.) slbot_149 (- slbot_149)))))
(check-sat)
