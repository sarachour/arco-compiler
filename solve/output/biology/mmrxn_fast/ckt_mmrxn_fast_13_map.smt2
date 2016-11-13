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
; =  {(sc.switch[3].SUB/sc.switch[3].Kmod)} {1.}
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
; =  {sc.switch[3].PROD} {(sc.switch[3].Vmax/1.)}
(assert (= sc_4 (/ sc_3 1.)))
; 
; =  {of.switch[3].PROD} {0.}
(assert (= of_4 0.))
; 
; >=  {((sc.switch[3].n*-500.)+of.switch[3].n)} {3300.}
(assert (<= (+ (* sc_0 -500.) of_0) 3300.))
; 
; <=  {((sc.switch[3].n*-500.)+of.switch[3].n)} {500.}
(assert (>= (+ (* sc_0 -500.) of_0) 500.))
; 
; >=  {((sc.switch[3].SUB*4.05)+of.switch[3].SUB)} {10.}
(assert (<= (+ (* sc_1 4.05) of_1) 10.))
; 
; <=  {((sc.switch[3].SUB*4.05)+of.switch[3].SUB)} {0.0001}
(assert (>= (+ (* sc_1 4.05) of_1) 0.0001))
; 
; >=  {((sc.switch[3].Kmod*1.)+of.switch[3].Kmod)} {10.}
(assert (<= (+ (* sc_2 1.) of_2) 10.))
; 
; <=  {((sc.switch[3].Kmod*1.)+of.switch[3].Kmod)} {0.0001}
(assert (>= (+ (* sc_2 1.) of_2) 0.0001))
(declare-fun slbot_4_1 () Real)
(assert (<= slbot_4_1 1e-08))
(declare-fun sltop_4_1 () Real)
(assert (>= sltop_4_1 1e-08))
; 
; =  {(((sc.switch[3].PROD*0.)+of.switch[3].PROD)+sl.min.switch[3].PROD.1)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4_1) 9.99934002508e-38))
; 
; =  {(((sc.switch[3].PROD*5.05)+of.switch[3].PROD)+sl.max.switch[3].PROD.1)} {9.999900001}
(assert (= (+ (+ (* sc_4 5.05) of_4) sltop_4_1) 9.999900001))
(declare-fun slbot_3_1 () Real)
(assert (<= slbot_3_1 1e-08))
(declare-fun sltop_3_1 () Real)
(assert (>= sltop_3_1 1e-08))
; 
; =  {(((sc.switch[3].Vmax*0.)+of.switch[3].Vmax)+sl.min.switch[3].Vmax.1)} {0.0001}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3_1) 0.0001))
; 
; =  {(((sc.switch[3].Vmax*1.)+of.switch[3].Vmax)+sl.max.switch[3].Vmax.1)} {10.}
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
; >=  {((sc.input.I[2].X*0.42)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_5 0.42) of_5) 10.))
; 
; <=  {((sc.input.I[2].X*0.42)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_5 0.42) of_5) 0.))
; 
; >=  {((sc.input.I[2].O*0.42)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_6 0.42) of_6) 10.))
; 
; <=  {((sc.input.I[2].O*0.42)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_6 0.42) of_6) 0.))
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_8 sc_7))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_8 of_7))
; 
; >=  {((sc.input.I[0].X*4.05)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_7 4.05) of_7) 10.))
; 
; <=  {((sc.input.I[0].X*4.05)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_7 4.05) of_7) 0.))
; 
; >=  {((sc.input.I[0].O*4.05)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_8 4.05) of_8) 10.))
; 
; <=  {((sc.input.I[0].O*4.05)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_8 4.05) of_8) 0.))
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_10 sc_9))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_10 of_9))
; 
; >=  {((sc.input.I[3].X*1.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_9 1.) of_9) 10.))
; 
; <=  {((sc.input.I[3].X*1.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_9 1.) of_9) 0.))
; 
; >=  {((sc.input.I[3].O*1.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_10 1.) of_10) 10.))
; 
; <=  {((sc.input.I[3].O*1.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_10 1.) of_10) 0.))
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_12 sc_11))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_12 of_11))
; 
; >=  {((sc.input.I[1].X*4.63)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_11 4.63) of_11) 10.))
; 
; <=  {((sc.input.I[1].X*4.63)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_11 4.63) of_11) 0.))
; 
; >=  {((sc.input.I[1].O*4.63)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_12 4.63) of_12) 10.))
; 
; <=  {((sc.input.I[1].O*4.63)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_12 4.63) of_12) 0.))
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_14 sc_13))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_14 of_13))
(declare-fun slbot_13_1 () Real)
(assert (<= slbot_13_1 1e-08))
(declare-fun sltop_13_1 () Real)
(assert (>= sltop_13_1 1e-08))
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X.1)} {0.}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13_1) 0.))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_13 1.) of_13) sltop_13_1) 3300.))
(declare-fun slbot_14_1 () Real)
(assert (<= slbot_14_1 1e-08))
(declare-fun sltop_14_1 () Real)
(assert (>= sltop_14_1 1e-08))
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O.1)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14_1) 0.))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_14 1.) of_14) sltop_14_1) 3300.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_17 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_19 0.))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_18 (* 1. sc_19)))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D)}
(assert (and (= sc_18 (* 1. sc_17)) (= sc_18 (* 1. sc_16))))
; no offset
(assert (= (- (+ of_18 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT} {(sc.vadd[8].A*1.)}
(assert (= sc_20 (* sc_18 1.)))
; 
; =  {of.vadd[8].OUT} {0.}
(assert (= of_20 0.))
; no scale
(assert (= sc_16 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= of_21 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_17 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_19 0.))
; 
; =  {sc.vadd[8].A} {(1.*sc.vadd[8].B)}
(assert (= sc_18 (* 1. sc_19)))
; no offset
(assert (= (+ of_18 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[8].A*1.)} {(1.*sc.vadd[8].C)} {(1.*sc.vadd[8].D*sc.vadd[8].OUT2)}
(assert (and (= (* sc_18 1.) (* 1. sc_17)) (= (* sc_18 1.) (* (* 1. sc_16) sc_21))))
; 
; =  {sc.vadd[8].OUT2} {(sc.vadd[8].A*1.)}
(assert (= sc_21 (* sc_18 1.)))
; no offset
(assert (= of_21 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[8].OUT2_0} {(sc.vadd[8].A*1.)}
(assert (= sc_15 (* sc_18 1.)))
; 
; =  {of.vadd[8].OUT2_0} {(0.-0.-0.)}
(assert (= of_15 0.))
; 
; >=  {((sc.vadd[8].OUT2_0*0.)+of.vadd[8].OUT2_0)} {3300.}
(assert (<= (+ (* sc_15 0.) of_15) 3300.))
; 
; <=  {((sc.vadd[8].OUT2_0*0.)+of.vadd[8].OUT2_0)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
; 
; >=  {((sc.vadd[8].D*2.525)+of.vadd[8].D)} {3300.}
(assert (<= (+ (* sc_16 2.525) of_16) 3300.))
; 
; <=  {((sc.vadd[8].D*2.525)+of.vadd[8].D)} {0.}
(assert (>= (+ (* sc_16 2.525) of_16) 0.))
; 
; >=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {3300.}
(assert (<= (+ (* sc_17 0.) of_17) 3300.))
; 
; <=  {((sc.vadd[8].C*0.)+of.vadd[8].C)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
; 
; >=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {3300.}
(assert (<= (+ (* sc_18 0.) of_18) 3300.))
; 
; <=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
(declare-fun slbot_21_1 () Real)
(assert (<= slbot_21_1 1e-08))
(declare-fun sltop_21_1 () Real)
(assert (>= sltop_21_1 1e-08))
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21_1) 0.))
; 
; =  {(((sc.vadd[8].OUT2*1.)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_21 1.) of_21) sltop_21_1) 3300.))
(declare-fun slbot_19_1 () Real)
(assert (<= slbot_19_1 1e-08))
(declare-fun sltop_19_1 () Real)
(assert (>= sltop_19_1 1e-08))
; 
; =  {(((sc.vadd[8].B*0.)+of.vadd[8].B)+sl.min.vadd[8].B.1)} {0.}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19_1) 0.))
; 
; =  {(((sc.vadd[8].B*6.308)+of.vadd[8].B)+sl.max.vadd[8].B.1)} {3300.}
(assert (= (+ (+ (* sc_19 6.308) of_19) sltop_19_1) 3300.))
(declare-fun slbot_20_1 () Real)
(assert (<= slbot_20_1 1e-08))
(declare-fun sltop_20_1 () Real)
(assert (>= sltop_20_1 1e-08))
; 
; =  {(((sc.vadd[8].OUT*0.)+of.vadd[8].OUT)+sl.min.vadd[8].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20_1) -1650.))
; 
; =  {(((sc.vadd[8].OUT*6.308)+of.vadd[8].OUT)+sl.max.vadd[8].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_20 6.308) of_20) sltop_20_1) 1650.))
(declare-fun slbot_21_1 () Real)
(assert (<= slbot_21_1 1e-08))
(declare-fun sltop_21_1 () Real)
(assert (>= sltop_21_1 1e-08))
; 
; =  {(((sc.vadd[8].OUT2*0.)+of.vadd[8].OUT2)+sl.min.vadd[8].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21_1) 0.))
; 
; =  {(((sc.vadd[8].OUT2*1.)+of.vadd[8].OUT2)+sl.max.vadd[8].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_21 1.) of_21) sltop_21_1) 3300.))
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_23 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_26 0.))
; 
; =  {sc.vadd[12].A} {(1.*sc.vadd[12].B)}
(assert (= sc_25 (* 1. sc_26)))
; 
; =  {sc.vadd[12].A} {(1.*sc.vadd[12].C)} {(1.*sc.vadd[12].D)}
(assert (and (= sc_25 (* 1. sc_24)) (= sc_25 (* 1. sc_23))))
; no offset
(assert (= (- (+ of_25 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[12].OUT} {(sc.vadd[12].A*1.)}
(assert (= sc_27 (* sc_25 1.)))
; 
; =  {of.vadd[12].OUT} {0.}
(assert (= of_27 0.))
; no scale
(assert (= sc_23 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_23 0.))
; no offset
(assert (= of_28 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_26 0.))
; 
; =  {sc.vadd[12].A} {(1.*sc.vadd[12].B)}
(assert (= sc_25 (* 1. sc_26)))
; no offset
(assert (= (+ of_25 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[12].A*1.)} {(1.*sc.vadd[12].C)} {(1.*sc.vadd[12].D*sc.vadd[12].OUT2)}
(assert (and (= (* sc_25 1.) (* 1. sc_24)) (= (* sc_25 1.) (* (* 1. sc_23) sc_28))))
; 
; =  {sc.vadd[12].OUT2} {(sc.vadd[12].A*1.)}
(assert (= sc_28 (* sc_25 1.)))
; no offset
(assert (= of_28 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[12].OUT2_0} {(sc.vadd[12].A*1.)}
(assert (= sc_22 (* sc_25 1.)))
; 
; =  {of.vadd[12].OUT2_0} {(0.-0.-0.)}
(assert (= of_22 0.))
; 
; >=  {((sc.vadd[12].OUT2_0*0.)+of.vadd[12].OUT2_0)} {3300.}
(assert (<= (+ (* sc_22 0.) of_22) 3300.))
; 
; <=  {((sc.vadd[12].OUT2_0*0.)+of.vadd[12].OUT2_0)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.vadd[12].D*0.)+of.vadd[12].D)} {3300.}
(assert (<= (+ (* sc_23 0.) of_23) 3300.))
; 
; <=  {((sc.vadd[12].D*0.)+of.vadd[12].D)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
; 
; >=  {((sc.vadd[12].C*0.)+of.vadd[12].C)} {3300.}
(assert (<= (+ (* sc_24 0.) of_24) 3300.))
; 
; <=  {((sc.vadd[12].C*0.)+of.vadd[12].C)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.vadd[12].A*0.)+of.vadd[12].A)} {3300.}
(assert (<= (+ (* sc_25 0.) of_25) 3300.))
; 
; <=  {((sc.vadd[12].A*0.)+of.vadd[12].A)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
(declare-fun slbot_28_1 () Real)
(assert (<= slbot_28_1 1e-08))
(declare-fun sltop_28_1 () Real)
(assert (>= sltop_28_1 1e-08))
; 
; =  {(((sc.vadd[12].OUT2*0.)+of.vadd[12].OUT2)+sl.min.vadd[12].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28_1) 0.))
; 
; =  {(((sc.vadd[12].OUT2*1.)+of.vadd[12].OUT2)+sl.max.vadd[12].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_28 1.) of_28) sltop_28_1) 3300.))
(declare-fun slbot_26_1 () Real)
(assert (<= slbot_26_1 1e-08))
(declare-fun sltop_26_1 () Real)
(assert (>= sltop_26_1 1e-08))
; 
; =  {(((sc.vadd[12].B*0.)+of.vadd[12].B)+sl.min.vadd[12].B.1)} {0.}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26_1) 0.))
; 
; =  {(((sc.vadd[12].B*0.42)+of.vadd[12].B)+sl.max.vadd[12].B.1)} {3300.}
(assert (= (+ (+ (* sc_26 0.42) of_26) sltop_26_1) 3300.))
(declare-fun slbot_27_1 () Real)
(assert (<= slbot_27_1 1e-08))
(declare-fun sltop_27_1 () Real)
(assert (>= sltop_27_1 1e-08))
; 
; =  {(((sc.vadd[12].OUT*0.)+of.vadd[12].OUT)+sl.min.vadd[12].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27_1) -1650.))
; 
; =  {(((sc.vadd[12].OUT*0.42)+of.vadd[12].OUT)+sl.max.vadd[12].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_27 0.42) of_27) sltop_27_1) 1650.))
(declare-fun slbot_28_1 () Real)
(assert (<= slbot_28_1 1e-08))
(declare-fun sltop_28_1 () Real)
(assert (>= sltop_28_1 1e-08))
; 
; =  {(((sc.vadd[12].OUT2*0.)+of.vadd[12].OUT2)+sl.min.vadd[12].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28_1) 0.))
; 
; =  {(((sc.vadd[12].OUT2*1.)+of.vadd[12].OUT2)+sl.max.vadd[12].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_28 1.) of_28) sltop_28_1) 3300.))
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
(assert (= of_33 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_32 (* 1. sc_33)))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D)}
(assert (and (= sc_32 (* 1. sc_31)) (= sc_32 (* 1. sc_30))))
; no offset
(assert (= (- (+ of_32 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT} {(sc.vadd[10].A*1.)}
(assert (= sc_34 (* sc_32 1.)))
; 
; =  {of.vadd[10].OUT} {0.}
(assert (= of_34 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_33 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_32 (* 1. sc_33)))
; no offset
(assert (= (+ of_32 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[10].A*1.)} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D*sc.vadd[10].OUT2)}
(assert (and (= (* sc_32 1.) (* 1. sc_31)) (= (* sc_32 1.) (* (* 1. sc_30) sc_35))))
; 
; =  {sc.vadd[10].OUT2} {(sc.vadd[10].A*1.)}
(assert (= sc_35 (* sc_32 1.)))
; no offset
(assert (= of_35 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT2_0} {(sc.vadd[10].A*1.)}
(assert (= sc_29 (* sc_32 1.)))
; 
; =  {of.vadd[10].OUT2_0} {(0.-0.-0.)}
(assert (= of_29 0.))
(declare-fun slbot_34_1 () Real)
(assert (<= slbot_34_1 1e-08))
(declare-fun sltop_34_1 () Real)
(assert (>= sltop_34_1 1e-08))
; 
; =  {(((sc.vadd[10].OUT*0.)+of.vadd[10].OUT)+sl.min.vadd[10].OUT.1)} {0.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34_1) 0.))
; 
; =  {(((sc.vadd[10].OUT*6.308)+of.vadd[10].OUT)+sl.max.vadd[10].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_34 6.308) of_34) sltop_34_1) 1650.))
(declare-fun slbot_32_1 () Real)
(assert (<= slbot_32_1 1e-08))
(declare-fun sltop_32_1 () Real)
(assert (>= sltop_32_1 1e-08))
; 
; =  {(((sc.vadd[10].A*0.)+of.vadd[10].A)+sl.min.vadd[10].A.1)} {0.}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32_1) 0.))
; 
; =  {(((sc.vadd[10].A*25.232)+of.vadd[10].A)+sl.max.vadd[10].A.1)} {3300.}
(assert (= (+ (+ (* sc_32 25.232) of_32) sltop_32_1) 3300.))
; 
; >=  {((sc.vadd[10].B*0.)+of.vadd[10].B)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.vadd[10].B*0.)+of.vadd[10].B)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
(declare-fun slbot_34_1 () Real)
(assert (<= slbot_34_1 1e-08))
(declare-fun sltop_34_1 () Real)
(assert (>= sltop_34_1 1e-08))
; 
; =  {(((sc.vadd[10].OUT*0.)+of.vadd[10].OUT)+sl.min.vadd[10].OUT.1)} {0.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34_1) 0.))
; 
; =  {(((sc.vadd[10].OUT*6.308)+of.vadd[10].OUT)+sl.max.vadd[10].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_34 6.308) of_34) sltop_34_1) 1650.))
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
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_39 (* 1. sc_40)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D)}
(assert (and (= sc_39 (* 1. sc_38)) (= sc_39 (* 1. sc_37))))
; no offset
(assert (= (- (+ of_39 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1.)}
(assert (= sc_41 (* sc_39 1.)))
; 
; =  {of.vadd[4].OUT} {0.}
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
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_39 (* 1. sc_40)))
; no offset
(assert (= (+ of_39 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[4].A*1.)} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D*sc.vadd[4].OUT2)}
(assert (and (= (* sc_39 1.) (* 1. sc_38)) (= (* sc_39 1.) (* (* 1. sc_37) sc_42))))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1.)}
(assert (= sc_42 (* sc_39 1.)))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1.)}
(assert (= sc_36 (* sc_39 1.)))
; 
; =  {of.vadd[4].OUT2_0} {(0.-0.-0.)}
(assert (= of_36 0.))
; 
; >=  {((sc.vadd[4].OUT2_0*0.124)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_36 0.124) of_36) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.124)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_36 0.124) of_36) 0.))
(declare-fun slbot_37_1 () Real)
(assert (<= slbot_37_1 1e-08))
(declare-fun sltop_37_1 () Real)
(assert (>= sltop_37_1 1e-08))
; 
; =  {(((sc.vadd[4].D*0.)+of.vadd[4].D)+sl.min.vadd[4].D.1)} {0.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37_1) 0.))
; 
; =  {(((sc.vadd[4].D*3.154)+of.vadd[4].D)+sl.max.vadd[4].D.1)} {3300.}
(assert (= (+ (+ (* sc_37 3.154) of_37) sltop_37_1) 3300.))
; 
; >=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {3300.}
(assert (<= (+ (* sc_38 0.) of_38) 3300.))
; 
; <=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_39 0.) of_39) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
(declare-fun slbot_42_1 () Real)
(assert (<= slbot_42_1 1e-08))
(declare-fun sltop_42_1 () Real)
(assert (>= sltop_42_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42_1) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_42 1.) of_42) sltop_42_1) 3300.))
(declare-fun slbot_40_1 () Real)
(assert (<= slbot_40_1 1e-08))
(declare-fun sltop_40_1 () Real)
(assert (>= sltop_40_1 1e-08))
; 
; =  {(((sc.vadd[4].B*0.)+of.vadd[4].B)+sl.min.vadd[4].B.1)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40_1) 0.))
; 
; =  {(((sc.vadd[4].B*5.05)+of.vadd[4].B)+sl.max.vadd[4].B.1)} {3300.}
(assert (= (+ (+ (* sc_40 5.05) of_40) sltop_40_1) 3300.))
(declare-fun slbot_41_1 () Real)
(assert (<= slbot_41_1 1e-08))
(declare-fun sltop_41_1 () Real)
(assert (>= sltop_41_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41_1) -1650.))
; 
; =  {(((sc.vadd[4].OUT*3.154)+of.vadd[4].OUT)+sl.max.vadd[4].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_41 3.154) of_41) sltop_41_1) 1650.))
(declare-fun slbot_42_1 () Real)
(assert (<= slbot_42_1 1e-08))
(declare-fun sltop_42_1 () Real)
(assert (>= sltop_42_1 1e-08))
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42_1) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_42 1.) of_42) sltop_42_1) 3300.))
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
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_47 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_46 (* 1. sc_47)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_46 (* 1. sc_45)) (= sc_46 (* 1. sc_44))))
; no offset
(assert (= (- (+ of_46 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_48 (* sc_46 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_48 0.))
; no scale
(assert (= sc_44 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= of_49 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_47 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_46 (* 1. sc_47)))
; no offset
(assert (= (+ of_46 0.) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {(sc.vadd[1].A*1.)} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= (* sc_46 1.) (* 1. sc_45)) (= (* sc_46 1.) (* (* 1. sc_44) sc_49))))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_49 (* sc_46 1.)))
; no offset
(assert (= of_49 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_43 (* sc_46 1.)))
; 
; =  {of.vadd[1].OUT2_0} {(0.-0.-0.)}
(assert (= of_43 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.256)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_43 0.256) of_43) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.256)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_43 0.256) of_43) 0.))
(declare-fun slbot_44_1 () Real)
(assert (<= slbot_44_1 1e-08))
(declare-fun sltop_44_1 () Real)
(assert (>= sltop_44_1 1e-08))
; 
; =  {(((sc.vadd[1].D*0.)+of.vadd[1].D)+sl.min.vadd[1].D.1)} {0.}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44_1) 0.))
; 
; =  {(((sc.vadd[1].D*3.154)+of.vadd[1].D)+sl.max.vadd[1].D.1)} {3300.}
(assert (= (+ (+ (* sc_44 3.154) of_44) sltop_44_1) 3300.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_45 0.) of_45) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_46 0.) of_46) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
(declare-fun slbot_49_1 () Real)
(assert (<= slbot_49_1 1e-08))
(declare-fun sltop_49_1 () Real)
(assert (>= sltop_49_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_49 1.) of_49) sltop_49_1) 3300.))
(declare-fun slbot_47_1 () Real)
(assert (<= slbot_47_1 1e-08))
(declare-fun sltop_47_1 () Real)
(assert (>= sltop_47_1 1e-08))
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B.1)} {0.}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47_1) 0.))
; 
; =  {(((sc.vadd[1].B*4.63)+of.vadd[1].B)+sl.max.vadd[1].B.1)} {3300.}
(assert (= (+ (+ (* sc_47 4.63) of_47) sltop_47_1) 3300.))
(declare-fun slbot_48_1 () Real)
(assert (<= slbot_48_1 1e-08))
(declare-fun sltop_48_1 () Real)
(assert (>= sltop_48_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT.1)} {-1650.}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48_1) -1650.))
; 
; =  {(((sc.vadd[1].OUT*3.154)+of.vadd[1].OUT)+sl.max.vadd[1].OUT.1)} {1650.}
(assert (= (+ (+ (* sc_48 3.154) of_48) sltop_48_1) 1650.))
(declare-fun slbot_49_1 () Real)
(assert (<= slbot_49_1 1e-08))
(declare-fun sltop_49_1 () Real)
(assert (>= sltop_49_1 1e-08))
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2.1)} {0.}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49_1) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2.1)} {3300.}
(assert (= (+ (+ (* sc_49 1.) of_49) sltop_49_1) 3300.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_50 0.) of_50) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_51 0.) of_51) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_52 0.) of_52) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_53 0.) of_53) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_54 0.) of_54) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_55 0.) of_55) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_56 0.) of_56) 3300.))
; 
; <=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
; 
; >=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_57 0.) of_57) 3300.))
; 
; <=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_58 0.) of_58) 3300.))
; 
; <=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
; 
; >=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_59 0.) of_59) 3300.))
; 
; <=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_61 0.) of_61) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.V[0].X*3.154)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_62 3.154) of_62) 3300.))
; 
; <=  {((sc.input.V[0].X*3.154)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_62 3.154) of_62) 0.))
; 
; >=  {((sc.input.V[0].O*3.154)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_63 3.154) of_63) 3300.))
; 
; <=  {((sc.input.V[0].O*3.154)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_63 3.154) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_64 0.) of_64) 3300.))
; 
; <=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
; 
; >=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_65 0.) of_65) 3300.))
; 
; <=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
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
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_66 0.) of_66) 3300.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_67 0.) of_67) 3300.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.V[15].X*0.256)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_68 0.256) of_68) 3300.))
; 
; <=  {((sc.input.V[15].X*0.256)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_68 0.256) of_68) 0.))
; 
; >=  {((sc.input.V[15].O*0.256)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_69 0.256) of_69) 3300.))
; 
; <=  {((sc.input.V[15].O*0.256)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_69 0.256) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_70 0.) of_70) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_71 0.) of_71) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_71 0.) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_73 sc_72))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_73 of_72))
; 
; >=  {((sc.input.V[14].X*-500.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_72 -500.) of_72) 3300.))
; 
; <=  {((sc.input.V[14].X*-500.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_72 -500.) of_72) 0.))
; 
; >=  {((sc.input.V[14].O*-500.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_73 -500.) of_73) 3300.))
; 
; <=  {((sc.input.V[14].O*-500.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_73 -500.) of_73) 0.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_75 sc_74))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_75 of_74))
; 
; >=  {((sc.input.V[16].X*0.124)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_74 0.124) of_74) 3300.))
; 
; <=  {((sc.input.V[16].X*0.124)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_74 0.124) of_74) 0.))
; 
; >=  {((sc.input.V[16].O*0.124)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_75 0.124) of_75) 3300.))
; 
; <=  {((sc.input.V[16].O*0.124)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_75 0.124) of_75) 0.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_77 sc_76))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_77 of_76))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_76 0.) of_76) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_77 0.) of_77) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_79 sc_78))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_79 of_78))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_78 0.) of_78) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_81 sc_80))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_81 of_80))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_80 0.) of_80) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_80 0.) of_80) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_81 0.) of_81) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_81 0.) of_81) 0.))
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_83 sc_82))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_83 of_82))
; 
; >=  {((sc.input.V[1].X*3.154)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_82 3.154) of_82) 3300.))
; 
; <=  {((sc.input.V[1].X*3.154)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_82 3.154) of_82) 0.))
; 
; >=  {((sc.input.V[1].O*3.154)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_83 3.154) of_83) 3300.))
; 
; <=  {((sc.input.V[1].O*3.154)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_83 3.154) of_83) 0.))
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_85 sc_84))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_85 of_84))
; 
; >=  {((sc.input.V[17].X*25.232)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_84 25.232) of_84) 3300.))
; 
; <=  {((sc.input.V[17].X*25.232)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_84 25.232) of_84) 0.))
; 
; >=  {((sc.input.V[17].O*25.232)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_85 25.232) of_85) 3300.))
; 
; <=  {((sc.input.V[17].O*25.232)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_85 25.232) of_85) 0.))
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_87 sc_86))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_87 of_86))
; 
; >=  {((sc.input.V[18].X*2.525)+of.input.V[18].X)} {3300.}
(assert (<= (+ (* sc_86 2.525) of_86) 3300.))
; 
; <=  {((sc.input.V[18].X*2.525)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_86 2.525) of_86) 0.))
; 
; >=  {((sc.input.V[18].O*2.525)+of.input.V[18].O)} {3300.}
(assert (<= (+ (* sc_87 2.525) of_87) 3300.))
; 
; <=  {((sc.input.V[18].O*2.525)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_87 2.525) of_87) 0.))
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
; 
; =  {sc.input.V[19].O} {sc.input.V[19].X}
(assert (= sc_89 sc_88))
; 
; =  {of.input.V[19].O} {of.input.V[19].X}
(assert (= of_89 of_88))
; 
; >=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {3300.}
(assert (<= (+ (* sc_88 1.) of_88) 3300.))
; 
; <=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {0.}
(assert (>= (+ (* sc_88 1.) of_88) 0.))
; 
; >=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {3300.}
(assert (<= (+ (* sc_89 1.) of_89) 3300.))
; 
; <=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {0.}
(assert (>= (+ (* sc_89 1.) of_89) 0.))
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
(assert (= of_91 0.))
; no offset
(assert (= of_90 0.))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_92 (* sc_91 sc_90)))
; 
; =  {of.itov[2].Y} {0.}
(assert (= of_92 0.))
(declare-fun slbot_90_1 () Real)
(assert (<= slbot_90_1 1e-08))
(declare-fun sltop_90_1 () Real)
(assert (>= sltop_90_1 1e-08))
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X.1)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90_1) 0.0001))
; 
; =  {(((sc.itov[2].X*1.)+of.itov[2].X)+sl.max.itov[2].X.1)} {10.}
(assert (= (+ (+ (* sc_90 1.) of_90) sltop_90_1) 10.))
(declare-fun slbot_92_1 () Real)
(assert (<= slbot_92_1 1e-08))
(declare-fun sltop_92_1 () Real)
(assert (>= sltop_92_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92_1) 0.0001))
; 
; =  {(((sc.itov[2].Y*3.154)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_92 3.154) of_92) sltop_92_1) 3300.))
; 
; >=  {((sc.itov[2].K*3.154)+of.itov[2].K)} {330.}
(assert (<= (+ (* sc_91 3.154) of_91) 330.))
; 
; <=  {((sc.itov[2].K*3.154)+of.itov[2].K)} {1.}
(assert (>= (+ (* sc_91 3.154) of_91) 1.))
(declare-fun slbot_92_1 () Real)
(assert (<= slbot_92_1 1e-08))
(declare-fun sltop_92_1 () Real)
(assert (>= sltop_92_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92_1) 0.0001))
; 
; =  {(((sc.itov[2].Y*3.154)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_92 3.154) of_92) sltop_92_1) 3300.))
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
(assert (= of_94 0.))
; no offset
(assert (= of_93 0.))
; 
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_95 (* sc_94 sc_93)))
; 
; =  {of.itov[7].Y} {0.}
(assert (= of_95 0.))
(declare-fun slbot_93_1 () Real)
(assert (<= slbot_93_1 1e-08))
(declare-fun sltop_93_1 () Real)
(assert (>= sltop_93_1 1e-08))
; 
; =  {(((sc.itov[7].X*0.)+of.itov[7].X)+sl.min.itov[7].X.1)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93_1) 0.0001))
; 
; =  {(((sc.itov[7].X*1.)+of.itov[7].X)+sl.max.itov[7].X.1)} {10.}
(assert (= (+ (+ (* sc_93 1.) of_93) sltop_93_1) 10.))
(declare-fun slbot_95_1 () Real)
(assert (<= slbot_95_1 1e-08))
(declare-fun sltop_95_1 () Real)
(assert (>= sltop_95_1 1e-08))
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95_1) 0.0001))
; 
; =  {(((sc.itov[7].Y*25.232)+of.itov[7].Y)+sl.max.itov[7].Y.1)} {3300.}
(assert (= (+ (+ (* sc_95 25.232) of_95) sltop_95_1) 3300.))
; 
; >=  {((sc.itov[7].K*25.232)+of.itov[7].K)} {330.}
(assert (<= (+ (* sc_94 25.232) of_94) 330.))
; 
; <=  {((sc.itov[7].K*25.232)+of.itov[7].K)} {1.}
(assert (>= (+ (* sc_94 25.232) of_94) 1.))
(declare-fun slbot_95_1 () Real)
(assert (<= slbot_95_1 1e-08))
(declare-fun sltop_95_1 () Real)
(assert (>= sltop_95_1 1e-08))
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95_1) 0.0001))
; 
; =  {(((sc.itov[7].Y*25.232)+of.itov[7].Y)+sl.max.itov[7].Y.1)} {3300.}
(assert (= (+ (+ (* sc_95 25.232) of_95) sltop_95_1) 3300.))
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
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_98 (* sc_97 sc_96)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_98 0.))
(declare-fun slbot_96_1 () Real)
(assert (<= slbot_96_1 1e-08))
(declare-fun sltop_96_1 () Real)
(assert (>= sltop_96_1 1e-08))
; 
; =  {(((sc.itov[9].X*0.)+of.itov[9].X)+sl.min.itov[9].X.1)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96_1) 0.0001))
; 
; =  {(((sc.itov[9].X*1.)+of.itov[9].X)+sl.max.itov[9].X.1)} {10.}
(assert (= (+ (+ (* sc_96 1.) of_96) sltop_96_1) 10.))
(declare-fun slbot_98_1 () Real)
(assert (<= slbot_98_1 1e-08))
(declare-fun sltop_98_1 () Real)
(assert (>= sltop_98_1 1e-08))
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98_1) 0.0001))
; 
; =  {(((sc.itov[9].Y*6.308)+of.itov[9].Y)+sl.max.itov[9].Y.1)} {3300.}
(assert (= (+ (+ (* sc_98 6.308) of_98) sltop_98_1) 3300.))
(declare-fun slbot_97_1 () Real)
(assert (<= slbot_97_1 1e-08))
(declare-fun sltop_97_1 () Real)
(assert (>= sltop_97_1 1e-08))
; 
; =  {(((sc.itov[9].K*0.)+of.itov[9].K)+sl.min.itov[9].K.1)} {1.}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97_1) 1.))
; 
; =  {(((sc.itov[9].K*6.308)+of.itov[9].K)+sl.max.itov[9].K.1)} {330.}
(assert (= (+ (+ (* sc_97 6.308) of_97) sltop_97_1) 330.))
(declare-fun slbot_98_1 () Real)
(assert (<= slbot_98_1 1e-08))
(declare-fun sltop_98_1 () Real)
(assert (>= sltop_98_1 1e-08))
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98_1) 0.0001))
; 
; =  {(((sc.itov[9].Y*6.308)+of.itov[9].Y)+sl.max.itov[9].Y.1)} {3300.}
(assert (= (+ (+ (* sc_98 6.308) of_98) sltop_98_1) 3300.))
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
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_101 (* sc_100 sc_99)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_101 0.))
; 
; >=  {((sc.itov[0].X*4.63)+of.itov[0].X)} {10.}
(assert (<= (+ (* sc_99 4.63) of_99) 10.))
; 
; <=  {((sc.itov[0].X*4.63)+of.itov[0].X)} {0.0001}
(assert (>= (+ (* sc_99 4.63) of_99) 0.0001))
(declare-fun slbot_101_1 () Real)
(assert (<= slbot_101_1 1e-08))
(declare-fun sltop_101_1 () Real)
(assert (>= sltop_101_1 1e-08))
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_101 0.) of_101) slbot_101_1) 0.0001))
; 
; =  {(((sc.itov[0].Y*4.63)+of.itov[0].Y)+sl.max.itov[0].Y.1)} {3300.}
(assert (= (+ (+ (* sc_101 4.63) of_101) sltop_101_1) 3300.))
(declare-fun slbot_100_1 () Real)
(assert (<= slbot_100_1 1e-08))
(declare-fun sltop_100_1 () Real)
(assert (>= sltop_100_1 1e-08))
; 
; =  {(((sc.itov[0].K*0.)+of.itov[0].K)+sl.min.itov[0].K.1)} {1.}
(assert (= (+ (+ (* sc_100 0.) of_100) slbot_100_1) 1.))
; 
; =  {(((sc.itov[0].K*1.)+of.itov[0].K)+sl.max.itov[0].K.1)} {330.}
(assert (= (+ (+ (* sc_100 1.) of_100) sltop_100_1) 330.))
(declare-fun slbot_101_1 () Real)
(assert (<= slbot_101_1 1e-08))
(declare-fun sltop_101_1 () Real)
(assert (>= sltop_101_1 1e-08))
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_101 0.) of_101) slbot_101_1) 0.0001))
; 
; =  {(((sc.itov[0].Y*4.63)+of.itov[0].Y)+sl.max.itov[0].Y.1)} {3300.}
(assert (= (+ (+ (* sc_101 4.63) of_101) sltop_101_1) 3300.))
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
; =  {sc.itov[11].Y} {(sc.itov[11].K*sc.itov[11].X)}
(assert (= sc_104 (* sc_103 sc_102)))
; 
; =  {of.itov[11].Y} {0.}
(assert (= of_104 0.))
; 
; >=  {((sc.itov[11].X*0.42)+of.itov[11].X)} {10.}
(assert (<= (+ (* sc_102 0.42) of_102) 10.))
; 
; <=  {((sc.itov[11].X*0.42)+of.itov[11].X)} {0.0001}
(assert (>= (+ (* sc_102 0.42) of_102) 0.0001))
(declare-fun slbot_104_1 () Real)
(assert (<= slbot_104_1 1e-08))
(declare-fun sltop_104_1 () Real)
(assert (>= sltop_104_1 1e-08))
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_104 0.) of_104) slbot_104_1) 0.0001))
; 
; =  {(((sc.itov[11].Y*0.42)+of.itov[11].Y)+sl.max.itov[11].Y.1)} {3300.}
(assert (= (+ (+ (* sc_104 0.42) of_104) sltop_104_1) 3300.))
(declare-fun slbot_103_1 () Real)
(assert (<= slbot_103_1 1e-08))
(declare-fun sltop_103_1 () Real)
(assert (>= sltop_103_1 1e-08))
; 
; =  {(((sc.itov[11].K*0.)+of.itov[11].K)+sl.min.itov[11].K.1)} {1.}
(assert (= (+ (+ (* sc_103 0.) of_103) slbot_103_1) 1.))
; 
; =  {(((sc.itov[11].K*1.)+of.itov[11].K)+sl.max.itov[11].K.1)} {330.}
(assert (= (+ (+ (* sc_103 1.) of_103) sltop_103_1) 330.))
(declare-fun slbot_104_1 () Real)
(assert (<= slbot_104_1 1e-08))
(declare-fun sltop_104_1 () Real)
(assert (>= sltop_104_1 1e-08))
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_104 0.) of_104) slbot_104_1) 0.0001))
; 
; =  {(((sc.itov[11].Y*0.42)+of.itov[11].Y)+sl.max.itov[11].Y.1)} {3300.}
(assert (= (+ (+ (* sc_104 0.42) of_104) sltop_104_1) 3300.))
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
; =  {sc.itov[6].Y} {(sc.itov[6].K*sc.itov[6].X)}
(assert (= sc_107 (* sc_106 sc_105)))
; 
; =  {of.itov[6].Y} {0.}
(assert (= of_107 0.))
(declare-fun slbot_105_1 () Real)
(assert (<= slbot_105_1 1e-08))
(declare-fun sltop_105_1 () Real)
(assert (>= sltop_105_1 1e-08))
; 
; =  {(((sc.itov[6].X*0.)+of.itov[6].X)+sl.min.itov[6].X.1)} {0.0001}
(assert (= (+ (+ (* sc_105 0.) of_105) slbot_105_1) 0.0001))
; 
; =  {(((sc.itov[6].X*5.05)+of.itov[6].X)+sl.max.itov[6].X.1)} {10.}
(assert (= (+ (+ (* sc_105 5.05) of_105) sltop_105_1) 10.))
(declare-fun slbot_107_1 () Real)
(assert (<= slbot_107_1 1e-08))
(declare-fun sltop_107_1 () Real)
(assert (>= sltop_107_1 1e-08))
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_107 0.) of_107) slbot_107_1) 0.0001))
; 
; =  {(((sc.itov[6].Y*5.05)+of.itov[6].Y)+sl.max.itov[6].Y.1)} {3300.}
(assert (= (+ (+ (* sc_107 5.05) of_107) sltop_107_1) 3300.))
; 
; >=  {((sc.itov[6].K*1.)+of.itov[6].K)} {330.}
(assert (<= (+ (* sc_106 1.) of_106) 330.))
; 
; <=  {((sc.itov[6].K*1.)+of.itov[6].K)} {1.}
(assert (>= (+ (* sc_106 1.) of_106) 1.))
(declare-fun slbot_107_1 () Real)
(assert (<= slbot_107_1 1e-08))
(declare-fun sltop_107_1 () Real)
(assert (>= sltop_107_1 1e-08))
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_107 0.) of_107) slbot_107_1) 0.0001))
; 
; =  {(((sc.itov[6].Y*5.05)+of.itov[6].Y)+sl.max.itov[6].Y.1)} {3300.}
(assert (= (+ (+ (* sc_107 5.05) of_107) sltop_107_1) 3300.))
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
; =  {sc.itov[5].Y} {(sc.itov[5].K*sc.itov[5].X)}
(assert (= sc_110 (* sc_109 sc_108)))
; 
; =  {of.itov[5].Y} {0.}
(assert (= of_110 0.))
(declare-fun slbot_108_1 () Real)
(assert (<= slbot_108_1 1e-08))
(declare-fun sltop_108_1 () Real)
(assert (>= sltop_108_1 1e-08))
; 
; =  {(((sc.itov[5].X*0.)+of.itov[5].X)+sl.min.itov[5].X.1)} {0.0001}
(assert (= (+ (+ (* sc_108 0.) of_108) slbot_108_1) 0.0001))
; 
; =  {(((sc.itov[5].X*1.)+of.itov[5].X)+sl.max.itov[5].X.1)} {10.}
(assert (= (+ (+ (* sc_108 1.) of_108) sltop_108_1) 10.))
(declare-fun slbot_110_1 () Real)
(assert (<= slbot_110_1 1e-08))
(declare-fun sltop_110_1 () Real)
(assert (>= sltop_110_1 1e-08))
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_110 0.) of_110) slbot_110_1) 0.0001))
; 
; =  {(((sc.itov[5].Y*3.154)+of.itov[5].Y)+sl.max.itov[5].Y.1)} {3300.}
(assert (= (+ (+ (* sc_110 3.154) of_110) sltop_110_1) 3300.))
; 
; >=  {((sc.itov[5].K*3.154)+of.itov[5].K)} {330.}
(assert (<= (+ (* sc_109 3.154) of_109) 330.))
; 
; <=  {((sc.itov[5].K*3.154)+of.itov[5].K)} {1.}
(assert (>= (+ (* sc_109 3.154) of_109) 1.))
(declare-fun slbot_110_1 () Real)
(assert (<= slbot_110_1 1e-08))
(declare-fun sltop_110_1 () Real)
(assert (>= sltop_110_1 1e-08))
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y.1)} {0.0001}
(assert (= (+ (+ (* sc_110 0.) of_110) slbot_110_1) 0.0001))
; 
; =  {(((sc.itov[5].Y*3.154)+of.itov[5].Y)+sl.max.itov[5].Y.1)} {3300.}
(assert (= (+ (+ (* sc_110 3.154) of_110) sltop_110_1) 3300.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].D}
(assert (= sc_92 sc_44))
; 
; =  {of.itov[2].Y} {of.vadd[1].D}
(assert (= of_92 of_44))
; 
; =  {sc.input.V[17].O} {sc.itov[7].K}
(assert (= sc_85 sc_94))
; 
; =  {of.input.V[17].O} {of.itov[7].K}
(assert (= of_85 of_94))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[2].X}
(assert (= sc_42 sc_90))
; 
; =  {of.vadd[4].OUT2} {of.itov[2].X}
(assert (= of_42 of_90))
; 
; =  {sc.vadd[4].OUT2} {sc.itov[7].X}
(assert (= sc_42 sc_93))
; 
; =  {of.vadd[4].OUT2} {of.itov[7].X}
(assert (= of_42 of_93))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[5].X}
(assert (= sc_49 sc_108))
; 
; =  {of.vadd[1].OUT2} {of.itov[5].X}
(assert (= of_49 of_108))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[9].X}
(assert (= sc_49 sc_96))
; 
; =  {of.vadd[1].OUT2} {of.itov[9].X}
(assert (= of_49 of_96))
; 
; =  {sc.input.I[0].O} {sc.switch[3].SUB}
(assert (= sc_8 sc_1))
; 
; =  {of.input.I[0].O} {of.switch[3].SUB}
(assert (= of_8 of_1))
; 
; =  {sc.input.V[9].O} {sc.vadd[10].B}
(assert (= sc_61 sc_33))
; 
; =  {of.input.V[9].O} {of.vadd[10].B}
(assert (= of_61 of_33))
; 
; =  {sc.itov[11].Y} {sc.vadd[12].B}
(assert (= sc_104 sc_26))
; 
; =  {of.itov[11].Y} {of.vadd[12].B}
(assert (= of_104 of_26))
; 
; =  {sc.input.V[15].O} {sc.vadd[1].OUT2_0}
(assert (= sc_69 sc_43))
; 
; =  {of.input.V[15].O} {of.vadd[1].OUT2_0}
(assert (= of_69 of_43))
; 
; =  {sc.input.V[13].O} {sc.vadd[12].C}
(assert (= sc_57 sc_24))
; 
; =  {of.input.V[13].O} {of.vadd[12].C}
(assert (= of_57 of_24))
; 
; =  {sc.input.I[3].O} {sc.switch[3].Kmod}
(assert (= sc_10 sc_2))
; 
; =  {of.input.I[3].O} {of.switch[3].Kmod}
(assert (= of_10 of_2))
; 
; =  {sc.input.V[14].O} {sc.switch[3].n}
(assert (= sc_73 sc_0))
; 
; =  {of.input.V[14].O} {of.switch[3].n}
(assert (= of_73 of_0))
; 
; =  {sc.input.V[11].O} {sc.vadd[12].A}
(assert (= sc_65 sc_25))
; 
; =  {of.input.V[11].O} {of.vadd[12].A}
(assert (= of_65 of_25))
; 
; =  {sc.itov[5].Y} {sc.vadd[4].D}
(assert (= sc_110 sc_37))
; 
; =  {of.itov[5].Y} {of.vadd[4].D}
(assert (= of_110 of_37))
; 
; =  {sc.input.V[12].O} {sc.vadd[12].D}
(assert (= sc_59 sc_23))
; 
; =  {of.input.V[12].O} {of.vadd[12].D}
(assert (= of_59 of_23))
; 
; =  {sc.input.I[2].O} {sc.itov[11].X}
(assert (= sc_6 sc_102))
; 
; =  {of.input.I[2].O} {of.itov[11].X}
(assert (= of_6 of_102))
; 
; =  {sc.input.V[8].O} {sc.vadd[8].A}
(assert (= sc_53 sc_18))
; 
; =  {of.input.V[8].O} {of.vadd[8].A}
(assert (= of_53 of_18))
; 
; =  {sc.switch[3].PROD} {sc.itov[6].X}
(assert (= sc_4 sc_105))
; 
; =  {of.switch[3].PROD} {of.itov[6].X}
(assert (= of_4 of_105))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].C}
(assert (= sc_77 sc_45))
; 
; =  {of.input.V[3].O} {of.vadd[1].C}
(assert (= of_77 of_45))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].A}
(assert (= sc_51 sc_46))
; 
; =  {of.input.V[2].O} {of.vadd[1].A}
(assert (= of_51 of_46))
; 
; =  {sc.itov[7].Y} {sc.vadd[10].A}
(assert (= sc_95 sc_32))
; 
; =  {of.itov[7].Y} {of.vadd[10].A}
(assert (= of_95 of_32))
; 
; =  {sc.vadd[10].OUT} {sc.itov[9].K}
(assert (= sc_34 sc_97))
; 
; =  {of.vadd[10].OUT} {of.itov[9].K}
(assert (= of_34 of_97))
; 
; =  {sc.input.V[19].O} {sc.itov[6].K}
(assert (= sc_89 sc_106))
; 
; =  {of.input.V[19].O} {of.itov[6].K}
(assert (= of_89 of_106))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_101 sc_47))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_101 of_47))
; 
; =  {sc.input.I[1].O} {sc.itov[0].X}
(assert (= sc_12 sc_99))
; 
; =  {of.input.I[1].O} {of.itov[0].X}
(assert (= of_12 of_99))
; 
; =  {sc.input.V[1].O} {sc.itov[2].K}
(assert (= sc_83 sc_91))
; 
; =  {of.input.V[1].O} {of.itov[2].K}
(assert (= of_83 of_91))
; 
; =  {sc.input.V[7].O} {sc.vadd[8].C}
(assert (= sc_55 sc_17))
; 
; =  {of.input.V[7].O} {of.vadd[8].C}
(assert (= of_55 of_17))
; 
; =  {sc.vadd[12].OUT2} {sc.output.V[0].X}
(assert (= sc_28 sc_13))
; 
; =  {of.vadd[12].OUT2} {of.output.V[0].X}
(assert (= of_28 of_13))
; 
; =  {sc.vadd[8].OUT2} {sc.itov[11].K}
(assert (= sc_21 sc_103))
; 
; =  {of.vadd[8].OUT2} {of.itov[11].K}
(assert (= of_21 of_103))
; 
; =  {sc.vadd[8].OUT2} {sc.itov[0].K}
(assert (= sc_21 sc_100))
; 
; =  {of.vadd[8].OUT2} {of.itov[0].K}
(assert (= of_21 of_100))
; 
; =  {sc.vadd[8].OUT2} {sc.switch[3].Vmax}
(assert (= sc_21 sc_3))
; 
; =  {of.vadd[8].OUT2} {of.switch[3].Vmax}
(assert (= of_21 of_3))
; 
; =  {sc.itov[6].Y} {sc.vadd[4].B}
(assert (= sc_107 sc_40))
; 
; =  {of.itov[6].Y} {of.vadd[4].B}
(assert (= of_107 of_40))
; 
; =  {sc.input.V[0].O} {sc.itov[5].K}
(assert (= sc_63 sc_109))
; 
; =  {of.input.V[0].O} {of.itov[5].K}
(assert (= of_63 of_109))
; 
; =  {sc.input.V[10].O} {sc.vadd[12].OUT2_0}
(assert (= sc_67 sc_22))
; 
; =  {of.input.V[10].O} {of.vadd[12].OUT2_0}
(assert (= of_67 of_22))
; 
; =  {sc.input.V[18].O} {sc.vadd[8].D}
(assert (= sc_87 sc_16))
; 
; =  {of.input.V[18].O} {of.vadd[8].D}
(assert (= of_87 of_16))
; 
; =  {sc.input.V[16].O} {sc.vadd[4].OUT2_0}
(assert (= sc_75 sc_36))
; 
; =  {of.input.V[16].O} {of.vadd[4].OUT2_0}
(assert (= of_75 of_36))
; 
; =  {sc.itov[9].Y} {sc.vadd[8].B}
(assert (= sc_98 sc_19))
; 
; =  {of.itov[9].Y} {of.vadd[8].B}
(assert (= of_98 of_19))
; 
; =  {sc.input.V[4].O} {sc.vadd[4].A}
(assert (= sc_79 sc_39))
; 
; =  {of.input.V[4].O} {of.vadd[4].A}
(assert (= of_79 of_39))
; 
; =  {sc.input.V[5].O} {sc.vadd[4].C}
(assert (= sc_81 sc_38))
; 
; =  {of.input.V[5].O} {of.vadd[4].C}
(assert (= of_81 of_38))
; 
; =  {sc.input.V[6].O} {sc.vadd[8].OUT2_0}
(assert (= sc_71 sc_15))
; 
; =  {of.input.V[6].O} {of.vadd[8].OUT2_0}
(assert (= of_71 of_15))
(assert (<= (* (/ 1. sc_14) 0.001) 0.1))
; 
; =  {sc.vadd[12].OUT2} {sc.output.V[0].O} {sc.vadd[1].OUT2} {sc.vadd[4].OUT2} {sc.vadd[8].OUT2}
(assert (and (and (and (= sc_28 sc_14) (= sc_28 sc_49)) (= sc_28 sc_42)) (= sc_28 sc_21)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_27_1 0.) slbot_27_1 (- slbot_27_1)) (ite (>= sltop_34_1 0.) sltop_34_1 (- sltop_34_1))) (ite (>= slbot_28_1 0.) slbot_28_1 (- slbot_28_1))) (ite (>= slbot_108_1 0.) slbot_108_1 (- slbot_108_1))) (ite (>= slbot_19_1 0.) slbot_19_1 (- slbot_19_1))) (ite (>= slbot_37_1 0.) slbot_37_1 (- slbot_37_1))) (ite (>= sltop_93_1 0.) sltop_93_1 (- sltop_93_1))) (ite (>= sltop_37_1 0.) sltop_37_1 (- sltop_37_1))) (ite (>= sltop_95_1 0.) sltop_95_1 (- sltop_95_1))) (ite (>= sltop_13_1 0.) sltop_13_1 (- sltop_13_1))) (ite (>= sltop_103_1 0.) sltop_103_1 (- sltop_103_1))) (ite (>= slbot_107_1 0.) slbot_107_1 (- slbot_107_1))) (ite (>= slbot_110_1 0.) slbot_110_1 (- slbot_110_1))) (ite (>= sltop_28_1 0.) sltop_28_1 (- sltop_28_1))) (ite (>= slbot_92_1 0.) slbot_92_1 (- slbot_92_1))) (ite (>= sltop_92_1 0.) sltop_92_1 (- sltop_92_1))) (ite (>= sltop_101_1 0.) sltop_101_1 (- sltop_101_1))) (ite (>= slbot_4_1 0.) slbot_4_1 (- slbot_4_1))) (ite (>= slbot_95_1 0.) slbot_95_1 (- slbot_95_1))) (ite (>= sltop_21_1 0.) sltop_21_1 (- sltop_21_1))) (ite (>= slbot_96_1 0.) slbot_96_1 (- slbot_96_1))) (ite (>= slbot_14_1 0.) slbot_14_1 (- slbot_14_1))) (ite (>= sltop_40_1 0.) sltop_40_1 (- sltop_40_1))) (ite (>= sltop_19_1 0.) sltop_19_1 (- sltop_19_1))) (ite (>= slbot_97_1 0.) slbot_97_1 (- slbot_97_1))) (ite (>= slbot_49_1 0.) slbot_49_1 (- slbot_49_1))) (ite (>= sltop_49_1 0.) sltop_49_1 (- sltop_49_1))) (ite (>= slbot_104_1 0.) slbot_104_1 (- slbot_104_1))) (ite (>= slbot_34_1 0.) slbot_34_1 (- slbot_34_1))) (ite (>= slbot_47_1 0.) slbot_47_1 (- slbot_47_1))) (ite (>= sltop_104_1 0.) sltop_104_1 (- sltop_104_1))) (ite (>= sltop_41_1 0.) sltop_41_1 (- sltop_41_1))) (ite (>= sltop_26_1 0.) sltop_26_1 (- sltop_26_1))) (ite (>= slbot_44_1 0.) slbot_44_1 (- slbot_44_1))) (ite (>= slbot_90_1 0.) slbot_90_1 (- slbot_90_1))) (ite (>= sltop_32_1 0.) sltop_32_1 (- sltop_32_1))) (ite (>= slbot_48_1 0.) slbot_48_1 (- slbot_48_1))) (ite (>= slbot_100_1 0.) slbot_100_1 (- slbot_100_1))) (ite (>= sltop_47_1 0.) sltop_47_1 (- sltop_47_1))) (ite (>= slbot_20_1 0.) slbot_20_1 (- slbot_20_1))) (ite (>= slbot_40_1 0.) slbot_40_1 (- slbot_40_1))) (ite (>= sltop_98_1 0.) sltop_98_1 (- sltop_98_1))) (ite (>= slbot_101_1 0.) slbot_101_1 (- slbot_101_1))) (ite (>= sltop_3_1 0.) sltop_3_1 (- sltop_3_1))) (ite (>= slbot_32_1 0.) slbot_32_1 (- slbot_32_1))) (ite (>= sltop_110_1 0.) sltop_110_1 (- sltop_110_1))) (ite (>= slbot_98_1 0.) slbot_98_1 (- slbot_98_1))) (ite (>= slbot_21_1 0.) slbot_21_1 (- slbot_21_1))) (ite (>= slbot_42_1 0.) slbot_42_1 (- slbot_42_1))) (ite (>= sltop_90_1 0.) sltop_90_1 (- sltop_90_1))) (ite (>= sltop_48_1 0.) sltop_48_1 (- sltop_48_1))) (ite (>= slbot_3_1 0.) slbot_3_1 (- slbot_3_1))) (ite (>= slbot_93_1 0.) slbot_93_1 (- slbot_93_1))) (ite (>= sltop_97_1 0.) sltop_97_1 (- sltop_97_1))) (ite (>= slbot_41_1 0.) slbot_41_1 (- slbot_41_1))) (ite (>= sltop_96_1 0.) sltop_96_1 (- sltop_96_1))) (ite (>= sltop_100_1 0.) sltop_100_1 (- sltop_100_1))) (ite (>= sltop_4_1 0.) sltop_4_1 (- sltop_4_1))) (ite (>= sltop_14_1 0.) sltop_14_1 (- sltop_14_1))) (ite (>= sltop_44_1 0.) sltop_44_1 (- sltop_44_1))) (ite (>= sltop_27_1 0.) sltop_27_1 (- sltop_27_1))) (ite (>= slbot_13_1 0.) slbot_13_1 (- slbot_13_1))) (ite (>= sltop_20_1 0.) sltop_20_1 (- sltop_20_1))) (ite (>= slbot_105_1 0.) slbot_105_1 (- slbot_105_1))) (ite (>= sltop_105_1 0.) sltop_105_1 (- sltop_105_1))) (ite (>= sltop_107_1 0.) sltop_107_1 (- sltop_107_1))) (ite (>= slbot_26_1 0.) slbot_26_1 (- slbot_26_1))) (ite (>= sltop_42_1 0.) sltop_42_1 (- sltop_42_1))) (ite (>= sltop_108_1 0.) sltop_108_1 (- sltop_108_1))) (ite (>= slbot_103_1 0.) slbot_103_1 (- slbot_103_1)))))
(check-sat)
