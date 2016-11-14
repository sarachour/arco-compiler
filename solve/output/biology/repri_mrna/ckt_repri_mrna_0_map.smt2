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
(assert (= of_2 0.))
; no offset
(assert (= of_0 0.))
; no offset
(assert (= of_1 0.))
; no offset
(assert (= of_0 0.))
; no offset
(assert (= of_2 0.))
; no offset
(assert (= of_0 0.))
; 
; =  {(sc.ihill_rep[0].Km^2)} {(sc.ihill_rep[0].S^2)}
(assert (= (^ sc_2 2) (^ sc_1 2)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_3 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill_rep[0].REP} {(sc.ihill_rep[0].Vmax*((sc.ihill_rep[0].Km^2)/(sc.ihill_rep[0].Km^2)))}
(assert (= sc_4 (* sc_3 (/ (^ sc_2 2) (^ sc_2 2)))))
; 
; =  {of.ihill_rep[0].REP} {0.}
(assert (= of_4 0.))
; 
; >=  {((sc.ihill_rep[0].n*2.)+of.ihill_rep[0].n)} {5.}
(assert (<= (+ (* sc_0 2.) of_0) 5.))
; 
; <=  {((sc.ihill_rep[0].n*2.)+of.ihill_rep[0].n)} {1.}
(assert (>= (+ (* sc_0 2.) of_0) 1.))
(declare-fun slbot_1_1 () Real)
(assert (<= slbot_1_1 1e-08))
(declare-fun sltop_1_1 () Real)
(assert (>= sltop_1_1 1e-08))
; 
; =  {(((sc.ihill_rep[0].S*0.)+of.ihill_rep[0].S)+sl.min.ihill_rep[0].S.1)} {0.}
(assert (= (+ (+ (* sc_1 0.) of_1) slbot_1_1) 0.))
; 
; =  {(((sc.ihill_rep[0].S*120.)+of.ihill_rep[0].S)+sl.max.ihill_rep[0].S.1)} {10.}
(assert (= (+ (+ (* sc_1 120.) of_1) sltop_1_1) 10.))
(declare-fun slbot_4_1 () Real)
(assert (<= slbot_4_1 1e-08))
(declare-fun sltop_4_1 () Real)
(assert (>= sltop_4_1 1e-08))
; 
; =  {(((sc.ihill_rep[0].REP*0.0499497502503)+of.ihill_rep[0].REP)+sl.min.ihill_rep[0].REP.1)} {0.}
(assert (= (+ (+ (* sc_4 0.0499497502503) of_4) slbot_4_1) 0.))
; 
; =  {(((sc.ihill_rep[0].REP*0.499502497509)+of.ihill_rep[0].REP)+sl.max.ihill_rep[0].REP.1)} {1000000.}
(assert (= (+ (+ (* sc_4 0.499502497509) of_4) sltop_4_1) 1000000.))
(declare-fun slbot_2_1 () Real)
(assert (<= slbot_2_1 1e-08))
(declare-fun sltop_2_1 () Real)
(assert (>= sltop_2_1 1e-08))
; 
; =  {(((sc.ihill_rep[0].Km*39.9999)+of.ihill_rep[0].Km)+sl.min.ihill_rep[0].Km.1)} {1.}
(assert (= (+ (+ (* sc_2 39.9999) of_2) slbot_2_1) 1.))
; 
; =  {(((sc.ihill_rep[0].Km*40.)+of.ihill_rep[0].Km)+sl.max.ihill_rep[0].Km.1)} {10.}
(assert (= (+ (+ (* sc_2 40.) of_2) sltop_2_1) 10.))
; 
; >=  {((sc.ihill_rep[0].Vmax*0.4995)+of.ihill_rep[0].Vmax)} {10.}
(assert (<= (+ (* sc_3 0.4995) of_3) 10.))
; 
; <=  {((sc.ihill_rep[0].Vmax*0.4995)+of.ihill_rep[0].Vmax)} {0.}
(assert (>= (+ (* sc_3 0.4995) of_3) 0.))
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
; no scale
(assert (= sc_5 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_5 0.))
; no offset
(assert (= of_9 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_8 0.))
; 
; =  {sc.vdadd[2].A} {(1.*sc.vdadd[2].B)}
(assert (= sc_7 (* 1. sc_8)))
; 
; =  {sc.vdadd[2].A} {(1.*sc.vdadd[2].D*sc.vdadd[2].OUT)}
(assert (= sc_7 (* (* 1. sc_5) sc_9)))
; 
; =  {sc.vdadd[2].OUT} {sc.vdadd[2].A}
(assert (= sc_9 sc_7))
; no offset
(assert (= of_9 0.))
; no offset
(assert (= (- (+ of_7 0.) 0.) 0.))
; 
; =  {sc.vdadd[2].OUT_0} {sc.vdadd[2].A}
(assert (= sc_6 sc_7))
; 
; =  {of.vdadd[2].OUT_0} {((of.vdadd[2].A+0.)-0.)}
(assert (= of_6 (- (+ of_7 0.) 0.)))
; 
; >=  {((sc.vdadd[2].D*0.03010299956)+of.vdadd[2].D)} {10.}
(assert (<= (+ (* sc_5 0.03010299956) of_5) 10.))
; 
; <=  {((sc.vdadd[2].D*0.03010299956)+of.vdadd[2].D)} {0.}
(assert (>= (+ (* sc_5 0.03010299956) of_5) 0.))
(declare-fun slbot_9_1 () Real)
(assert (<= slbot_9_1 1e-08))
(declare-fun sltop_9_1 () Real)
(assert (>= sltop_9_1 1e-08))
; 
; =  {(((sc.vdadd[2].OUT*0.)+of.vdadd[2].OUT)+sl.min.vdadd[2].OUT.1)} {0.}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9_1) 0.))
; 
; =  {(((sc.vdadd[2].OUT*120.)+of.vdadd[2].OUT)+sl.max.vdadd[2].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_9 120.) of_9) sltop_9_1) 12000.))
; 
; >=  {((sc.vdadd[2].OUT_0*0.)+of.vdadd[2].OUT_0)} {3300.}
(assert (<= (+ (* sc_6 0.) of_6) 3300.))
; 
; <=  {((sc.vdadd[2].OUT_0*0.)+of.vdadd[2].OUT_0)} {0.}
(assert (>= (+ (* sc_6 0.) of_6) 0.))
(declare-fun slbot_7_1 () Real)
(assert (<= slbot_7_1 1e-08))
(declare-fun sltop_7_1 () Real)
(assert (>= sltop_7_1 1e-08))
; 
; =  {(((sc.vdadd[2].A*0.)+of.vdadd[2].A)+sl.min.vdadd[2].A.1)} {0.}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7_1) 0.))
; 
; =  {(((sc.vdadd[2].A*120.411998266)+of.vdadd[2].A)+sl.max.vdadd[2].A.1)} {3300.}
(assert (= (+ (+ (* sc_7 120.411998266) of_7) sltop_7_1) 3300.))
; 
; >=  {((sc.vdadd[2].B*0.)+of.vdadd[2].B)} {3300.}
(assert (<= (+ (* sc_8 0.) of_8) 3300.))
; 
; <=  {((sc.vdadd[2].B*0.)+of.vdadd[2].B)} {0.}
(assert (>= (+ (* sc_8 0.) of_8) 0.))
(declare-fun slbot_9_1 () Real)
(assert (<= slbot_9_1 1e-08))
(declare-fun sltop_9_1 () Real)
(assert (>= sltop_9_1 1e-08))
; 
; =  {(((sc.vdadd[2].OUT*0.)+of.vdadd[2].OUT)+sl.min.vdadd[2].OUT.1)} {0.}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9_1) 0.))
; 
; =  {(((sc.vdadd[2].OUT*120.)+of.vdadd[2].OUT)+sl.max.vdadd[2].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_9 120.) of_9) sltop_9_1) 12000.))
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
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
; no scale
(assert (= sc_10 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_10 0.))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_13 0.))
; 
; =  {sc.vdadd[3].A} {(1.*sc.vdadd[3].B)}
(assert (= sc_12 (* 1. sc_13)))
; 
; =  {sc.vdadd[3].A} {(1.*sc.vdadd[3].D*sc.vdadd[3].OUT)}
(assert (= sc_12 (* (* 1. sc_10) sc_14)))
; 
; =  {sc.vdadd[3].OUT} {sc.vdadd[3].A}
(assert (= sc_14 sc_12))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= (- (+ of_12 0.) 0.) 0.))
; 
; =  {sc.vdadd[3].OUT_0} {sc.vdadd[3].A}
(assert (= sc_11 sc_12))
; 
; =  {of.vdadd[3].OUT_0} {((of.vdadd[3].A+0.)-0.)}
(assert (= of_11 (- (+ of_12 0.) 0.)))
; 
; >=  {((sc.vdadd[3].D*0.15051499783)+of.vdadd[3].D)} {10.}
(assert (<= (+ (* sc_10 0.15051499783) of_10) 10.))
; 
; <=  {((sc.vdadd[3].D*0.15051499783)+of.vdadd[3].D)} {0.}
(assert (>= (+ (* sc_10 0.15051499783) of_10) 0.))
(declare-fun slbot_14_1 () Real)
(assert (<= slbot_14_1 1e-08))
(declare-fun sltop_14_1 () Real)
(assert (>= sltop_14_1 1e-08))
; 
; =  {(((sc.vdadd[3].OUT*0.)+of.vdadd[3].OUT)+sl.min.vdadd[3].OUT.1)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14_1) 0.))
; 
; =  {(((sc.vdadd[3].OUT*40.)+of.vdadd[3].OUT)+sl.max.vdadd[3].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_14 40.) of_14) sltop_14_1) 12000.))
; 
; >=  {((sc.vdadd[3].OUT_0*0.)+of.vdadd[3].OUT_0)} {3300.}
(assert (<= (+ (* sc_11 0.) of_11) 3300.))
; 
; <=  {((sc.vdadd[3].OUT_0*0.)+of.vdadd[3].OUT_0)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
(declare-fun slbot_12_1 () Real)
(assert (<= slbot_12_1 1e-08))
(declare-fun sltop_12_1 () Real)
(assert (>= sltop_12_1 1e-08))
; 
; =  {(((sc.vdadd[3].A*0.0499497502503)+of.vdadd[3].A)+sl.min.vdadd[3].A.1)} {0.}
(assert (= (+ (+ (* sc_12 0.0499497502503) of_12) slbot_12_1) 0.))
; 
; =  {(((sc.vdadd[3].A*0.499502497509)+of.vdadd[3].A)+sl.max.vdadd[3].A.1)} {3300.}
(assert (= (+ (+ (* sc_12 0.499502497509) of_12) sltop_12_1) 3300.))
; 
; >=  {((sc.vdadd[3].B*0.0005)+of.vdadd[3].B)} {3300.}
(assert (<= (+ (* sc_13 0.0005) of_13) 3300.))
; 
; <=  {((sc.vdadd[3].B*0.0005)+of.vdadd[3].B)} {0.}
(assert (>= (+ (* sc_13 0.0005) of_13) 0.))
(declare-fun slbot_14_1 () Real)
(assert (<= slbot_14_1 1e-08))
(declare-fun sltop_14_1 () Real)
(assert (>= sltop_14_1 1e-08))
; 
; =  {(((sc.vdadd[3].OUT*0.)+of.vdadd[3].OUT)+sl.min.vdadd[3].OUT.1)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14_1) 0.))
; 
; =  {(((sc.vdadd[3].OUT*40.)+of.vdadd[3].OUT)+sl.max.vdadd[3].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_14 40.) of_14) sltop_14_1) 12000.))
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[2].X*0.15051499783)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_15 0.15051499783) of_15) 10.))
; 
; <=  {((sc.input.I[2].X*0.15051499783)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_15 0.15051499783) of_15) 0.))
; 
; >=  {((sc.input.I[2].O*0.15051499783)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_16 0.15051499783) of_16) 10.))
; 
; <=  {((sc.input.I[2].O*0.15051499783)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_16 0.15051499783) of_16) 0.))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_18 of_17))
(declare-fun slbot_17_1 () Real)
(assert (<= slbot_17_1 1e-08))
(declare-fun sltop_17_1 () Real)
(assert (>= sltop_17_1 1e-08))
; 
; =  {(((sc.input.I[0].X*39.9999)+of.input.I[0].X)+sl.min.input.I[0].X.1)} {0.}
(assert (= (+ (+ (* sc_17 39.9999) of_17) slbot_17_1) 0.))
; 
; =  {(((sc.input.I[0].X*40.)+of.input.I[0].X)+sl.max.input.I[0].X.1)} {10.}
(assert (= (+ (+ (* sc_17 40.) of_17) sltop_17_1) 10.))
(declare-fun slbot_18_1 () Real)
(assert (<= slbot_18_1 1e-08))
(declare-fun sltop_18_1 () Real)
(assert (>= sltop_18_1 1e-08))
; 
; =  {(((sc.input.I[0].O*39.9999)+of.input.I[0].O)+sl.min.input.I[0].O.1)} {0.}
(assert (= (+ (+ (* sc_18 39.9999) of_18) slbot_18_1) 0.))
; 
; =  {(((sc.input.I[0].O*40.)+of.input.I[0].O)+sl.max.input.I[0].O.1)} {10.}
(assert (= (+ (+ (* sc_18 40.) of_18) sltop_18_1) 10.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[3].X*0.03010299956)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_19 0.03010299956) of_19) 10.))
; 
; <=  {((sc.input.I[3].X*0.03010299956)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_19 0.03010299956) of_19) 0.))
; 
; >=  {((sc.input.I[3].O*0.03010299956)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_20 0.03010299956) of_20) 10.))
; 
; <=  {((sc.input.I[3].O*0.03010299956)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_20 0.03010299956) of_20) 0.))
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
; >=  {((sc.input.I[1].X*0.4995)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_21 0.4995) of_21) 10.))
; 
; <=  {((sc.input.I[1].X*0.4995)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_21 0.4995) of_21) 0.))
; 
; >=  {((sc.input.I[1].O*0.4995)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_22 0.4995) of_22) 10.))
; 
; <=  {((sc.input.I[1].O*0.4995)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_22 0.4995) of_22) 0.))
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
(declare-fun slbot_23_1 () Real)
(assert (<= slbot_23_1 1e-08))
(declare-fun sltop_23_1 () Real)
(assert (>= sltop_23_1 1e-08))
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X.1)} {0.}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23_1) 0.))
; 
; =  {(((sc.output.V[0].X*40.)+of.output.V[0].X)+sl.max.output.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_23 40.) of_23) sltop_23_1) 3300.))
(declare-fun slbot_24_1 () Real)
(assert (<= slbot_24_1 1e-08))
(declare-fun sltop_24_1 () Real)
(assert (>= sltop_24_1 1e-08))
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O.1)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24_1) 0.))
; 
; =  {(((sc.output.V[0].O*40.)+of.output.V[0].O)+sl.max.output.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_24 40.) of_24) sltop_24_1) 3300.))
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
(declare-fun slbot_25_1 () Real)
(assert (<= slbot_25_1 1e-08))
(declare-fun sltop_25_1 () Real)
(assert (>= sltop_25_1 1e-08))
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X.1)} {0.}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25_1) 0.))
; 
; =  {(((sc.output.V[1].X*120.)+of.output.V[1].X)+sl.max.output.V[1].X.1)} {3300.}
(assert (= (+ (+ (* sc_25 120.) of_25) sltop_25_1) 3300.))
(declare-fun slbot_26_1 () Real)
(assert (<= slbot_26_1 1e-08))
(declare-fun sltop_26_1 () Real)
(assert (>= sltop_26_1 1e-08))
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O.1)} {0.}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26_1) 0.))
; 
; =  {(((sc.output.V[1].O*120.)+of.output.V[1].O)+sl.max.output.V[1].O.1)} {3300.}
(assert (= (+ (+ (* sc_26 120.) of_26) sltop_26_1) 3300.))
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_28 sc_27))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_28 of_27))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_27 0.) of_27) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_28 0.) of_28) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_30 sc_29))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_30 of_29))
; 
; >=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_29 2.) of_29) 3300.))
; 
; <=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_29 2.) of_29) 0.))
; 
; >=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_30 2.) of_30) 3300.))
; 
; <=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_30 2.) of_30) 0.))
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_32 of_31))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_31 0.) of_31) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_32 0.) of_32) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.V[4].X*0.0005)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_33 0.0005) of_33) 3300.))
; 
; <=  {((sc.input.V[4].X*0.0005)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_33 0.0005) of_33) 0.))
; 
; >=  {((sc.input.V[4].O*0.0005)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_34 0.0005) of_34) 3300.))
; 
; <=  {((sc.input.V[4].O*0.0005)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_34 0.0005) of_34) 0.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.V[5].X*3.01029995664)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_35 3.01029995664) of_35) 3300.))
; 
; <=  {((sc.input.V[5].X*3.01029995664)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_35 3.01029995664) of_35) 0.))
; 
; >=  {((sc.input.V[5].O*3.01029995664)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_36 3.01029995664) of_36) 3300.))
; 
; <=  {((sc.input.V[5].O*3.01029995664)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_36 3.01029995664) of_36) 0.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_37 0.) of_37) 3300.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_38 0.) of_38) 3300.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; no offset
(assert (= of_40 0.))
; no offset
(assert (= of_39 0.))
; 
; =  {sc.itov[1].Y} {(sc.itov[1].K*sc.itov[1].X)}
(assert (= sc_41 (* sc_40 sc_39)))
; 
; =  {of.itov[1].Y} {0.}
(assert (= of_41 0.))
(declare-fun slbot_39_1 () Real)
(assert (<= slbot_39_1 1e-08))
(declare-fun sltop_39_1 () Real)
(assert (>= sltop_39_1 1e-08))
; 
; =  {(((sc.itov[1].X*0.)+of.itov[1].X)+sl.min.itov[1].X.1)} {0.}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39_1) 0.))
; 
; =  {(((sc.itov[1].X*40.)+of.itov[1].X)+sl.max.itov[1].X.1)} {10.}
(assert (= (+ (+ (* sc_39 40.) of_39) sltop_39_1) 10.))
(declare-fun slbot_41_1 () Real)
(assert (<= slbot_41_1 1e-08))
(declare-fun sltop_41_1 () Real)
(assert (>= sltop_41_1 1e-08))
; 
; =  {(((sc.itov[1].Y*0.)+of.itov[1].Y)+sl.min.itov[1].Y.1)} {0.}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41_1) 0.))
; 
; =  {(((sc.itov[1].Y*120.411998266)+of.itov[1].Y)+sl.max.itov[1].Y.1)} {3300.}
(assert (= (+ (+ (* sc_41 120.411998266) of_41) sltop_41_1) 3300.))
; 
; >=  {((sc.itov[1].K*3.01029995664)+of.itov[1].K)} {330.}
(assert (<= (+ (* sc_40 3.01029995664) of_40) 330.))
; 
; <=  {((sc.itov[1].K*3.01029995664)+of.itov[1].K)} {1.}
(assert (>= (+ (* sc_40 3.01029995664) of_40) 1.))
(declare-fun slbot_41_1 () Real)
(assert (<= slbot_41_1 1e-08))
(declare-fun sltop_41_1 () Real)
(assert (>= sltop_41_1 1e-08))
; 
; =  {(((sc.itov[1].Y*0.)+of.itov[1].Y)+sl.min.itov[1].Y.1)} {0.}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41_1) 0.))
; 
; =  {(((sc.itov[1].Y*120.411998266)+of.itov[1].Y)+sl.max.itov[1].Y.1)} {3300.}
(assert (= (+ (+ (* sc_41 120.411998266) of_41) sltop_41_1) 3300.))
; 
; =  {sc.vdadd[3].OUT} {sc.output.V[0].X}
(assert (= sc_14 sc_23))
; 
; =  {of.vdadd[3].OUT} {of.output.V[0].X}
(assert (= of_14 of_23))
; 
; =  {sc.vdadd[3].OUT} {sc.itov[1].X}
(assert (= sc_14 sc_39))
; 
; =  {of.vdadd[3].OUT} {of.itov[1].X}
(assert (= of_14 of_39))
; 
; =  {sc.input.I[0].O} {sc.ihill_rep[0].Km}
(assert (= sc_18 sc_2))
; 
; =  {of.input.I[0].O} {of.ihill_rep[0].Km}
(assert (= of_18 of_2))
; 
; =  {sc.itov[1].Y} {sc.vdadd[2].A}
(assert (= sc_41 sc_7))
; 
; =  {of.itov[1].Y} {of.vdadd[2].A}
(assert (= of_41 of_7))
; 
; =  {sc.input.I[3].O} {sc.vdadd[2].D}
(assert (= sc_20 sc_5))
; 
; =  {of.input.I[3].O} {of.vdadd[2].D}
(assert (= of_20 of_5))
; 
; =  {sc.input.I[2].O} {sc.vdadd[3].D}
(assert (= sc_16 sc_10))
; 
; =  {of.input.I[2].O} {of.vdadd[3].D}
(assert (= of_16 of_10))
; 
; =  {sc.input.V[2].O} {sc.vdadd[3].OUT_0}
(assert (= sc_28 sc_11))
; 
; =  {of.input.V[2].O} {of.vdadd[3].OUT_0}
(assert (= of_28 of_11))
; 
; =  {sc.input.V[3].O} {sc.vdadd[2].B}
(assert (= sc_32 sc_8))
; 
; =  {of.input.V[3].O} {of.vdadd[2].B}
(assert (= of_32 of_8))
; 
; =  {sc.input.I[1].O} {sc.ihill_rep[0].Vmax}
(assert (= sc_22 sc_3))
; 
; =  {of.input.I[1].O} {of.ihill_rep[0].Vmax}
(assert (= of_22 of_3))
; 
; =  {sc.vdadd[2].OUT} {sc.output.V[1].X}
(assert (= sc_9 sc_25))
; 
; =  {of.vdadd[2].OUT} {of.output.V[1].X}
(assert (= of_9 of_25))
; 
; =  {sc.vdadd[2].OUT} {sc.ihill_rep[0].S}
(assert (= sc_9 sc_1))
; 
; =  {of.vdadd[2].OUT} {of.ihill_rep[0].S}
(assert (= of_9 of_1))
; 
; =  {sc.input.V[1].O} {sc.vdadd[2].OUT_0}
(assert (= sc_38 sc_6))
; 
; =  {of.input.V[1].O} {of.vdadd[2].OUT_0}
(assert (= of_38 of_6))
; 
; =  {sc.ihill_rep[0].REP} {sc.vdadd[3].A}
(assert (= sc_4 sc_12))
; 
; =  {of.ihill_rep[0].REP} {of.vdadd[3].A}
(assert (= of_4 of_12))
; 
; =  {sc.input.V[0].O} {sc.ihill_rep[0].n}
(assert (= sc_30 sc_0))
; 
; =  {of.input.V[0].O} {of.ihill_rep[0].n}
(assert (= of_30 of_0))
; 
; =  {sc.input.V[5].O} {sc.itov[1].K}
(assert (= sc_36 sc_40))
; 
; =  {of.input.V[5].O} {of.itov[1].K}
(assert (= of_36 of_40))
; 
; =  {sc.input.V[4].O} {sc.vdadd[3].B}
(assert (= sc_34 sc_13))
; 
; =  {of.input.V[4].O} {of.vdadd[3].B}
(assert (= of_34 of_13))
(assert (<= (* (/ 1. sc_24) 1) 100.))
(assert (<= (* (/ 1. sc_24) 1) 100.))
(assert (not (= 1. sc_24)))
(assert (<= (* (/ 1. sc_26) 1) 100.))
(assert (<= (* (/ 1. sc_26) 1) 100.))
(assert (not (= 1. sc_26)))
(assert (not (= 1. sc_4)))
; 
; =  {sc.vdadd[3].OUT} {sc.output.V[0].O} {sc.vdadd[2].OUT} {sc.output.V[1].O}
(assert (and (and (= sc_14 sc_24) (= sc_14 sc_9)) (= sc_14 sc_26)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_1_1 0.) slbot_1_1 (- slbot_1_1)) (ite (>= sltop_17_1 0.) sltop_17_1 (- sltop_17_1))) (ite (>= slbot_7_1 0.) slbot_7_1 (- slbot_7_1))) (ite (>= sltop_18_1 0.) sltop_18_1 (- sltop_18_1))) (ite (>= slbot_17_1 0.) slbot_17_1 (- slbot_17_1))) (ite (>= slbot_4_1 0.) slbot_4_1 (- slbot_4_1))) (ite (>= slbot_2_1 0.) slbot_2_1 (- slbot_2_1))) (ite (>= slbot_18_1 0.) slbot_18_1 (- slbot_18_1))) (ite (>= slbot_24_1 0.) slbot_24_1 (- slbot_24_1))) (ite (>= sltop_25_1 0.) sltop_25_1 (- sltop_25_1))) (ite (>= sltop_12_1 0.) sltop_12_1 (- sltop_12_1))) (ite (>= slbot_25_1 0.) slbot_25_1 (- slbot_25_1))) (ite (>= slbot_39_1 0.) slbot_39_1 (- slbot_39_1))) (ite (>= slbot_14_1 0.) slbot_14_1 (- slbot_14_1))) (ite (>= sltop_2_1 0.) sltop_2_1 (- sltop_2_1))) (ite (>= slbot_41_1 0.) slbot_41_1 (- slbot_41_1))) (ite (>= sltop_4_1 0.) sltop_4_1 (- sltop_4_1))) (ite (>= sltop_14_1 0.) sltop_14_1 (- sltop_14_1))) (ite (>= sltop_39_1 0.) sltop_39_1 (- sltop_39_1))) (ite (>= sltop_23_1 0.) sltop_23_1 (- sltop_23_1))) (ite (>= slbot_9_1 0.) slbot_9_1 (- slbot_9_1))) (ite (>= sltop_1_1 0.) sltop_1_1 (- sltop_1_1))) (ite (>= sltop_7_1 0.) sltop_7_1 (- sltop_7_1))) (ite (>= slbot_12_1 0.) slbot_12_1 (- slbot_12_1))) (ite (>= slbot_26_1 0.) slbot_26_1 (- slbot_26_1))) (ite (>= sltop_9_1 0.) sltop_9_1 (- sltop_9_1))) (ite (>= slbot_23_1 0.) slbot_23_1 (- slbot_23_1))) (ite (>= sltop_41_1 0.) sltop_41_1 (- sltop_41_1))) (ite (>= sltop_26_1 0.) sltop_26_1 (- sltop_26_1))) (ite (>= sltop_24_1 0.) sltop_24_1 (- sltop_24_1)))))
(check-sat)
