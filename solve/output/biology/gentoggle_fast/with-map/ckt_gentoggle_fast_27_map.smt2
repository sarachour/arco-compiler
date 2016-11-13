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
; =  {(sc.switch[6].SUB/sc.switch[6].Kmod)} {1.}
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
; =  {sc.switch[6].PROD} {(sc.switch[6].Vmax/1.)}
(assert (= sc_4 (/ sc_3 1.)))
; 
; =  {of.switch[6].PROD} {0.}
(assert (= of_4 0.))
; 
; >=  {((sc.switch[6].n*1000.75)+of.switch[6].n)} {3300.}
(assert (<= (+ (* sc_0 1000.75) of_0) 3300.))
; 
; <=  {((sc.switch[6].n*1000.75)+of.switch[6].n)} {0.5}
(assert (>= (+ (* sc_0 1000.75) of_0) 0.5))
(declare-fun slbot_1 () Real)
(declare-fun sltop_1 () Real)
; 
; =  {(((sc.switch[6].SUB*0.)+of.switch[6].SUB)+sl.min.switch[6].SUB)} {0.0001}
(assert (= (+ (+ (* sc_1 0.) of_1) slbot_1) 0.0001))
; 
; =  {(((sc.switch[6].SUB*0.6)+of.switch[6].SUB)+sl.max.switch[6].SUB)} {10.}
(assert (= (+ (+ (* sc_1 0.6) of_1) sltop_1) 10.))
; 
; >=  {((sc.switch[6].Kmod*0.0029618)+of.switch[6].Kmod)} {10.}
(assert (<= (+ (* sc_2 0.0029618) of_2) 10.))
; 
; <=  {((sc.switch[6].Kmod*0.0029618)+of.switch[6].Kmod)} {0.0001}
(assert (>= (+ (* sc_2 0.0029618) of_2) 0.0001))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.switch[6].PROD*0.)+of.switch[6].PROD)+sl.min.switch[6].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4) 9.99934002508e-38))
; 
; =  {(((sc.switch[6].PROD*15.6)+of.switch[6].PROD)+sl.max.switch[6].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_4 15.6) of_4) sltop_4) 9.9999999))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.switch[6].Vmax*0.)+of.switch[6].Vmax)+sl.min.switch[6].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 0.0001))
; 
; =  {(((sc.switch[6].Vmax*15.6)+of.switch[6].Vmax)+sl.max.switch[6].Vmax)} {10.}
(assert (= (+ (+ (* sc_3 15.6) of_3) sltop_3) 10.))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.switch[6].PROD*0.)+of.switch[6].PROD)+sl.min.switch[6].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4) 9.99934002508e-38))
; 
; =  {(((sc.switch[6].PROD*15.6)+of.switch[6].PROD)+sl.max.switch[6].PROD)} {9.9999999}
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
; >=  {((sc.input.I[2].X*15.6)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_5 15.6) of_5) 10.))
; 
; <=  {((sc.input.I[2].X*15.6)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_5 15.6) of_5) 0.))
; 
; >=  {((sc.input.I[2].O*15.6)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_6 15.6) of_6) 10.))
; 
; <=  {((sc.input.I[2].O*15.6)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_6 15.6) of_6) 0.))
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
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_7 0.) of_7) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_7 0.) of_7) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_8 0.) of_8) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_8 0.) of_8) 0.))
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
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_9 0.) of_9) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_9 0.) of_9) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_10 0.) of_10) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_10 0.) of_10) 0.))
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
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_11 0.) of_11) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_12 0.) of_12) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
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
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.input.I[0].X*0.)+of.input.I[0].X)+sl.min.input.I[0].X)} {0.}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 0.))
; 
; =  {(((sc.input.I[0].X*0.6)+of.input.I[0].X)+sl.max.input.I[0].X)} {10.}
(assert (= (+ (+ (* sc_13 0.6) of_13) sltop_13) 10.))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.input.I[0].O*0.)+of.input.I[0].O)+sl.min.input.I[0].O)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14) 0.))
; 
; =  {(((sc.input.I[0].O*0.6)+of.input.I[0].O)+sl.max.input.I[0].O)} {10.}
(assert (= (+ (+ (* sc_14 0.6) of_14) sltop_14) 10.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[6].X*1.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_15 1.) of_15) 10.))
; 
; <=  {((sc.input.I[6].X*1.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_15 1.) of_15) 0.))
; 
; >=  {((sc.input.I[6].O*1.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_16 1.) of_16) 10.))
; 
; <=  {((sc.input.I[6].O*1.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_16 1.) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[3].X*4.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_17 4.) of_17) 10.))
; 
; <=  {((sc.input.I[3].X*4.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_17 4.) of_17) 0.))
; 
; >=  {((sc.input.I[3].O*4.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_18 4.) of_18) 10.))
; 
; <=  {((sc.input.I[3].O*4.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_18 4.) of_18) 0.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[4].X*4.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_19 4.) of_19) 10.))
; 
; <=  {((sc.input.I[4].X*4.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_19 4.) of_19) 0.))
; 
; >=  {((sc.input.I[4].O*4.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_20 4.) of_20) 10.))
; 
; <=  {((sc.input.I[4].O*4.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_20 4.) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_22 sc_21))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_22 of_21))
; 
; >=  {((sc.input.I[5].X*0.0029618)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_21 0.0029618) of_21) 10.))
; 
; <=  {((sc.input.I[5].X*0.0029618)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_21 0.0029618) of_21) 0.))
; 
; >=  {((sc.input.I[5].O*0.0029618)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_22 0.0029618) of_22) 10.))
; 
; <=  {((sc.input.I[5].O*0.0029618)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_22 0.0029618) of_22) 0.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_24 sc_23))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_24 of_23))
; 
; >=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_23 156.25) of_23) 10.))
; 
; <=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_23 156.25) of_23) 0.))
; 
; >=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_24 156.25) of_24) 10.))
; 
; <=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_24 156.25) of_24) 0.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_26 sc_25))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_26 of_25))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_25 156.25) of_25) sltop_25) 3300.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_26 156.25) of_26) sltop_26) 3300.))
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_28 sc_27))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_28 of_27))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_27 15.6) of_27) sltop_27) 3300.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_28 15.6) of_28) sltop_28) 3300.))
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_30 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_33 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_32 (* 1. sc_33)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D)}
(assert (and (= sc_32 (* 1. sc_31)) (= sc_32 (* 1. sc_30))))
; no offset
(assert (= (- (+ of_32 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1.)}
(assert (= sc_34 (* sc_32 1.)))
; 
; =  {of.vadd[2].OUT} {0.}
(assert (= of_34 0.))
; no scale
(assert (= sc_30 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_30 0.))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_33 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_32 (* 1. sc_33)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D*sc.vadd[2].OUT2)}
(assert (and (= sc_32 (* 1. sc_31)) (= sc_32 (* (* 1. sc_30) sc_35))))
; no offset
(assert (= (- (+ of_32 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1.)}
(assert (= sc_35 (* sc_32 1.)))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1.)}
(assert (= sc_29 (* sc_32 1.)))
; 
; =  {of.vadd[2].OUT2_0} {0.}
(assert (= of_29 0.))
; 
; >=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {3300.}
(assert (<= (+ (* sc_29 0.) of_29) 3300.))
; 
; <=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
; 
; >=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {3300.}
(assert (<= (+ (* sc_30 4.) of_30) 3300.))
; 
; <=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {0.}
(assert (>= (+ (* sc_30 4.) of_30) 0.))
; 
; >=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {3300.}
(assert (<= (+ (* sc_31 0.) of_31) 3300.))
; 
; <=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {3300.}
(assert (<= (+ (* sc_32 0.) of_32) 3300.))
; 
; <=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_35 156.25) of_35) sltop_35) 3300.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[2].B*3.75903614458)+of.vadd[2].B)+sl.min.vadd[2].B)} {0.}
(assert (= (+ (+ (* sc_33 3.75903614458) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[2].B*62.4)+of.vadd[2].B)+sl.max.vadd[2].B)} {3300.}
(assert (= (+ (+ (* sc_33 62.4) of_33) sltop_33) 3300.))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.vadd[2].OUT*3.75903614458)+of.vadd[2].OUT)+sl.min.vadd[2].OUT)} {-1650.}
(assert (= (+ (+ (* sc_34 3.75903614458) of_34) slbot_34) -1650.))
; 
; =  {(((sc.vadd[2].OUT*62.4)+of.vadd[2].OUT)+sl.max.vadd[2].OUT)} {1650.}
(assert (= (+ (+ (* sc_34 62.4) of_34) sltop_34) 1650.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_35 156.25) of_35) sltop_35) 3300.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_37 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_38 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_40 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_39 (* 1. sc_40)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_39 (* 1. sc_38)) (= sc_39 (* 1. sc_37))))
; no offset
(assert (= (- (+ of_39 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_41 (* sc_39 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
(assert (= of_41 0.))
; no scale
(assert (= sc_37 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_37 0.))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_38 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_40 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_39 (* 1. sc_40)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_39 (* 1. sc_38)) (= sc_39 (* (* 1. sc_37) sc_42))))
; no offset
(assert (= (- (+ of_39 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_42 (* sc_39 1.)))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_36 (* sc_39 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_36 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_36 0.) of_36) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
; 
; >=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {3300.}
(assert (<= (+ (* sc_37 4.) of_37) 3300.))
; 
; <=  {((sc.vadd[5].D*4.)+of.vadd[5].D)} {0.}
(assert (>= (+ (* sc_37 4.) of_37) 0.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_38 0.) of_38) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_39 0.) of_39) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
(declare-fun slbot_42 () Real)
(declare-fun sltop_42 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_42 15.6) of_42) sltop_42) 3300.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.vadd[5].B*0.00204799328914)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_40 0.00204799328914) of_40) slbot_40) 0.))
; 
; =  {(((sc.vadd[5].B*625.)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_40 625.) of_40) sltop_40) 3300.))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.vadd[5].OUT*0.00204799328914)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_41 0.00204799328914) of_41) slbot_41) -1650.))
; 
; =  {(((sc.vadd[5].OUT*625.)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_41 625.) of_41) sltop_41) 1650.))
(declare-fun slbot_42 () Real)
(declare-fun sltop_42 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_42 15.6) of_42) sltop_42) 3300.))
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
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
; no offset
(assert (= of_44 0.))
; no offset
(assert (= of_45 0.))
; no scale
(assert (= (/ sc_44 sc_45) 1.))
; no scale
(assert (= sc_43 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= of_45 0.))
; no scale
(assert (= (/ sc_44 sc_45) 1.))
; no scale
(assert (= sc_43 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_46 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_47 (* sc_46 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_47 0.))
; no scale
(assert (= sc_45 1.))
; no scale
(assert (= (* sc_43 1.) 1.))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_45 1.))
; no scale
(assert (= (* sc_43 1.) 1.))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_44 1.))
; no scale
(assert (= sc_43 1.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= of_43 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_46 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_48 (* sc_46 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_48 0.))
; 
; >=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_43 2.5) of_43) 5.))
; 
; <=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_43 2.5) of_43) 1.))
(declare-fun slbot_44 () Real)
(declare-fun sltop_44 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44) 1.))
; 
; =  {(((sc.ihill[0].S*156.25)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_44 156.25) of_44) sltop_44) 10.))
(declare-fun slbot_48 () Real)
(declare-fun sltop_48 () Real)
; 
; =  {(((sc.ihill[0].REP*0.000511998322284)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {9.999900001e-10}
(assert (= (+ (+ (* sc_48 0.000511998322284) of_48) slbot_48) 9.999900001e-10))
; 
; =  {(((sc.ihill[0].REP*156.25)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {5.}
(assert (= (+ (+ (* sc_48 156.25) of_48) sltop_48) 5.))
; 
; >=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_46 156.25) of_46) 10.))
; 
; <=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_46 156.25) of_46) 0.0001))
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_50 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_49 0.))
; 
; =  {sc.vtoi[1].Y} {((1./sc.vtoi[1].K)*sc.vtoi[1].X)}
(assert (= sc_51 (* (/ 1. sc_50) sc_49)))
; 
; =  {of.vtoi[1].Y} {0.}
(assert (= of_51 0.))
(declare-fun slbot_49 () Real)
(declare-fun sltop_49 () Real)
; 
; =  {(((sc.vtoi[1].X*0.)+of.vtoi[1].X)+sl.min.vtoi[1].X)} {1.}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49) 1.))
; 
; =  {(((sc.vtoi[1].X*156.25)+of.vtoi[1].X)+sl.max.vtoi[1].X)} {3300.}
(assert (= (+ (+ (* sc_49 156.25) of_49) sltop_49) 3300.))
; 
; >=  {((sc.vtoi[1].K*1.)+of.vtoi[1].K)} {3300.}
(assert (<= (+ (* sc_50 1.) of_50) 3300.))
; 
; <=  {((sc.vtoi[1].K*1.)+of.vtoi[1].K)} {1.}
(assert (>= (+ (* sc_50 1.) of_50) 1.))
(declare-fun slbot_51 () Real)
(declare-fun sltop_51 () Real)
; 
; =  {(((sc.vtoi[1].Y*0.)+of.vtoi[1].Y)+sl.min.vtoi[1].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_51 0.) of_51) slbot_51) 0.00030303030303))
; 
; =  {(((sc.vtoi[1].Y*156.25)+of.vtoi[1].Y)+sl.max.vtoi[1].Y)} {3300.}
(assert (= (+ (+ (* sc_51 156.25) of_51) sltop_51) 3300.))
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
(assert (= of_53 0.))
; no offset
(assert (= of_52 0.))
; 
; =  {1.} {(sc.igenebind[3].K*sc.igenebind[3].TF)}
(assert (= 1. (* sc_53 sc_52)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_54 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[3].GE} {(sc.igenebind[3].Vmax*(1./1.))}
(assert (= sc_55 (* sc_54 (/ 1. 1.))))
; 
; =  {of.igenebind[3].GE} {0.}
(assert (= of_55 0.))
; 
; >=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {10.}
(assert (<= (+ (* sc_52 1.) of_52) 10.))
; 
; <=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {0.0001}
(assert (>= (+ (* sc_52 1.) of_52) 0.0001))
(declare-fun slbot_53 () Real)
(declare-fun sltop_53 () Real)
; 
; =  {(((sc.igenebind[3].K*0.)+of.igenebind[3].K)+sl.min.igenebind[3].K)} {0.0001}
(assert (= (+ (+ (* sc_53 0.) of_53) slbot_53) 0.0001))
; 
; =  {(((sc.igenebind[3].K*15.6)+of.igenebind[3].K)+sl.max.igenebind[3].K)} {10.}
(assert (= (+ (+ (* sc_53 15.6) of_53) sltop_53) 10.))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.igenebind[3].GE*0.939759036145)+of.igenebind[3].GE)+sl.min.igenebind[3].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_55 0.939759036145) of_55) slbot_55) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[3].GE*15.6)+of.igenebind[3].GE)+sl.max.igenebind[3].GE)} {9.9999999}
(assert (= (+ (+ (* sc_55 15.6) of_55) sltop_55) 9.9999999))
; 
; >=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {10.}
(assert (<= (+ (* sc_54 15.6) of_54) 10.))
; 
; <=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {0.0001}
(assert (>= (+ (* sc_54 15.6) of_54) 0.0001))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_56 0.) of_56) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_57 0.) of_57) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_58 4.) of_58) 3300.))
; 
; <=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_58 4.) of_58) 0.))
; 
; >=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_59 4.) of_59) 3300.))
; 
; <=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_59 4.) of_59) 0.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.V[7].X*4.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_60 4.) of_60) 3300.))
; 
; <=  {((sc.input.V[7].X*4.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_60 4.) of_60) 0.))
; 
; >=  {((sc.input.V[7].O*4.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_61 4.) of_61) 3300.))
; 
; <=  {((sc.input.V[7].O*4.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_61 4.) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.V[9].X*1000.75)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_62 1000.75) of_62) 3300.))
; 
; <=  {((sc.input.V[9].X*1000.75)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_62 1000.75) of_62) 0.))
; 
; >=  {((sc.input.V[9].O*1000.75)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_63 1000.75) of_63) 3300.))
; 
; <=  {((sc.input.V[9].O*1000.75)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_63 1000.75) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.V[0].X*2.5)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_64 2.5) of_64) 3300.))
; 
; <=  {((sc.input.V[0].X*2.5)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_64 2.5) of_64) 0.))
; 
; >=  {((sc.input.V[0].O*2.5)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_65 2.5) of_65) 3300.))
; 
; <=  {((sc.input.V[0].O*2.5)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_65 2.5) of_65) 0.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.V[10].X*1.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_66 1.) of_66) 3300.))
; 
; <=  {((sc.input.V[10].X*1.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_66 1.) of_66) 0.))
; 
; >=  {((sc.input.V[10].O*1.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_67 1.) of_67) 3300.))
; 
; <=  {((sc.input.V[10].O*1.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_67 1.) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_68 0.) of_68) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_69 0.) of_69) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_70 0.) of_70) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_71 0.) of_71) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_71 0.) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_73 sc_72))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_73 of_72))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_72 0.) of_72) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_72 0.) of_72) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_73 0.) of_73) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_75 sc_74))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_75 of_74))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_74 0.) of_74) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_75 0.) of_75) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_77 sc_76))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_77 of_76))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_76 0.) of_76) 3300.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_77 0.) of_77) 3300.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
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
(assert (= of_79 0.))
; no offset
(assert (= of_78 0.))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_80 (* sc_79 sc_78)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_80 0.))
; 
; >=  {((sc.itov[4].X*4.)+of.itov[4].X)} {10.}
(assert (<= (+ (* sc_78 4.) of_78) 10.))
; 
; <=  {((sc.itov[4].X*4.)+of.itov[4].X)} {0.0001}
(assert (>= (+ (* sc_78 4.) of_78) 0.0001))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_80 0.00204799328914) of_80) slbot_80) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_80 625.) of_80) sltop_80) 3300.))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.itov[4].K*0.000511998322284)+of.itov[4].K)+sl.min.itov[4].K)} {1.}
(assert (= (+ (+ (* sc_79 0.000511998322284) of_79) slbot_79) 1.))
; 
; =  {(((sc.itov[4].K*156.25)+of.itov[4].K)+sl.max.itov[4].K)} {330.}
(assert (= (+ (+ (* sc_79 156.25) of_79) sltop_79) 330.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.itov[4].Y*0.00204799328914)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_80 0.00204799328914) of_80) slbot_80) 0.0001))
; 
; =  {(((sc.itov[4].Y*625.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_80 625.) of_80) sltop_80) 3300.))
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
(assert (= of_82 0.))
; no offset
(assert (= of_81 0.))
; 
; =  {sc.itov[1].Y} {(sc.itov[1].K*sc.itov[1].X)}
(assert (= sc_83 (* sc_82 sc_81)))
; 
; =  {of.itov[1].Y} {0.}
(assert (= of_83 0.))
; 
; >=  {((sc.itov[1].X*4.)+of.itov[1].X)} {10.}
(assert (<= (+ (* sc_81 4.) of_81) 10.))
; 
; <=  {((sc.itov[1].X*4.)+of.itov[1].X)} {0.0001}
(assert (>= (+ (* sc_81 4.) of_81) 0.0001))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_83 3.75903614458) of_83) slbot_83) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_83 62.4) of_83) sltop_83) 3300.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.itov[1].K*0.939759036145)+of.itov[1].K)+sl.min.itov[1].K)} {1.}
(assert (= (+ (+ (* sc_82 0.939759036145) of_82) slbot_82) 1.))
; 
; =  {(((sc.itov[1].K*15.6)+of.itov[1].K)+sl.max.itov[1].K)} {330.}
(assert (= (+ (+ (* sc_82 15.6) of_82) sltop_82) 330.))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_83 3.75903614458) of_83) slbot_83) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_83 62.4) of_83) sltop_83) 3300.))
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
; 
; =  {sc.iadd[0].A} {sc.iadd[0].B}
(assert (= sc_86 sc_87))
; 
; =  {sc.iadd[0].A} {sc.iadd[0].C} {sc.iadd[0].D}
(assert (and (= sc_86 sc_85) (= sc_86 sc_84)))
; 
; =  {sc.iadd[0].OUT} {sc.iadd[0].A}
(assert (= sc_88 sc_86))
; 
; =  {of.iadd[0].OUT} {((of.iadd[0].A+of.iadd[0].B)-of.iadd[0].C-of.iadd[0].D)}
(assert (= of_88 (- (+ of_86 of_87) (+ of_85 of_84))))
; 
; >=  {((sc.iadd[0].D*0.)+of.iadd[0].D)} {5.}
(assert (<= (+ (* sc_84 0.) of_84) 5.))
; 
; <=  {((sc.iadd[0].D*0.)+of.iadd[0].D)} {0.}
(assert (>= (+ (* sc_84 0.) of_84) 0.))
; 
; >=  {((sc.iadd[0].C*0.)+of.iadd[0].C)} {5.}
(assert (<= (+ (* sc_85 0.) of_85) 5.))
; 
; <=  {((sc.iadd[0].C*0.)+of.iadd[0].C)} {0.}
(assert (>= (+ (* sc_85 0.) of_85) 0.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.iadd[0].A*0.)+of.iadd[0].A)+sl.min.iadd[0].A)} {0.}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 0.))
; 
; =  {(((sc.iadd[0].A*15.6)+of.iadd[0].A)+sl.max.iadd[0].A)} {5.}
(assert (= (+ (+ (* sc_86 15.6) of_86) sltop_86) 5.))
; 
; >=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {5.}
(assert (<= (+ (* sc_87 0.) of_87) 5.))
; 
; <=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {0.}
(assert (>= (+ (* sc_87 0.) of_87) 0.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.iadd[0].OUT*0.)+of.iadd[0].OUT)+sl.min.iadd[0].OUT)} {-10.}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) -10.))
; 
; =  {(((sc.iadd[0].OUT*15.6)+of.iadd[0].OUT)+sl.max.iadd[0].OUT)} {10.}
(assert (= (+ (+ (* sc_88 15.6) of_88) sltop_88) 10.))
; 
; =  {sc.input.I[6].O} {sc.igenebind[3].TF}
(assert (= sc_16 sc_52))
; 
; =  {of.input.I[6].O} {of.igenebind[3].TF}
(assert (= of_16 of_52))
; 
; =  {sc.input.I[0].O} {sc.switch[6].SUB}
(assert (= sc_14 sc_1))
; 
; =  {of.input.I[0].O} {of.switch[6].SUB}
(assert (= of_14 of_1))
; 
; =  {sc.vadd[2].OUT2} {sc.vtoi[1].X}
(assert (= sc_35 sc_49))
; 
; =  {of.vadd[2].OUT2} {of.vtoi[1].X}
(assert (= of_35 of_49))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].X}
(assert (= sc_35 sc_25))
; 
; =  {of.vadd[2].OUT2} {of.output.V[0].X}
(assert (= of_35 of_25))
; 
; =  {sc.input.V[9].O} {sc.switch[6].n}
(assert (= sc_63 sc_0))
; 
; =  {of.input.V[9].O} {of.switch[6].n}
(assert (= of_63 of_0))
; 
; =  {sc.ihill[0].REP} {sc.itov[4].K}
(assert (= sc_48 sc_79))
; 
; =  {of.ihill[0].REP} {of.itov[4].K}
(assert (= of_48 of_79))
; 
; =  {sc.itov[1].Y} {sc.vadd[2].B}
(assert (= sc_83 sc_33))
; 
; =  {of.itov[1].Y} {of.vadd[2].B}
(assert (= of_83 of_33))
; 
; =  {sc.input.I[9].O} {sc.iadd[0].D}
(assert (= sc_12 sc_84))
; 
; =  {of.input.I[9].O} {of.iadd[0].D}
(assert (= of_12 of_84))
; 
; =  {sc.input.I[3].O} {sc.itov[1].X}
(assert (= sc_18 sc_81))
; 
; =  {of.input.I[3].O} {of.itov[1].X}
(assert (= of_18 of_81))
; 
; =  {sc.input.I[4].O} {sc.itov[4].X}
(assert (= sc_20 sc_78))
; 
; =  {of.input.I[4].O} {of.itov[4].X}
(assert (= of_20 of_78))
; 
; =  {sc.input.I[5].O} {sc.switch[6].Kmod}
(assert (= sc_22 sc_2))
; 
; =  {of.input.I[5].O} {of.switch[6].Kmod}
(assert (= of_22 of_2))
; 
; =  {sc.vtoi[1].Y} {sc.ihill[0].S}
(assert (= sc_51 sc_44))
; 
; =  {of.vtoi[1].Y} {of.ihill[0].S}
(assert (= of_51 of_44))
; 
; =  {sc.input.I[2].O} {sc.igenebind[3].Vmax}
(assert (= sc_6 sc_54))
; 
; =  {of.input.I[2].O} {of.igenebind[3].Vmax}
(assert (= of_6 of_54))
; 
; =  {sc.input.V[8].O} {sc.vadd[5].D}
(assert (= sc_59 sc_37))
; 
; =  {of.input.V[8].O} {of.vadd[5].D}
(assert (= of_59 of_37))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[1].X}
(assert (= sc_42 sc_27))
; 
; =  {of.vadd[5].OUT2} {of.output.V[1].X}
(assert (= of_42 of_27))
; 
; =  {sc.vadd[5].OUT2} {sc.switch[6].Vmax}
(assert (= sc_42 sc_3))
; 
; =  {of.vadd[5].OUT2} {of.switch[6].Vmax}
(assert (= of_42 of_3))
; 
; =  {sc.input.V[3].O} {sc.vadd[5].C}
(assert (= sc_71 sc_38))
; 
; =  {of.input.V[3].O} {of.vadd[5].C}
(assert (= of_71 of_38))
; 
; =  {sc.input.V[2].O} {sc.vadd[2].C}
(assert (= sc_57 sc_31))
; 
; =  {of.input.V[2].O} {of.vadd[2].C}
(assert (= of_57 of_31))
; 
; =  {sc.switch[6].PROD} {sc.iadd[0].A}
(assert (= sc_4 sc_86))
; 
; =  {of.switch[6].PROD} {of.iadd[0].A}
(assert (= of_4 of_86))
; 
; =  {sc.iadd[0].OUT} {sc.igenebind[3].K}
(assert (= sc_88 sc_53))
; 
; =  {of.iadd[0].OUT} {of.igenebind[3].K}
(assert (= of_88 of_53))
; 
; =  {sc.input.I[1].O} {sc.ihill[0].Vmax}
(assert (= sc_24 sc_46))
; 
; =  {of.input.I[1].O} {of.ihill[0].Vmax}
(assert (= of_24 of_46))
; 
; =  {sc.input.I[7].O} {sc.iadd[0].C}
(assert (= sc_10 sc_85))
; 
; =  {of.input.I[7].O} {of.iadd[0].C}
(assert (= of_10 of_85))
; 
; =  {sc.input.V[1].O} {sc.vadd[2].A}
(assert (= sc_77 sc_32))
; 
; =  {of.input.V[1].O} {of.vadd[2].A}
(assert (= of_77 of_32))
; 
; =  {sc.input.V[7].O} {sc.vadd[2].D}
(assert (= sc_61 sc_30))
; 
; =  {of.input.V[7].O} {of.vadd[2].D}
(assert (= of_61 of_30))
; 
; =  {sc.input.I[8].O} {sc.iadd[0].B}
(assert (= sc_8 sc_87))
; 
; =  {of.input.I[8].O} {of.iadd[0].B}
(assert (= of_8 of_87))
; 
; =  {sc.input.V[10].O} {sc.vtoi[1].K}
(assert (= sc_67 sc_50))
; 
; =  {of.input.V[10].O} {of.vtoi[1].K}
(assert (= of_67 of_50))
; 
; =  {sc.input.V[0].O} {sc.ihill[0].n}
(assert (= sc_65 sc_43))
; 
; =  {of.input.V[0].O} {of.ihill[0].n}
(assert (= of_65 of_43))
; 
; =  {sc.igenebind[3].GE} {sc.itov[1].K}
(assert (= sc_55 sc_82))
; 
; =  {of.igenebind[3].GE} {of.itov[1].K}
(assert (= of_55 of_82))
; 
; =  {sc.itov[4].Y} {sc.vadd[5].B}
(assert (= sc_80 sc_40))
; 
; =  {of.itov[4].Y} {of.vadd[5].B}
(assert (= of_80 of_40))
; 
; =  {sc.input.V[5].O} {sc.vadd[5].OUT2_0}
(assert (= sc_75 sc_36))
; 
; =  {of.input.V[5].O} {of.vadd[5].OUT2_0}
(assert (= of_75 of_36))
; 
; =  {sc.input.V[4].O} {sc.vadd[5].A}
(assert (= sc_73 sc_39))
; 
; =  {of.input.V[4].O} {of.vadd[5].A}
(assert (= of_73 of_39))
; 
; =  {sc.input.V[6].O} {sc.vadd[2].OUT2_0}
(assert (= sc_69 sc_29))
; 
; =  {of.input.V[6].O} {of.vadd[2].OUT2_0}
(assert (= of_69 of_29))
(assert (<= (* (/ 1. sc_26) 0.001) 0.1))
(assert (<= (* (/ 1. sc_28) 0.001) 0.1))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].O} {sc.vadd[5].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_35 sc_26) (= sc_35 sc_42)) (= sc_35 sc_28)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_14 0.) slbot_14 (- slbot_14)) (ite (>= sltop_1 0.) sltop_1 (- sltop_1))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= sltop_14 0.) sltop_14 (- sltop_14))) (ite (>= sltop_41 0.) sltop_41 (- sltop_41))) (ite (>= slbot_44 0.) slbot_44 (- slbot_44))) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= sltop_55 0.) sltop_55 (- sltop_55))) (ite (>= slbot_35 0.) slbot_35 (- slbot_35))) (ite (>= slbot_49 0.) slbot_49 (- slbot_49))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= sltop_4 0.) sltop_4 (- sltop_4))) (ite (>= sltop_27 0.) sltop_27 (- sltop_27))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= slbot_83 0.) slbot_83 (- slbot_83))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_42 0.) sltop_42 (- sltop_42))) (ite (>= slbot_53 0.) slbot_53 (- slbot_53))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= slbot_26 0.) slbot_26 (- slbot_26))) (ite (>= sltop_28 0.) sltop_28 (- sltop_28))) (ite (>= sltop_44 0.) sltop_44 (- sltop_44))) (ite (>= sltop_49 0.) sltop_49 (- sltop_49))) (ite (>= sltop_82 0.) sltop_82 (- sltop_82))) (ite (>= slbot_25 0.) slbot_25 (- slbot_25))) (ite (>= slbot_41 0.) slbot_41 (- slbot_41))) (ite (>= slbot_82 0.) slbot_82 (- slbot_82))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= slbot_28 0.) slbot_28 (- slbot_28))) (ite (>= slbot_4 0.) slbot_4 (- slbot_4))) (ite (>= slbot_55 0.) slbot_55 (- slbot_55))) (ite (>= slbot_51 0.) slbot_51 (- slbot_51))) (ite (>= sltop_51 0.) sltop_51 (- sltop_51))) (ite (>= sltop_34 0.) sltop_34 (- sltop_34))) (ite (>= slbot_48 0.) slbot_48 (- slbot_48))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= sltop_53 0.) sltop_53 (- sltop_53))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= sltop_48 0.) sltop_48 (- sltop_48))) (ite (>= sltop_83 0.) sltop_83 (- sltop_83))) (ite (>= slbot_42 0.) slbot_42 (- slbot_42))) (ite (>= sltop_25 0.) sltop_25 (- sltop_25))) (ite (>= slbot_34 0.) slbot_34 (- slbot_34))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_26 0.) sltop_26 (- sltop_26))) (ite (>= sltop_35 0.) sltop_35 (- sltop_35))) (ite (>= sltop_40 0.) sltop_40 (- sltop_40))) (ite (>= slbot_27 0.) slbot_27 (- slbot_27))) (ite (>= slbot_33 0.) slbot_33 (- slbot_33))) (ite (>= sltop_33 0.) sltop_33 (- sltop_33))) (ite (>= slbot_40 0.) slbot_40 (- slbot_40))) (ite (>= slbot_1 0.) slbot_1 (- slbot_1)))))
(check-sat)
