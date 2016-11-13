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
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_6 sc_5))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_6 of_5))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_5 0.) of_5) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_5 0.) of_5) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_6 0.) of_6) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_6 0.) of_6) 0.))
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
; >=  {((sc.input.I[8].X*15.6)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_7 15.6) of_7) 10.))
; 
; <=  {((sc.input.I[8].X*15.6)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_7 15.6) of_7) 0.))
; 
; >=  {((sc.input.I[8].O*15.6)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_8 15.6) of_8) 10.))
; 
; <=  {((sc.input.I[8].O*15.6)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_8 15.6) of_8) 0.))
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
; >=  {((sc.input.I[7].X*337.632520764)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_9 337.632520764) of_9) 10.))
; 
; <=  {((sc.input.I[7].X*337.632520764)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_9 337.632520764) of_9) 0.))
; 
; >=  {((sc.input.I[7].O*337.632520764)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_10 337.632520764) of_10) 10.))
; 
; <=  {((sc.input.I[7].O*337.632520764)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_10 337.632520764) of_10) 0.))
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
; >=  {((sc.input.I[9].X*4.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_11 4.) of_11) 10.))
; 
; <=  {((sc.input.I[9].X*4.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_11 4.) of_11) 0.))
; 
; >=  {((sc.input.I[9].O*4.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_12 4.) of_12) 10.))
; 
; <=  {((sc.input.I[9].O*4.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_12 4.) of_12) 0.))
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
; 
; >=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_13 156.25) of_13) 10.))
; 
; <=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_13 156.25) of_13) 0.))
; 
; >=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_14 156.25) of_14) 10.))
; 
; <=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_14 156.25) of_14) 0.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[11].X*1.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_15 1.) of_15) 10.))
; 
; <=  {((sc.input.I[11].X*1.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_15 1.) of_15) 0.))
; 
; >=  {((sc.input.I[11].O*1.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_16 1.) of_16) 10.))
; 
; <=  {((sc.input.I[11].O*1.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_16 1.) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[10].X*4.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_17 4.) of_17) 10.))
; 
; <=  {((sc.input.I[10].X*4.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_17 4.) of_17) 0.))
; 
; >=  {((sc.input.I[10].O*4.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_18 4.) of_18) 10.))
; 
; <=  {((sc.input.I[10].O*4.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_18 4.) of_18) 0.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
; 
; >=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_22 sc_21))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_22 of_21))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_21 0.) of_21) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_22 0.) of_22) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_24 sc_23))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_24 of_23))
; 
; >=  {((sc.input.I[16].X*0.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_23 0.) of_23) 10.))
; 
; <=  {((sc.input.I[16].X*0.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
; 
; >=  {((sc.input.I[16].O*0.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_24 0.) of_24) 10.))
; 
; <=  {((sc.input.I[16].O*0.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_26 sc_25))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_26 of_25))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_25 0.) of_25) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_26 0.) of_26) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_28 sc_27))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_28 of_27))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_30 sc_29))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_30 of_29))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_29 0.) of_29) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_30 0.) of_30) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_32 of_31))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_31 0.) of_31) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_32 0.) of_32) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.I[17].X*0.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_33 0.) of_33) 10.))
; 
; <=  {((sc.input.I[17].X*0.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.input.I[17].O*0.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[17].O*0.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_36 sc_35))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_36 of_35))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_35 156.25) of_35) sltop_35) 3300.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_36 156.25) of_36) sltop_36) 3300.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_38 sc_37))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_38 of_37))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_37 15.6) of_37) sltop_37) 3300.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_38 15.6) of_38) sltop_38) 3300.))
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
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_40 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_42 (* 1. sc_43)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D)}
(assert (and (= sc_42 (* 1. sc_41)) (= sc_42 (* 1. sc_40))))
; no offset
(assert (= (- (+ of_42 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1.)}
(assert (= sc_44 (* sc_42 1.)))
; 
; =  {of.vadd[2].OUT} {0.}
(assert (= of_44 0.))
; no scale
(assert (= sc_40 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_40 0.))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_42 (* 1. sc_43)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D*sc.vadd[2].OUT2)}
(assert (and (= sc_42 (* 1. sc_41)) (= sc_42 (* (* 1. sc_40) sc_45))))
; no offset
(assert (= (- (+ of_42 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1.)}
(assert (= sc_45 (* sc_42 1.)))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1.)}
(assert (= sc_39 (* sc_42 1.)))
; 
; =  {of.vadd[2].OUT2_0} {0.}
(assert (= of_39 0.))
; 
; >=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {3300.}
(assert (<= (+ (* sc_39 0.) of_39) 3300.))
; 
; <=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
; 
; >=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {3300.}
(assert (<= (+ (* sc_40 4.) of_40) 3300.))
; 
; <=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {0.}
(assert (>= (+ (* sc_40 4.) of_40) 0.))
; 
; >=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {3300.}
(assert (<= (+ (* sc_41 0.) of_41) 3300.))
; 
; <=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
; 
; >=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {3300.}
(assert (<= (+ (* sc_42 0.) of_42) 3300.))
; 
; <=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_45 156.25) of_45) sltop_45) 3300.))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vadd[2].B*3.75903614458)+of.vadd[2].B)+sl.min.vadd[2].B)} {0.}
(assert (= (+ (+ (* sc_43 3.75903614458) of_43) slbot_43) 0.))
; 
; =  {(((sc.vadd[2].B*62.4)+of.vadd[2].B)+sl.max.vadd[2].B)} {3300.}
(assert (= (+ (+ (* sc_43 62.4) of_43) sltop_43) 3300.))
(declare-fun slbot_44 () Real)
(declare-fun sltop_44 () Real)
; 
; =  {(((sc.vadd[2].OUT*3.75903614458)+of.vadd[2].OUT)+sl.min.vadd[2].OUT)} {-1650.}
(assert (= (+ (+ (* sc_44 3.75903614458) of_44) slbot_44) -1650.))
; 
; =  {(((sc.vadd[2].OUT*62.4)+of.vadd[2].OUT)+sl.max.vadd[2].OUT)} {1650.}
(assert (= (+ (+ (* sc_44 62.4) of_44) sltop_44) 1650.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_45 156.25) of_45) sltop_45) 3300.))
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
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_48 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_50 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_49 (* 1. sc_50)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_49 (* 1. sc_48)) (= sc_49 (* 1. sc_47))))
; no offset
(assert (= (- (+ of_49 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_51 (* sc_49 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
(assert (= of_51 0.))
; no scale
(assert (= sc_47 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= of_52 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_48 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_50 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_49 (* 1. sc_50)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_49 (* 1. sc_48)) (= sc_49 (* (* 1. sc_47) sc_52))))
; no offset
(assert (= (- (+ of_49 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_52 (* sc_49 1.)))
; no offset
(assert (= of_52 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_46 (* sc_49 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_46 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_46 0.) of_46) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
; 
; >=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {3300.}
(assert (<= (+ (* sc_47 4.) of_47) 3300.))
; 
; <=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {0.}
(assert (>= (+ (* sc_47 4.) of_47) 0.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_48 0.) of_48) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_49 0.) of_49) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_52 15.6) of_52) sltop_52) 3300.))
(declare-fun slbot_50 () Real)
(declare-fun sltop_50 () Real)
; 
; =  {(((sc.vadd[5].B*0.00204799328914)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_50 0.00204799328914) of_50) slbot_50) 0.))
; 
; =  {(((sc.vadd[5].B*625.)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_50 625.) of_50) sltop_50) 3300.))
(declare-fun slbot_51 () Real)
(declare-fun sltop_51 () Real)
; 
; =  {(((sc.vadd[5].OUT*0.00204799328914)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_51 0.00204799328914) of_51) slbot_51) -1650.))
; 
; =  {(((sc.vadd[5].OUT*625.)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_51 625.) of_51) sltop_51) 1650.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
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
; no offset
(assert (= of_54 0.))
; no offset
(assert (= of_55 0.))
; no scale
(assert (= (/ sc_54 sc_55) 1.))
; no scale
(assert (= sc_53 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_53 0.))
; no offset
(assert (= of_54 0.))
; no offset
(assert (= of_55 0.))
; no scale
(assert (= (/ sc_54 sc_55) 1.))
; no scale
(assert (= sc_53 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_53 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_56 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_57 (* sc_56 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_57 0.))
; no scale
(assert (= sc_55 1.))
; no scale
(assert (= (* sc_53 1.) 1.))
; no offset
(assert (= of_55 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_55 1.))
; no scale
(assert (= (* sc_53 1.) 1.))
; no offset
(assert (= of_55 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_54 1.))
; no scale
(assert (= sc_53 1.))
; no offset
(assert (= of_54 0.))
; no offset
(assert (= of_53 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_56 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_58 (* sc_56 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_58 0.))
; 
; >=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_53 2.5) of_53) 5.))
; 
; <=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_53 2.5) of_53) 1.))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_54 0.) of_54) slbot_54) 1.))
; 
; =  {(((sc.ihill[0].S*156.25)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_54 156.25) of_54) sltop_54) 10.))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.ihill[0].REP*0.000511998322284)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {9.999900001e-10}
(assert (= (+ (+ (* sc_58 0.000511998322284) of_58) slbot_58) 9.999900001e-10))
; 
; =  {(((sc.ihill[0].REP*156.25)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {5.}
(assert (= (+ (+ (* sc_58 156.25) of_58) sltop_58) 5.))
; 
; >=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_56 156.25) of_56) 10.))
; 
; <=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_56 156.25) of_56) 0.0001))
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_60 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_59 0.))
; 
; =  {sc.vtoi[7].Y} {((1./sc.vtoi[7].K)*sc.vtoi[7].X)}
(assert (= sc_61 (* (/ 1. sc_60) sc_59)))
; 
; =  {of.vtoi[7].Y} {0.}
(assert (= of_61 0.))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.vtoi[7].X*0.)+of.vtoi[7].X)+sl.min.vtoi[7].X)} {1.}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59) 1.))
; 
; =  {(((sc.vtoi[7].X*156.25)+of.vtoi[7].X)+sl.max.vtoi[7].X)} {3300.}
(assert (= (+ (+ (* sc_59 156.25) of_59) sltop_59) 3300.))
; 
; >=  {((sc.vtoi[7].K*1.)+of.vtoi[7].K)} {3300.}
(assert (<= (+ (* sc_60 1.) of_60) 3300.))
; 
; <=  {((sc.vtoi[7].K*1.)+of.vtoi[7].K)} {1.}
(assert (>= (+ (* sc_60 1.) of_60) 1.))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.vtoi[7].Y*0.)+of.vtoi[7].Y)+sl.min.vtoi[7].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_61 0.) of_61) slbot_61) 0.00030303030303))
; 
; =  {(((sc.vtoi[7].Y*156.25)+of.vtoi[7].Y)+sl.max.vtoi[7].Y)} {3300.}
(assert (= (+ (+ (* sc_61 156.25) of_61) sltop_61) 3300.))
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
(assert (= of_63 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; 
; =  {sc.vtoi[6].Y} {((1./sc.vtoi[6].K)*sc.vtoi[6].X)}
(assert (= sc_64 (* (/ 1. sc_63) sc_62)))
; 
; =  {of.vtoi[6].Y} {0.}
(assert (= of_64 0.))
; 
; >=  {((sc.vtoi[6].X*1.)+of.vtoi[6].X)} {3300.}
(assert (<= (+ (* sc_62 1.) of_62) 3300.))
; 
; <=  {((sc.vtoi[6].X*1.)+of.vtoi[6].X)} {1.}
(assert (>= (+ (* sc_62 1.) of_62) 1.))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.vtoi[6].Y*0.)+of.vtoi[6].Y)+sl.min.vtoi[6].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_64 0.) of_64) slbot_64) 0.00030303030303))
; 
; =  {(((sc.vtoi[6].Y*1.66666666667)+of.vtoi[6].Y)+sl.max.vtoi[6].Y)} {3300.}
(assert (= (+ (+ (* sc_64 1.66666666667) of_64) sltop_64) 3300.))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.vtoi[6].K*0.)+of.vtoi[6].K)+sl.min.vtoi[6].K)} {1.}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63) 1.))
; 
; =  {(((sc.vtoi[6].K*0.6)+of.vtoi[6].K)+sl.max.vtoi[6].K)} {3300.}
(assert (= (+ (+ (* sc_63 0.6) of_63) sltop_63) 3300.))
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
(assert (= of_66 0.))
; no offset
(assert (= of_65 0.))
; 
; =  {1.} {(sc.igenebind[3].K*sc.igenebind[3].TF)}
(assert (= 1. (* sc_66 sc_65)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_67 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[3].GE} {(sc.igenebind[3].Vmax*(1./1.))}
(assert (= sc_68 (* sc_67 (/ 1. 1.))))
; 
; =  {of.igenebind[3].GE} {0.}
(assert (= of_68 0.))
; 
; >=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {10.}
(assert (<= (+ (* sc_65 1.) of_65) 10.))
; 
; <=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {0.0001}
(assert (>= (+ (* sc_65 1.) of_65) 0.0001))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.igenebind[3].K*0.)+of.igenebind[3].K)+sl.min.igenebind[3].K)} {0.0001}
(assert (= (+ (+ (* sc_66 0.) of_66) slbot_66) 0.0001))
; 
; =  {(((sc.igenebind[3].K*15.6)+of.igenebind[3].K)+sl.max.igenebind[3].K)} {10.}
(assert (= (+ (+ (* sc_66 15.6) of_66) sltop_66) 10.))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.igenebind[3].GE*0.939759036145)+of.igenebind[3].GE)+sl.min.igenebind[3].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_68 0.939759036145) of_68) slbot_68) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[3].GE*15.6)+of.igenebind[3].GE)+sl.max.igenebind[3].GE)} {9.9999999}
(assert (= (+ (+ (* sc_68 15.6) of_68) sltop_68) 9.9999999))
; 
; >=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {10.}
(assert (<= (+ (* sc_67 15.6) of_67) 10.))
; 
; <=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {0.0001}
(assert (>= (+ (* sc_67 15.6) of_67) 0.0001))
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_70 of_69))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_69 0.) of_69) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_70 0.) of_70) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_71 4.) of_71) 3300.))
; 
; <=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_71 4.) of_71) 0.))
; 
; >=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_72 4.) of_72) 3300.))
; 
; <=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_72 4.) of_72) 0.))
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_73 0.) of_73) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_74 0.) of_74) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_75 1.) of_75) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_75 1.) of_75) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_76 1.) of_76) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_76 1.) of_76) 0.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_77 4.) of_77) 3300.))
; 
; <=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_77 4.) of_77) 0.))
; 
; >=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_78 4.) of_78) 3300.))
; 
; <=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_78 4.) of_78) 0.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_80 sc_79))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_80 of_79))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_79 0.6) of_79) sltop_79) 3300.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_80 0.6) of_80) sltop_80) 3300.))
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_82 sc_81))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_82 of_81))
; 
; >=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_81 1.) of_81) 3300.))
; 
; <=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_81 1.) of_81) 0.))
; 
; >=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_82 1.) of_82) 3300.))
; 
; <=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_82 1.) of_82) 0.))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_84 sc_83))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_84 of_83))
; 
; >=  {((sc.input.V[10].X*1000.75)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_83 1000.75) of_83) 3300.))
; 
; <=  {((sc.input.V[10].X*1000.75)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_83 1000.75) of_83) 0.))
; 
; >=  {((sc.input.V[10].O*1000.75)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_84 1000.75) of_84) 3300.))
; 
; <=  {((sc.input.V[10].O*1000.75)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_84 1000.75) of_84) 0.))
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_86 sc_85))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_86 of_85))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_85 0.) of_85) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_85 0.) of_85) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_86 0.) of_86) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_86 0.) of_86) 0.))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_88 sc_87))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_88 of_87))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_87 0.) of_87) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_87 0.) of_87) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_88 0.) of_88) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_88 0.) of_88) 0.))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_90 sc_89))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_90 of_89))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_89 0.) of_89) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_89 0.) of_89) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_90 0.) of_90) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_90 0.) of_90) 0.))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_92 sc_91))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_92 of_91))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_91 0.) of_91) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_92 0.) of_92) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_92 0.) of_92) 0.))
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_94 sc_93))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_94 of_93))
; 
; >=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_93 2.5) of_93) 3300.))
; 
; <=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_93 2.5) of_93) 0.))
; 
; >=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_94 2.5) of_94) 3300.))
; 
; <=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_94 2.5) of_94) 0.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
; no offset
(assert (= of_96 0.))
; no offset
(assert (= of_95 0.))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_97 (* sc_96 sc_95)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_97 0.))
; 
; >=  {((sc.itov[4].X*4.)+of.itov[4].X)} {10.}
(assert (<= (+ (* sc_95 4.) of_95) 10.))
; 
; <=  {((sc.itov[4].X*4.)+of.itov[4].X)} {0.0001}
(assert (>= (+ (* sc_95 4.) of_95) 0.0001))
(declare-fun slbot_97 () Real)
(declare-fun sltop_97 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_97 0.00204799328914) of_97) slbot_97) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_97 625.) of_97) sltop_97) 3300.))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.itov[4].K*0.000511998322284)+of.itov[4].K)+sl.min.itov[4].K)} {1.}
(assert (= (+ (+ (* sc_96 0.000511998322284) of_96) slbot_96) 1.))
; 
; =  {(((sc.itov[4].K*156.25)+of.itov[4].K)+sl.max.itov[4].K)} {330.}
(assert (= (+ (+ (* sc_96 156.25) of_96) sltop_96) 330.))
(declare-fun slbot_97 () Real)
(declare-fun sltop_97 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_97 0.00204799328914) of_97) slbot_97) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_97 625.) of_97) sltop_97) 3300.))
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
; no offset
(assert (= of_99 0.))
; no offset
(assert (= of_98 0.))
; 
; =  {sc.itov[1].Y} {(sc.itov[1].K*sc.itov[1].X)}
(assert (= sc_100 (* sc_99 sc_98)))
; 
; =  {of.itov[1].Y} {0.}
(assert (= of_100 0.))
; 
; >=  {((sc.itov[1].X*4.)+of.itov[1].X)} {10.}
(assert (<= (+ (* sc_98 4.) of_98) 10.))
; 
; <=  {((sc.itov[1].X*4.)+of.itov[1].X)} {0.0001}
(assert (>= (+ (* sc_98 4.) of_98) 0.0001))
(declare-fun slbot_100 () Real)
(declare-fun sltop_100 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_100 3.75903614458) of_100) slbot_100) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_100 62.4) of_100) sltop_100) 3300.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.itov[1].K*0.939759036145)+of.itov[1].K)+sl.min.itov[1].K)} {1.}
(assert (= (+ (+ (* sc_99 0.939759036145) of_99) slbot_99) 1.))
; 
; =  {(((sc.itov[1].K*15.6)+of.itov[1].K)+sl.max.itov[1].K)} {330.}
(assert (= (+ (+ (* sc_99 15.6) of_99) sltop_99) 330.))
(declare-fun slbot_100 () Real)
(declare-fun sltop_100 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_100 3.75903614458) of_100) slbot_100) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_100 62.4) of_100) sltop_100) 3300.))
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
; 
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_103 sc_104))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_103 sc_102) (= sc_103 sc_101)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_105 sc_103))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_105 (- (+ of_103 of_104) (+ of_102 of_101))))
; 
; >=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {5.}
(assert (<= (+ (* sc_101 0.) of_101) 5.))
; 
; <=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {0.}
(assert (>= (+ (* sc_101 0.) of_101) 0.))
; 
; >=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {5.}
(assert (<= (+ (* sc_102 0.) of_102) 5.))
; 
; <=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {0.}
(assert (>= (+ (* sc_102 0.) of_102) 0.))
(declare-fun slbot_105 () Real)
(declare-fun sltop_105 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_105 0.) of_105) slbot_105) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_105 1.66666666667) of_105) sltop_105) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_103 0.) of_103) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_103 0.) of_103) 0.))
(declare-fun slbot_104 () Real)
(declare-fun sltop_104 () Real)
; 
; =  {(((sc.iadd[8].B*0.)+of.iadd[8].B)+sl.min.iadd[8].B)} {0.}
(assert (= (+ (+ (* sc_104 0.) of_104) slbot_104) 0.))
; 
; =  {(((sc.iadd[8].B*1.66666666667)+of.iadd[8].B)+sl.max.iadd[8].B)} {5.}
(assert (= (+ (+ (* sc_104 1.66666666667) of_104) sltop_104) 5.))
(declare-fun slbot_105 () Real)
(declare-fun sltop_105 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_105 0.) of_105) slbot_105) -10.))
; 
; =  {(((sc.iadd[8].OUT*1.66666666667)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_105 1.66666666667) of_105) sltop_105) 10.))
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
; 
; =  {sc.iadd[9].A} {sc.iadd[9].B}
(assert (= sc_108 sc_109))
; 
; =  {sc.iadd[9].A} {sc.iadd[9].C} {sc.iadd[9].D}
(assert (and (= sc_108 sc_107) (= sc_108 sc_106)))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[9].A}
(assert (= sc_110 sc_108))
; 
; =  {of.iadd[9].OUT} {((of.iadd[9].A+of.iadd[9].B)-of.iadd[9].C-of.iadd[9].D)}
(assert (= of_110 (- (+ of_108 of_109) (+ of_107 of_106))))
; 
; >=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {5.}
(assert (<= (+ (* sc_106 0.) of_106) 5.))
; 
; <=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {0.}
(assert (>= (+ (* sc_106 0.) of_106) 0.))
; 
; >=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {5.}
(assert (<= (+ (* sc_107 0.) of_107) 5.))
; 
; <=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {0.}
(assert (>= (+ (* sc_107 0.) of_107) 0.))
(declare-fun slbot_110 () Real)
(declare-fun sltop_110 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_110 0.) of_110) slbot_110) -10.))
; 
; =  {(((sc.iadd[9].OUT*1.66666666667)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_110 1.66666666667) of_110) sltop_110) 10.))
; 
; >=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {5.}
(assert (<= (+ (* sc_108 0.) of_108) 5.))
; 
; <=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {0.}
(assert (>= (+ (* sc_108 0.) of_108) 0.))
(declare-fun slbot_109 () Real)
(declare-fun sltop_109 () Real)
; 
; =  {(((sc.iadd[9].B*0.)+of.iadd[9].B)+sl.min.iadd[9].B)} {0.}
(assert (= (+ (+ (* sc_109 0.) of_109) slbot_109) 0.))
; 
; =  {(((sc.iadd[9].B*1.66666666667)+of.iadd[9].B)+sl.max.iadd[9].B)} {5.}
(assert (= (+ (+ (* sc_109 1.66666666667) of_109) sltop_109) 5.))
(declare-fun slbot_110 () Real)
(declare-fun sltop_110 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_110 0.) of_110) slbot_110) -10.))
; 
; =  {(((sc.iadd[9].OUT*1.66666666667)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_110 1.66666666667) of_110) sltop_110) 10.))
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
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
; 
; =  {sc.iadd[10].A} {sc.iadd[10].B}
(assert (= sc_113 sc_114))
; 
; =  {sc.iadd[10].A} {sc.iadd[10].C} {sc.iadd[10].D}
(assert (and (= sc_113 sc_112) (= sc_113 sc_111)))
; 
; =  {sc.iadd[10].OUT} {sc.iadd[10].A}
(assert (= sc_115 sc_113))
; 
; =  {of.iadd[10].OUT} {((of.iadd[10].A+of.iadd[10].B)-of.iadd[10].C-of.iadd[10].D)}
(assert (= of_115 (- (+ of_113 of_114) (+ of_112 of_111))))
; 
; >=  {((sc.iadd[10].D*0.)+of.iadd[10].D)} {5.}
(assert (<= (+ (* sc_111 0.) of_111) 5.))
; 
; <=  {((sc.iadd[10].D*0.)+of.iadd[10].D)} {0.}
(assert (>= (+ (* sc_111 0.) of_111) 0.))
; 
; >=  {((sc.iadd[10].C*0.)+of.iadd[10].C)} {5.}
(assert (<= (+ (* sc_112 0.) of_112) 5.))
; 
; <=  {((sc.iadd[10].C*0.)+of.iadd[10].C)} {0.}
(assert (>= (+ (* sc_112 0.) of_112) 0.))
; 
; >=  {((sc.iadd[10].A*0.)+of.iadd[10].A)} {5.}
(assert (<= (+ (* sc_113 0.) of_113) 5.))
; 
; <=  {((sc.iadd[10].A*0.)+of.iadd[10].A)} {0.}
(assert (>= (+ (* sc_113 0.) of_113) 0.))
(declare-fun slbot_114 () Real)
(declare-fun sltop_114 () Real)
; 
; =  {(((sc.iadd[10].B*0.)+of.iadd[10].B)+sl.min.iadd[10].B)} {0.}
(assert (= (+ (+ (* sc_114 0.) of_114) slbot_114) 0.))
; 
; =  {(((sc.iadd[10].B*15.6)+of.iadd[10].B)+sl.max.iadd[10].B)} {5.}
(assert (= (+ (+ (* sc_114 15.6) of_114) sltop_114) 5.))
(declare-fun slbot_115 () Real)
(declare-fun sltop_115 () Real)
; 
; =  {(((sc.iadd[10].OUT*0.)+of.iadd[10].OUT)+sl.min.iadd[10].OUT)} {-10.}
(assert (= (+ (+ (* sc_115 0.) of_115) slbot_115) -10.))
; 
; =  {(((sc.iadd[10].OUT*15.6)+of.iadd[10].OUT)+sl.max.iadd[10].OUT)} {10.}
(assert (= (+ (+ (* sc_115 15.6) of_115) sltop_115) 10.))
; 
; =  {sc.input.I[6].O} {sc.iadd[9].A}
(assert (= sc_22 sc_108))
; 
; =  {of.input.I[6].O} {of.iadd[9].A}
(assert (= of_22 of_108))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].X}
(assert (= sc_45 sc_35))
; 
; =  {of.vadd[2].OUT2} {of.output.V[0].X}
(assert (= of_45 of_35))
; 
; =  {sc.vadd[2].OUT2} {sc.vtoi[7].X}
(assert (= sc_45 sc_59))
; 
; =  {of.vadd[2].OUT2} {of.vtoi[7].X}
(assert (= of_45 of_59))
; 
; =  {sc.input.I[0].O} {sc.ihill[0].Vmax}
(assert (= sc_14 sc_56))
; 
; =  {of.input.I[0].O} {of.ihill[0].Vmax}
(assert (= of_14 of_56))
; 
; =  {sc.switch[7].PROD} {sc.iadd[10].B}
(assert (= sc_4 sc_114))
; 
; =  {of.switch[7].PROD} {of.iadd[10].B}
(assert (= of_4 of_114))
; 
; =  {sc.input.V[9].O} {sc.vadd[5].D}
(assert (= sc_78 sc_47))
; 
; =  {of.input.V[9].O} {of.vadd[5].D}
(assert (= of_78 of_47))
; 
; =  {sc.ihill[0].REP} {sc.itov[4].K}
(assert (= sc_58 sc_96))
; 
; =  {of.ihill[0].REP} {of.itov[4].K}
(assert (= of_58 of_96))
; 
; =  {sc.itov[1].Y} {sc.vadd[2].B}
(assert (= sc_100 sc_43))
; 
; =  {of.itov[1].Y} {of.vadd[2].B}
(assert (= of_100 of_43))
; 
; =  {sc.input.I[9].O} {sc.itov[1].X}
(assert (= sc_12 sc_98))
; 
; =  {of.input.I[9].O} {of.itov[1].X}
(assert (= of_12 of_98))
; 
; =  {sc.input.I[16].O} {sc.iadd[10].D}
(assert (= sc_24 sc_111))
; 
; =  {of.input.I[16].O} {of.iadd[10].D}
(assert (= of_24 of_111))
; 
; =  {sc.input.V[13].O} {sc.vtoi[7].K}
(assert (= sc_76 sc_60))
; 
; =  {of.input.V[13].O} {of.vtoi[7].K}
(assert (= of_76 of_60))
; 
; =  {sc.vtoi[7].Y} {sc.ihill[0].S}
(assert (= sc_61 sc_54))
; 
; =  {of.vtoi[7].Y} {of.ihill[0].S}
(assert (= of_61 of_54))
; 
; =  {sc.input.I[3].O} {sc.iadd[8].C}
(assert (= sc_26 sc_102))
; 
; =  {of.input.I[3].O} {of.iadd[8].C}
(assert (= of_26 of_102))
; 
; =  {sc.input.I[4].O} {sc.iadd[9].D}
(assert (= sc_28 sc_106))
; 
; =  {of.input.I[4].O} {of.iadd[9].D}
(assert (= of_28 of_106))
; 
; =  {sc.input.I[5].O} {sc.iadd[9].C}
(assert (= sc_30 sc_107))
; 
; =  {of.input.I[5].O} {of.iadd[9].C}
(assert (= of_30 of_107))
; 
; =  {sc.vtoi[6].Y} {sc.iadd[9].B}
(assert (= sc_64 sc_109))
; 
; =  {of.vtoi[6].Y} {of.iadd[9].B}
(assert (= of_64 of_109))
; 
; =  {sc.input.V[11].O} {sc.vtoi[6].X}
(assert (= sc_82 sc_62))
; 
; =  {of.input.V[11].O} {of.vtoi[6].X}
(assert (= of_82 of_62))
; 
; =  {sc.input.I[2].O} {sc.iadd[8].A}
(assert (= sc_6 sc_103))
; 
; =  {of.input.I[2].O} {of.iadd[8].A}
(assert (= of_6 of_103))
; 
; =  {sc.input.V[8].O} {sc.vadd[2].D}
(assert (= sc_72 sc_40))
; 
; =  {of.input.V[8].O} {of.vadd[2].D}
(assert (= of_72 of_40))
; 
; =  {sc.input.V[2].O} {sc.vadd[2].A}
(assert (= sc_70 sc_42))
; 
; =  {of.input.V[2].O} {of.vadd[2].A}
(assert (= of_70 of_42))
; 
; =  {sc.input.V[3].O} {sc.vadd[2].C}
(assert (= sc_88 sc_41))
; 
; =  {of.input.V[3].O} {of.vadd[2].C}
(assert (= of_88 of_41))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[1].X}
(assert (= sc_52 sc_37))
; 
; =  {of.vadd[5].OUT2} {of.output.V[1].X}
(assert (= of_52 of_37))
; 
; =  {sc.vadd[5].OUT2} {sc.switch[7].Vmax}
(assert (= sc_52 sc_3))
; 
; =  {of.vadd[5].OUT2} {of.switch[7].Vmax}
(assert (= of_52 of_3))
; 
; =  {sc.input.I[15].O} {sc.iadd[10].C}
(assert (= sc_20 sc_112))
; 
; =  {of.input.I[15].O} {of.iadd[10].C}
(assert (= of_20 of_112))
; 
; =  {sc.input.I[1].O} {sc.iadd[8].D}
(assert (= sc_32 sc_101))
; 
; =  {of.input.I[1].O} {of.iadd[8].D}
(assert (= of_32 of_101))
; 
; =  {sc.input.I[10].O} {sc.itov[4].X}
(assert (= sc_18 sc_95))
; 
; =  {of.input.I[10].O} {of.itov[4].X}
(assert (= of_18 of_95))
; 
; =  {sc.iadd[10].OUT} {sc.igenebind[3].K}
(assert (= sc_115 sc_66))
; 
; =  {of.iadd[10].OUT} {of.igenebind[3].K}
(assert (= of_115 of_66))
; 
; =  {sc.input.V[1].O} {sc.ihill[0].n}
(assert (= sc_94 sc_53))
; 
; =  {of.input.V[1].O} {of.ihill[0].n}
(assert (= of_94 of_53))
; 
; =  {sc.input.I[7].O} {sc.switch[7].SUB}
(assert (= sc_10 sc_1))
; 
; =  {of.input.I[7].O} {of.switch[7].SUB}
(assert (= of_10 of_1))
; 
; =  {sc.input.I[17].O} {sc.iadd[10].A}
(assert (= sc_34 sc_113))
; 
; =  {of.input.I[17].O} {of.iadd[10].A}
(assert (= of_34 of_113))
; 
; =  {sc.input.V[7].O} {sc.vadd[2].OUT2_0}
(assert (= sc_74 sc_39))
; 
; =  {of.input.V[7].O} {of.vadd[2].OUT2_0}
(assert (= of_74 of_39))
; 
; =  {sc.input.I[8].O} {sc.igenebind[3].Vmax}
(assert (= sc_8 sc_67))
; 
; =  {of.input.I[8].O} {of.igenebind[3].Vmax}
(assert (= of_8 of_67))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[8].B}
(assert (= sc_110 sc_104))
; 
; =  {of.iadd[9].OUT} {of.iadd[8].B}
(assert (= of_110 of_104))
; 
; =  {sc.igenebind[3].GE} {sc.itov[1].K}
(assert (= sc_68 sc_99))
; 
; =  {of.igenebind[3].GE} {of.itov[1].K}
(assert (= of_68 of_99))
; 
; =  {sc.input.V[0].O} {sc.vtoi[6].K}
(assert (= sc_80 sc_63))
; 
; =  {of.input.V[0].O} {of.vtoi[6].K}
(assert (= of_80 of_63))
; 
; =  {sc.input.V[10].O} {sc.switch[7].n}
(assert (= sc_84 sc_0))
; 
; =  {of.input.V[10].O} {of.switch[7].n}
(assert (= of_84 of_0))
; 
; =  {sc.itov[4].Y} {sc.vadd[5].B}
(assert (= sc_97 sc_50))
; 
; =  {of.itov[4].Y} {of.vadd[5].B}
(assert (= of_97 of_50))
; 
; =  {sc.iadd[8].OUT} {sc.switch[7].Kmod}
(assert (= sc_105 sc_2))
; 
; =  {of.iadd[8].OUT} {of.switch[7].Kmod}
(assert (= of_105 of_2))
; 
; =  {sc.input.V[5].O} {sc.vadd[5].C}
(assert (= sc_92 sc_48))
; 
; =  {of.input.V[5].O} {of.vadd[5].C}
(assert (= of_92 of_48))
; 
; =  {sc.input.V[4].O} {sc.vadd[5].A}
(assert (= sc_90 sc_49))
; 
; =  {of.input.V[4].O} {of.vadd[5].A}
(assert (= of_90 of_49))
; 
; =  {sc.input.V[6].O} {sc.vadd[5].OUT2_0}
(assert (= sc_86 sc_46))
; 
; =  {of.input.V[6].O} {of.vadd[5].OUT2_0}
(assert (= of_86 of_46))
; 
; =  {sc.input.I[11].O} {sc.igenebind[3].TF}
(assert (= sc_16 sc_65))
; 
; =  {of.input.I[11].O} {of.igenebind[3].TF}
(assert (= of_16 of_65))
(assert (<= (* (/ 1. sc_36) 0.001) 0.1))
(assert (<= (* (/ 1. sc_38) 0.001) 0.1))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].O} {sc.vadd[5].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_45 sc_36) (= sc_45 sc_52)) (= sc_45 sc_38)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_36 0.) sltop_36 (- sltop_36)) (ite (>= sltop_96 0.) sltop_96 (- sltop_96))) (ite (>= slbot_44 0.) slbot_44 (- slbot_44))) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= slbot_35 0.) slbot_35 (- slbot_35))) (ite (>= sltop_4 0.) sltop_4 (- sltop_4))) (ite (>= sltop_66 0.) sltop_66 (- sltop_66))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_104 0.) sltop_104 (- sltop_104))) (ite (>= slbot_59 0.) slbot_59 (- slbot_59))) (ite (>= sltop_105 0.) sltop_105 (- sltop_105))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= sltop_58 0.) sltop_58 (- sltop_58))) (ite (>= slbot_36 0.) slbot_36 (- slbot_36))) (ite (>= sltop_109 0.) sltop_109 (- sltop_109))) (ite (>= slbot_96 0.) slbot_96 (- slbot_96))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= slbot_115 0.) slbot_115 (- slbot_115))) (ite (>= sltop_100 0.) sltop_100 (- sltop_100))) (ite (>= slbot_104 0.) slbot_104 (- slbot_104))) (ite (>= slbot_54 0.) slbot_54 (- slbot_54))) (ite (>= sltop_51 0.) sltop_51 (- sltop_51))) (ite (>= slbot_45 0.) slbot_45 (- slbot_45))) (ite (>= slbot_68 0.) slbot_68 (- slbot_68))) (ite (>= sltop_110 0.) sltop_110 (- sltop_110))) (ite (>= sltop_115 0.) sltop_115 (- sltop_115))) (ite (>= slbot_38 0.) slbot_38 (- slbot_38))) (ite (>= sltop_45 0.) sltop_45 (- sltop_45))) (ite (>= sltop_64 0.) sltop_64 (- sltop_64))) (ite (>= sltop_68 0.) sltop_68 (- sltop_68))) (ite (>= slbot_114 0.) slbot_114 (- slbot_114))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= slbot_110 0.) slbot_110 (- slbot_110))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_35 0.) sltop_35 (- sltop_35))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99))) (ite (>= slbot_66 0.) slbot_66 (- slbot_66))) (ite (>= sltop_52 0.) sltop_52 (- sltop_52))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= sltop_114 0.) sltop_114 (- sltop_114))) (ite (>= slbot_63 0.) slbot_63 (- slbot_63))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= slbot_109 0.) slbot_109 (- slbot_109))) (ite (>= sltop_54 0.) sltop_54 (- sltop_54))) (ite (>= slbot_64 0.) slbot_64 (- slbot_64))) (ite (>= slbot_37 0.) slbot_37 (- slbot_37))) (ite (>= slbot_61 0.) slbot_61 (- slbot_61))) (ite (>= sltop_38 0.) sltop_38 (- sltop_38))) (ite (>= sltop_44 0.) sltop_44 (- sltop_44))) (ite (>= slbot_4 0.) slbot_4 (- slbot_4))) (ite (>= slbot_105 0.) slbot_105 (- slbot_105))) (ite (>= slbot_52 0.) slbot_52 (- slbot_52))) (ite (>= slbot_51 0.) slbot_51 (- slbot_51))) (ite (>= sltop_97 0.) sltop_97 (- sltop_97))) (ite (>= slbot_43 0.) slbot_43 (- slbot_43))) (ite (>= slbot_50 0.) slbot_50 (- slbot_50))) (ite (>= slbot_100 0.) slbot_100 (- slbot_100))) (ite (>= sltop_50 0.) sltop_50 (- sltop_50))) (ite (>= sltop_37 0.) sltop_37 (- sltop_37))) (ite (>= sltop_61 0.) sltop_61 (- sltop_61))) (ite (>= sltop_63 0.) sltop_63 (- sltop_63))) (ite (>= slbot_58 0.) slbot_58 (- slbot_58))) (ite (>= sltop_43 0.) sltop_43 (- sltop_43))) (ite (>= slbot_97 0.) slbot_97 (- slbot_97))) (ite (>= sltop_59 0.) sltop_59 (- sltop_59)))))
(check-sat)
