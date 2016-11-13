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
; =  {(sc.switch[9].SUB/sc.switch[9].Kmod)} {1.}
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
; =  {sc.switch[9].PROD} {(sc.switch[9].Vmax/1.)}
(assert (= sc_4 (/ sc_3 1.)))
; 
; =  {of.switch[9].PROD} {0.}
(assert (= of_4 0.))
; 
; >=  {((sc.switch[9].n*-500.)+of.switch[9].n)} {3300.}
(assert (<= (+ (* sc_0 -500.) of_0) 3300.))
; 
; <=  {((sc.switch[9].n*-500.)+of.switch[9].n)} {500.}
(assert (>= (+ (* sc_0 -500.) of_0) 500.))
; 
; >=  {((sc.switch[9].SUB*4.05)+of.switch[9].SUB)} {10.}
(assert (<= (+ (* sc_1 4.05) of_1) 10.))
; 
; <=  {((sc.switch[9].SUB*4.05)+of.switch[9].SUB)} {0.0001}
(assert (>= (+ (* sc_1 4.05) of_1) 0.0001))
; 
; >=  {((sc.switch[9].Kmod*1.)+of.switch[9].Kmod)} {10.}
(assert (<= (+ (* sc_2 1.) of_2) 10.))
; 
; <=  {((sc.switch[9].Kmod*1.)+of.switch[9].Kmod)} {0.0001}
(assert (>= (+ (* sc_2 1.) of_2) 0.0001))
(declare-fun slbot_4_1 () Real)
(assert (<= slbot_4_1 1e-08))
(declare-fun sltop_4_1 () Real)
(assert (>= sltop_4_1 1e-08))
; 
; =  {(((sc.switch[9].PROD*0.)+of.switch[9].PROD)+sl.min.switch[9].PROD.1)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4_1) 9.99934002508e-38))
; 
; =  {(((sc.switch[9].PROD*5.05)+of.switch[9].PROD)+sl.max.switch[9].PROD.1)} {9.999900001}
(assert (= (+ (+ (* sc_4 5.05) of_4) sltop_4_1) 9.999900001))
(declare-fun slbot_3_1 () Real)
(assert (<= slbot_3_1 1e-08))
(declare-fun sltop_3_1 () Real)
(assert (>= sltop_3_1 1e-08))
; 
; =  {(((sc.switch[9].Vmax*0.)+of.switch[9].Vmax)+sl.min.switch[9].Vmax.1)} {0.0001}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3_1) 0.0001))
; 
; =  {(((sc.switch[9].Vmax*1.)+of.switch[9].Vmax)+sl.max.switch[9].Vmax.1)} {10.}
(assert (= (+ (+ (* sc_3 1.) of_3) sltop_3_1) 10.))
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
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_8 sc_7))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_8 of_7))
; 
; >=  {((sc.input.I[7].X*1.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_7 1.) of_7) 10.))
; 
; <=  {((sc.input.I[7].X*1.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_7 1.) of_7) 0.))
; 
; >=  {((sc.input.I[7].O*1.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_8 1.) of_8) 10.))
; 
; <=  {((sc.input.I[7].O*1.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_8 1.) of_8) 0.))
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_10 sc_9))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_10 of_9))
; 
; >=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_9 0.) of_9) 10.))
; 
; <=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_9 0.) of_9) 0.))
; 
; >=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_10 0.) of_10) 10.))
; 
; <=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_10 0.) of_10) 0.))
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_12 sc_11))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_12 of_11))
; 
; >=  {((sc.input.I[6].X*0.42)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_11 0.42) of_11) 10.))
; 
; <=  {((sc.input.I[6].X*0.42)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_11 0.42) of_11) 0.))
; 
; >=  {((sc.input.I[6].O*0.42)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_12 0.42) of_12) 10.))
; 
; <=  {((sc.input.I[6].O*0.42)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_12 0.42) of_12) 0.))
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_14 sc_13))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_14 of_13))
; 
; >=  {((sc.input.I[3].X*4.05)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_13 4.05) of_13) 10.))
; 
; <=  {((sc.input.I[3].X*4.05)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_13 4.05) of_13) 0.))
; 
; >=  {((sc.input.I[3].O*4.05)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_14 4.05) of_14) 10.))
; 
; <=  {((sc.input.I[3].O*4.05)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_14 4.05) of_14) 0.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[4].X*4.63)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_15 4.63) of_15) 10.))
; 
; <=  {((sc.input.I[4].X*4.63)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_15 4.63) of_15) 0.))
; 
; >=  {((sc.input.I[4].O*4.63)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_16 4.63) of_16) 10.))
; 
; <=  {((sc.input.I[4].O*4.63)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_16 4.63) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[5].X*25.232)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_17 25.232) of_17) 10.))
; 
; <=  {((sc.input.I[5].X*25.232)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_17 25.232) of_17) 0.))
; 
; >=  {((sc.input.I[5].O*25.232)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_18 25.232) of_18) 10.))
; 
; <=  {((sc.input.I[5].O*25.232)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_18 25.232) of_18) 0.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_22 sc_21))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_22 of_21))
(declare-fun slbot_21_1 () Real)
(assert (<= slbot_21_1 1e-08))
(declare-fun sltop_21_1 () Real)
(assert (>= sltop_21_1 1e-08))
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X.1)} {0.}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21_1) 0.))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_21 1.) of_21) sltop_21_1) 3300.))
(declare-fun slbot_22_1 () Real)
(assert (<= slbot_22_1 1e-08))
(declare-fun sltop_22_1 () Real)
(assert (>= sltop_22_1 1e-08))
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O.1)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22_1) 0.))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_22 1.) of_22) sltop_22_1) 3300.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_25 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_27 0.))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_26 (* 1. sc_27)))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D)}
(assert (and (= sc_26 (* 1. sc_25)) (= sc_26 (* 1. sc_24))))
; no offset
(assert (= (- (+ of_26 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT} {(sc.vadd[8].A*1.)}
(assert (= sc_28 (* sc_26 1.)))
; 
; =  {of.vadd[8].OUT} {0.}
(assert (= of_28 0.))
; no scale
(assert (= sc_24 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_25 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_27 0.))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_26 (* 1. sc_27)))
; no offset
(assert (= (+ of_26 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[8].A*1.)} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D*sc.vadd[8].OUT2)}
(assert (and (= (* sc_26 1.) (* 1. sc_25)) (= (* sc_26 1.) (* (* 1. sc_24) sc_29))))
; 
; =  {sc.vadd[8].OUT2} {(sc.vadd[8].A*1.)}
(assert (= sc_29 (* sc_26 1.)))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT2_0} {(sc.vadd[8].A*1.)}
(assert (= sc_23 (* sc_26 1.)))
; 
; =  {of.vadd[8].OUT2_0} {(0.-0.-0.)}
(assert (= of_23 0.))
; 
; >=  {((sc.vadd[8].OUT2_0*0.)+of.vadd[8].OUT2_0)} {3300.}
(assert (<= (+ (* sc_23 0.) of_23) 3300.))
; 
; <=  {((sc.vadd[8].OUT2_0*0.)+of.vadd[8].OUT2_0)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
; 
; >=  {((sc.vadd[8].D*0.)+of.vadd[8].D)} {3300.}
(assert (<= (+ (* sc_24 0.) of_24) 3300.))
; 
; <=  {((sc.vadd[8].D*0.)+of.vadd[8].D)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {3300.}
(assert (<= (+ (* sc_25 0.) of_25) 3300.))
; 
; <=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
; 
; >=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {3300.}
(assert (<= (+ (* sc_26 0.) of_26) 3300.))
; 
; <=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
(declare-fun slbot_29_1 () Real)
(assert (<= slbot_29_1 1e-08))
(declare-fun sltop_29_1 () Real)
(assert (>= sltop_29_1 1e-08))
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29_1) 0.))
; 
; =  {(((sc.vadd[8].OUT2*1.)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_29 1.) of_29) sltop_29_1) 3300.))
(declare-fun slbot_27_1 () Real)
(assert (<= slbot_27_1 1e-08))
(declare-fun sltop_27_1 () Real)
(assert (>= sltop_27_1 1e-08))
; 
; =  {(((sc.vadd[8].B*0.)+of.vadd[8].B)+sl.min.vadd[8].B.1)} {0.}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27_1) 0.))
; 
; =  {(((sc.vadd[8].B*0.42)+of.vadd[8].B)+sl.max.vadd[8].B.1)} {3300.}
(assert (= (+ (+ (* sc_27 0.42) of_27) sltop_27_1) 3300.))
(declare-fun slbot_28_1 () Real)
(assert (<= slbot_28_1 1e-08))
(declare-fun sltop_28_1 () Real)
(assert (>= sltop_28_1 1e-08))
; 
; =  {(((sc.vadd[8].OUT*0.)+of.vadd[8].OUT)+sl.min.vadd[8].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28_1) -1650.))
; 
; =  {(((sc.vadd[8].OUT*0.42)+of.vadd[8].OUT)+sl.max.vadd[8].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_28 0.42) of_28) sltop_28_1) 1650.))
(declare-fun slbot_29_1 () Real)
(assert (<= slbot_29_1 1e-08))
(declare-fun sltop_29_1 () Real)
(assert (>= sltop_29_1 1e-08))
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29_1) 0.))
; 
; =  {(((sc.vadd[8].OUT2*1.)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_29 1.) of_29) sltop_29_1) 3300.))
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
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_32 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_34 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_33 (* 1. sc_34)))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D)}
(assert (and (= sc_33 (* 1. sc_32)) (= sc_33 (* 1. sc_31))))
; no offset
(assert (= (- (+ of_33 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT} {(sc.vadd[10].A*1.)}
(assert (= sc_35 (* sc_33 1.)))
; 
; =  {of.vadd[10].OUT} {0.}
(assert (= of_35 0.))
; no scale
(assert (= sc_31 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; no offset
(assert (= of_36 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_32 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_34 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_33 (* 1. sc_34)))
; no offset
(assert (= (+ of_33 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[10].A*1.)} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D*sc.vadd[10].OUT2)}
(assert (and (= (* sc_33 1.) (* 1. sc_32)) (= (* sc_33 1.) (* (* 1. sc_31) sc_36))))
; 
; =  {sc.vadd[10].OUT2} {(sc.vadd[10].A*1.)}
(assert (= sc_36 (* sc_33 1.)))
; no offset
(assert (= of_36 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT2_0} {(sc.vadd[10].A*1.)}
(assert (= sc_30 (* sc_33 1.)))
; 
; =  {of.vadd[10].OUT2_0} {(0.-0.-0.)}
(assert (= of_30 0.))
; 
; >=  {((sc.vadd[10].OUT2_0*0.124)+of.vadd[10].OUT2_0)} {3300.}
(assert (<= (+ (* sc_30 0.124) of_30) 3300.))
; 
; <=  {((sc.vadd[10].OUT2_0*0.124)+of.vadd[10].OUT2_0)} {0.}
(assert (>= (+ (* sc_30 0.124) of_30) 0.))
(declare-fun slbot_31_1 () Real)
(assert (<= slbot_31_1 1e-08))
(declare-fun sltop_31_1 () Real)
(assert (>= sltop_31_1 1e-08))
; 
; =  {(((sc.vadd[10].D*0.)+of.vadd[10].D)+sl.min.vadd[10].D.1)} {0.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31_1) 0.))
; 
; =  {(((sc.vadd[10].D*3.154)+of.vadd[10].D)+sl.max.vadd[10].D.1)} {3300.}
(assert (= (+ (+ (* sc_31 3.154) of_31) sltop_31_1) 3300.))
; 
; >=  {((sc.vadd[10].C*0.)+of.vadd[10].C)} {3300.}
(assert (<= (+ (* sc_32 0.) of_32) 3300.))
; 
; <=  {((sc.vadd[10].C*0.)+of.vadd[10].C)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
; 
; >=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
(declare-fun slbot_36_1 () Real)
(assert (<= slbot_36_1 1e-08))
(declare-fun sltop_36_1 () Real)
(assert (>= sltop_36_1 1e-08))
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36_1) 0.))
; 
; =  {(((sc.vadd[10].OUT2*1.)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_36 1.) of_36) sltop_36_1) 3300.))
(declare-fun slbot_34_1 () Real)
(assert (<= slbot_34_1 1e-08))
(declare-fun sltop_34_1 () Real)
(assert (>= sltop_34_1 1e-08))
; 
; =  {(((sc.vadd[10].B*0.)+of.vadd[10].B)+sl.min.vadd[10].B.1)} {0.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34_1) 0.))
; 
; =  {(((sc.vadd[10].B*5.05)+of.vadd[10].B)+sl.max.vadd[10].B.1)} {3300.}
(assert (= (+ (+ (* sc_34 5.05) of_34) sltop_34_1) 3300.))
(declare-fun slbot_35_1 () Real)
(assert (<= slbot_35_1 1e-08))
(declare-fun sltop_35_1 () Real)
(assert (>= sltop_35_1 1e-08))
; 
; =  {(((sc.vadd[10].OUT*0.)+of.vadd[10].OUT)+sl.min.vadd[10].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35_1) -1650.))
; 
; =  {(((sc.vadd[10].OUT*3.154)+of.vadd[10].OUT)+sl.max.vadd[10].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_35 3.154) of_35) sltop_35_1) 1650.))
(declare-fun slbot_36_1 () Real)
(assert (<= slbot_36_1 1e-08))
(declare-fun sltop_36_1 () Real)
(assert (>= sltop_36_1 1e-08))
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36_1) 0.))
; 
; =  {(((sc.vadd[10].OUT2*1.)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_36 1.) of_36) sltop_36_1) 3300.))
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
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_40 (* 1. sc_41)))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D)}
(assert (and (= sc_40 (* 1. sc_39)) (= sc_40 (* 1. sc_38))))
; no offset
(assert (= (- (+ of_40 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1.)}
(assert (= sc_42 (* sc_40 1.)))
; 
; =  {of.vadd[6].OUT} {0.}
(assert (= of_42 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; 
; =  {sc.vadd[6].A} {(1.*sc.vadd[6].B)}
(assert (= sc_40 (* 1. sc_41)))
; no offset
(assert (= (+ of_40 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[6].A*1.)} {(1.*sc.vadd[6].C)} {(1.*sc.vadd[6].D*sc.vadd[6].OUT2)}
(assert (and (= (* sc_40 1.) (* 1. sc_39)) (= (* sc_40 1.) (* (* 1. sc_38) sc_43))))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1.)}
(assert (= sc_43 (* sc_40 1.)))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1.)}
(assert (= sc_37 (* sc_40 1.)))
; 
; =  {of.vadd[6].OUT2_0} {(0.-0.-0.)}
(assert (= of_37 0.))
(declare-fun slbot_42_1 () Real)
(assert (<= slbot_42_1 1e-08))
(declare-fun sltop_42_1 () Real)
(assert (>= sltop_42_1 1e-08))
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT.1)} {0.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42_1) 0.))
; 
; =  {(((sc.vadd[6].OUT*6.308)+of.vadd[6].OUT)+sl.max.vadd[6].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_42 6.308) of_42) sltop_42_1) 1650.))
(declare-fun slbot_40_1 () Real)
(assert (<= slbot_40_1 1e-08))
(declare-fun sltop_40_1 () Real)
(assert (>= sltop_40_1 1e-08))
; 
; =  {(((sc.vadd[6].A*0.)+of.vadd[6].A)+sl.min.vadd[6].A.1)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40_1) 0.))
; 
; =  {(((sc.vadd[6].A*25.232)+of.vadd[6].A)+sl.max.vadd[6].A.1)} {3300.}
(assert (= (+ (+ (* sc_40 25.232) of_40) sltop_40_1) 3300.))
; 
; >=  {((sc.vadd[6].B*0.)+of.vadd[6].B)} {3300.}
(assert (<= (+ (* sc_41 0.) of_41) 3300.))
; 
; <=  {((sc.vadd[6].B*0.)+of.vadd[6].B)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun slbot_42_1 () Real)
(assert (<= slbot_42_1 1e-08))
(declare-fun sltop_42_1 () Real)
(assert (>= sltop_42_1 1e-08))
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT.1)} {0.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42_1) 0.))
; 
; =  {(((sc.vadd[6].OUT*6.308)+of.vadd[6].OUT)+sl.max.vadd[6].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_42 6.308) of_42) sltop_42_1) 1650.))
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
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_46 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_48 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_47 (* 1. sc_48)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D)}
(assert (and (= sc_47 (* 1. sc_46)) (= sc_47 (* 1. sc_45))))
; no offset
(assert (= (- (+ of_47 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1.)}
(assert (= sc_49 (* sc_47 1.)))
; 
; =  {of.vadd[4].OUT} {0.}
(assert (= of_49 0.))
; no scale
(assert (= sc_45 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= of_50 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_46 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_48 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_47 (* 1. sc_48)))
; no offset
(assert (= (+ of_47 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[4].A*1.)} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D*sc.vadd[4].OUT2)}
(assert (and (= (* sc_47 1.) (* 1. sc_46)) (= (* sc_47 1.) (* (* 1. sc_45) sc_50))))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1.)}
(assert (= sc_50 (* sc_47 1.)))
; no offset
(assert (= of_50 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1.)}
(assert (= sc_44 (* sc_47 1.)))
; 
; =  {of.vadd[4].OUT2_0} {(0.-0.-0.)}
(assert (= of_44 0.))
; 
; >=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_44 0.) of_44) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.vadd[4].D*2.525)+of.vadd[4].D)} {3300.}
(assert (<= (+ (* sc_45 2.525) of_45) 3300.))
; 
; <=  {((sc.vadd[4].D*2.525)+of.vadd[4].D)} {0.}
(assert (>= (+ (* sc_45 2.525) of_45) 0.))
; 
; >=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {3300.}
(assert (<= (+ (* sc_46 0.) of_46) 3300.))
; 
; <=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_47 0.) of_47) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
(declare-fun slbot_50_1 () Real)
(assert (<= slbot_50_1 1e-08))
(declare-fun sltop_50_1 () Real)
(assert (>= sltop_50_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_50 0.) of_50) slbot_50_1) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_50 1.) of_50) sltop_50_1) 3300.))
(declare-fun slbot_48_1 () Real)
(assert (<= slbot_48_1 1e-08))
(declare-fun sltop_48_1 () Real)
(assert (>= sltop_48_1 1e-08))
; 
; =  {(((sc.vadd[4].B*0.)+of.vadd[4].B)+sl.min.vadd[4].B.1)} {0.}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48_1) 0.))
; 
; =  {(((sc.vadd[4].B*6.308)+of.vadd[4].B)+sl.max.vadd[4].B.1)} {3300.}
(assert (= (+ (+ (* sc_48 6.308) of_48) sltop_48_1) 3300.))
(declare-fun slbot_49_1 () Real)
(assert (<= slbot_49_1 1e-08))
(declare-fun sltop_49_1 () Real)
(assert (>= sltop_49_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49_1) -1650.))
; 
; =  {(((sc.vadd[4].OUT*6.308)+of.vadd[4].OUT)+sl.max.vadd[4].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_49 6.308) of_49) sltop_49_1) 1650.))
(declare-fun slbot_50_1 () Real)
(assert (<= slbot_50_1 1e-08))
(declare-fun sltop_50_1 () Real)
(assert (>= sltop_50_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_50 0.) of_50) slbot_50_1) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_50 1.) of_50) sltop_50_1) 3300.))
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
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_52 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_53 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_55 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_54 (* 1. sc_55)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_54 (* 1. sc_53)) (= sc_54 (* 1. sc_52))))
; no offset
(assert (= (- (+ of_54 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_56 (* sc_54 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_56 0.))
; no scale
(assert (= sc_52 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_52 0.))
; no offset
(assert (= of_57 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_53 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_55 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_54 (* 1. sc_55)))
; no offset
(assert (= (+ of_54 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[1].A*1.)} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= (* sc_54 1.) (* 1. sc_53)) (= (* sc_54 1.) (* (* 1. sc_52) sc_57))))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_57 (* sc_54 1.)))
; no offset
(assert (= of_57 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_51 (* sc_54 1.)))
; 
; =  {of.vadd[1].OUT2_0} {(0.-0.-0.)}
(assert (= of_51 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.256)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_51 0.256) of_51) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.256)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_51 0.256) of_51) 0.))
(declare-fun slbot_52_1 () Real)
(assert (<= slbot_52_1 1e-08))
(declare-fun sltop_52_1 () Real)
(assert (>= sltop_52_1 1e-08))
; 
; =  {(((sc.vadd[1].D*0.)+of.vadd[1].D)+sl.min.vadd[1].D.1)} {0.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52_1) 0.))
; 
; =  {(((sc.vadd[1].D*3.154)+of.vadd[1].D)+sl.max.vadd[1].D.1)} {3300.}
(assert (= (+ (+ (* sc_52 3.154) of_52) sltop_52_1) 3300.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_53 0.) of_53) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_54 0.) of_54) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
(declare-fun slbot_57_1 () Real)
(assert (<= slbot_57_1 1e-08))
(declare-fun sltop_57_1 () Real)
(assert (>= sltop_57_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_57 1.) of_57) sltop_57_1) 3300.))
(declare-fun slbot_55_1 () Real)
(assert (<= slbot_55_1 1e-08))
(declare-fun sltop_55_1 () Real)
(assert (>= sltop_55_1 1e-08))
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B.1)} {0.}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55_1) 0.))
; 
; =  {(((sc.vadd[1].B*4.63)+of.vadd[1].B)+sl.max.vadd[1].B.1)} {3300.}
(assert (= (+ (+ (* sc_55 4.63) of_55) sltop_55_1) 3300.))
(declare-fun slbot_56_1 () Real)
(assert (<= slbot_56_1 1e-08))
(declare-fun sltop_56_1 () Real)
(assert (>= sltop_56_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56_1) -1650.))
; 
; =  {(((sc.vadd[1].OUT*3.154)+of.vadd[1].OUT)+sl.max.vadd[1].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_56 3.154) of_56) sltop_56_1) 1650.))
(declare-fun slbot_57_1 () Real)
(assert (<= slbot_57_1 1e-08))
(declare-fun sltop_57_1 () Real)
(assert (>= sltop_57_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_57 1.) of_57) sltop_57_1) 3300.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_58 0.) of_58) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_59 0.) of_59) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_61 0.) of_61) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_62 0.) of_62) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_63 0.) of_63) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_64 0.) of_64) 3300.))
; 
; <=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
; 
; >=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_65 0.) of_65) 3300.))
; 
; <=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_66 0.) of_66) 3300.))
; 
; <=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
; 
; >=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_67 0.) of_67) 3300.))
; 
; <=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_68 0.) of_68) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_69 0.) of_69) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.V[0].X*3.154)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_70 3.154) of_70) 3300.))
; 
; <=  {((sc.input.V[0].X*3.154)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_70 3.154) of_70) 0.))
; 
; >=  {((sc.input.V[0].O*3.154)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_71 3.154) of_71) 3300.))
; 
; <=  {((sc.input.V[0].O*3.154)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_71 3.154) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_73 sc_72))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_73 of_72))
; 
; >=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_72 0.) of_72) 3300.))
; 
; <=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_72 0.) of_72) 0.))
; 
; >=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_73 0.) of_73) 3300.))
; 
; <=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_75 sc_74))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_75 of_74))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_74 0.) of_74) 3300.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_75 0.) of_75) 3300.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_77 sc_76))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_77 of_76))
; 
; >=  {((sc.input.V[15].X*0.256)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_76 0.256) of_76) 3300.))
; 
; <=  {((sc.input.V[15].X*0.256)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_76 0.256) of_76) 0.))
; 
; >=  {((sc.input.V[15].O*0.256)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_77 0.256) of_77) 3300.))
; 
; <=  {((sc.input.V[15].O*0.256)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_77 0.256) of_77) 0.))
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_79 sc_78))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_79 of_78))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_78 0.) of_78) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_81 sc_80))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_81 of_80))
; 
; >=  {((sc.input.V[14].X*-500.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_80 -500.) of_80) 3300.))
; 
; <=  {((sc.input.V[14].X*-500.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_80 -500.) of_80) 0.))
; 
; >=  {((sc.input.V[14].O*-500.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_81 -500.) of_81) 3300.))
; 
; <=  {((sc.input.V[14].O*-500.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_81 -500.) of_81) 0.))
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_83 sc_82))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_83 of_82))
; 
; >=  {((sc.input.V[16].X*0.124)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_82 0.124) of_82) 3300.))
; 
; <=  {((sc.input.V[16].X*0.124)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_82 0.124) of_82) 0.))
; 
; >=  {((sc.input.V[16].O*0.124)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_83 0.124) of_83) 3300.))
; 
; <=  {((sc.input.V[16].O*0.124)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_83 0.124) of_83) 0.))
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_85 sc_84))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_85 of_84))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_84 0.) of_84) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_84 0.) of_84) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_85 0.) of_85) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_85 0.) of_85) 0.))
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_87 sc_86))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_87 of_86))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_86 0.) of_86) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_86 0.) of_86) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_87 0.) of_87) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_87 0.) of_87) 0.))
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_89 sc_88))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_89 of_88))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_88 0.) of_88) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_88 0.) of_88) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_89 0.) of_89) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_89 0.) of_89) 0.))
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_91 sc_90))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_91 of_90))
; 
; >=  {((sc.input.V[1].X*3.154)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_90 3.154) of_90) 3300.))
; 
; <=  {((sc.input.V[1].X*3.154)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_90 3.154) of_90) 0.))
; 
; >=  {((sc.input.V[1].O*3.154)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_91 3.154) of_91) 3300.))
; 
; <=  {((sc.input.V[1].O*3.154)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_91 3.154) of_91) 0.))
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_93 sc_92))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_93 of_92))
; 
; >=  {((sc.input.V[17].X*2.525)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_92 2.525) of_92) 3300.))
; 
; <=  {((sc.input.V[17].X*2.525)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_92 2.525) of_92) 0.))
; 
; >=  {((sc.input.V[17].O*2.525)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_93 2.525) of_93) 3300.))
; 
; <=  {((sc.input.V[17].O*2.525)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_93 2.525) of_93) 0.))
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_95 sc_94))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_95 of_94))
; 
; >=  {((sc.input.V[18].X*1.)+of.input.V[18].X)} {3300.}
(assert (<= (+ (* sc_94 1.) of_94) 3300.))
; 
; <=  {((sc.input.V[18].X*1.)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_94 1.) of_94) 0.))
; 
; >=  {((sc.input.V[18].O*1.)+of.input.V[18].O)} {3300.}
(assert (<= (+ (* sc_95 1.) of_95) 3300.))
; 
; <=  {((sc.input.V[18].O*1.)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_95 1.) of_95) 0.))
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
(assert (= of_97 0.))
; no offset
(assert (= of_96 0.))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_98 (* sc_97 sc_96)))
; 
; =  {of.itov[2].Y} {0.}
(assert (= of_98 0.))
(declare-fun slbot_96_1 () Real)
(assert (<= slbot_96_1 1e-08))
(declare-fun sltop_96_1 () Real)
(assert (>= sltop_96_1 1e-08))
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X.1)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96_1) 0.0001))
; 
; =  {(((sc.itov[2].X*1.)+of.itov[2].X)+sl.max.itov[2].X.1)} {10.}
(assert (= (+ (+ (* sc_96 1.) of_96) sltop_96_1) 10.))
(declare-fun slbot_98_1 () Real)
(assert (<= slbot_98_1 1e-08))
(declare-fun sltop_98_1 () Real)
(assert (>= sltop_98_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98_1) 0.0001))
; 
; =  {(((sc.itov[2].Y*3.154)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_98 3.154) of_98) sltop_98_1) 3300.))
; 
; >=  {((sc.itov[2].K*3.154)+of.itov[2].K)} {330.}
(assert (<= (+ (* sc_97 3.154) of_97) 330.))
; 
; <=  {((sc.itov[2].K*3.154)+of.itov[2].K)} {1.}
(assert (>= (+ (* sc_97 3.154) of_97) 1.))
(declare-fun slbot_98_1 () Real)
(assert (<= slbot_98_1 1e-08))
(declare-fun sltop_98_1 () Real)
(assert (>= sltop_98_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98_1) 0.0001))
; 
; =  {(((sc.itov[2].Y*3.154)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_98 3.154) of_98) sltop_98_1) 3300.))
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
(assert (= of_100 0.))
; no offset
(assert (= of_99 0.))
; 
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_101 (* sc_100 sc_99)))
; 
; =  {of.itov[7].Y} {0.}
(assert (= of_101 0.))
; 
; >=  {((sc.itov[7].X*0.42)+of.itov[7].X)} {10.}
(assert (<= (+ (* sc_99 0.42) of_99) 10.))
; 
; <=  {((sc.itov[7].X*0.42)+of.itov[7].X)} {0.0001}
(assert (>= (+ (* sc_99 0.42) of_99) 0.0001))
(declare-fun slbot_101_1 () Real)
(assert (<= slbot_101_1 1e-08))
(declare-fun sltop_101_1 () Real)
(assert (>= sltop_101_1 1e-08))
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_101 0.) of_101) slbot_101_1) 0.0001))
; 
; =  {(((sc.itov[7].Y*0.42)+of.itov[7].Y)+sl.max.itov[7].Y.1)} {3300.}
(assert (= (+ (+ (* sc_101 0.42) of_101) sltop_101_1) 3300.))
(declare-fun slbot_100_1 () Real)
(assert (<= slbot_100_1 1e-08))
(declare-fun sltop_100_1 () Real)
(assert (>= sltop_100_1 1e-08))
; 
; =  {(((sc.itov[7].K*0.)+of.itov[7].K)+sl.min.itov[7].K.1)} {1.}
(assert (= (+ (+ (* sc_100 0.) of_100) slbot_100_1) 1.))
; 
; =  {(((sc.itov[7].K*1.)+of.itov[7].K)+sl.max.itov[7].K.1)} {330.}
(assert (= (+ (+ (* sc_100 1.) of_100) sltop_100_1) 330.))
(declare-fun slbot_101_1 () Real)
(assert (<= slbot_101_1 1e-08))
(declare-fun sltop_101_1 () Real)
(assert (>= sltop_101_1 1e-08))
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_101 0.) of_101) slbot_101_1) 0.0001))
; 
; =  {(((sc.itov[7].Y*0.42)+of.itov[7].Y)+sl.max.itov[7].Y.1)} {3300.}
(assert (= (+ (+ (* sc_101 0.42) of_101) sltop_101_1) 3300.))
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
(assert (= of_103 0.))
; no offset
(assert (= of_102 0.))
; 
; =  {sc.itov[12].Y} {(sc.itov[12].K*sc.itov[12].X)}
(assert (= sc_104 (* sc_103 sc_102)))
; 
; =  {of.itov[12].Y} {0.}
(assert (= of_104 0.))
(declare-fun slbot_102_1 () Real)
(assert (<= slbot_102_1 1e-08))
(declare-fun sltop_102_1 () Real)
(assert (>= sltop_102_1 1e-08))
; 
; =  {(((sc.itov[12].X*0.)+of.itov[12].X)+sl.min.itov[12].X.1)} {0.0001}
(assert (= (+ (+ (* sc_102 0.) of_102) slbot_102_1) 0.0001))
; 
; =  {(((sc.itov[12].X*5.05)+of.itov[12].X)+sl.max.itov[12].X.1)} {10.}
(assert (= (+ (+ (* sc_102 5.05) of_102) sltop_102_1) 10.))
(declare-fun slbot_104_1 () Real)
(assert (<= slbot_104_1 1e-08))
(declare-fun sltop_104_1 () Real)
(assert (>= sltop_104_1 1e-08))
; 
; =  {(((sc.itov[12].Y*0.)+of.itov[12].Y)+sl.min.itov[12].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_104 0.) of_104) slbot_104_1) 0.0001))
; 
; =  {(((sc.itov[12].Y*5.05)+of.itov[12].Y)+sl.max.itov[12].Y.1)} {3300.}
(assert (= (+ (+ (* sc_104 5.05) of_104) sltop_104_1) 3300.))
; 
; >=  {((sc.itov[12].K*1.)+of.itov[12].K)} {330.}
(assert (<= (+ (* sc_103 1.) of_103) 330.))
; 
; <=  {((sc.itov[12].K*1.)+of.itov[12].K)} {1.}
(assert (>= (+ (* sc_103 1.) of_103) 1.))
(declare-fun slbot_104_1 () Real)
(assert (<= slbot_104_1 1e-08))
(declare-fun sltop_104_1 () Real)
(assert (>= sltop_104_1 1e-08))
; 
; =  {(((sc.itov[12].Y*0.)+of.itov[12].Y)+sl.min.itov[12].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_104 0.) of_104) slbot_104_1) 0.0001))
; 
; =  {(((sc.itov[12].Y*5.05)+of.itov[12].Y)+sl.max.itov[12].Y.1)} {3300.}
(assert (= (+ (+ (* sc_104 5.05) of_104) sltop_104_1) 3300.))
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
(assert (= of_106 0.))
; no offset
(assert (= of_105 0.))
; 
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_107 (* sc_106 sc_105)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_107 0.))
; 
; >=  {((sc.itov[0].X*4.63)+of.itov[0].X)} {10.}
(assert (<= (+ (* sc_105 4.63) of_105) 10.))
; 
; <=  {((sc.itov[0].X*4.63)+of.itov[0].X)} {0.0001}
(assert (>= (+ (* sc_105 4.63) of_105) 0.0001))
(declare-fun slbot_107_1 () Real)
(assert (<= slbot_107_1 1e-08))
(declare-fun sltop_107_1 () Real)
(assert (>= sltop_107_1 1e-08))
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_107 0.) of_107) slbot_107_1) 0.0001))
; 
; =  {(((sc.itov[0].Y*4.63)+of.itov[0].Y)+sl.max.itov[0].Y.1)} {3300.}
(assert (= (+ (+ (* sc_107 4.63) of_107) sltop_107_1) 3300.))
(declare-fun slbot_106_1 () Real)
(assert (<= slbot_106_1 1e-08))
(declare-fun sltop_106_1 () Real)
(assert (>= sltop_106_1 1e-08))
; 
; =  {(((sc.itov[0].K*0.)+of.itov[0].K)+sl.min.itov[0].K.1)} {1.}
(assert (= (+ (+ (* sc_106 0.) of_106) slbot_106_1) 1.))
; 
; =  {(((sc.itov[0].K*1.)+of.itov[0].K)+sl.max.itov[0].K.1)} {330.}
(assert (= (+ (+ (* sc_106 1.) of_106) sltop_106_1) 330.))
(declare-fun slbot_107_1 () Real)
(assert (<= slbot_107_1 1e-08))
(declare-fun sltop_107_1 () Real)
(assert (>= sltop_107_1 1e-08))
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_107 0.) of_107) slbot_107_1) 0.0001))
; 
; =  {(((sc.itov[0].Y*4.63)+of.itov[0].Y)+sl.max.itov[0].Y.1)} {3300.}
(assert (= (+ (+ (* sc_107 4.63) of_107) sltop_107_1) 3300.))
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
; no offset
(assert (= of_109 0.))
; no offset
(assert (= of_108 0.))
; 
; =  {sc.itov[11].Y} {(sc.itov[11].K*sc.itov[11].X)}
(assert (= sc_110 (* sc_109 sc_108)))
; 
; =  {of.itov[11].Y} {0.}
(assert (= of_110 0.))
(declare-fun slbot_108_1 () Real)
(assert (<= slbot_108_1 1e-08))
(declare-fun sltop_108_1 () Real)
(assert (>= sltop_108_1 1e-08))
; 
; =  {(((sc.itov[11].X*0.)+of.itov[11].X)+sl.min.itov[11].X.1)} {0.0001}
(assert (= (+ (+ (* sc_108 0.) of_108) slbot_108_1) 0.0001))
; 
; =  {(((sc.itov[11].X*1.)+of.itov[11].X)+sl.max.itov[11].X.1)} {10.}
(assert (= (+ (+ (* sc_108 1.) of_108) sltop_108_1) 10.))
(declare-fun slbot_110_1 () Real)
(assert (<= slbot_110_1 1e-08))
(declare-fun sltop_110_1 () Real)
(assert (>= sltop_110_1 1e-08))
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_110 0.) of_110) slbot_110_1) 0.0001))
; 
; =  {(((sc.itov[11].Y*3.154)+of.itov[11].Y)+sl.max.itov[11].Y.1)} {3300.}
(assert (= (+ (+ (* sc_110 3.154) of_110) sltop_110_1) 3300.))
; 
; >=  {((sc.itov[11].K*3.154)+of.itov[11].K)} {330.}
(assert (<= (+ (* sc_109 3.154) of_109) 330.))
; 
; <=  {((sc.itov[11].K*3.154)+of.itov[11].K)} {1.}
(assert (>= (+ (* sc_109 3.154) of_109) 1.))
(declare-fun slbot_110_1 () Real)
(assert (<= slbot_110_1 1e-08))
(declare-fun sltop_110_1 () Real)
(assert (>= sltop_110_1 1e-08))
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_110 0.) of_110) slbot_110_1) 0.0001))
; 
; =  {(((sc.itov[11].Y*3.154)+of.itov[11].Y)+sl.max.itov[11].Y.1)} {3300.}
(assert (= (+ (+ (* sc_110 3.154) of_110) sltop_110_1) 3300.))
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
; no offset
(assert (= of_112 0.))
; no offset
(assert (= of_111 0.))
; 
; =  {sc.itov[3].Y} {(sc.itov[3].K*sc.itov[3].X)}
(assert (= sc_113 (* sc_112 sc_111)))
; 
; =  {of.itov[3].Y} {0.}
(assert (= of_113 0.))
; 
; >=  {((sc.itov[3].X*25.232)+of.itov[3].X)} {10.}
(assert (<= (+ (* sc_111 25.232) of_111) 10.))
; 
; <=  {((sc.itov[3].X*25.232)+of.itov[3].X)} {0.0001}
(assert (>= (+ (* sc_111 25.232) of_111) 0.0001))
(declare-fun slbot_113_1 () Real)
(assert (<= slbot_113_1 1e-08))
(declare-fun sltop_113_1 () Real)
(assert (>= sltop_113_1 1e-08))
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_113 0.) of_113) slbot_113_1) 0.0001))
; 
; =  {(((sc.itov[3].Y*25.232)+of.itov[3].Y)+sl.max.itov[3].Y.1)} {3300.}
(assert (= (+ (+ (* sc_113 25.232) of_113) sltop_113_1) 3300.))
(declare-fun slbot_112_1 () Real)
(assert (<= slbot_112_1 1e-08))
(declare-fun sltop_112_1 () Real)
(assert (>= sltop_112_1 1e-08))
; 
; =  {(((sc.itov[3].K*0.)+of.itov[3].K)+sl.min.itov[3].K.1)} {1.}
(assert (= (+ (+ (* sc_112 0.) of_112) slbot_112_1) 1.))
; 
; =  {(((sc.itov[3].K*1.)+of.itov[3].K)+sl.max.itov[3].K.1)} {330.}
(assert (= (+ (+ (* sc_112 1.) of_112) sltop_112_1) 330.))
(declare-fun slbot_113_1 () Real)
(assert (<= slbot_113_1 1e-08))
(declare-fun sltop_113_1 () Real)
(assert (>= sltop_113_1 1e-08))
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_113 0.) of_113) slbot_113_1) 0.0001))
; 
; =  {(((sc.itov[3].Y*25.232)+of.itov[3].Y)+sl.max.itov[3].Y.1)} {3300.}
(assert (= (+ (+ (* sc_113 25.232) of_113) sltop_113_1) 3300.))
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
(assert (= of_115 0.))
; no offset
(assert (= of_114 0.))
; 
; =  {sc.itov[5].Y} {(sc.itov[5].K*sc.itov[5].X)}
(assert (= sc_116 (* sc_115 sc_114)))
; 
; =  {of.itov[5].Y} {0.}
(assert (= of_116 0.))
(declare-fun slbot_114_1 () Real)
(assert (<= slbot_114_1 1e-08))
(declare-fun sltop_114_1 () Real)
(assert (>= sltop_114_1 1e-08))
; 
; =  {(((sc.itov[5].X*0.)+of.itov[5].X)+sl.min.itov[5].X.1)} {0.0001}
(assert (= (+ (+ (* sc_114 0.) of_114) slbot_114_1) 0.0001))
; 
; =  {(((sc.itov[5].X*1.)+of.itov[5].X)+sl.max.itov[5].X.1)} {10.}
(assert (= (+ (+ (* sc_114 1.) of_114) sltop_114_1) 10.))
(declare-fun slbot_116_1 () Real)
(assert (<= slbot_116_1 1e-08))
(declare-fun sltop_116_1 () Real)
(assert (>= sltop_116_1 1e-08))
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_116 0.) of_116) slbot_116_1) 0.0001))
; 
; =  {(((sc.itov[5].Y*6.308)+of.itov[5].Y)+sl.max.itov[5].Y.1)} {3300.}
(assert (= (+ (+ (* sc_116 6.308) of_116) sltop_116_1) 3300.))
(declare-fun slbot_115_1 () Real)
(assert (<= slbot_115_1 1e-08))
(declare-fun sltop_115_1 () Real)
(assert (>= sltop_115_1 1e-08))
; 
; =  {(((sc.itov[5].K*0.)+of.itov[5].K)+sl.min.itov[5].K.1)} {1.}
(assert (= (+ (+ (* sc_115 0.) of_115) slbot_115_1) 1.))
; 
; =  {(((sc.itov[5].K*6.308)+of.itov[5].K)+sl.max.itov[5].K.1)} {330.}
(assert (= (+ (+ (* sc_115 6.308) of_115) sltop_115_1) 330.))
(declare-fun slbot_116_1 () Real)
(assert (<= slbot_116_1 1e-08))
(declare-fun sltop_116_1 () Real)
(assert (>= sltop_116_1 1e-08))
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_116 0.) of_116) slbot_116_1) 0.0001))
; 
; =  {(((sc.itov[5].Y*6.308)+of.itov[5].Y)+sl.max.itov[5].Y.1)} {3300.}
(assert (= (+ (+ (* sc_116 6.308) of_116) sltop_116_1) 3300.))
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
; 
; =  {sc.iadd[13].A} {sc.iadd[13].B}
(assert (= sc_119 sc_120))
; 
; =  {sc.iadd[13].A} {sc.iadd[13].C} {sc.iadd[13].D}
(assert (and (= sc_119 sc_118) (= sc_119 sc_117)))
; 
; =  {sc.iadd[13].OUT} {sc.iadd[13].A}
(assert (= sc_121 sc_119))
; 
; =  {of.iadd[13].OUT} {((of.iadd[13].A+of.iadd[13].B)-of.iadd[13].C-of.iadd[13].D)}
(assert (= of_121 (- (+ of_119 of_120) (+ of_118 of_117))))
; 
; >=  {((sc.iadd[13].D*0.)+of.iadd[13].D)} {5.}
(assert (<= (+ (* sc_117 0.) of_117) 5.))
; 
; <=  {((sc.iadd[13].D*0.)+of.iadd[13].D)} {0.}
(assert (>= (+ (* sc_117 0.) of_117) 0.))
; 
; >=  {((sc.iadd[13].C*0.)+of.iadd[13].C)} {5.}
(assert (<= (+ (* sc_118 0.) of_118) 5.))
; 
; <=  {((sc.iadd[13].C*0.)+of.iadd[13].C)} {0.}
(assert (>= (+ (* sc_118 0.) of_118) 0.))
(declare-fun slbot_121_1 () Real)
(assert (<= slbot_121_1 1e-08))
(declare-fun sltop_121_1 () Real)
(assert (>= sltop_121_1 1e-08))
; 
; =  {(((sc.iadd[13].OUT*0.)+of.iadd[13].OUT)+sl.min.iadd[13].OUT.1)} {-10.}
(assert (= (+ (+ (* sc_121 0.) of_121) slbot_121_1) -10.))
; 
; =  {(((sc.iadd[13].OUT*5.05)+of.iadd[13].OUT)+sl.max.iadd[13].OUT.1)} {10.}
(assert (= (+ (+ (* sc_121 5.05) of_121) sltop_121_1) 10.))
; 
; >=  {((sc.iadd[13].A*0.)+of.iadd[13].A)} {5.}
(assert (<= (+ (* sc_119 0.) of_119) 5.))
; 
; <=  {((sc.iadd[13].A*0.)+of.iadd[13].A)} {0.}
(assert (>= (+ (* sc_119 0.) of_119) 0.))
(declare-fun slbot_120_1 () Real)
(assert (<= slbot_120_1 1e-08))
(declare-fun sltop_120_1 () Real)
(assert (>= sltop_120_1 1e-08))
; 
; =  {(((sc.iadd[13].B*0.)+of.iadd[13].B)+sl.min.iadd[13].B.1)} {0.}
(assert (= (+ (+ (* sc_120 0.) of_120) slbot_120_1) 0.))
; 
; =  {(((sc.iadd[13].B*5.05)+of.iadd[13].B)+sl.max.iadd[13].B.1)} {5.}
(assert (= (+ (+ (* sc_120 5.05) of_120) sltop_120_1) 5.))
(declare-fun slbot_121_1 () Real)
(assert (<= slbot_121_1 1e-08))
(declare-fun sltop_121_1 () Real)
(assert (>= sltop_121_1 1e-08))
; 
; =  {(((sc.iadd[13].OUT*0.)+of.iadd[13].OUT)+sl.min.iadd[13].OUT.1)} {-10.}
(assert (= (+ (+ (* sc_121 0.) of_121) slbot_121_1) -10.))
; 
; =  {(((sc.iadd[13].OUT*5.05)+of.iadd[13].OUT)+sl.max.iadd[13].OUT.1)} {10.}
(assert (= (+ (+ (* sc_121 5.05) of_121) sltop_121_1) 10.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].D}
(assert (= sc_98 sc_52))
; 
; =  {of.itov[2].Y} {of.vadd[1].D}
(assert (= of_98 of_52))
; 
; =  {sc.itov[12].Y} {sc.vadd[10].B}
(assert (= sc_104 sc_34))
; 
; =  {of.itov[12].Y} {of.vadd[10].B}
(assert (= of_104 of_34))
; 
; =  {sc.input.V[17].O} {sc.vadd[4].D}
(assert (= sc_93 sc_45))
; 
; =  {of.input.V[17].O} {of.vadd[4].D}
(assert (= of_93 of_45))
; 
; =  {sc.input.I[6].O} {sc.itov[7].X}
(assert (= sc_12 sc_99))
; 
; =  {of.input.I[6].O} {of.itov[7].X}
(assert (= of_12 of_99))
; 
; =  {sc.vadd[4].OUT2} {sc.switch[9].Vmax}
(assert (= sc_50 sc_3))
; 
; =  {of.vadd[4].OUT2} {of.switch[9].Vmax}
(assert (= of_50 of_3))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[7].K}
(assert (= sc_50 sc_100))
; 
; =  {of.vadd[4].OUT2} {of.itov[7].K}
(assert (= of_50 of_100))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[0].K}
(assert (= sc_50 sc_106))
; 
; =  {of.vadd[4].OUT2} {of.itov[0].K}
(assert (= of_50 of_106))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[5].X}
(assert (= sc_57 sc_114))
; 
; =  {of.vadd[1].OUT2} {of.itov[5].X}
(assert (= of_57 of_114))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[11].X}
(assert (= sc_57 sc_108))
; 
; =  {of.vadd[1].OUT2} {of.itov[11].X}
(assert (= of_57 of_108))
; 
; =  {sc.input.I[0].O} {sc.iadd[13].D}
(assert (= sc_10 sc_117))
; 
; =  {of.input.I[0].O} {of.iadd[13].D}
(assert (= of_10 of_117))
; 
; =  {sc.input.V[9].O} {sc.vadd[8].A}
(assert (= sc_69 sc_26))
; 
; =  {of.input.V[9].O} {of.vadd[8].A}
(assert (= of_69 of_26))
; 
; =  {sc.itov[11].Y} {sc.vadd[10].D}
(assert (= sc_110 sc_31))
; 
; =  {of.itov[11].Y} {of.vadd[10].D}
(assert (= of_110 of_31))
; 
; =  {sc.input.V[15].O} {sc.vadd[1].OUT2_0}
(assert (= sc_77 sc_51))
; 
; =  {of.input.V[15].O} {of.vadd[1].OUT2_0}
(assert (= of_77 of_51))
; 
; =  {sc.iadd[13].OUT} {sc.itov[12].X}
(assert (= sc_121 sc_102))
; 
; =  {of.iadd[13].OUT} {of.itov[12].X}
(assert (= of_121 of_102))
; 
; =  {sc.input.I[3].O} {sc.switch[9].SUB}
(assert (= sc_14 sc_1))
; 
; =  {of.input.I[3].O} {of.switch[9].SUB}
(assert (= of_14 of_1))
; 
; =  {sc.input.I[4].O} {sc.itov[0].X}
(assert (= sc_16 sc_105))
; 
; =  {of.input.I[4].O} {of.itov[0].X}
(assert (= of_16 of_105))
; 
; =  {sc.input.V[13].O} {sc.vadd[10].C}
(assert (= sc_65 sc_32))
; 
; =  {of.input.V[13].O} {of.vadd[10].C}
(assert (= of_65 of_32))
; 
; =  {sc.input.I[5].O} {sc.itov[3].X}
(assert (= sc_18 sc_111))
; 
; =  {of.input.I[5].O} {of.itov[3].X}
(assert (= of_18 of_111))
; 
; =  {sc.input.V[14].O} {sc.switch[9].n}
(assert (= sc_81 sc_0))
; 
; =  {of.input.V[14].O} {of.switch[9].n}
(assert (= of_81 of_0))
; 
; =  {sc.input.V[11].O} {sc.vadd[8].D}
(assert (= sc_73 sc_24))
; 
; =  {of.input.V[11].O} {of.vadd[8].D}
(assert (= of_73 of_24))
; 
; =  {sc.itov[5].Y} {sc.vadd[4].B}
(assert (= sc_116 sc_48))
; 
; =  {of.itov[5].Y} {of.vadd[4].B}
(assert (= of_116 of_48))
; 
; =  {sc.input.V[12].O} {sc.vadd[10].A}
(assert (= sc_67 sc_33))
; 
; =  {of.input.V[12].O} {of.vadd[10].A}
(assert (= of_67 of_33))
; 
; =  {sc.input.I[2].O} {sc.iadd[13].A}
(assert (= sc_6 sc_119))
; 
; =  {of.input.I[2].O} {of.iadd[13].A}
(assert (= of_6 of_119))
; 
; =  {sc.input.V[8].O} {sc.vadd[8].OUT2_0}
(assert (= sc_61 sc_23))
; 
; =  {of.input.V[8].O} {of.vadd[8].OUT2_0}
(assert (= of_61 of_23))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].C}
(assert (= sc_85 sc_53))
; 
; =  {of.input.V[3].O} {of.vadd[1].C}
(assert (= of_85 of_53))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].A}
(assert (= sc_59 sc_54))
; 
; =  {of.input.V[2].O} {of.vadd[1].A}
(assert (= of_59 of_54))
; 
; =  {sc.itov[7].Y} {sc.vadd[8].B}
(assert (= sc_101 sc_27))
; 
; =  {of.itov[7].Y} {of.vadd[8].B}
(assert (= of_101 of_27))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_107 sc_55))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_107 of_55))
; 
; =  {sc.vadd[6].OUT} {sc.itov[5].K}
(assert (= sc_42 sc_115))
; 
; =  {of.vadd[6].OUT} {of.itov[5].K}
(assert (= of_42 of_115))
; 
; =  {sc.input.I[1].O} {sc.iadd[13].C}
(assert (= sc_20 sc_118))
; 
; =  {of.input.I[1].O} {of.iadd[13].C}
(assert (= of_20 of_118))
; 
; =  {sc.input.V[1].O} {sc.itov[2].K}
(assert (= sc_91 sc_97))
; 
; =  {of.input.V[1].O} {of.itov[2].K}
(assert (= of_91 of_97))
; 
; =  {sc.vadd[10].OUT2} {sc.itov[3].K}
(assert (= sc_36 sc_112))
; 
; =  {of.vadd[10].OUT2} {of.itov[3].K}
(assert (= of_36 of_112))
; 
; =  {sc.vadd[10].OUT2} {sc.itov[2].X}
(assert (= sc_36 sc_96))
; 
; =  {of.vadd[10].OUT2} {of.itov[2].X}
(assert (= of_36 of_96))
; 
; =  {sc.input.I[7].O} {sc.switch[9].Kmod}
(assert (= sc_8 sc_2))
; 
; =  {of.input.I[7].O} {of.switch[9].Kmod}
(assert (= of_8 of_2))
; 
; =  {sc.input.V[7].O} {sc.vadd[6].B}
(assert (= sc_63 sc_41))
; 
; =  {of.input.V[7].O} {of.vadd[6].B}
(assert (= of_63 of_41))
; 
; =  {sc.vadd[8].OUT2} {sc.output.V[0].X}
(assert (= sc_29 sc_21))
; 
; =  {of.vadd[8].OUT2} {of.output.V[0].X}
(assert (= of_29 of_21))
; 
; =  {sc.itov[3].Y} {sc.vadd[6].A}
(assert (= sc_113 sc_40))
; 
; =  {of.itov[3].Y} {of.vadd[6].A}
(assert (= of_113 of_40))
; 
; =  {sc.input.V[10].O} {sc.vadd[8].C}
(assert (= sc_75 sc_25))
; 
; =  {of.input.V[10].O} {of.vadd[8].C}
(assert (= of_75 of_25))
; 
; =  {sc.input.V[0].O} {sc.itov[11].K}
(assert (= sc_71 sc_109))
; 
; =  {of.input.V[0].O} {of.itov[11].K}
(assert (= of_71 of_109))
; 
; =  {sc.switch[9].PROD} {sc.iadd[13].B}
(assert (= sc_4 sc_120))
; 
; =  {of.switch[9].PROD} {of.iadd[13].B}
(assert (= of_4 of_120))
; 
; =  {sc.input.V[16].O} {sc.vadd[10].OUT2_0}
(assert (= sc_83 sc_30))
; 
; =  {of.input.V[16].O} {of.vadd[10].OUT2_0}
(assert (= of_83 of_30))
; 
; =  {sc.input.V[18].O} {sc.itov[12].K}
(assert (= sc_95 sc_103))
; 
; =  {of.input.V[18].O} {of.itov[12].K}
(assert (= of_95 of_103))
; 
; =  {sc.input.V[4].O} {sc.vadd[4].OUT2_0}
(assert (= sc_87 sc_44))
; 
; =  {of.input.V[4].O} {of.vadd[4].OUT2_0}
(assert (= of_87 of_44))
; 
; =  {sc.input.V[5].O} {sc.vadd[4].C}
(assert (= sc_89 sc_46))
; 
; =  {of.input.V[5].O} {of.vadd[4].C}
(assert (= of_89 of_46))
; 
; =  {sc.input.V[6].O} {sc.vadd[4].A}
(assert (= sc_79 sc_47))
; 
; =  {of.input.V[6].O} {of.vadd[4].A}
(assert (= of_79 of_47))
(assert (<= (* (/ 1. sc_22) 0.001) 0.1))
; 
; =  {sc.vadd[8].OUT2} {sc.output.V[0].O} {sc.vadd[1].OUT2} {sc.vadd[10].OUT2} {sc.vadd[4].OUT2}
(assert (and (and (and (= sc_29 sc_22) (= sc_29 sc_57)) (= sc_29 sc_36)) (= sc_29 sc_50)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_27_1 0.) slbot_27_1 (- slbot_27_1)) (ite (>= sltop_34_1 0.) sltop_34_1 (- sltop_34_1))) (ite (>= slbot_52_1 0.) slbot_52_1 (- slbot_52_1))) (ite (>= sltop_113_1 0.) sltop_113_1 (- sltop_113_1))) (ite (>= slbot_28_1 0.) slbot_28_1 (- slbot_28_1))) (ite (>= slbot_108_1 0.) slbot_108_1 (- slbot_108_1))) (ite (>= slbot_57_1 0.) slbot_57_1 (- slbot_57_1))) (ite (>= slbot_22_1 0.) slbot_22_1 (- slbot_22_1))) (ite (>= sltop_57_1 0.) sltop_57_1 (- sltop_57_1))) (ite (>= slbot_35_1 0.) slbot_35_1 (- slbot_35_1))) (ite (>= slbot_107_1 0.) slbot_107_1 (- slbot_107_1))) (ite (>= slbot_110_1 0.) slbot_110_1 (- slbot_110_1))) (ite (>= sltop_28_1 0.) sltop_28_1 (- sltop_28_1))) (ite (>= sltop_52_1 0.) sltop_52_1 (- sltop_52_1))) (ite (>= sltop_101_1 0.) sltop_101_1 (- sltop_101_1))) (ite (>= slbot_4_1 0.) slbot_4_1 (- slbot_4_1))) (ite (>= sltop_112_1 0.) sltop_112_1 (- sltop_112_1))) (ite (>= sltop_21_1 0.) sltop_21_1 (- sltop_21_1))) (ite (>= slbot_96_1 0.) slbot_96_1 (- slbot_96_1))) (ite (>= sltop_114_1 0.) sltop_114_1 (- sltop_114_1))) (ite (>= sltop_40_1 0.) sltop_40_1 (- sltop_40_1))) (ite (>= sltop_55_1 0.) sltop_55_1 (- sltop_55_1))) (ite (>= sltop_121_1 0.) sltop_121_1 (- sltop_121_1))) (ite (>= slbot_49_1 0.) slbot_49_1 (- slbot_49_1))) (ite (>= sltop_49_1 0.) sltop_49_1 (- sltop_49_1))) (ite (>= slbot_104_1 0.) slbot_104_1 (- slbot_104_1))) (ite (>= slbot_36_1 0.) slbot_36_1 (- slbot_36_1))) (ite (>= slbot_34_1 0.) slbot_34_1 (- slbot_34_1))) (ite (>= slbot_120_1 0.) slbot_120_1 (- slbot_120_1))) (ite (>= sltop_104_1 0.) sltop_104_1 (- sltop_104_1))) (ite (>= slbot_121_1 0.) slbot_121_1 (- slbot_121_1))) (ite (>= sltop_35_1 0.) sltop_35_1 (- sltop_35_1))) (ite (>= slbot_55_1 0.) slbot_55_1 (- slbot_55_1))) (ite (>= sltop_116_1 0.) sltop_116_1 (- sltop_116_1))) (ite (>= slbot_48_1 0.) slbot_48_1 (- slbot_48_1))) (ite (>= sltop_115_1 0.) sltop_115_1 (- sltop_115_1))) (ite (>= slbot_100_1 0.) slbot_100_1 (- slbot_100_1))) (ite (>= sltop_29_1 0.) sltop_29_1 (- sltop_29_1))) (ite (>= sltop_56_1 0.) sltop_56_1 (- sltop_56_1))) (ite (>= sltop_31_1 0.) sltop_31_1 (- sltop_31_1))) (ite (>= slbot_40_1 0.) slbot_40_1 (- slbot_40_1))) (ite (>= sltop_98_1 0.) sltop_98_1 (- sltop_98_1))) (ite (>= slbot_101_1 0.) slbot_101_1 (- slbot_101_1))) (ite (>= slbot_112_1 0.) slbot_112_1 (- slbot_112_1))) (ite (>= sltop_3_1 0.) sltop_3_1 (- sltop_3_1))) (ite (>= sltop_110_1 0.) sltop_110_1 (- sltop_110_1))) (ite (>= slbot_98_1 0.) slbot_98_1 (- slbot_98_1))) (ite (>= slbot_106_1 0.) slbot_106_1 (- slbot_106_1))) (ite (>= slbot_50_1 0.) slbot_50_1 (- slbot_50_1))) (ite (>= sltop_120_1 0.) sltop_120_1 (- sltop_120_1))) (ite (>= sltop_36_1 0.) sltop_36_1 (- sltop_36_1))) (ite (>= slbot_21_1 0.) slbot_21_1 (- slbot_21_1))) (ite (>= slbot_42_1 0.) slbot_42_1 (- slbot_42_1))) (ite (>= sltop_102_1 0.) sltop_102_1 (- sltop_102_1))) (ite (>= sltop_48_1 0.) sltop_48_1 (- sltop_48_1))) (ite (>= slbot_3_1 0.) slbot_3_1 (- slbot_3_1))) (ite (>= sltop_22_1 0.) sltop_22_1 (- sltop_22_1))) (ite (>= sltop_96_1 0.) sltop_96_1 (- sltop_96_1))) (ite (>= sltop_100_1 0.) sltop_100_1 (- sltop_100_1))) (ite (>= slbot_116_1 0.) slbot_116_1 (- slbot_116_1))) (ite (>= sltop_4_1 0.) sltop_4_1 (- sltop_4_1))) (ite (>= slbot_102_1 0.) slbot_102_1 (- slbot_102_1))) (ite (>= slbot_113_1 0.) slbot_113_1 (- slbot_113_1))) (ite (>= sltop_27_1 0.) sltop_27_1 (- sltop_27_1))) (ite (>= sltop_106_1 0.) sltop_106_1 (- sltop_106_1))) (ite (>= slbot_115_1 0.) slbot_115_1 (- slbot_115_1))) (ite (>= sltop_107_1 0.) sltop_107_1 (- sltop_107_1))) (ite (>= sltop_50_1 0.) sltop_50_1 (- sltop_50_1))) (ite (>= slbot_31_1 0.) slbot_31_1 (- slbot_31_1))) (ite (>= sltop_42_1 0.) sltop_42_1 (- sltop_42_1))) (ite (>= sltop_108_1 0.) sltop_108_1 (- sltop_108_1))) (ite (>= slbot_29_1 0.) slbot_29_1 (- slbot_29_1))) (ite (>= slbot_56_1 0.) slbot_56_1 (- slbot_56_1))) (ite (>= slbot_114_1 0.) slbot_114_1 (- slbot_114_1)))))
(check-sat)
