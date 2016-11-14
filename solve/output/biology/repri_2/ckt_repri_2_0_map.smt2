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
; =  {(((sc.ihill_rep[0].REP*0.04995)+of.ihill_rep[0].REP)+sl.min.ihill_rep[0].REP.1)} {0.}
(assert (= (+ (+ (* sc_4 0.04995) of_4) slbot_4_1) 0.))
; 
; =  {(((sc.ihill_rep[0].REP*0.4995)+of.ihill_rep[0].REP)+sl.max.ihill_rep[0].REP.1)} {1000000.}
(assert (= (+ (+ (* sc_4 0.4995) of_4) sltop_4_1) 1000000.))
; 
; >=  {((sc.ihill_rep[0].Km*40.)+of.ihill_rep[0].Km)} {10.}
(assert (<= (+ (* sc_2 40.) of_2) 10.))
; 
; <=  {((sc.ihill_rep[0].Km*40.)+of.ihill_rep[0].Km)} {1.}
(assert (>= (+ (* sc_2 40.) of_2) 1.))
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
; no offset
(assert (= of_7 0.))
; no offset
(assert (= of_5 0.))
; no offset
(assert (= of_6 0.))
; no offset
(assert (= of_5 0.))
; no offset
(assert (= of_7 0.))
; no offset
(assert (= of_5 0.))
; 
; =  {(sc.ihill_rep[5].Km^2)} {(sc.ihill_rep[5].S^2)}
(assert (= (^ sc_7 2) (^ sc_6 2)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_8 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill_rep[5].REP} {(sc.ihill_rep[5].Vmax*((sc.ihill_rep[5].Km^2)/(sc.ihill_rep[5].Km^2)))}
(assert (= sc_9 (* sc_8 (/ (^ sc_7 2) (^ sc_7 2)))))
; 
; =  {of.ihill_rep[5].REP} {0.}
(assert (= of_9 0.))
; 
; >=  {((sc.ihill_rep[5].n*2.)+of.ihill_rep[5].n)} {5.}
(assert (<= (+ (* sc_5 2.) of_5) 5.))
; 
; <=  {((sc.ihill_rep[5].n*2.)+of.ihill_rep[5].n)} {1.}
(assert (>= (+ (* sc_5 2.) of_5) 1.))
(declare-fun slbot_6_1 () Real)
(assert (<= slbot_6_1 1e-08))
(declare-fun sltop_6_1 () Real)
(assert (>= sltop_6_1 1e-08))
; 
; =  {(((sc.ihill_rep[5].S*0.)+of.ihill_rep[5].S)+sl.min.ihill_rep[5].S.1)} {0.}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6_1) 0.))
; 
; =  {(((sc.ihill_rep[5].S*120.)+of.ihill_rep[5].S)+sl.max.ihill_rep[5].S.1)} {10.}
(assert (= (+ (+ (* sc_6 120.) of_6) sltop_6_1) 10.))
(declare-fun slbot_9_1 () Real)
(assert (<= slbot_9_1 1e-08))
(declare-fun sltop_9_1 () Real)
(assert (>= sltop_9_1 1e-08))
; 
; =  {(((sc.ihill_rep[5].REP*0.04995)+of.ihill_rep[5].REP)+sl.min.ihill_rep[5].REP.1)} {0.}
(assert (= (+ (+ (* sc_9 0.04995) of_9) slbot_9_1) 0.))
; 
; =  {(((sc.ihill_rep[5].REP*0.4995)+of.ihill_rep[5].REP)+sl.max.ihill_rep[5].REP.1)} {1000000.}
(assert (= (+ (+ (* sc_9 0.4995) of_9) sltop_9_1) 1000000.))
; 
; >=  {((sc.ihill_rep[5].Km*40.)+of.ihill_rep[5].Km)} {10.}
(assert (<= (+ (* sc_7 40.) of_7) 10.))
; 
; <=  {((sc.ihill_rep[5].Km*40.)+of.ihill_rep[5].Km)} {1.}
(assert (>= (+ (* sc_7 40.) of_7) 1.))
; 
; >=  {((sc.ihill_rep[5].Vmax*0.4995)+of.ihill_rep[5].Vmax)} {10.}
(assert (<= (+ (* sc_8 0.4995) of_8) 10.))
; 
; <=  {((sc.ihill_rep[5].Vmax*0.4995)+of.ihill_rep[5].Vmax)} {0.}
(assert (>= (+ (* sc_8 0.4995) of_8) 0.))
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
; =  {sc.vdadd[7].A} {(1.*sc.vdadd[7].B)}
(assert (= sc_12 (* 1. sc_13)))
; 
; =  {sc.vdadd[7].A} {(1.*sc.vdadd[7].D*sc.vdadd[7].OUT)}
(assert (= sc_12 (* (* 1. sc_10) sc_14)))
; 
; =  {sc.vdadd[7].OUT} {sc.vdadd[7].A}
(assert (= sc_14 sc_12))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= (- (+ of_12 0.) 0.) 0.))
; 
; =  {sc.vdadd[7].OUT_0} {sc.vdadd[7].A}
(assert (= sc_11 sc_12))
; 
; =  {of.vdadd[7].OUT_0} {((of.vdadd[7].A+0.)-0.)}
(assert (= of_11 (- (+ of_12 0.) 0.)))
; 
; >=  {((sc.vdadd[7].D*0.03010299956)+of.vdadd[7].D)} {10.}
(assert (<= (+ (* sc_10 0.03010299956) of_10) 10.))
; 
; <=  {((sc.vdadd[7].D*0.03010299956)+of.vdadd[7].D)} {0.}
(assert (>= (+ (* sc_10 0.03010299956) of_10) 0.))
(declare-fun slbot_14_1 () Real)
(assert (<= slbot_14_1 1e-08))
(declare-fun sltop_14_1 () Real)
(assert (>= sltop_14_1 1e-08))
; 
; =  {(((sc.vdadd[7].OUT*0.)+of.vdadd[7].OUT)+sl.min.vdadd[7].OUT.1)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14_1) 0.))
; 
; =  {(((sc.vdadd[7].OUT*120.)+of.vdadd[7].OUT)+sl.max.vdadd[7].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_14 120.) of_14) sltop_14_1) 12000.))
; 
; >=  {((sc.vdadd[7].OUT_0*0.)+of.vdadd[7].OUT_0)} {3300.}
(assert (<= (+ (* sc_11 0.) of_11) 3300.))
; 
; <=  {((sc.vdadd[7].OUT_0*0.)+of.vdadd[7].OUT_0)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
(declare-fun slbot_12_1 () Real)
(assert (<= slbot_12_1 1e-08))
(declare-fun sltop_12_1 () Real)
(assert (>= sltop_12_1 1e-08))
; 
; =  {(((sc.vdadd[7].A*0.)+of.vdadd[7].A)+sl.min.vdadd[7].A.1)} {0.}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12_1) 0.))
; 
; =  {(((sc.vdadd[7].A*120.411998266)+of.vdadd[7].A)+sl.max.vdadd[7].A.1)} {3300.}
(assert (= (+ (+ (* sc_12 120.411998266) of_12) sltop_12_1) 3300.))
; 
; >=  {((sc.vdadd[7].B*0.)+of.vdadd[7].B)} {3300.}
(assert (<= (+ (* sc_13 0.) of_13) 3300.))
; 
; <=  {((sc.vdadd[7].B*0.)+of.vdadd[7].B)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
(declare-fun slbot_14_1 () Real)
(assert (<= slbot_14_1 1e-08))
(declare-fun sltop_14_1 () Real)
(assert (>= sltop_14_1 1e-08))
; 
; =  {(((sc.vdadd[7].OUT*0.)+of.vdadd[7].OUT)+sl.min.vdadd[7].OUT.1)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14_1) 0.))
; 
; =  {(((sc.vdadd[7].OUT*120.)+of.vdadd[7].OUT)+sl.max.vdadd[7].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_14 120.) of_14) sltop_14_1) 12000.))
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
; no scale
(assert (= sc_15 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_15 0.))
; no offset
(assert (= of_19 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_18 0.))
; 
; =  {sc.vdadd[3].A} {(1.*sc.vdadd[3].B)}
(assert (= sc_17 (* 1. sc_18)))
; 
; =  {sc.vdadd[3].A} {(1.*sc.vdadd[3].D*sc.vdadd[3].OUT)}
(assert (= sc_17 (* (* 1. sc_15) sc_19)))
; 
; =  {sc.vdadd[3].OUT} {sc.vdadd[3].A}
(assert (= sc_19 sc_17))
; no offset
(assert (= of_19 0.))
; no offset
(assert (= (- (+ of_17 0.) 0.) 0.))
; 
; =  {sc.vdadd[3].OUT_0} {sc.vdadd[3].A}
(assert (= sc_16 sc_17))
; 
; =  {of.vdadd[3].OUT_0} {((of.vdadd[3].A+0.)-0.)}
(assert (= of_16 (- (+ of_17 0.) 0.)))
; 
; >=  {((sc.vdadd[3].D*0.03010299956)+of.vdadd[3].D)} {10.}
(assert (<= (+ (* sc_15 0.03010299956) of_15) 10.))
; 
; <=  {((sc.vdadd[3].D*0.03010299956)+of.vdadd[3].D)} {0.}
(assert (>= (+ (* sc_15 0.03010299956) of_15) 0.))
(declare-fun slbot_19_1 () Real)
(assert (<= slbot_19_1 1e-08))
(declare-fun sltop_19_1 () Real)
(assert (>= sltop_19_1 1e-08))
; 
; =  {(((sc.vdadd[3].OUT*0.)+of.vdadd[3].OUT)+sl.min.vdadd[3].OUT.1)} {0.}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19_1) 0.))
; 
; =  {(((sc.vdadd[3].OUT*120.)+of.vdadd[3].OUT)+sl.max.vdadd[3].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_19 120.) of_19) sltop_19_1) 12000.))
; 
; >=  {((sc.vdadd[3].OUT_0*0.)+of.vdadd[3].OUT_0)} {3300.}
(assert (<= (+ (* sc_16 0.) of_16) 3300.))
; 
; <=  {((sc.vdadd[3].OUT_0*0.)+of.vdadd[3].OUT_0)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
(declare-fun slbot_17_1 () Real)
(assert (<= slbot_17_1 1e-08))
(declare-fun sltop_17_1 () Real)
(assert (>= sltop_17_1 1e-08))
; 
; =  {(((sc.vdadd[3].A*0.)+of.vdadd[3].A)+sl.min.vdadd[3].A.1)} {0.}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17_1) 0.))
; 
; =  {(((sc.vdadd[3].A*120.411998266)+of.vdadd[3].A)+sl.max.vdadd[3].A.1)} {3300.}
(assert (= (+ (+ (* sc_17 120.411998266) of_17) sltop_17_1) 3300.))
; 
; >=  {((sc.vdadd[3].B*0.)+of.vdadd[3].B)} {3300.}
(assert (<= (+ (* sc_18 0.) of_18) 3300.))
; 
; <=  {((sc.vdadd[3].B*0.)+of.vdadd[3].B)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
(declare-fun slbot_19_1 () Real)
(assert (<= slbot_19_1 1e-08))
(declare-fun sltop_19_1 () Real)
(assert (>= sltop_19_1 1e-08))
; 
; =  {(((sc.vdadd[3].OUT*0.)+of.vdadd[3].OUT)+sl.min.vdadd[3].OUT.1)} {0.}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19_1) 0.))
; 
; =  {(((sc.vdadd[3].OUT*120.)+of.vdadd[3].OUT)+sl.max.vdadd[3].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_19 120.) of_19) sltop_19_1) 12000.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; no scale
(assert (= sc_20 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_20 0.))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_23 0.))
; 
; =  {sc.vdadd[4].A} {(1.*sc.vdadd[4].B)}
(assert (= sc_22 (* 1. sc_23)))
; 
; =  {sc.vdadd[4].A} {(1.*sc.vdadd[4].D*sc.vdadd[4].OUT)}
(assert (= sc_22 (* (* 1. sc_20) sc_24)))
; 
; =  {sc.vdadd[4].OUT} {sc.vdadd[4].A}
(assert (= sc_24 sc_22))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= (- (+ of_22 0.) 0.) 0.))
; 
; =  {sc.vdadd[4].OUT_0} {sc.vdadd[4].A}
(assert (= sc_21 sc_22))
; 
; =  {of.vdadd[4].OUT_0} {((of.vdadd[4].A+0.)-0.)}
(assert (= of_21 (- (+ of_22 0.) 0.)))
; 
; >=  {((sc.vdadd[4].D*0.15051499783)+of.vdadd[4].D)} {10.}
(assert (<= (+ (* sc_20 0.15051499783) of_20) 10.))
; 
; <=  {((sc.vdadd[4].D*0.15051499783)+of.vdadd[4].D)} {0.}
(assert (>= (+ (* sc_20 0.15051499783) of_20) 0.))
(declare-fun slbot_24_1 () Real)
(assert (<= slbot_24_1 1e-08))
(declare-fun sltop_24_1 () Real)
(assert (>= sltop_24_1 1e-08))
; 
; =  {(((sc.vdadd[4].OUT*0.)+of.vdadd[4].OUT)+sl.min.vdadd[4].OUT.1)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24_1) 0.))
; 
; =  {(((sc.vdadd[4].OUT*40.)+of.vdadd[4].OUT)+sl.max.vdadd[4].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_24 40.) of_24) sltop_24_1) 12000.))
; 
; >=  {((sc.vdadd[4].OUT_0*0.)+of.vdadd[4].OUT_0)} {3300.}
(assert (<= (+ (* sc_21 0.) of_21) 3300.))
; 
; <=  {((sc.vdadd[4].OUT_0*0.)+of.vdadd[4].OUT_0)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
(declare-fun slbot_22_1 () Real)
(assert (<= slbot_22_1 1e-08))
(declare-fun sltop_22_1 () Real)
(assert (>= sltop_22_1 1e-08))
; 
; =  {(((sc.vdadd[4].A*0.04995)+of.vdadd[4].A)+sl.min.vdadd[4].A.1)} {0.}
(assert (= (+ (+ (* sc_22 0.04995) of_22) slbot_22_1) 0.))
; 
; =  {(((sc.vdadd[4].A*0.4995)+of.vdadd[4].A)+sl.max.vdadd[4].A.1)} {3300.}
(assert (= (+ (+ (* sc_22 0.4995) of_22) sltop_22_1) 3300.))
; 
; >=  {((sc.vdadd[4].B*0.0005)+of.vdadd[4].B)} {3300.}
(assert (<= (+ (* sc_23 0.0005) of_23) 3300.))
; 
; <=  {((sc.vdadd[4].B*0.0005)+of.vdadd[4].B)} {0.}
(assert (>= (+ (* sc_23 0.0005) of_23) 0.))
(declare-fun slbot_24_1 () Real)
(assert (<= slbot_24_1 1e-08))
(declare-fun sltop_24_1 () Real)
(assert (>= sltop_24_1 1e-08))
; 
; =  {(((sc.vdadd[4].OUT*0.)+of.vdadd[4].OUT)+sl.min.vdadd[4].OUT.1)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24_1) 0.))
; 
; =  {(((sc.vdadd[4].OUT*40.)+of.vdadd[4].OUT)+sl.max.vdadd[4].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_24 40.) of_24) sltop_24_1) 12000.))
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
; no scale
(assert (= sc_25 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_25 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_28 0.))
; 
; =  {sc.vdadd[1].A} {(1.*sc.vdadd[1].B)}
(assert (= sc_27 (* 1. sc_28)))
; 
; =  {sc.vdadd[1].A} {(1.*sc.vdadd[1].D*sc.vdadd[1].OUT)}
(assert (= sc_27 (* (* 1. sc_25) sc_29)))
; 
; =  {sc.vdadd[1].OUT} {sc.vdadd[1].A}
(assert (= sc_29 sc_27))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= (- (+ of_27 0.) 0.) 0.))
; 
; =  {sc.vdadd[1].OUT_0} {sc.vdadd[1].A}
(assert (= sc_26 sc_27))
; 
; =  {of.vdadd[1].OUT_0} {((of.vdadd[1].A+0.)-0.)}
(assert (= of_26 (- (+ of_27 0.) 0.)))
; 
; >=  {((sc.vdadd[1].D*0.15051499783)+of.vdadd[1].D)} {10.}
(assert (<= (+ (* sc_25 0.15051499783) of_25) 10.))
; 
; <=  {((sc.vdadd[1].D*0.15051499783)+of.vdadd[1].D)} {0.}
(assert (>= (+ (* sc_25 0.15051499783) of_25) 0.))
(declare-fun slbot_29_1 () Real)
(assert (<= slbot_29_1 1e-08))
(declare-fun sltop_29_1 () Real)
(assert (>= sltop_29_1 1e-08))
; 
; =  {(((sc.vdadd[1].OUT*0.)+of.vdadd[1].OUT)+sl.min.vdadd[1].OUT.1)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29_1) 0.))
; 
; =  {(((sc.vdadd[1].OUT*40.)+of.vdadd[1].OUT)+sl.max.vdadd[1].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_29 40.) of_29) sltop_29_1) 12000.))
; 
; >=  {((sc.vdadd[1].OUT_0*0.)+of.vdadd[1].OUT_0)} {3300.}
(assert (<= (+ (* sc_26 0.) of_26) 3300.))
; 
; <=  {((sc.vdadd[1].OUT_0*0.)+of.vdadd[1].OUT_0)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
(declare-fun slbot_27_1 () Real)
(assert (<= slbot_27_1 1e-08))
(declare-fun sltop_27_1 () Real)
(assert (>= sltop_27_1 1e-08))
; 
; =  {(((sc.vdadd[1].A*0.04995)+of.vdadd[1].A)+sl.min.vdadd[1].A.1)} {0.}
(assert (= (+ (+ (* sc_27 0.04995) of_27) slbot_27_1) 0.))
; 
; =  {(((sc.vdadd[1].A*0.4995)+of.vdadd[1].A)+sl.max.vdadd[1].A.1)} {3300.}
(assert (= (+ (+ (* sc_27 0.4995) of_27) sltop_27_1) 3300.))
; 
; >=  {((sc.vdadd[1].B*0.0005)+of.vdadd[1].B)} {3300.}
(assert (<= (+ (* sc_28 0.0005) of_28) 3300.))
; 
; <=  {((sc.vdadd[1].B*0.0005)+of.vdadd[1].B)} {0.}
(assert (>= (+ (* sc_28 0.0005) of_28) 0.))
(declare-fun slbot_29_1 () Real)
(assert (<= slbot_29_1 1e-08))
(declare-fun sltop_29_1 () Real)
(assert (>= sltop_29_1 1e-08))
; 
; =  {(((sc.vdadd[1].OUT*0.)+of.vdadd[1].OUT)+sl.min.vdadd[1].OUT.1)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29_1) 0.))
; 
; =  {(((sc.vdadd[1].OUT*40.)+of.vdadd[1].OUT)+sl.max.vdadd[1].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_29 40.) of_29) sltop_29_1) 12000.))
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_31 sc_30))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_31 of_30))
; 
; >=  {((sc.input.I[2].X*0.4995)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_30 0.4995) of_30) 10.))
; 
; <=  {((sc.input.I[2].X*0.4995)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_30 0.4995) of_30) 0.))
; 
; >=  {((sc.input.I[2].O*0.4995)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_31 0.4995) of_31) 10.))
; 
; <=  {((sc.input.I[2].O*0.4995)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_31 0.4995) of_31) 0.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_33 sc_32))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_33 of_32))
; 
; >=  {((sc.input.I[7].X*0.03010299956)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_32 0.03010299956) of_32) 10.))
; 
; <=  {((sc.input.I[7].X*0.03010299956)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_32 0.03010299956) of_32) 0.))
; 
; >=  {((sc.input.I[7].O*0.03010299956)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_33 0.03010299956) of_33) 10.))
; 
; <=  {((sc.input.I[7].O*0.03010299956)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_33 0.03010299956) of_33) 0.))
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
; 
; >=  {((sc.input.I[0].X*40.)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_34 40.) of_34) 10.))
; 
; <=  {((sc.input.I[0].X*40.)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_34 40.) of_34) 0.))
; 
; >=  {((sc.input.I[0].O*40.)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_35 40.) of_35) 10.))
; 
; <=  {((sc.input.I[0].O*40.)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_35 40.) of_35) 0.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.I[6].X*0.03010299956)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_36 0.03010299956) of_36) 10.))
; 
; <=  {((sc.input.I[6].X*0.03010299956)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_36 0.03010299956) of_36) 0.))
; 
; >=  {((sc.input.I[6].O*0.03010299956)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_37 0.03010299956) of_37) 10.))
; 
; <=  {((sc.input.I[6].O*0.03010299956)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_37 0.03010299956) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.I[3].X*0.4995)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_38 0.4995) of_38) 10.))
; 
; <=  {((sc.input.I[3].X*0.4995)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_38 0.4995) of_38) 0.))
; 
; >=  {((sc.input.I[3].O*0.4995)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_39 0.4995) of_39) 10.))
; 
; <=  {((sc.input.I[3].O*0.4995)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_39 0.4995) of_39) 0.))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.I[4].X*0.15051499783)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_40 0.15051499783) of_40) 10.))
; 
; <=  {((sc.input.I[4].X*0.15051499783)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_40 0.15051499783) of_40) 0.))
; 
; >=  {((sc.input.I[4].O*0.15051499783)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_41 0.15051499783) of_41) 10.))
; 
; <=  {((sc.input.I[4].O*0.15051499783)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_41 0.15051499783) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.I[5].X*0.15051499783)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_42 0.15051499783) of_42) 10.))
; 
; <=  {((sc.input.I[5].X*0.15051499783)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_42 0.15051499783) of_42) 0.))
; 
; >=  {((sc.input.I[5].O*0.15051499783)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_43 0.15051499783) of_43) 10.))
; 
; <=  {((sc.input.I[5].O*0.15051499783)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_43 0.15051499783) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.I[1].X*40.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_44 40.) of_44) 10.))
; 
; <=  {((sc.input.I[1].X*40.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_44 40.) of_44) 0.))
; 
; >=  {((sc.input.I[1].O*40.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_45 40.) of_45) 10.))
; 
; <=  {((sc.input.I[1].O*40.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_45 40.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_47 sc_46))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_47 of_46))
(declare-fun slbot_46_1 () Real)
(assert (<= slbot_46_1 1e-08))
(declare-fun sltop_46_1 () Real)
(assert (>= sltop_46_1 1e-08))
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X.1)} {0.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46_1) 0.))
; 
; =  {(((sc.output.V[2].X*40.)+of.output.V[2].X)+sl.max.output.V[2].X.1)} {3300.}
(assert (= (+ (+ (* sc_46 40.) of_46) sltop_46_1) 3300.))
(declare-fun slbot_47_1 () Real)
(assert (<= slbot_47_1 1e-08))
(declare-fun sltop_47_1 () Real)
(assert (>= sltop_47_1 1e-08))
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O.1)} {0.}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47_1) 0.))
; 
; =  {(((sc.output.V[2].O*40.)+of.output.V[2].O)+sl.max.output.V[2].O.1)} {3300.}
(assert (= (+ (+ (* sc_47 40.) of_47) sltop_47_1) 3300.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_49 sc_48))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_49 of_48))
(declare-fun slbot_48_1 () Real)
(assert (<= slbot_48_1 1e-08))
(declare-fun sltop_48_1 () Real)
(assert (>= sltop_48_1 1e-08))
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X.1)} {0.}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48_1) 0.))
; 
; =  {(((sc.output.V[0].X*40.)+of.output.V[0].X)+sl.max.output.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_48 40.) of_48) sltop_48_1) 3300.))
(declare-fun slbot_49_1 () Real)
(assert (<= slbot_49_1 1e-08))
(declare-fun sltop_49_1 () Real)
(assert (>= sltop_49_1 1e-08))
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O.1)} {0.}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49_1) 0.))
; 
; =  {(((sc.output.V[0].O*40.)+of.output.V[0].O)+sl.max.output.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_49 40.) of_49) sltop_49_1) 3300.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_51 sc_50))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_51 of_50))
(declare-fun slbot_50_1 () Real)
(assert (<= slbot_50_1 1e-08))
(declare-fun sltop_50_1 () Real)
(assert (>= sltop_50_1 1e-08))
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X.1)} {0.}
(assert (= (+ (+ (* sc_50 0.) of_50) slbot_50_1) 0.))
; 
; =  {(((sc.output.V[3].X*120.)+of.output.V[3].X)+sl.max.output.V[3].X.1)} {3300.}
(assert (= (+ (+ (* sc_50 120.) of_50) sltop_50_1) 3300.))
(declare-fun slbot_51_1 () Real)
(assert (<= slbot_51_1 1e-08))
(declare-fun sltop_51_1 () Real)
(assert (>= sltop_51_1 1e-08))
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O.1)} {0.}
(assert (= (+ (+ (* sc_51 0.) of_51) slbot_51_1) 0.))
; 
; =  {(((sc.output.V[3].O*120.)+of.output.V[3].O)+sl.max.output.V[3].O.1)} {3300.}
(assert (= (+ (+ (* sc_51 120.) of_51) sltop_51_1) 3300.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_53 sc_52))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_53 of_52))
(declare-fun slbot_52_1 () Real)
(assert (<= slbot_52_1 1e-08))
(declare-fun sltop_52_1 () Real)
(assert (>= sltop_52_1 1e-08))
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X.1)} {0.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52_1) 0.))
; 
; =  {(((sc.output.V[1].X*120.)+of.output.V[1].X)+sl.max.output.V[1].X.1)} {3300.}
(assert (= (+ (+ (* sc_52 120.) of_52) sltop_52_1) 3300.))
(declare-fun slbot_53_1 () Real)
(assert (<= slbot_53_1 1e-08))
(declare-fun sltop_53_1 () Real)
(assert (>= sltop_53_1 1e-08))
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O.1)} {0.}
(assert (= (+ (+ (* sc_53 0.) of_53) slbot_53_1) 0.))
; 
; =  {(((sc.output.V[1].O*120.)+of.output.V[1].O)+sl.max.output.V[1].O.1)} {3300.}
(assert (= (+ (+ (* sc_53 120.) of_53) sltop_53_1) 3300.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_54 0.) of_54) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_55 0.) of_55) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.V[8].X*0.0005)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_56 0.0005) of_56) 3300.))
; 
; <=  {((sc.input.V[8].X*0.0005)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_56 0.0005) of_56) 0.))
; 
; >=  {((sc.input.V[8].O*0.0005)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_57 0.0005) of_57) 3300.))
; 
; <=  {((sc.input.V[8].O*0.0005)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_57 0.0005) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_58 0.) of_58) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_59 0.) of_59) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
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
; >=  {((sc.input.V[9].X*0.0005)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_60 0.0005) of_60) 3300.))
; 
; <=  {((sc.input.V[9].X*0.0005)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_60 0.0005) of_60) 0.))
; 
; >=  {((sc.input.V[9].O*0.0005)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_61 0.0005) of_61) 3300.))
; 
; <=  {((sc.input.V[9].O*0.0005)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_61 0.0005) of_61) 0.))
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
; >=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_62 2.) of_62) 3300.))
; 
; <=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_62 2.) of_62) 0.))
; 
; >=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_63 2.) of_63) 3300.))
; 
; <=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_63 2.) of_63) 0.))
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
; >=  {((sc.input.V[11].X*3.01029995664)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_64 3.01029995664) of_64) 3300.))
; 
; <=  {((sc.input.V[11].X*3.01029995664)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_64 3.01029995664) of_64) 0.))
; 
; >=  {((sc.input.V[11].O*3.01029995664)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_65 3.01029995664) of_65) 3300.))
; 
; <=  {((sc.input.V[11].O*3.01029995664)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_65 3.01029995664) of_65) 0.))
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
; >=  {((sc.input.V[10].X*3.01029995664)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_66 3.01029995664) of_66) 3300.))
; 
; <=  {((sc.input.V[10].X*3.01029995664)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_66 3.01029995664) of_66) 0.))
; 
; >=  {((sc.input.V[10].O*3.01029995664)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_67 3.01029995664) of_67) 3300.))
; 
; <=  {((sc.input.V[10].O*3.01029995664)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_67 3.01029995664) of_67) 0.))
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
; >=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_76 2.) of_76) 3300.))
; 
; <=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_76 2.) of_76) 0.))
; 
; >=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_77 2.) of_77) 3300.))
; 
; <=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_77 2.) of_77) 0.))
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
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_80 (* sc_79 sc_78)))
; 
; =  {of.itov[2].Y} {0.}
(assert (= of_80 0.))
(declare-fun slbot_78_1 () Real)
(assert (<= slbot_78_1 1e-08))
(declare-fun sltop_78_1 () Real)
(assert (>= sltop_78_1 1e-08))
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X.1)} {0.}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78_1) 0.))
; 
; =  {(((sc.itov[2].X*40.)+of.itov[2].X)+sl.max.itov[2].X.1)} {10.}
(assert (= (+ (+ (* sc_78 40.) of_78) sltop_78_1) 10.))
(declare-fun slbot_80_1 () Real)
(assert (<= slbot_80_1 1e-08))
(declare-fun sltop_80_1 () Real)
(assert (>= sltop_80_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80_1) 0.))
; 
; =  {(((sc.itov[2].Y*120.411998266)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_80 120.411998266) of_80) sltop_80_1) 3300.))
; 
; >=  {((sc.itov[2].K*3.01029995664)+of.itov[2].K)} {330.}
(assert (<= (+ (* sc_79 3.01029995664) of_79) 330.))
; 
; <=  {((sc.itov[2].K*3.01029995664)+of.itov[2].K)} {1.}
(assert (>= (+ (* sc_79 3.01029995664) of_79) 1.))
(declare-fun slbot_80_1 () Real)
(assert (<= slbot_80_1 1e-08))
(declare-fun sltop_80_1 () Real)
(assert (>= sltop_80_1 1e-08))
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y.1)} {0.}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80_1) 0.))
; 
; =  {(((sc.itov[2].Y*120.411998266)+of.itov[2].Y)+sl.max.itov[2].Y.1)} {3300.}
(assert (= (+ (+ (* sc_80 120.411998266) of_80) sltop_80_1) 3300.))
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
; =  {sc.itov[6].Y} {(sc.itov[6].K*sc.itov[6].X)}
(assert (= sc_83 (* sc_82 sc_81)))
; 
; =  {of.itov[6].Y} {0.}
(assert (= of_83 0.))
(declare-fun slbot_81_1 () Real)
(assert (<= slbot_81_1 1e-08))
(declare-fun sltop_81_1 () Real)
(assert (>= sltop_81_1 1e-08))
; 
; =  {(((sc.itov[6].X*0.)+of.itov[6].X)+sl.min.itov[6].X.1)} {0.}
(assert (= (+ (+ (* sc_81 0.) of_81) slbot_81_1) 0.))
; 
; =  {(((sc.itov[6].X*40.)+of.itov[6].X)+sl.max.itov[6].X.1)} {10.}
(assert (= (+ (+ (* sc_81 40.) of_81) sltop_81_1) 10.))
(declare-fun slbot_83_1 () Real)
(assert (<= slbot_83_1 1e-08))
(declare-fun sltop_83_1 () Real)
(assert (>= sltop_83_1 1e-08))
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y.1)} {0.}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83_1) 0.))
; 
; =  {(((sc.itov[6].Y*120.411998266)+of.itov[6].Y)+sl.max.itov[6].Y.1)} {3300.}
(assert (= (+ (+ (* sc_83 120.411998266) of_83) sltop_83_1) 3300.))
; 
; >=  {((sc.itov[6].K*3.01029995664)+of.itov[6].K)} {330.}
(assert (<= (+ (* sc_82 3.01029995664) of_82) 330.))
; 
; <=  {((sc.itov[6].K*3.01029995664)+of.itov[6].K)} {1.}
(assert (>= (+ (* sc_82 3.01029995664) of_82) 1.))
(declare-fun slbot_83_1 () Real)
(assert (<= slbot_83_1 1e-08))
(declare-fun sltop_83_1 () Real)
(assert (>= sltop_83_1 1e-08))
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y.1)} {0.}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83_1) 0.))
; 
; =  {(((sc.itov[6].Y*120.411998266)+of.itov[6].Y)+sl.max.itov[6].Y.1)} {3300.}
(assert (= (+ (+ (* sc_83 120.411998266) of_83) sltop_83_1) 3300.))
; 
; =  {sc.vdadd[3].OUT} {sc.ihill_rep[0].S}
(assert (= sc_19 sc_1))
; 
; =  {of.vdadd[3].OUT} {of.ihill_rep[0].S}
(assert (= of_19 of_1))
; 
; =  {sc.vdadd[3].OUT} {sc.output.V[3].X}
(assert (= sc_19 sc_50))
; 
; =  {of.vdadd[3].OUT} {of.output.V[3].X}
(assert (= of_19 of_50))
; 
; =  {sc.ihill_rep[5].REP} {sc.vdadd[1].A}
(assert (= sc_9 sc_27))
; 
; =  {of.ihill_rep[5].REP} {of.vdadd[1].A}
(assert (= of_9 of_27))
; 
; =  {sc.itov[2].Y} {sc.vdadd[3].A}
(assert (= sc_80 sc_17))
; 
; =  {of.itov[2].Y} {of.vdadd[3].A}
(assert (= of_80 of_17))
; 
; =  {sc.input.I[6].O} {sc.vdadd[7].D}
(assert (= sc_37 sc_10))
; 
; =  {of.input.I[6].O} {of.vdadd[7].D}
(assert (= of_37 of_10))
; 
; =  {sc.input.I[0].O} {sc.ihill_rep[5].Km}
(assert (= sc_35 sc_7))
; 
; =  {of.input.I[0].O} {of.ihill_rep[5].Km}
(assert (= of_35 of_7))
; 
; =  {sc.vdadd[7].OUT} {sc.output.V[1].X}
(assert (= sc_14 sc_52))
; 
; =  {of.vdadd[7].OUT} {of.output.V[1].X}
(assert (= of_14 of_52))
; 
; =  {sc.vdadd[7].OUT} {sc.ihill_rep[5].S}
(assert (= sc_14 sc_6))
; 
; =  {of.vdadd[7].OUT} {of.ihill_rep[5].S}
(assert (= of_14 of_6))
; 
; =  {sc.input.V[9].O} {sc.vdadd[1].B}
(assert (= sc_61 sc_28))
; 
; =  {of.input.V[9].O} {of.vdadd[1].B}
(assert (= of_61 of_28))
; 
; =  {sc.input.I[4].O} {sc.vdadd[4].D}
(assert (= sc_41 sc_20))
; 
; =  {of.input.I[4].O} {of.vdadd[4].D}
(assert (= of_41 of_20))
; 
; =  {sc.input.I[3].O} {sc.ihill_rep[0].Vmax}
(assert (= sc_39 sc_3))
; 
; =  {of.input.I[3].O} {of.ihill_rep[0].Vmax}
(assert (= of_39 of_3))
; 
; =  {sc.input.I[5].O} {sc.vdadd[1].D}
(assert (= sc_43 sc_25))
; 
; =  {of.input.I[5].O} {of.vdadd[1].D}
(assert (= of_43 of_25))
; 
; =  {sc.input.V[11].O} {sc.itov[2].K}
(assert (= sc_65 sc_79))
; 
; =  {of.input.V[11].O} {of.itov[2].K}
(assert (= of_65 of_79))
; 
; =  {sc.input.I[2].O} {sc.ihill_rep[5].Vmax}
(assert (= sc_31 sc_8))
; 
; =  {of.input.I[2].O} {of.ihill_rep[5].Vmax}
(assert (= of_31 of_8))
; 
; =  {sc.input.V[8].O} {sc.vdadd[4].B}
(assert (= sc_57 sc_23))
; 
; =  {of.input.V[8].O} {of.vdadd[4].B}
(assert (= of_57 of_23))
; 
; =  {sc.input.V[3].O} {sc.vdadd[3].OUT_0}
(assert (= sc_71 sc_16))
; 
; =  {of.input.V[3].O} {of.vdadd[3].OUT_0}
(assert (= of_71 of_16))
; 
; =  {sc.input.V[2].O} {sc.vdadd[1].OUT_0}
(assert (= sc_55 sc_26))
; 
; =  {of.input.V[2].O} {of.vdadd[1].OUT_0}
(assert (= of_55 of_26))
; 
; =  {sc.input.I[1].O} {sc.ihill_rep[0].Km}
(assert (= sc_45 sc_2))
; 
; =  {of.input.I[1].O} {of.ihill_rep[0].Km}
(assert (= of_45 of_2))
; 
; =  {sc.input.V[1].O} {sc.ihill_rep[0].n}
(assert (= sc_77 sc_0))
; 
; =  {of.input.V[1].O} {of.ihill_rep[0].n}
(assert (= of_77 of_0))
; 
; =  {sc.input.I[7].O} {sc.vdadd[3].D}
(assert (= sc_33 sc_15))
; 
; =  {of.input.I[7].O} {of.vdadd[3].D}
(assert (= of_33 of_15))
; 
; =  {sc.ihill_rep[0].REP} {sc.vdadd[4].A}
(assert (= sc_4 sc_22))
; 
; =  {of.ihill_rep[0].REP} {of.vdadd[4].A}
(assert (= of_4 of_22))
; 
; =  {sc.input.V[7].O} {sc.vdadd[7].OUT_0}
(assert (= sc_59 sc_11))
; 
; =  {of.input.V[7].O} {of.vdadd[7].OUT_0}
(assert (= of_59 of_11))
; 
; =  {sc.vdadd[1].OUT} {sc.output.V[2].X}
(assert (= sc_29 sc_46))
; 
; =  {of.vdadd[1].OUT} {of.output.V[2].X}
(assert (= of_29 of_46))
; 
; =  {sc.vdadd[1].OUT} {sc.itov[6].X}
(assert (= sc_29 sc_81))
; 
; =  {of.vdadd[1].OUT} {of.itov[6].X}
(assert (= of_29 of_81))
; 
; =  {sc.itov[6].Y} {sc.vdadd[7].A}
(assert (= sc_83 sc_12))
; 
; =  {of.itov[6].Y} {of.vdadd[7].A}
(assert (= of_83 of_12))
; 
; =  {sc.input.V[10].O} {sc.itov[6].K}
(assert (= sc_67 sc_82))
; 
; =  {of.input.V[10].O} {of.itov[6].K}
(assert (= of_67 of_82))
; 
; =  {sc.input.V[0].O} {sc.ihill_rep[5].n}
(assert (= sc_63 sc_5))
; 
; =  {of.input.V[0].O} {of.ihill_rep[5].n}
(assert (= of_63 of_5))
; 
; =  {sc.vdadd[4].OUT} {sc.itov[2].X}
(assert (= sc_24 sc_78))
; 
; =  {of.vdadd[4].OUT} {of.itov[2].X}
(assert (= of_24 of_78))
; 
; =  {sc.vdadd[4].OUT} {sc.output.V[0].X}
(assert (= sc_24 sc_48))
; 
; =  {of.vdadd[4].OUT} {of.output.V[0].X}
(assert (= of_24 of_48))
; 
; =  {sc.input.V[5].O} {sc.vdadd[4].OUT_0}
(assert (= sc_75 sc_21))
; 
; =  {of.input.V[5].O} {of.vdadd[4].OUT_0}
(assert (= of_75 of_21))
; 
; =  {sc.input.V[4].O} {sc.vdadd[3].B}
(assert (= sc_73 sc_18))
; 
; =  {of.input.V[4].O} {of.vdadd[3].B}
(assert (= of_73 of_18))
; 
; =  {sc.input.V[6].O} {sc.vdadd[7].B}
(assert (= sc_69 sc_13))
; 
; =  {of.input.V[6].O} {of.vdadd[7].B}
(assert (= of_69 of_13))
(assert (<= (* (/ 1. sc_49) 1) 100.))
(assert (<= (* (/ 1. sc_49) 1) 100.))
(assert (not (= 1. sc_49)))
(assert (<= (* (/ 1. sc_53) 1) 100.))
(assert (<= (* (/ 1. sc_53) 1) 100.))
(assert (not (= 1. sc_53)))
(assert (<= (* (/ 1. sc_47) 1) 100.))
(assert (<= (* (/ 1. sc_47) 1) 100.))
(assert (not (= 1. sc_47)))
(assert (<= (* (/ 1. sc_51) 1) 100.))
(assert (<= (* (/ 1. sc_51) 1) 100.))
(assert (not (= 1. sc_51)))
(assert (not (= 1. sc_4)))
(assert (not (= 1. sc_9)))
; 
; =  {sc.vdadd[4].OUT} {sc.output.V[0].O} {sc.vdadd[7].OUT} {sc.output.V[1].O} {sc.vdadd[1].OUT} {sc.output.V[2].O} {sc.vdadd[3].OUT} {sc.output.V[3].O}
(assert (and (and (and (and (and (and (= sc_24 sc_49) (= sc_24 sc_14)) (= sc_24 sc_53)) (= sc_24 sc_29)) (= sc_24 sc_47)) (= sc_24 sc_19)) (= sc_24 sc_51)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_1_1 0.) slbot_1_1 (- slbot_1_1)) (ite (>= slbot_46_1 0.) slbot_46_1 (- slbot_46_1))) (ite (>= slbot_48_1 0.) slbot_48_1 (- slbot_48_1))) (ite (>= sltop_81_1 0.) sltop_81_1 (- sltop_81_1))) (ite (>= sltop_17_1 0.) sltop_17_1 (- sltop_17_1))) (ite (>= slbot_27_1 0.) slbot_27_1 (- slbot_27_1))) (ite (>= slbot_52_1 0.) slbot_52_1 (- slbot_52_1))) (ite (>= slbot_19_1 0.) slbot_19_1 (- slbot_19_1))) (ite (>= sltop_29_1 0.) sltop_29_1 (- sltop_29_1))) (ite (>= sltop_47_1 0.) sltop_47_1 (- sltop_47_1))) (ite (>= slbot_53_1 0.) slbot_53_1 (- slbot_53_1))) (ite (>= slbot_6_1 0.) slbot_6_1 (- slbot_6_1))) (ite (>= slbot_22_1 0.) slbot_22_1 (- slbot_22_1))) (ite (>= sltop_53_1 0.) sltop_53_1 (- sltop_53_1))) (ite (>= slbot_78_1 0.) slbot_78_1 (- slbot_78_1))) (ite (>= slbot_17_1 0.) slbot_17_1 (- slbot_17_1))) (ite (>= sltop_52_1 0.) sltop_52_1 (- sltop_52_1))) (ite (>= slbot_4_1 0.) slbot_4_1 (- slbot_4_1))) (ite (>= sltop_6_1 0.) sltop_6_1 (- sltop_6_1))) (ite (>= slbot_24_1 0.) slbot_24_1 (- slbot_24_1))) (ite (>= slbot_50_1 0.) slbot_50_1 (- slbot_50_1))) (ite (>= sltop_51_1 0.) sltop_51_1 (- sltop_51_1))) (ite (>= sltop_78_1 0.) sltop_78_1 (- sltop_78_1))) (ite (>= slbot_80_1 0.) slbot_80_1 (- slbot_80_1))) (ite (>= sltop_12_1 0.) sltop_12_1 (- sltop_12_1))) (ite (>= slbot_14_1 0.) slbot_14_1 (- slbot_14_1))) (ite (>= sltop_48_1 0.) sltop_48_1 (- sltop_48_1))) (ite (>= sltop_19_1 0.) sltop_19_1 (- sltop_19_1))) (ite (>= sltop_22_1 0.) sltop_22_1 (- sltop_22_1))) (ite (>= slbot_51_1 0.) slbot_51_1 (- slbot_51_1))) (ite (>= sltop_4_1 0.) sltop_4_1 (- sltop_4_1))) (ite (>= sltop_14_1 0.) sltop_14_1 (- sltop_14_1))) (ite (>= slbot_49_1 0.) slbot_49_1 (- slbot_49_1))) (ite (>= sltop_49_1 0.) sltop_49_1 (- sltop_49_1))) (ite (>= sltop_27_1 0.) sltop_27_1 (- sltop_27_1))) (ite (>= slbot_9_1 0.) slbot_9_1 (- slbot_9_1))) (ite (>= sltop_80_1 0.) sltop_80_1 (- sltop_80_1))) (ite (>= sltop_46_1 0.) sltop_46_1 (- sltop_46_1))) (ite (>= sltop_1_1 0.) sltop_1_1 (- sltop_1_1))) (ite (>= slbot_47_1 0.) slbot_47_1 (- slbot_47_1))) (ite (>= sltop_50_1 0.) sltop_50_1 (- sltop_50_1))) (ite (>= slbot_12_1 0.) slbot_12_1 (- slbot_12_1))) (ite (>= sltop_9_1 0.) sltop_9_1 (- sltop_9_1))) (ite (>= slbot_83_1 0.) slbot_83_1 (- slbot_83_1))) (ite (>= slbot_29_1 0.) slbot_29_1 (- slbot_29_1))) (ite (>= slbot_81_1 0.) slbot_81_1 (- slbot_81_1))) (ite (>= sltop_83_1 0.) sltop_83_1 (- sltop_83_1))) (ite (>= sltop_24_1 0.) sltop_24_1 (- sltop_24_1)))))
(check-sat)
