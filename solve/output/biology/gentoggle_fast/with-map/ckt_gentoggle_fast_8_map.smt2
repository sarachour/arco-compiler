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
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_8 sc_7))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_8 of_7))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_7 0.) of_7) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_7 0.) of_7) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_8 0.) of_8) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_8 0.) of_8) 0.))
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_10 sc_9))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_10 of_9))
; 
; >=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_9 0.) of_9) 10.))
; 
; <=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_9 0.) of_9) 0.))
; 
; >=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_10 0.) of_10) 10.))
; 
; <=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_10 0.) of_10) 0.))
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_12 sc_11))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_12 of_11))
; 
; >=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_11 156.25) of_11) 10.))
; 
; <=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_11 156.25) of_11) 0.))
; 
; >=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_12 156.25) of_12) 10.))
; 
; <=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_12 156.25) of_12) 0.))
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_14 sc_13))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_14 of_13))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_13 0.) of_13) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[3].X*4.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_15 4.) of_15) 10.))
; 
; <=  {((sc.input.I[3].X*4.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_15 4.) of_15) 0.))
; 
; >=  {((sc.input.I[3].O*4.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_16 4.) of_16) 10.))
; 
; <=  {((sc.input.I[3].O*4.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_16 4.) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[4].X*4.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_17 4.) of_17) 10.))
; 
; <=  {((sc.input.I[4].X*4.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_17 4.) of_17) 0.))
; 
; >=  {((sc.input.I[4].O*4.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_18 4.) of_18) 10.))
; 
; <=  {((sc.input.I[4].O*4.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_18 4.) of_18) 0.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[5].X*1.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_19 1.) of_19) 10.))
; 
; <=  {((sc.input.I[5].X*1.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_19 1.) of_19) 0.))
; 
; >=  {((sc.input.I[5].O*1.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_20 1.) of_20) 10.))
; 
; <=  {((sc.input.I[5].O*1.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_20 1.) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_22 sc_21))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_22 of_21))
; 
; >=  {((sc.input.I[1].X*337.632520764)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_21 337.632520764) of_21) 10.))
; 
; <=  {((sc.input.I[1].X*337.632520764)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_21 337.632520764) of_21) 0.))
; 
; >=  {((sc.input.I[1].O*337.632520764)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_22 337.632520764) of_22) 10.))
; 
; <=  {((sc.input.I[1].O*337.632520764)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_22 337.632520764) of_22) 0.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_24 sc_23))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_24 of_23))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_23 156.25) of_23) sltop_23) 3300.))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_24 156.25) of_24) sltop_24) 3300.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_26 sc_25))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_26 of_25))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_25 15.6) of_25) sltop_25) 3300.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_26 15.6) of_26) sltop_26) 3300.))
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_28 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_30 (* 1. sc_31)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D)}
(assert (and (= sc_30 (* 1. sc_29)) (= sc_30 (* 1. sc_28))))
; no offset
(assert (= (- (+ of_30 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1.)}
(assert (= sc_32 (* sc_30 1.)))
; 
; =  {of.vadd[2].OUT} {0.}
(assert (= of_32 0.))
; no scale
(assert (= sc_28 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_28 0.))
; no offset
(assert (= of_33 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_30 (* 1. sc_31)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D*sc.vadd[2].OUT2)}
(assert (and (= sc_30 (* 1. sc_29)) (= sc_30 (* (* 1. sc_28) sc_33))))
; no offset
(assert (= (- (+ of_30 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1.)}
(assert (= sc_33 (* sc_30 1.)))
; no offset
(assert (= of_33 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1.)}
(assert (= sc_27 (* sc_30 1.)))
; 
; =  {of.vadd[2].OUT2_0} {0.}
(assert (= of_27 0.))
; 
; >=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {3300.}
(assert (<= (+ (* sc_27 0.) of_27) 3300.))
; 
; <=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {3300.}
(assert (<= (+ (* sc_28 4.) of_28) 3300.))
; 
; <=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {0.}
(assert (>= (+ (* sc_28 4.) of_28) 0.))
; 
; >=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {3300.}
(assert (<= (+ (* sc_29 0.) of_29) 3300.))
; 
; <=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
; 
; >=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {3300.}
(assert (<= (+ (* sc_30 0.) of_30) 3300.))
; 
; <=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_33 156.25) of_33) sltop_33) 3300.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vadd[2].B*3.75903614458)+of.vadd[2].B)+sl.min.vadd[2].B)} {0.}
(assert (= (+ (+ (* sc_31 3.75903614458) of_31) slbot_31) 0.))
; 
; =  {(((sc.vadd[2].B*62.4)+of.vadd[2].B)+sl.max.vadd[2].B)} {3300.}
(assert (= (+ (+ (* sc_31 62.4) of_31) sltop_31) 3300.))
(declare-fun slbot_32 () Real)
(declare-fun sltop_32 () Real)
; 
; =  {(((sc.vadd[2].OUT*3.75903614458)+of.vadd[2].OUT)+sl.min.vadd[2].OUT)} {-1650.}
(assert (= (+ (+ (* sc_32 3.75903614458) of_32) slbot_32) -1650.))
; 
; =  {(((sc.vadd[2].OUT*62.4)+of.vadd[2].OUT)+sl.max.vadd[2].OUT)} {1650.}
(assert (= (+ (+ (* sc_32 62.4) of_32) sltop_32) 1650.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[2].OUT2*156.25)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_33 156.25) of_33) sltop_33) 3300.))
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_36 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_38 0.))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].B)}
(assert (= sc_37 (* 1. sc_38)))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].C)} {(1.*sc.vadd[7].D)}
(assert (and (= sc_37 (* 1. sc_36)) (= sc_37 (* 1. sc_35))))
; no offset
(assert (= (- (+ of_37 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT} {(sc.vadd[7].A*1.)}
(assert (= sc_39 (* sc_37 1.)))
; 
; =  {of.vadd[7].OUT} {0.}
(assert (= of_39 0.))
; no scale
(assert (= sc_35 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= of_40 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_36 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_38 0.))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].B)}
(assert (= sc_37 (* 1. sc_38)))
; 
; =  {sc.vadd[7].A} {(1.*sc.vadd[7].C)} {(1.*sc.vadd[7].D*sc.vadd[7].OUT2)}
(assert (and (= sc_37 (* 1. sc_36)) (= sc_37 (* (* 1. sc_35) sc_40))))
; no offset
(assert (= (- (+ of_37 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT2} {(sc.vadd[7].A*1.)}
(assert (= sc_40 (* sc_37 1.)))
; no offset
(assert (= of_40 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[7].OUT2_0} {(sc.vadd[7].A*1.)}
(assert (= sc_34 (* sc_37 1.)))
; 
; =  {of.vadd[7].OUT2_0} {0.}
(assert (= of_34 0.))
; 
; >=  {((sc.vadd[7].OUT2_0*0.)+of.vadd[7].OUT2_0)} {3300.}
(assert (<= (+ (* sc_34 0.) of_34) 3300.))
; 
; <=  {((sc.vadd[7].OUT2_0*0.)+of.vadd[7].OUT2_0)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.vadd[7].D*4.)+of.vadd[7].D)} {3300.}
(assert (<= (+ (* sc_35 4.) of_35) 3300.))
; 
; <=  {((sc.vadd[7].D*4.)+of.vadd[7].D)} {0.}
(assert (>= (+ (* sc_35 4.) of_35) 0.))
; 
; >=  {((sc.vadd[7].C*0.)+of.vadd[7].C)} {3300.}
(assert (<= (+ (* sc_36 0.) of_36) 3300.))
; 
; <=  {((sc.vadd[7].C*0.)+of.vadd[7].C)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
; 
; >=  {((sc.vadd[7].A*0.)+of.vadd[7].A)} {3300.}
(assert (<= (+ (* sc_37 0.) of_37) 3300.))
; 
; <=  {((sc.vadd[7].A*0.)+of.vadd[7].A)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.vadd[7].OUT2*0.)+of.vadd[7].OUT2)+sl.min.vadd[7].OUT2)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) 0.))
; 
; =  {(((sc.vadd[7].OUT2*15.6)+of.vadd[7].OUT2)+sl.max.vadd[7].OUT2)} {3300.}
(assert (= (+ (+ (* sc_40 15.6) of_40) sltop_40) 3300.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.vadd[7].B*0.00204799328914)+of.vadd[7].B)+sl.min.vadd[7].B)} {0.}
(assert (= (+ (+ (* sc_38 0.00204799328914) of_38) slbot_38) 0.))
; 
; =  {(((sc.vadd[7].B*625.)+of.vadd[7].B)+sl.max.vadd[7].B)} {3300.}
(assert (= (+ (+ (* sc_38 625.) of_38) sltop_38) 3300.))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.vadd[7].OUT*0.00204799328914)+of.vadd[7].OUT)+sl.min.vadd[7].OUT)} {-1650.}
(assert (= (+ (+ (* sc_39 0.00204799328914) of_39) slbot_39) -1650.))
; 
; =  {(((sc.vadd[7].OUT*625.)+of.vadd[7].OUT)+sl.max.vadd[7].OUT)} {1650.}
(assert (= (+ (+ (* sc_39 625.) of_39) sltop_39) 1650.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.vadd[7].OUT2*0.)+of.vadd[7].OUT2)+sl.min.vadd[7].OUT2)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) 0.))
; 
; =  {(((sc.vadd[7].OUT2*15.6)+of.vadd[7].OUT2)+sl.max.vadd[7].OUT2)} {3300.}
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
; no offset
(assert (= of_42 0.))
; no offset
(assert (= of_43 0.))
; no scale
(assert (= (/ sc_42 sc_43) 1.))
; no scale
(assert (= sc_41 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= of_43 0.))
; no scale
(assert (= (/ sc_42 sc_43) 1.))
; no scale
(assert (= sc_41 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_45 (* sc_44 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_45 0.))
; no scale
(assert (= sc_43 1.))
; no scale
(assert (= (* sc_41 1.) 1.))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_43 1.))
; no scale
(assert (= (* sc_41 1.) 1.))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= 0. 0.))
; no scale
(assert (= sc_42 1.))
; no scale
(assert (= sc_41 1.))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= of_41 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_46 (* sc_44 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_46 0.))
; 
; >=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_41 2.5) of_41) 5.))
; 
; <=  {((sc.ihill[0].n*2.5)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_41 2.5) of_41) 1.))
(declare-fun slbot_42 () Real)
(declare-fun sltop_42 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42) 1.))
; 
; =  {(((sc.ihill[0].S*156.25)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_42 156.25) of_42) sltop_42) 10.))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.ihill[0].REP*0.000511998322284)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {9.999900001e-10}
(assert (= (+ (+ (* sc_46 0.000511998322284) of_46) slbot_46) 9.999900001e-10))
; 
; =  {(((sc.ihill[0].REP*156.25)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {5.}
(assert (= (+ (+ (* sc_46 156.25) of_46) sltop_46) 5.))
; 
; >=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_44 156.25) of_44) 10.))
; 
; <=  {((sc.ihill[0].Vmax*156.25)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_44 156.25) of_44) 0.0001))
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_48 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_47 0.))
; 
; =  {sc.vtoi[5].Y} {((1./sc.vtoi[5].K)*sc.vtoi[5].X)}
(assert (= sc_49 (* (/ 1. sc_48) sc_47)))
; 
; =  {of.vtoi[5].Y} {0.}
(assert (= of_49 0.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.vtoi[5].X*0.)+of.vtoi[5].X)+sl.min.vtoi[5].X)} {1.}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47) 1.))
; 
; =  {(((sc.vtoi[5].X*156.25)+of.vtoi[5].X)+sl.max.vtoi[5].X)} {3300.}
(assert (= (+ (+ (* sc_47 156.25) of_47) sltop_47) 3300.))
; 
; >=  {((sc.vtoi[5].K*1.)+of.vtoi[5].K)} {3300.}
(assert (<= (+ (* sc_48 1.) of_48) 3300.))
; 
; <=  {((sc.vtoi[5].K*1.)+of.vtoi[5].K)} {1.}
(assert (>= (+ (* sc_48 1.) of_48) 1.))
(declare-fun slbot_49 () Real)
(declare-fun sltop_49 () Real)
; 
; =  {(((sc.vtoi[5].Y*0.)+of.vtoi[5].Y)+sl.min.vtoi[5].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49) 0.00030303030303))
; 
; =  {(((sc.vtoi[5].Y*156.25)+of.vtoi[5].Y)+sl.max.vtoi[5].Y)} {3300.}
(assert (= (+ (+ (* sc_49 156.25) of_49) sltop_49) 3300.))
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
(assert (= of_51 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_50 0.))
; 
; =  {sc.vtoi[4].Y} {((1./sc.vtoi[4].K)*sc.vtoi[4].X)}
(assert (= sc_52 (* (/ 1. sc_51) sc_50)))
; 
; =  {of.vtoi[4].Y} {0.}
(assert (= of_52 0.))
; 
; >=  {((sc.vtoi[4].X*1.)+of.vtoi[4].X)} {3300.}
(assert (<= (+ (* sc_50 1.) of_50) 3300.))
; 
; <=  {((sc.vtoi[4].X*1.)+of.vtoi[4].X)} {1.}
(assert (>= (+ (* sc_50 1.) of_50) 1.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.vtoi[4].Y*0.)+of.vtoi[4].Y)+sl.min.vtoi[4].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) 0.00030303030303))
; 
; =  {(((sc.vtoi[4].Y*1.66666666667)+of.vtoi[4].Y)+sl.max.vtoi[4].Y)} {3300.}
(assert (= (+ (+ (* sc_52 1.66666666667) of_52) sltop_52) 3300.))
(declare-fun slbot_51 () Real)
(declare-fun sltop_51 () Real)
; 
; =  {(((sc.vtoi[4].K*0.)+of.vtoi[4].K)+sl.min.vtoi[4].K)} {1.}
(assert (= (+ (+ (* sc_51 0.) of_51) slbot_51) 1.))
; 
; =  {(((sc.vtoi[4].K*0.6)+of.vtoi[4].K)+sl.max.vtoi[4].K)} {3300.}
(assert (= (+ (+ (* sc_51 0.6) of_51) sltop_51) 3300.))
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
; no offset
(assert (= of_54 0.))
; no offset
(assert (= of_53 0.))
; 
; =  {1.} {(sc.igenebind[3].K*sc.igenebind[3].TF)}
(assert (= 1. (* sc_54 sc_53)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_55 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[3].GE} {(sc.igenebind[3].Vmax*(1./1.))}
(assert (= sc_56 (* sc_55 (/ 1. 1.))))
; 
; =  {of.igenebind[3].GE} {0.}
(assert (= of_56 0.))
; 
; >=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {10.}
(assert (<= (+ (* sc_53 1.) of_53) 10.))
; 
; <=  {((sc.igenebind[3].TF*1.)+of.igenebind[3].TF)} {0.0001}
(assert (>= (+ (* sc_53 1.) of_53) 0.0001))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.igenebind[3].K*0.)+of.igenebind[3].K)+sl.min.igenebind[3].K)} {0.0001}
(assert (= (+ (+ (* sc_54 0.) of_54) slbot_54) 0.0001))
; 
; =  {(((sc.igenebind[3].K*15.6)+of.igenebind[3].K)+sl.max.igenebind[3].K)} {10.}
(assert (= (+ (+ (* sc_54 15.6) of_54) sltop_54) 10.))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.igenebind[3].GE*0.939759036145)+of.igenebind[3].GE)+sl.min.igenebind[3].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_56 0.939759036145) of_56) slbot_56) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[3].GE*15.6)+of.igenebind[3].GE)+sl.max.igenebind[3].GE)} {9.9999999}
(assert (= (+ (+ (* sc_56 15.6) of_56) sltop_56) 9.9999999))
; 
; >=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {10.}
(assert (<= (+ (* sc_55 15.6) of_55) 10.))
; 
; <=  {((sc.igenebind[3].Vmax*15.6)+of.igenebind[3].Vmax)} {0.0001}
(assert (>= (+ (* sc_55 15.6) of_55) 0.0001))
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_58 sc_57))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_58 of_57))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_57 0.) of_57) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_58 0.) of_58) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_60 sc_59))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_60 of_59))
; 
; >=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_59 4.) of_59) 3300.))
; 
; <=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_59 4.) of_59) 0.))
; 
; >=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_60 4.) of_60) 3300.))
; 
; <=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_60 4.) of_60) 0.))
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_62 sc_61))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_62 of_61))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_61 0.) of_61) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_62 0.) of_62) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_63 1.) of_63) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_63 1.) of_63) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_64 1.) of_64) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_64 1.) of_64) 0.))
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_65 4.) of_65) 3300.))
; 
; <=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_65 4.) of_65) 0.))
; 
; >=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_66 4.) of_66) 3300.))
; 
; <=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_66 4.) of_66) 0.))
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_68 of_67))
(declare-fun slbot_67 () Real)
(declare-fun sltop_67 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_67 0.) of_67) slbot_67) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_67 0.6) of_67) sltop_67) 3300.))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_68 0.) of_68) slbot_68) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_68 0.6) of_68) sltop_68) 3300.))
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_70 of_69))
; 
; >=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_69 1.) of_69) 3300.))
; 
; <=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_69 1.) of_69) 0.))
; 
; >=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_70 1.) of_70) 3300.))
; 
; <=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_70 1.) of_70) 0.))
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.V[10].X*1000.75)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_71 1000.75) of_71) 3300.))
; 
; <=  {((sc.input.V[10].X*1000.75)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_71 1000.75) of_71) 0.))
; 
; >=  {((sc.input.V[10].O*1000.75)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_72 1000.75) of_72) 3300.))
; 
; <=  {((sc.input.V[10].O*1000.75)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_72 1000.75) of_72) 0.))
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_73 0.) of_73) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_74 0.) of_74) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_75 0.) of_75) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_76 0.) of_76) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_77 0.) of_77) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_78 0.) of_78) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_80 sc_79))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_80 of_79))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_80 0.) of_80) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_80 0.) of_80) 0.))
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_82 sc_81))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_82 of_81))
; 
; >=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_81 2.5) of_81) 3300.))
; 
; <=  {((sc.input.V[1].X*2.5)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_81 2.5) of_81) 0.))
; 
; >=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_82 2.5) of_82) 3300.))
; 
; <=  {((sc.input.V[1].O*2.5)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_82 2.5) of_82) 0.))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
; no offset
(assert (= of_84 0.))
; no offset
(assert (= of_83 0.))
; 
; =  {sc.itov[6].Y} {(sc.itov[6].K*sc.itov[6].X)}
(assert (= sc_85 (* sc_84 sc_83)))
; 
; =  {of.itov[6].Y} {0.}
(assert (= of_85 0.))
; 
; >=  {((sc.itov[6].X*4.)+of.itov[6].X)} {10.}
(assert (<= (+ (* sc_83 4.) of_83) 10.))
; 
; <=  {((sc.itov[6].X*4.)+of.itov[6].X)} {0.0001}
(assert (>= (+ (* sc_83 4.) of_83) 0.0001))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.itov[6].Y*0.00204799328914)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_85 0.00204799328914) of_85) slbot_85) 0.0001))
; 
; =  {(((sc.itov[6].Y*625.)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_85 625.) of_85) sltop_85) 3300.))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.itov[6].K*0.000511998322284)+of.itov[6].K)+sl.min.itov[6].K)} {1.}
(assert (= (+ (+ (* sc_84 0.000511998322284) of_84) slbot_84) 1.))
; 
; =  {(((sc.itov[6].K*156.25)+of.itov[6].K)+sl.max.itov[6].K)} {330.}
(assert (= (+ (+ (* sc_84 156.25) of_84) sltop_84) 330.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.itov[6].Y*0.00204799328914)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_85 0.00204799328914) of_85) slbot_85) 0.0001))
; 
; =  {(((sc.itov[6].Y*625.)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_85 625.) of_85) sltop_85) 3300.))
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
(assert (= of_87 0.))
; no offset
(assert (= of_86 0.))
; 
; =  {sc.itov[1].Y} {(sc.itov[1].K*sc.itov[1].X)}
(assert (= sc_88 (* sc_87 sc_86)))
; 
; =  {of.itov[1].Y} {0.}
(assert (= of_88 0.))
; 
; >=  {((sc.itov[1].X*4.)+of.itov[1].X)} {10.}
(assert (<= (+ (* sc_86 4.) of_86) 10.))
; 
; <=  {((sc.itov[1].X*4.)+of.itov[1].X)} {0.0001}
(assert (>= (+ (* sc_86 4.) of_86) 0.0001))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_88 3.75903614458) of_88) slbot_88) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_88 62.4) of_88) sltop_88) 3300.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.itov[1].K*0.939759036145)+of.itov[1].K)+sl.min.itov[1].K)} {1.}
(assert (= (+ (+ (* sc_87 0.939759036145) of_87) slbot_87) 1.))
; 
; =  {(((sc.itov[1].K*15.6)+of.itov[1].K)+sl.max.itov[1].K)} {330.}
(assert (= (+ (+ (* sc_87 15.6) of_87) sltop_87) 330.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.itov[1].Y*3.75903614458)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_88 3.75903614458) of_88) slbot_88) 0.0001))
; 
; =  {(((sc.itov[1].Y*62.4)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_88 62.4) of_88) sltop_88) 3300.))
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
; 
; =  {sc.iadd[0].A} {sc.iadd[0].B}
(assert (= sc_91 sc_92))
; 
; =  {sc.iadd[0].A} {sc.iadd[0].C} {sc.iadd[0].D}
(assert (and (= sc_91 sc_90) (= sc_91 sc_89)))
; 
; =  {sc.iadd[0].OUT} {sc.iadd[0].A}
(assert (= sc_93 sc_91))
; 
; =  {of.iadd[0].OUT} {((of.iadd[0].A+of.iadd[0].B)-of.iadd[0].C-of.iadd[0].D)}
(assert (= of_93 (- (+ of_91 of_92) (+ of_90 of_89))))
; 
; >=  {((sc.iadd[0].D*0.)+of.iadd[0].D)} {5.}
(assert (<= (+ (* sc_89 0.) of_89) 5.))
; 
; <=  {((sc.iadd[0].D*0.)+of.iadd[0].D)} {0.}
(assert (>= (+ (* sc_89 0.) of_89) 0.))
; 
; >=  {((sc.iadd[0].C*0.)+of.iadd[0].C)} {5.}
(assert (<= (+ (* sc_90 0.) of_90) 5.))
; 
; <=  {((sc.iadd[0].C*0.)+of.iadd[0].C)} {0.}
(assert (>= (+ (* sc_90 0.) of_90) 0.))
; 
; >=  {((sc.iadd[0].A*0.)+of.iadd[0].A)} {5.}
(assert (<= (+ (* sc_91 0.) of_91) 5.))
; 
; <=  {((sc.iadd[0].A*0.)+of.iadd[0].A)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.iadd[0].B*0.)+of.iadd[0].B)+sl.min.iadd[0].B)} {0.}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 0.))
; 
; =  {(((sc.iadd[0].B*15.6)+of.iadd[0].B)+sl.max.iadd[0].B)} {5.}
(assert (= (+ (+ (* sc_92 15.6) of_92) sltop_92) 5.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.iadd[0].OUT*0.)+of.iadd[0].OUT)+sl.min.iadd[0].OUT)} {-10.}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) -10.))
; 
; =  {(((sc.iadd[0].OUT*15.6)+of.iadd[0].OUT)+sl.max.iadd[0].OUT)} {10.}
(assert (= (+ (+ (* sc_93 15.6) of_93) sltop_93) 10.))
; 
; =  {sc.vadd[7].OUT2} {sc.output.V[1].X}
(assert (= sc_40 sc_25))
; 
; =  {of.vadd[7].OUT2} {of.output.V[1].X}
(assert (= of_40 of_25))
; 
; =  {sc.vadd[7].OUT2} {sc.switch[5].Vmax}
(assert (= sc_40 sc_3))
; 
; =  {of.vadd[7].OUT2} {of.switch[5].Vmax}
(assert (= of_40 of_3))
; 
; =  {sc.vadd[2].OUT2} {sc.vtoi[5].X}
(assert (= sc_33 sc_47))
; 
; =  {of.vadd[2].OUT2} {of.vtoi[5].X}
(assert (= of_33 of_47))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].X}
(assert (= sc_33 sc_23))
; 
; =  {of.vadd[2].OUT2} {of.output.V[0].X}
(assert (= of_33 of_23))
; 
; =  {sc.input.I[0].O} {sc.ihill[0].Vmax}
(assert (= sc_12 sc_44))
; 
; =  {of.input.I[0].O} {of.ihill[0].Vmax}
(assert (= of_12 of_44))
; 
; =  {sc.input.V[9].O} {sc.vadd[7].D}
(assert (= sc_66 sc_35))
; 
; =  {of.input.V[9].O} {of.vadd[7].D}
(assert (= of_66 of_35))
; 
; =  {sc.ihill[0].REP} {sc.itov[6].K}
(assert (= sc_46 sc_84))
; 
; =  {of.ihill[0].REP} {of.itov[6].K}
(assert (= of_46 of_84))
; 
; =  {sc.itov[1].Y} {sc.vadd[2].B}
(assert (= sc_88 sc_31))
; 
; =  {of.itov[1].Y} {of.vadd[2].B}
(assert (= of_88 of_31))
; 
; =  {sc.vtoi[5].Y} {sc.ihill[0].S}
(assert (= sc_49 sc_42))
; 
; =  {of.vtoi[5].Y} {of.ihill[0].S}
(assert (= of_49 of_42))
; 
; =  {sc.input.I[9].O} {sc.iadd[0].C}
(assert (= sc_8 sc_90))
; 
; =  {of.input.I[9].O} {of.iadd[0].C}
(assert (= of_8 of_90))
; 
; =  {sc.input.V[13].O} {sc.vtoi[5].K}
(assert (= sc_64 sc_48))
; 
; =  {of.input.V[13].O} {of.vtoi[5].K}
(assert (= of_64 of_48))
; 
; =  {sc.input.I[3].O} {sc.itov[1].X}
(assert (= sc_16 sc_86))
; 
; =  {of.input.I[3].O} {of.itov[1].X}
(assert (= of_16 of_86))
; 
; =  {sc.input.I[4].O} {sc.itov[6].X}
(assert (= sc_18 sc_83))
; 
; =  {of.input.I[4].O} {of.itov[6].X}
(assert (= of_18 of_83))
; 
; =  {sc.input.I[5].O} {sc.igenebind[3].TF}
(assert (= sc_20 sc_53))
; 
; =  {of.input.I[5].O} {of.igenebind[3].TF}
(assert (= of_20 of_53))
; 
; =  {sc.input.V[11].O} {sc.vtoi[4].X}
(assert (= sc_70 sc_50))
; 
; =  {of.input.V[11].O} {of.vtoi[4].X}
(assert (= of_70 of_50))
; 
; =  {sc.input.V[8].O} {sc.vadd[2].D}
(assert (= sc_60 sc_28))
; 
; =  {of.input.V[8].O} {of.vadd[2].D}
(assert (= of_60 of_28))
; 
; =  {sc.input.I[2].O} {sc.igenebind[3].Vmax}
(assert (= sc_6 sc_55))
; 
; =  {of.input.I[2].O} {of.igenebind[3].Vmax}
(assert (= of_6 of_55))
; 
; =  {sc.input.V[3].O} {sc.vadd[2].C}
(assert (= sc_76 sc_29))
; 
; =  {of.input.V[3].O} {of.vadd[2].C}
(assert (= of_76 of_29))
; 
; =  {sc.input.V[2].O} {sc.vadd[2].A}
(assert (= sc_58 sc_30))
; 
; =  {of.input.V[2].O} {of.vadd[2].A}
(assert (= of_58 of_30))
; 
; =  {sc.iadd[0].OUT} {sc.igenebind[3].K}
(assert (= sc_93 sc_54))
; 
; =  {of.iadd[0].OUT} {of.igenebind[3].K}
(assert (= of_93 of_54))
; 
; =  {sc.input.I[10].O} {sc.iadd[0].D}
(assert (= sc_14 sc_89))
; 
; =  {of.input.I[10].O} {of.iadd[0].D}
(assert (= of_14 of_89))
; 
; =  {sc.input.I[1].O} {sc.switch[5].SUB}
(assert (= sc_22 sc_1))
; 
; =  {of.input.I[1].O} {of.switch[5].SUB}
(assert (= of_22 of_1))
; 
; =  {sc.input.V[1].O} {sc.ihill[0].n}
(assert (= sc_82 sc_41))
; 
; =  {of.input.V[1].O} {of.ihill[0].n}
(assert (= of_82 of_41))
; 
; =  {sc.input.V[7].O} {sc.vadd[2].OUT2_0}
(assert (= sc_62 sc_27))
; 
; =  {of.input.V[7].O} {of.vadd[2].OUT2_0}
(assert (= of_62 of_27))
; 
; =  {sc.itov[6].Y} {sc.vadd[7].B}
(assert (= sc_85 sc_38))
; 
; =  {of.itov[6].Y} {of.vadd[7].B}
(assert (= of_85 of_38))
; 
; =  {sc.switch[5].PROD} {sc.iadd[0].B}
(assert (= sc_4 sc_92))
; 
; =  {of.switch[5].PROD} {of.iadd[0].B}
(assert (= of_4 of_92))
; 
; =  {sc.igenebind[3].GE} {sc.itov[1].K}
(assert (= sc_56 sc_87))
; 
; =  {of.igenebind[3].GE} {of.itov[1].K}
(assert (= of_56 of_87))
; 
; =  {sc.input.V[10].O} {sc.switch[5].n}
(assert (= sc_72 sc_0))
; 
; =  {of.input.V[10].O} {of.switch[5].n}
(assert (= of_72 of_0))
; 
; =  {sc.input.V[0].O} {sc.vtoi[4].K}
(assert (= sc_68 sc_51))
; 
; =  {of.input.V[0].O} {of.vtoi[4].K}
(assert (= of_68 of_51))
; 
; =  {sc.input.V[4].O} {sc.vadd[7].C}
(assert (= sc_78 sc_36))
; 
; =  {of.input.V[4].O} {of.vadd[7].C}
(assert (= of_78 of_36))
; 
; =  {sc.input.V[5].O} {sc.vadd[7].A}
(assert (= sc_80 sc_37))
; 
; =  {of.input.V[5].O} {of.vadd[7].A}
(assert (= of_80 of_37))
; 
; =  {sc.input.V[6].O} {sc.vadd[7].OUT2_0}
(assert (= sc_74 sc_34))
; 
; =  {of.input.V[6].O} {of.vadd[7].OUT2_0}
(assert (= of_74 of_34))
; 
; =  {sc.input.I[11].O} {sc.iadd[0].A}
(assert (= sc_10 sc_91))
; 
; =  {of.input.I[11].O} {of.iadd[0].A}
(assert (= of_10 of_91))
; 
; =  {sc.vtoi[4].Y} {sc.switch[5].Kmod}
(assert (= sc_52 sc_2))
; 
; =  {of.vtoi[4].Y} {of.switch[5].Kmod}
(assert (= of_52 of_2))
(assert (<= (* (/ 1. sc_24) 0.001) 0.1))
(assert (<= (* (/ 1. sc_26) 0.001) 0.1))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[0].O} {sc.vadd[7].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_33 sc_24) (= sc_33 sc_40)) (= sc_33 sc_26)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_92 0.) slbot_92 (- slbot_92)) (ite (>= sltop_23 0.) sltop_23 (- sltop_23))) (ite (>= slbot_32 0.) slbot_32 (- slbot_32))) (ite (>= sltop_52 0.) sltop_52 (- sltop_52))) (ite (>= sltop_87 0.) sltop_87 (- sltop_87))) (ite (>= sltop_32 0.) sltop_32 (- sltop_32))) (ite (>= slbot_49 0.) slbot_49 (- slbot_49))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= sltop_4 0.) sltop_4 (- sltop_4))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_42 0.) sltop_42 (- sltop_42))) (ite (>= slbot_46 0.) slbot_46 (- slbot_46))) (ite (>= slbot_84 0.) slbot_84 (- slbot_84))) (ite (>= slbot_26 0.) slbot_26 (- slbot_26))) (ite (>= sltop_54 0.) sltop_54 (- sltop_54))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= sltop_38 0.) sltop_38 (- sltop_38))) (ite (>= sltop_67 0.) sltop_67 (- sltop_67))) (ite (>= sltop_39 0.) sltop_39 (- sltop_39))) (ite (>= sltop_49 0.) sltop_49 (- sltop_49))) (ite (>= sltop_92 0.) sltop_92 (- sltop_92))) (ite (>= slbot_31 0.) slbot_31 (- slbot_31))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= slbot_25 0.) slbot_25 (- slbot_25))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_24 0.) sltop_24 (- sltop_24))) (ite (>= sltop_31 0.) sltop_31 (- sltop_31))) (ite (>= slbot_24 0.) slbot_24 (- slbot_24))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= slbot_67 0.) slbot_67 (- slbot_67))) (ite (>= slbot_4 0.) slbot_4 (- slbot_4))) (ite (>= slbot_52 0.) slbot_52 (- slbot_52))) (ite (>= slbot_54 0.) slbot_54 (- slbot_54))) (ite (>= slbot_56 0.) slbot_56 (- slbot_56))) (ite (>= sltop_56 0.) sltop_56 (- sltop_56))) (ite (>= slbot_51 0.) slbot_51 (- slbot_51))) (ite (>= sltop_51 0.) sltop_51 (- sltop_51))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= slbot_68 0.) slbot_68 (- slbot_68))) (ite (>= sltop_47 0.) sltop_47 (- sltop_47))) (ite (>= slbot_87 0.) slbot_87 (- slbot_87))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= slbot_38 0.) slbot_38 (- slbot_38))) (ite (>= slbot_42 0.) slbot_42 (- slbot_42))) (ite (>= sltop_46 0.) sltop_46 (- sltop_46))) (ite (>= sltop_68 0.) sltop_68 (- sltop_68))) (ite (>= slbot_23 0.) slbot_23 (- slbot_23))) (ite (>= sltop_25 0.) sltop_25 (- sltop_25))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_26 0.) sltop_26 (- sltop_26))) (ite (>= sltop_40 0.) sltop_40 (- sltop_40))) (ite (>= slbot_39 0.) slbot_39 (- slbot_39))) (ite (>= slbot_47 0.) slbot_47 (- slbot_47))) (ite (>= sltop_84 0.) sltop_84 (- sltop_84))) (ite (>= slbot_33 0.) slbot_33 (- slbot_33))) (ite (>= sltop_33 0.) sltop_33 (- sltop_33))) (ite (>= slbot_40 0.) slbot_40 (- slbot_40)))))
(check-sat)
