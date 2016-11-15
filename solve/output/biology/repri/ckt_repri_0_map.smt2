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
; no offset
(assert (= of_0 0.))
; no offset
(assert (= of_1 0.))
; 
; =  {sc.vgain[2].P} {(sc.vgain[2].X*sc.vgain[2].Z)}
(assert (= sc_2 (* sc_0 sc_1)))
; 
; =  {of.vgain[2].P} {0.}
(assert (= of_2 0.))
; 
; >=  {((sc.vgain[2].X*3.01029995664)+of.vgain[2].X)} {500.}
(assert (<= (+ (* sc_0 3.01029995664) of_0) 500.))
; 
; <=  {((sc.vgain[2].X*3.01029995664)+of.vgain[2].X)} {0.}
(assert (>= (+ (* sc_0 3.01029995664) of_0) 0.))
(declare-fun slbot_2_1 () Real)
(assert (<= slbot_2_1 1e-08))
(declare-fun sltop_2_1 () Real)
(assert (>= sltop_2_1 1e-08))
; 
; =  {(((sc.vgain[2].P*0.)+of.vgain[2].P)+sl.min.vgain[2].P.1)} {0.}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2_1) 0.))
; 
; =  {(((sc.vgain[2].P*90.3089986992)+of.vgain[2].P)+sl.max.vgain[2].P.1)} {5000.}
(assert (= (+ (+ (* sc_2 90.3089986992) of_2) sltop_2_1) 5000.))
(declare-fun slbot_1_1 () Real)
(assert (<= slbot_1_1 1e-08))
(declare-fun sltop_1_1 () Real)
(assert (>= sltop_1_1 1e-08))
; 
; =  {(((sc.vgain[2].Z*0.)+of.vgain[2].Z)+sl.min.vgain[2].Z.1)} {0.}
(assert (= (+ (+ (* sc_1 0.) of_1) slbot_1_1) 0.))
; 
; =  {(((sc.vgain[2].Z*30.)+of.vgain[2].Z)+sl.max.vgain[2].Z.1)} {10.}
(assert (= (+ (+ (* sc_1 30.) of_1) sltop_1_1) 10.))
(declare-fun sc_3 () Real)
(assert (> sc_3 1e-08))
(declare-fun of_3 () Real)
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
(assert (= of_5 0.))
; no offset
(assert (= of_3 0.))
; no offset
(assert (= of_4 0.))
; no offset
(assert (= of_3 0.))
; no offset
(assert (= of_5 0.))
; no offset
(assert (= of_3 0.))
; 
; =  {(sc.ihill_rep[7].Km^2)} {(sc.ihill_rep[7].S^2)}
(assert (= (^ sc_5 2) (^ sc_4 2)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_6 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill_rep[7].REP} {(sc.ihill_rep[7].Vmax*((sc.ihill_rep[7].Km^2)/(sc.ihill_rep[7].Km^2)))}
(assert (= sc_7 (* sc_6 (/ (^ sc_5 2) (^ sc_5 2)))))
; 
; =  {of.ihill_rep[7].REP} {0.}
(assert (= of_7 0.))
; 
; >=  {((sc.ihill_rep[7].n*2.)+of.ihill_rep[7].n)} {5.}
(assert (<= (+ (* sc_3 2.) of_3) 5.))
; 
; <=  {((sc.ihill_rep[7].n*2.)+of.ihill_rep[7].n)} {1.}
(assert (>= (+ (* sc_3 2.) of_3) 1.))
(declare-fun slbot_4_1 () Real)
(assert (<= slbot_4_1 1e-08))
(declare-fun sltop_4_1 () Real)
(assert (>= sltop_4_1 1e-08))
; 
; =  {(((sc.ihill_rep[7].S*0.)+of.ihill_rep[7].S)+sl.min.ihill_rep[7].S.1)} {0.}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4_1) 0.))
; 
; =  {(((sc.ihill_rep[7].S*100.)+of.ihill_rep[7].S)+sl.max.ihill_rep[7].S.1)} {10.}
(assert (= (+ (+ (* sc_4 100.) of_4) sltop_4_1) 10.))
(declare-fun slbot_7_1 () Real)
(assert (<= slbot_7_1 1e-08))
(declare-fun sltop_7_1 () Real)
(assert (>= sltop_7_1 1e-08))
; 
; =  {(((sc.ihill_rep[7].REP*0.0688965517241)+of.ihill_rep[7].REP)+sl.min.ihill_rep[7].REP.1)} {0.}
(assert (= (+ (+ (* sc_7 0.0688965517241) of_7) slbot_7_1) 0.))
; 
; =  {(((sc.ihill_rep[7].REP*0.4995)+of.ihill_rep[7].REP)+sl.max.ihill_rep[7].REP.1)} {1000000.}
(assert (= (+ (+ (* sc_7 0.4995) of_7) sltop_7_1) 1000000.))
; 
; >=  {((sc.ihill_rep[7].Km*40.)+of.ihill_rep[7].Km)} {10.}
(assert (<= (+ (* sc_5 40.) of_5) 10.))
; 
; <=  {((sc.ihill_rep[7].Km*40.)+of.ihill_rep[7].Km)} {1.}
(assert (>= (+ (* sc_5 40.) of_5) 1.))
; 
; >=  {((sc.ihill_rep[7].Vmax*0.4995)+of.ihill_rep[7].Vmax)} {10.}
(assert (<= (+ (* sc_6 0.4995) of_6) 10.))
; 
; <=  {((sc.ihill_rep[7].Vmax*0.4995)+of.ihill_rep[7].Vmax)} {0.}
(assert (>= (+ (* sc_6 0.4995) of_6) 0.))
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
(assert (= of_10 0.))
; no offset
(assert (= of_8 0.))
; no offset
(assert (= of_9 0.))
; no offset
(assert (= of_8 0.))
; no offset
(assert (= of_10 0.))
; no offset
(assert (= of_8 0.))
; 
; =  {(sc.ihill_rep[11].Km^2)} {(sc.ihill_rep[11].S^2)}
(assert (= (^ sc_10 2) (^ sc_9 2)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_11 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill_rep[11].REP} {(sc.ihill_rep[11].Vmax*((sc.ihill_rep[11].Km^2)/(sc.ihill_rep[11].Km^2)))}
(assert (= sc_12 (* sc_11 (/ (^ sc_10 2) (^ sc_10 2)))))
; 
; =  {of.ihill_rep[11].REP} {0.}
(assert (= of_12 0.))
; 
; >=  {((sc.ihill_rep[11].n*2.)+of.ihill_rep[11].n)} {5.}
(assert (<= (+ (* sc_8 2.) of_8) 5.))
; 
; <=  {((sc.ihill_rep[11].n*2.)+of.ihill_rep[11].n)} {1.}
(assert (>= (+ (* sc_8 2.) of_8) 1.))
(declare-fun slbot_9_1 () Real)
(assert (<= slbot_9_1 1e-08))
(declare-fun sltop_9_1 () Real)
(assert (>= sltop_9_1 1e-08))
; 
; =  {(((sc.ihill_rep[11].S*0.)+of.ihill_rep[11].S)+sl.min.ihill_rep[11].S.1)} {0.}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9_1) 0.))
; 
; =  {(((sc.ihill_rep[11].S*100.)+of.ihill_rep[11].S)+sl.max.ihill_rep[11].S.1)} {10.}
(assert (= (+ (+ (* sc_9 100.) of_9) sltop_9_1) 10.))
(declare-fun slbot_12_1 () Real)
(assert (<= slbot_12_1 1e-08))
(declare-fun sltop_12_1 () Real)
(assert (>= sltop_12_1 1e-08))
; 
; =  {(((sc.ihill_rep[11].REP*0.0688965517241)+of.ihill_rep[11].REP)+sl.min.ihill_rep[11].REP.1)} {0.}
(assert (= (+ (+ (* sc_12 0.0688965517241) of_12) slbot_12_1) 0.))
; 
; =  {(((sc.ihill_rep[11].REP*0.4995)+of.ihill_rep[11].REP)+sl.max.ihill_rep[11].REP.1)} {1000000.}
(assert (= (+ (+ (* sc_12 0.4995) of_12) sltop_12_1) 1000000.))
; 
; >=  {((sc.ihill_rep[11].Km*40.)+of.ihill_rep[11].Km)} {10.}
(assert (<= (+ (* sc_10 40.) of_10) 10.))
; 
; <=  {((sc.ihill_rep[11].Km*40.)+of.ihill_rep[11].Km)} {1.}
(assert (>= (+ (* sc_10 40.) of_10) 1.))
; 
; >=  {((sc.ihill_rep[11].Vmax*0.4995)+of.ihill_rep[11].Vmax)} {10.}
(assert (<= (+ (* sc_11 0.4995) of_11) 10.))
; 
; <=  {((sc.ihill_rep[11].Vmax*0.4995)+of.ihill_rep[11].Vmax)} {0.}
(assert (>= (+ (* sc_11 0.4995) of_11) 0.))
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
(assert (= of_15 0.))
; no offset
(assert (= of_13 0.))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= of_13 0.))
; no offset
(assert (= of_15 0.))
; no offset
(assert (= of_13 0.))
; 
; =  {(sc.ihill_rep[1].Km^2)} {(sc.ihill_rep[1].S^2)}
(assert (= (^ sc_15 2) (^ sc_14 2)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill_rep[1].REP} {(sc.ihill_rep[1].Vmax*((sc.ihill_rep[1].Km^2)/(sc.ihill_rep[1].Km^2)))}
(assert (= sc_17 (* sc_16 (/ (^ sc_15 2) (^ sc_15 2)))))
; 
; =  {of.ihill_rep[1].REP} {0.}
(assert (= of_17 0.))
; 
; >=  {((sc.ihill_rep[1].n*2.)+of.ihill_rep[1].n)} {5.}
(assert (<= (+ (* sc_13 2.) of_13) 5.))
; 
; <=  {((sc.ihill_rep[1].n*2.)+of.ihill_rep[1].n)} {1.}
(assert (>= (+ (* sc_13 2.) of_13) 1.))
(declare-fun slbot_14_1 () Real)
(assert (<= slbot_14_1 1e-08))
(declare-fun sltop_14_1 () Real)
(assert (>= sltop_14_1 1e-08))
; 
; =  {(((sc.ihill_rep[1].S*0.)+of.ihill_rep[1].S)+sl.min.ihill_rep[1].S.1)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14_1) 0.))
; 
; =  {(((sc.ihill_rep[1].S*100.)+of.ihill_rep[1].S)+sl.max.ihill_rep[1].S.1)} {10.}
(assert (= (+ (+ (* sc_14 100.) of_14) sltop_14_1) 10.))
(declare-fun slbot_17_1 () Real)
(assert (<= slbot_17_1 1e-08))
(declare-fun sltop_17_1 () Real)
(assert (>= sltop_17_1 1e-08))
; 
; =  {(((sc.ihill_rep[1].REP*0.0688965517241)+of.ihill_rep[1].REP)+sl.min.ihill_rep[1].REP.1)} {0.}
(assert (= (+ (+ (* sc_17 0.0688965517241) of_17) slbot_17_1) 0.))
; 
; =  {(((sc.ihill_rep[1].REP*0.4995)+of.ihill_rep[1].REP)+sl.max.ihill_rep[1].REP.1)} {1000000.}
(assert (= (+ (+ (* sc_17 0.4995) of_17) sltop_17_1) 1000000.))
; 
; >=  {((sc.ihill_rep[1].Km*40.)+of.ihill_rep[1].Km)} {10.}
(assert (<= (+ (* sc_15 40.) of_15) 10.))
; 
; <=  {((sc.ihill_rep[1].Km*40.)+of.ihill_rep[1].Km)} {1.}
(assert (>= (+ (* sc_15 40.) of_15) 1.))
; 
; >=  {((sc.ihill_rep[1].Vmax*0.4995)+of.ihill_rep[1].Vmax)} {10.}
(assert (<= (+ (* sc_16 0.4995) of_16) 10.))
; 
; <=  {((sc.ihill_rep[1].Vmax*0.4995)+of.ihill_rep[1].Vmax)} {0.}
(assert (>= (+ (* sc_16 0.4995) of_16) 0.))
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
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; no scale
(assert (= sc_18 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_18 0.))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_21 0.))
; 
; =  {sc.vdadd[8].A} {(1.*sc.vdadd[8].B)}
(assert (= sc_20 (* 1. sc_21)))
; 
; =  {sc.vdadd[8].A} {(1.*sc.vdadd[8].D*sc.vdadd[8].OUT)}
(assert (= sc_20 (* (* 1. sc_18) sc_22)))
; 
; =  {sc.vdadd[8].OUT} {sc.vdadd[8].A}
(assert (= sc_22 sc_20))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= (- (+ of_20 0.) 0.) 0.))
; 
; =  {sc.vdadd[8].OUT_0} {sc.vdadd[8].A}
(assert (= sc_19 sc_20))
; 
; =  {of.vdadd[8].OUT_0} {((of.vdadd[8].A+0.)-0.)}
(assert (= of_19 (- (+ of_20 0.) 0.)))
; 
; >=  {((sc.vdadd[8].D*0.15051499783)+of.vdadd[8].D)} {10.}
(assert (<= (+ (* sc_18 0.15051499783) of_18) 10.))
; 
; <=  {((sc.vdadd[8].D*0.15051499783)+of.vdadd[8].D)} {0.}
(assert (>= (+ (* sc_18 0.15051499783) of_18) 0.))
(declare-fun slbot_22_1 () Real)
(assert (<= slbot_22_1 1e-08))
(declare-fun sltop_22_1 () Real)
(assert (>= sltop_22_1 1e-08))
; 
; =  {(((sc.vdadd[8].OUT*0.)+of.vdadd[8].OUT)+sl.min.vdadd[8].OUT.1)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22_1) 0.))
; 
; =  {(((sc.vdadd[8].OUT*30.)+of.vdadd[8].OUT)+sl.max.vdadd[8].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_22 30.) of_22) sltop_22_1) 12000.))
; 
; >=  {((sc.vdadd[8].OUT_0*0.)+of.vdadd[8].OUT_0)} {3300.}
(assert (<= (+ (* sc_19 0.) of_19) 3300.))
; 
; <=  {((sc.vdadd[8].OUT_0*0.)+of.vdadd[8].OUT_0)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
(declare-fun slbot_20_1 () Real)
(assert (<= slbot_20_1 1e-08))
(declare-fun sltop_20_1 () Real)
(assert (>= sltop_20_1 1e-08))
; 
; =  {(((sc.vdadd[8].A*0.0688965517241)+of.vdadd[8].A)+sl.min.vdadd[8].A.1)} {0.}
(assert (= (+ (+ (* sc_20 0.0688965517241) of_20) slbot_20_1) 0.))
; 
; =  {(((sc.vdadd[8].A*0.4995)+of.vdadd[8].A)+sl.max.vdadd[8].A.1)} {3300.}
(assert (= (+ (+ (* sc_20 0.4995) of_20) sltop_20_1) 3300.))
; 
; >=  {((sc.vdadd[8].B*0.0005)+of.vdadd[8].B)} {3300.}
(assert (<= (+ (* sc_21 0.0005) of_21) 3300.))
; 
; <=  {((sc.vdadd[8].B*0.0005)+of.vdadd[8].B)} {0.}
(assert (>= (+ (* sc_21 0.0005) of_21) 0.))
(declare-fun slbot_22_1 () Real)
(assert (<= slbot_22_1 1e-08))
(declare-fun sltop_22_1 () Real)
(assert (>= sltop_22_1 1e-08))
; 
; =  {(((sc.vdadd[8].OUT*0.)+of.vdadd[8].OUT)+sl.min.vdadd[8].OUT.1)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22_1) 0.))
; 
; =  {(((sc.vdadd[8].OUT*30.)+of.vdadd[8].OUT)+sl.max.vdadd[8].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_22 30.) of_22) sltop_22_1) 12000.))
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
; no scale
(assert (= sc_23 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_23 0.))
; no offset
(assert (= of_27 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_26 0.))
; 
; =  {sc.vdadd[0].A} {(1.*sc.vdadd[0].B)}
(assert (= sc_25 (* 1. sc_26)))
; 
; =  {sc.vdadd[0].A} {(1.*sc.vdadd[0].D*sc.vdadd[0].OUT)}
(assert (= sc_25 (* (* 1. sc_23) sc_27)))
; 
; =  {sc.vdadd[0].OUT} {sc.vdadd[0].A}
(assert (= sc_27 sc_25))
; no offset
(assert (= of_27 0.))
; no offset
(assert (= (- (+ of_25 0.) 0.) 0.))
; 
; =  {sc.vdadd[0].OUT_0} {sc.vdadd[0].A}
(assert (= sc_24 sc_25))
; 
; =  {of.vdadd[0].OUT_0} {((of.vdadd[0].A+0.)-0.)}
(assert (= of_24 (- (+ of_25 0.) 0.)))
; 
; >=  {((sc.vdadd[0].D*0.15051499783)+of.vdadd[0].D)} {10.}
(assert (<= (+ (* sc_23 0.15051499783) of_23) 10.))
; 
; <=  {((sc.vdadd[0].D*0.15051499783)+of.vdadd[0].D)} {0.}
(assert (>= (+ (* sc_23 0.15051499783) of_23) 0.))
(declare-fun slbot_27_1 () Real)
(assert (<= slbot_27_1 1e-08))
(declare-fun sltop_27_1 () Real)
(assert (>= sltop_27_1 1e-08))
; 
; =  {(((sc.vdadd[0].OUT*0.)+of.vdadd[0].OUT)+sl.min.vdadd[0].OUT.1)} {0.}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27_1) 0.))
; 
; =  {(((sc.vdadd[0].OUT*30.)+of.vdadd[0].OUT)+sl.max.vdadd[0].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_27 30.) of_27) sltop_27_1) 12000.))
; 
; >=  {((sc.vdadd[0].OUT_0*0.)+of.vdadd[0].OUT_0)} {3300.}
(assert (<= (+ (* sc_24 0.) of_24) 3300.))
; 
; <=  {((sc.vdadd[0].OUT_0*0.)+of.vdadd[0].OUT_0)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.vdadd[0].A*0.0005)+of.vdadd[0].A)} {3300.}
(assert (<= (+ (* sc_25 0.0005) of_25) 3300.))
; 
; <=  {((sc.vdadd[0].A*0.0005)+of.vdadd[0].A)} {0.}
(assert (>= (+ (* sc_25 0.0005) of_25) 0.))
(declare-fun slbot_26_1 () Real)
(assert (<= slbot_26_1 1e-08))
(declare-fun sltop_26_1 () Real)
(assert (>= sltop_26_1 1e-08))
; 
; =  {(((sc.vdadd[0].B*0.0688965517241)+of.vdadd[0].B)+sl.min.vdadd[0].B.1)} {0.}
(assert (= (+ (+ (* sc_26 0.0688965517241) of_26) slbot_26_1) 0.))
; 
; =  {(((sc.vdadd[0].B*0.4995)+of.vdadd[0].B)+sl.max.vdadd[0].B.1)} {3300.}
(assert (= (+ (+ (* sc_26 0.4995) of_26) sltop_26_1) 3300.))
(declare-fun slbot_27_1 () Real)
(assert (<= slbot_27_1 1e-08))
(declare-fun sltop_27_1 () Real)
(assert (>= sltop_27_1 1e-08))
; 
; =  {(((sc.vdadd[0].OUT*0.)+of.vdadd[0].OUT)+sl.min.vdadd[0].OUT.1)} {0.}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27_1) 0.))
; 
; =  {(((sc.vdadd[0].OUT*30.)+of.vdadd[0].OUT)+sl.max.vdadd[0].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_27 30.) of_27) sltop_27_1) 12000.))
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
; no scale
(assert (= sc_28 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_28 0.))
; no offset
(assert (= of_32 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_31 0.))
; 
; =  {sc.vdadd[10].A} {(1.*sc.vdadd[10].B)}
(assert (= sc_30 (* 1. sc_31)))
; 
; =  {sc.vdadd[10].A} {(1.*sc.vdadd[10].D*sc.vdadd[10].OUT)}
(assert (= sc_30 (* (* 1. sc_28) sc_32)))
; 
; =  {sc.vdadd[10].OUT} {sc.vdadd[10].A}
(assert (= sc_32 sc_30))
; no offset
(assert (= of_32 0.))
; no offset
(assert (= (- (+ of_30 0.) 0.) 0.))
; 
; =  {sc.vdadd[10].OUT_0} {sc.vdadd[10].A}
(assert (= sc_29 sc_30))
; 
; =  {of.vdadd[10].OUT_0} {((of.vdadd[10].A+0.)-0.)}
(assert (= of_29 (- (+ of_30 0.) 0.)))
; 
; >=  {((sc.vdadd[10].D*0.03010299956)+of.vdadd[10].D)} {10.}
(assert (<= (+ (* sc_28 0.03010299956) of_28) 10.))
; 
; <=  {((sc.vdadd[10].D*0.03010299956)+of.vdadd[10].D)} {0.}
(assert (>= (+ (* sc_28 0.03010299956) of_28) 0.))
(declare-fun slbot_32_1 () Real)
(assert (<= slbot_32_1 1e-08))
(declare-fun sltop_32_1 () Real)
(assert (>= sltop_32_1 1e-08))
; 
; =  {(((sc.vdadd[10].OUT*0.)+of.vdadd[10].OUT)+sl.min.vdadd[10].OUT.1)} {0.}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32_1) 0.))
; 
; =  {(((sc.vdadd[10].OUT*100.)+of.vdadd[10].OUT)+sl.max.vdadd[10].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_32 100.) of_32) sltop_32_1) 12000.))
; 
; >=  {((sc.vdadd[10].OUT_0*0.)+of.vdadd[10].OUT_0)} {3300.}
(assert (<= (+ (* sc_29 0.) of_29) 3300.))
; 
; <=  {((sc.vdadd[10].OUT_0*0.)+of.vdadd[10].OUT_0)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
(declare-fun slbot_30_1 () Real)
(assert (<= slbot_30_1 1e-08))
(declare-fun sltop_30_1 () Real)
(assert (>= sltop_30_1 1e-08))
; 
; =  {(((sc.vdadd[10].A*0.)+of.vdadd[10].A)+sl.min.vdadd[10].A.1)} {0.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30_1) 0.))
; 
; =  {(((sc.vdadd[10].A*90.3089986992)+of.vdadd[10].A)+sl.max.vdadd[10].A.1)} {3300.}
(assert (= (+ (+ (* sc_30 90.3089986992) of_30) sltop_30_1) 3300.))
; 
; >=  {((sc.vdadd[10].B*0.)+of.vdadd[10].B)} {3300.}
(assert (<= (+ (* sc_31 0.) of_31) 3300.))
; 
; <=  {((sc.vdadd[10].B*0.)+of.vdadd[10].B)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
(declare-fun slbot_32_1 () Real)
(assert (<= slbot_32_1 1e-08))
(declare-fun sltop_32_1 () Real)
(assert (>= sltop_32_1 1e-08))
; 
; =  {(((sc.vdadd[10].OUT*0.)+of.vdadd[10].OUT)+sl.min.vdadd[10].OUT.1)} {0.}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32_1) 0.))
; 
; =  {(((sc.vdadd[10].OUT*100.)+of.vdadd[10].OUT)+sl.max.vdadd[10].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_32 100.) of_32) sltop_32_1) 12000.))
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
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; no scale
(assert (= sc_33 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_33 0.))
; no offset
(assert (= of_37 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_36 0.))
; 
; =  {sc.vdadd[6].A} {(1.*sc.vdadd[6].B)}
(assert (= sc_35 (* 1. sc_36)))
; 
; =  {sc.vdadd[6].A} {(1.*sc.vdadd[6].D*sc.vdadd[6].OUT)}
(assert (= sc_35 (* (* 1. sc_33) sc_37)))
; 
; =  {sc.vdadd[6].OUT} {sc.vdadd[6].A}
(assert (= sc_37 sc_35))
; no offset
(assert (= of_37 0.))
; no offset
(assert (= (- (+ of_35 0.) 0.) 0.))
; 
; =  {sc.vdadd[6].OUT_0} {sc.vdadd[6].A}
(assert (= sc_34 sc_35))
; 
; =  {of.vdadd[6].OUT_0} {((of.vdadd[6].A+0.)-0.)}
(assert (= of_34 (- (+ of_35 0.) 0.)))
; 
; >=  {((sc.vdadd[6].D*0.15051499783)+of.vdadd[6].D)} {10.}
(assert (<= (+ (* sc_33 0.15051499783) of_33) 10.))
; 
; <=  {((sc.vdadd[6].D*0.15051499783)+of.vdadd[6].D)} {0.}
(assert (>= (+ (* sc_33 0.15051499783) of_33) 0.))
(declare-fun slbot_37_1 () Real)
(assert (<= slbot_37_1 1e-08))
(declare-fun sltop_37_1 () Real)
(assert (>= sltop_37_1 1e-08))
; 
; =  {(((sc.vdadd[6].OUT*0.)+of.vdadd[6].OUT)+sl.min.vdadd[6].OUT.1)} {0.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37_1) 0.))
; 
; =  {(((sc.vdadd[6].OUT*30.)+of.vdadd[6].OUT)+sl.max.vdadd[6].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_37 30.) of_37) sltop_37_1) 12000.))
; 
; >=  {((sc.vdadd[6].OUT_0*0.)+of.vdadd[6].OUT_0)} {3300.}
(assert (<= (+ (* sc_34 0.) of_34) 3300.))
; 
; <=  {((sc.vdadd[6].OUT_0*0.)+of.vdadd[6].OUT_0)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
(declare-fun slbot_35_1 () Real)
(assert (<= slbot_35_1 1e-08))
(declare-fun sltop_35_1 () Real)
(assert (>= sltop_35_1 1e-08))
; 
; =  {(((sc.vdadd[6].A*0.0688965517241)+of.vdadd[6].A)+sl.min.vdadd[6].A.1)} {0.}
(assert (= (+ (+ (* sc_35 0.0688965517241) of_35) slbot_35_1) 0.))
; 
; =  {(((sc.vdadd[6].A*0.4995)+of.vdadd[6].A)+sl.max.vdadd[6].A.1)} {3300.}
(assert (= (+ (+ (* sc_35 0.4995) of_35) sltop_35_1) 3300.))
; 
; >=  {((sc.vdadd[6].B*0.0005)+of.vdadd[6].B)} {3300.}
(assert (<= (+ (* sc_36 0.0005) of_36) 3300.))
; 
; <=  {((sc.vdadd[6].B*0.0005)+of.vdadd[6].B)} {0.}
(assert (>= (+ (* sc_36 0.0005) of_36) 0.))
(declare-fun slbot_37_1 () Real)
(assert (<= slbot_37_1 1e-08))
(declare-fun sltop_37_1 () Real)
(assert (>= sltop_37_1 1e-08))
; 
; =  {(((sc.vdadd[6].OUT*0.)+of.vdadd[6].OUT)+sl.min.vdadd[6].OUT.1)} {0.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37_1) 0.))
; 
; =  {(((sc.vdadd[6].OUT*30.)+of.vdadd[6].OUT)+sl.max.vdadd[6].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_37 30.) of_37) sltop_37_1) 12000.))
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
; no scale
(assert (= sc_38 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_38 0.))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; 
; =  {sc.vdadd[3].A} {(1.*sc.vdadd[3].B)}
(assert (= sc_40 (* 1. sc_41)))
; 
; =  {sc.vdadd[3].A} {(1.*sc.vdadd[3].D*sc.vdadd[3].OUT)}
(assert (= sc_40 (* (* 1. sc_38) sc_42)))
; 
; =  {sc.vdadd[3].OUT} {sc.vdadd[3].A}
(assert (= sc_42 sc_40))
; no offset
(assert (= of_42 0.))
; no offset
(assert (= (- (+ of_40 0.) 0.) 0.))
; 
; =  {sc.vdadd[3].OUT_0} {sc.vdadd[3].A}
(assert (= sc_39 sc_40))
; 
; =  {of.vdadd[3].OUT_0} {((of.vdadd[3].A+0.)-0.)}
(assert (= of_39 (- (+ of_40 0.) 0.)))
; 
; >=  {((sc.vdadd[3].D*0.03010299956)+of.vdadd[3].D)} {10.}
(assert (<= (+ (* sc_38 0.03010299956) of_38) 10.))
; 
; <=  {((sc.vdadd[3].D*0.03010299956)+of.vdadd[3].D)} {0.}
(assert (>= (+ (* sc_38 0.03010299956) of_38) 0.))
(declare-fun slbot_42_1 () Real)
(assert (<= slbot_42_1 1e-08))
(declare-fun sltop_42_1 () Real)
(assert (>= sltop_42_1 1e-08))
; 
; =  {(((sc.vdadd[3].OUT*0.)+of.vdadd[3].OUT)+sl.min.vdadd[3].OUT.1)} {0.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42_1) 0.))
; 
; =  {(((sc.vdadd[3].OUT*100.)+of.vdadd[3].OUT)+sl.max.vdadd[3].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_42 100.) of_42) sltop_42_1) 12000.))
; 
; >=  {((sc.vdadd[3].OUT_0*0.)+of.vdadd[3].OUT_0)} {3300.}
(assert (<= (+ (* sc_39 0.) of_39) 3300.))
; 
; <=  {((sc.vdadd[3].OUT_0*0.)+of.vdadd[3].OUT_0)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
(declare-fun slbot_40_1 () Real)
(assert (<= slbot_40_1 1e-08))
(declare-fun sltop_40_1 () Real)
(assert (>= sltop_40_1 1e-08))
; 
; =  {(((sc.vdadd[3].A*0.)+of.vdadd[3].A)+sl.min.vdadd[3].A.1)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40_1) 0.))
; 
; =  {(((sc.vdadd[3].A*90.3089986992)+of.vdadd[3].A)+sl.max.vdadd[3].A.1)} {3300.}
(assert (= (+ (+ (* sc_40 90.3089986992) of_40) sltop_40_1) 3300.))
; 
; >=  {((sc.vdadd[3].B*0.)+of.vdadd[3].B)} {3300.}
(assert (<= (+ (* sc_41 0.) of_41) 3300.))
; 
; <=  {((sc.vdadd[3].B*0.)+of.vdadd[3].B)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun slbot_42_1 () Real)
(assert (<= slbot_42_1 1e-08))
(declare-fun sltop_42_1 () Real)
(assert (>= sltop_42_1 1e-08))
; 
; =  {(((sc.vdadd[3].OUT*0.)+of.vdadd[3].OUT)+sl.min.vdadd[3].OUT.1)} {0.}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42_1) 0.))
; 
; =  {(((sc.vdadd[3].OUT*100.)+of.vdadd[3].OUT)+sl.max.vdadd[3].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_42 100.) of_42) sltop_42_1) 12000.))
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
; no scale
(assert (= sc_43 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_43 0.))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_46 0.))
; 
; =  {sc.vdadd[5].A} {(1.*sc.vdadd[5].B)}
(assert (= sc_45 (* 1. sc_46)))
; 
; =  {sc.vdadd[5].A} {(1.*sc.vdadd[5].D*sc.vdadd[5].OUT)}
(assert (= sc_45 (* (* 1. sc_43) sc_47)))
; 
; =  {sc.vdadd[5].OUT} {sc.vdadd[5].A}
(assert (= sc_47 sc_45))
; no offset
(assert (= of_47 0.))
; no offset
(assert (= (- (+ of_45 0.) 0.) 0.))
; 
; =  {sc.vdadd[5].OUT_0} {sc.vdadd[5].A}
(assert (= sc_44 sc_45))
; 
; =  {of.vdadd[5].OUT_0} {((of.vdadd[5].A+0.)-0.)}
(assert (= of_44 (- (+ of_45 0.) 0.)))
; 
; >=  {((sc.vdadd[5].D*0.03010299956)+of.vdadd[5].D)} {10.}
(assert (<= (+ (* sc_43 0.03010299956) of_43) 10.))
; 
; <=  {((sc.vdadd[5].D*0.03010299956)+of.vdadd[5].D)} {0.}
(assert (>= (+ (* sc_43 0.03010299956) of_43) 0.))
(declare-fun slbot_47_1 () Real)
(assert (<= slbot_47_1 1e-08))
(declare-fun sltop_47_1 () Real)
(assert (>= sltop_47_1 1e-08))
; 
; =  {(((sc.vdadd[5].OUT*0.)+of.vdadd[5].OUT)+sl.min.vdadd[5].OUT.1)} {0.}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47_1) 0.))
; 
; =  {(((sc.vdadd[5].OUT*100.)+of.vdadd[5].OUT)+sl.max.vdadd[5].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_47 100.) of_47) sltop_47_1) 12000.))
; 
; >=  {((sc.vdadd[5].OUT_0*0.)+of.vdadd[5].OUT_0)} {3300.}
(assert (<= (+ (* sc_44 0.) of_44) 3300.))
; 
; <=  {((sc.vdadd[5].OUT_0*0.)+of.vdadd[5].OUT_0)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun slbot_45_1 () Real)
(assert (<= slbot_45_1 1e-08))
(declare-fun sltop_45_1 () Real)
(assert (>= sltop_45_1 1e-08))
; 
; =  {(((sc.vdadd[5].A*0.)+of.vdadd[5].A)+sl.min.vdadd[5].A.1)} {0.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45_1) 0.))
; 
; =  {(((sc.vdadd[5].A*90.3089986992)+of.vdadd[5].A)+sl.max.vdadd[5].A.1)} {3300.}
(assert (= (+ (+ (* sc_45 90.3089986992) of_45) sltop_45_1) 3300.))
; 
; >=  {((sc.vdadd[5].B*0.)+of.vdadd[5].B)} {3300.}
(assert (<= (+ (* sc_46 0.) of_46) 3300.))
; 
; <=  {((sc.vdadd[5].B*0.)+of.vdadd[5].B)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
(declare-fun slbot_47_1 () Real)
(assert (<= slbot_47_1 1e-08))
(declare-fun sltop_47_1 () Real)
(assert (>= sltop_47_1 1e-08))
; 
; =  {(((sc.vdadd[5].OUT*0.)+of.vdadd[5].OUT)+sl.min.vdadd[5].OUT.1)} {0.}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47_1) 0.))
; 
; =  {(((sc.vdadd[5].OUT*100.)+of.vdadd[5].OUT)+sl.max.vdadd[5].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_47 100.) of_47) sltop_47_1) 12000.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.I[2].X*40.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_48 40.) of_48) 10.))
; 
; <=  {((sc.input.I[2].X*40.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_48 40.) of_48) 0.))
; 
; >=  {((sc.input.I[2].O*40.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_49 40.) of_49) 10.))
; 
; <=  {((sc.input.I[2].O*40.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_49 40.) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.I[8].X*0.15051499783)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_50 0.15051499783) of_50) 10.))
; 
; <=  {((sc.input.I[8].X*0.15051499783)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_50 0.15051499783) of_50) 0.))
; 
; >=  {((sc.input.I[8].O*0.15051499783)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_51 0.15051499783) of_51) 10.))
; 
; <=  {((sc.input.I[8].O*0.15051499783)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_51 0.15051499783) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.I[7].X*0.15051499783)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_52 0.15051499783) of_52) 10.))
; 
; <=  {((sc.input.I[7].X*0.15051499783)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_52 0.15051499783) of_52) 0.))
; 
; >=  {((sc.input.I[7].O*0.15051499783)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_53 0.15051499783) of_53) 10.))
; 
; <=  {((sc.input.I[7].O*0.15051499783)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_53 0.15051499783) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.I[9].X*0.03010299956)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_54 0.03010299956) of_54) 10.))
; 
; <=  {((sc.input.I[9].X*0.03010299956)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_54 0.03010299956) of_54) 0.))
; 
; >=  {((sc.input.I[9].O*0.03010299956)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_55 0.03010299956) of_55) 10.))
; 
; <=  {((sc.input.I[9].O*0.03010299956)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_55 0.03010299956) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.I[0].X*40.)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_56 40.) of_56) 10.))
; 
; <=  {((sc.input.I[0].X*40.)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_56 40.) of_56) 0.))
; 
; >=  {((sc.input.I[0].O*40.)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_57 40.) of_57) 10.))
; 
; <=  {((sc.input.I[0].O*40.)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_57 40.) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.I[11].X*0.03010299956)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_58 0.03010299956) of_58) 10.))
; 
; <=  {((sc.input.I[11].X*0.03010299956)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_58 0.03010299956) of_58) 0.))
; 
; >=  {((sc.input.I[11].O*0.03010299956)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_59 0.03010299956) of_59) 10.))
; 
; <=  {((sc.input.I[11].O*0.03010299956)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_59 0.03010299956) of_59) 0.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.I[10].X*0.03010299956)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_60 0.03010299956) of_60) 10.))
; 
; <=  {((sc.input.I[10].X*0.03010299956)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_60 0.03010299956) of_60) 0.))
; 
; >=  {((sc.input.I[10].O*0.03010299956)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_61 0.03010299956) of_61) 10.))
; 
; <=  {((sc.input.I[10].O*0.03010299956)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_61 0.03010299956) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.I[6].X*0.15051499783)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_62 0.15051499783) of_62) 10.))
; 
; <=  {((sc.input.I[6].X*0.15051499783)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_62 0.15051499783) of_62) 0.))
; 
; >=  {((sc.input.I[6].O*0.15051499783)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_63 0.15051499783) of_63) 10.))
; 
; <=  {((sc.input.I[6].O*0.15051499783)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_63 0.15051499783) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.I[3].X*0.4995)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_64 0.4995) of_64) 10.))
; 
; <=  {((sc.input.I[3].X*0.4995)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_64 0.4995) of_64) 0.))
; 
; >=  {((sc.input.I[3].O*0.4995)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_65 0.4995) of_65) 10.))
; 
; <=  {((sc.input.I[3].O*0.4995)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_65 0.4995) of_65) 0.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.I[4].X*0.4995)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_66 0.4995) of_66) 10.))
; 
; <=  {((sc.input.I[4].X*0.4995)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_66 0.4995) of_66) 0.))
; 
; >=  {((sc.input.I[4].O*0.4995)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_67 0.4995) of_67) 10.))
; 
; <=  {((sc.input.I[4].O*0.4995)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_67 0.4995) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.I[5].X*0.4995)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_68 0.4995) of_68) 10.))
; 
; <=  {((sc.input.I[5].X*0.4995)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_68 0.4995) of_68) 0.))
; 
; >=  {((sc.input.I[5].O*0.4995)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_69 0.4995) of_69) 10.))
; 
; <=  {((sc.input.I[5].O*0.4995)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_69 0.4995) of_69) 0.))
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
; >=  {((sc.input.I[1].X*40.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_70 40.) of_70) 10.))
; 
; <=  {((sc.input.I[1].X*40.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_70 40.) of_70) 0.))
; 
; >=  {((sc.input.I[1].O*40.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_71 40.) of_71) 10.))
; 
; <=  {((sc.input.I[1].O*40.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_71 40.) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_73 sc_72))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_73 of_72))
(declare-fun slbot_72_1 () Real)
(assert (<= slbot_72_1 1e-08))
(declare-fun sltop_72_1 () Real)
(assert (>= sltop_72_1 1e-08))
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X.1)} {0.}
(assert (= (+ (+ (* sc_72 0.) of_72) slbot_72_1) 0.))
; 
; =  {(((sc.output.V[2].X*30.)+of.output.V[2].X)+sl.max.output.V[2].X.1)} {3300.}
(assert (= (+ (+ (* sc_72 30.) of_72) sltop_72_1) 3300.))
(declare-fun slbot_73_1 () Real)
(assert (<= slbot_73_1 1e-08))
(declare-fun sltop_73_1 () Real)
(assert (>= sltop_73_1 1e-08))
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O.1)} {0.}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73_1) 0.))
; 
; =  {(((sc.output.V[2].O*30.)+of.output.V[2].O)+sl.max.output.V[2].O.1)} {3300.}
(assert (= (+ (+ (* sc_73 30.) of_73) sltop_73_1) 3300.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_75 sc_74))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_75 of_74))
(declare-fun slbot_74_1 () Real)
(assert (<= slbot_74_1 1e-08))
(declare-fun sltop_74_1 () Real)
(assert (>= sltop_74_1 1e-08))
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X.1)} {0.}
(assert (= (+ (+ (* sc_74 0.) of_74) slbot_74_1) 0.))
; 
; =  {(((sc.output.V[0].X*30.)+of.output.V[0].X)+sl.max.output.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_74 30.) of_74) sltop_74_1) 3300.))
(declare-fun slbot_75_1 () Real)
(assert (<= slbot_75_1 1e-08))
(declare-fun sltop_75_1 () Real)
(assert (>= sltop_75_1 1e-08))
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O.1)} {0.}
(assert (= (+ (+ (* sc_75 0.) of_75) slbot_75_1) 0.))
; 
; =  {(((sc.output.V[0].O*30.)+of.output.V[0].O)+sl.max.output.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_75 30.) of_75) sltop_75_1) 3300.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_77 sc_76))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_77 of_76))
(declare-fun slbot_76_1 () Real)
(assert (<= slbot_76_1 1e-08))
(declare-fun sltop_76_1 () Real)
(assert (>= sltop_76_1 1e-08))
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X.1)} {0.}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76_1) 0.))
; 
; =  {(((sc.output.V[3].X*30.)+of.output.V[3].X)+sl.max.output.V[3].X.1)} {3300.}
(assert (= (+ (+ (* sc_76 30.) of_76) sltop_76_1) 3300.))
(declare-fun slbot_77_1 () Real)
(assert (<= slbot_77_1 1e-08))
(declare-fun sltop_77_1 () Real)
(assert (>= sltop_77_1 1e-08))
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O.1)} {0.}
(assert (= (+ (+ (* sc_77 0.) of_77) slbot_77_1) 0.))
; 
; =  {(((sc.output.V[3].O*30.)+of.output.V[3].O)+sl.max.output.V[3].O.1)} {3300.}
(assert (= (+ (+ (* sc_77 30.) of_77) sltop_77_1) 3300.))
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; 
; =  {sc.output.V[4].O} {sc.output.V[4].X}
(assert (= sc_79 sc_78))
; 
; =  {of.output.V[4].O} {of.output.V[4].X}
(assert (= of_79 of_78))
(declare-fun slbot_78_1 () Real)
(assert (<= slbot_78_1 1e-08))
(declare-fun sltop_78_1 () Real)
(assert (>= sltop_78_1 1e-08))
; 
; =  {(((sc.output.V[4].X*0.)+of.output.V[4].X)+sl.min.output.V[4].X.1)} {0.}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78_1) 0.))
; 
; =  {(((sc.output.V[4].X*100.)+of.output.V[4].X)+sl.max.output.V[4].X.1)} {3300.}
(assert (= (+ (+ (* sc_78 100.) of_78) sltop_78_1) 3300.))
(declare-fun slbot_79_1 () Real)
(assert (<= slbot_79_1 1e-08))
(declare-fun sltop_79_1 () Real)
(assert (>= sltop_79_1 1e-08))
; 
; =  {(((sc.output.V[4].O*0.)+of.output.V[4].O)+sl.min.output.V[4].O.1)} {0.}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79_1) 0.))
; 
; =  {(((sc.output.V[4].O*100.)+of.output.V[4].O)+sl.max.output.V[4].O.1)} {3300.}
(assert (= (+ (+ (* sc_79 100.) of_79) sltop_79_1) 3300.))
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
; 
; =  {sc.output.V[5].O} {sc.output.V[5].X}
(assert (= sc_81 sc_80))
; 
; =  {of.output.V[5].O} {of.output.V[5].X}
(assert (= of_81 of_80))
(declare-fun slbot_80_1 () Real)
(assert (<= slbot_80_1 1e-08))
(declare-fun sltop_80_1 () Real)
(assert (>= sltop_80_1 1e-08))
; 
; =  {(((sc.output.V[5].X*0.)+of.output.V[5].X)+sl.min.output.V[5].X.1)} {0.}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80_1) 0.))
; 
; =  {(((sc.output.V[5].X*100.)+of.output.V[5].X)+sl.max.output.V[5].X.1)} {3300.}
(assert (= (+ (+ (* sc_80 100.) of_80) sltop_80_1) 3300.))
(declare-fun slbot_81_1 () Real)
(assert (<= slbot_81_1 1e-08))
(declare-fun sltop_81_1 () Real)
(assert (>= sltop_81_1 1e-08))
; 
; =  {(((sc.output.V[5].O*0.)+of.output.V[5].O)+sl.min.output.V[5].O.1)} {0.}
(assert (= (+ (+ (* sc_81 0.) of_81) slbot_81_1) 0.))
; 
; =  {(((sc.output.V[5].O*100.)+of.output.V[5].O)+sl.max.output.V[5].O.1)} {3300.}
(assert (= (+ (+ (* sc_81 100.) of_81) sltop_81_1) 3300.))
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_83 sc_82))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_83 of_82))
(declare-fun slbot_82_1 () Real)
(assert (<= slbot_82_1 1e-08))
(declare-fun sltop_82_1 () Real)
(assert (>= sltop_82_1 1e-08))
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X.1)} {0.}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82_1) 0.))
; 
; =  {(((sc.output.V[1].X*100.)+of.output.V[1].X)+sl.max.output.V[1].X.1)} {3300.}
(assert (= (+ (+ (* sc_82 100.) of_82) sltop_82_1) 3300.))
(declare-fun slbot_83_1 () Real)
(assert (<= slbot_83_1 1e-08))
(declare-fun sltop_83_1 () Real)
(assert (>= sltop_83_1 1e-08))
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O.1)} {0.}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83_1) 0.))
; 
; =  {(((sc.output.V[1].O*100.)+of.output.V[1].O)+sl.max.output.V[1].O.1)} {3300.}
(assert (= (+ (+ (* sc_83 100.) of_83) sltop_83_1) 3300.))
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_85 sc_84))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_85 of_84))
; 
; >=  {((sc.input.V[2].X*2.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_84 2.) of_84) 3300.))
; 
; <=  {((sc.input.V[2].X*2.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_84 2.) of_84) 0.))
; 
; >=  {((sc.input.V[2].O*2.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_85 2.) of_85) 3300.))
; 
; <=  {((sc.input.V[2].O*2.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_85 2.) of_85) 0.))
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_87 sc_86))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_87 of_86))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_86 0.) of_86) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_86 0.) of_86) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_87 0.) of_87) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_87 0.) of_87) 0.))
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_89 sc_88))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_89 of_88))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_88 0.) of_88) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_88 0.) of_88) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_89 0.) of_89) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_89 0.) of_89) 0.))
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_91 sc_90))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_91 of_90))
; 
; >=  {((sc.input.V[13].X*0.0005)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_90 0.0005) of_90) 3300.))
; 
; <=  {((sc.input.V[13].X*0.0005)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_90 0.0005) of_90) 0.))
; 
; >=  {((sc.input.V[13].O*0.0005)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_91 0.0005) of_91) 3300.))
; 
; <=  {((sc.input.V[13].O*0.0005)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_91 0.0005) of_91) 0.))
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_93 sc_92))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_93 of_92))
; 
; >=  {((sc.input.V[12].X*0.0005)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_92 0.0005) of_92) 3300.))
; 
; <=  {((sc.input.V[12].X*0.0005)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_92 0.0005) of_92) 0.))
; 
; >=  {((sc.input.V[12].O*0.0005)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_93 0.0005) of_93) 3300.))
; 
; <=  {((sc.input.V[12].O*0.0005)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_93 0.0005) of_93) 0.))
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_95 sc_94))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_95 of_94))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_94 0.) of_94) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_94 0.) of_94) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_95 0.) of_95) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_95 0.) of_95) 0.))
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_97 sc_96))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_97 of_96))
; 
; >=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_96 2.) of_96) 3300.))
; 
; <=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_96 2.) of_96) 0.))
; 
; >=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_97 2.) of_97) 3300.))
; 
; <=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_97 2.) of_97) 0.))
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_99 sc_98))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_99 of_98))
; 
; >=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_98 0.) of_98) 3300.))
; 
; <=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_98 0.) of_98) 0.))
; 
; >=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_99 0.) of_99) 3300.))
; 
; <=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_99 0.) of_99) 0.))
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_101 sc_100))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_101 of_100))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_100 0.) of_100) 3300.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_100 0.) of_100) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_101 0.) of_101) 3300.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_101 0.) of_101) 0.))
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_103 sc_102))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_103 of_102))
; 
; >=  {((sc.input.V[15].X*3.01029995664)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_102 3.01029995664) of_102) 3300.))
; 
; <=  {((sc.input.V[15].X*3.01029995664)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_102 3.01029995664) of_102) 0.))
; 
; >=  {((sc.input.V[15].O*3.01029995664)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_103 3.01029995664) of_103) 3300.))
; 
; <=  {((sc.input.V[15].O*3.01029995664)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_103 3.01029995664) of_103) 0.))
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_105 sc_104))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_105 of_104))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_104 0.) of_104) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_104 0.) of_104) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_105 0.) of_105) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_105 0.) of_105) 0.))
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_107 sc_106))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_107 of_106))
; 
; >=  {((sc.input.V[14].X*0.0005)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_106 0.0005) of_106) 3300.))
; 
; <=  {((sc.input.V[14].X*0.0005)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_106 0.0005) of_106) 0.))
; 
; >=  {((sc.input.V[14].O*0.0005)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_107 0.0005) of_107) 3300.))
; 
; <=  {((sc.input.V[14].O*0.0005)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_107 0.0005) of_107) 0.))
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_109 sc_108))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_109 of_108))
; 
; >=  {((sc.input.V[16].X*3.01029995664)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_108 3.01029995664) of_108) 3300.))
; 
; <=  {((sc.input.V[16].X*3.01029995664)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_108 3.01029995664) of_108) 0.))
; 
; >=  {((sc.input.V[16].O*3.01029995664)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_109 3.01029995664) of_109) 3300.))
; 
; <=  {((sc.input.V[16].O*3.01029995664)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_109 3.01029995664) of_109) 0.))
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_111 sc_110))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_111 of_110))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_110 0.) of_110) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_110 0.) of_110) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_111 0.) of_111) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_111 0.) of_111) 0.))
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_113 sc_112))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_113 of_112))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_112 0.) of_112) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_112 0.) of_112) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_113 0.) of_113) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_113 0.) of_113) 0.))
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_115 sc_114))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_115 of_114))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_114 0.) of_114) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_114 0.) of_114) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_115 0.) of_115) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_115 0.) of_115) 0.))
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_117 sc_116))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_117 of_116))
; 
; >=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_116 2.) of_116) 3300.))
; 
; <=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_116 2.) of_116) 0.))
; 
; >=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_117 2.) of_117) 3300.))
; 
; <=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_117 2.) of_117) 0.))
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_119 sc_118))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_119 of_118))
; 
; >=  {((sc.input.V[17].X*3.01029995664)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_118 3.01029995664) of_118) 3300.))
; 
; <=  {((sc.input.V[17].X*3.01029995664)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_118 3.01029995664) of_118) 0.))
; 
; >=  {((sc.input.V[17].O*3.01029995664)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_119 3.01029995664) of_119) 3300.))
; 
; <=  {((sc.input.V[17].O*3.01029995664)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_119 3.01029995664) of_119) 0.))
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
; no offset
(assert (= of_121 0.))
; no offset
(assert (= of_120 0.))
; 
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_122 (* sc_121 sc_120)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_122 0.))
(declare-fun slbot_120_1 () Real)
(assert (<= slbot_120_1 1e-08))
(declare-fun sltop_120_1 () Real)
(assert (>= sltop_120_1 1e-08))
; 
; =  {(((sc.itov[9].X*0.)+of.itov[9].X)+sl.min.itov[9].X.1)} {0.}
(assert (= (+ (+ (* sc_120 0.) of_120) slbot_120_1) 0.))
; 
; =  {(((sc.itov[9].X*30.)+of.itov[9].X)+sl.max.itov[9].X.1)} {10.}
(assert (= (+ (+ (* sc_120 30.) of_120) sltop_120_1) 10.))
(declare-fun slbot_122_1 () Real)
(assert (<= slbot_122_1 1e-08))
(declare-fun sltop_122_1 () Real)
(assert (>= sltop_122_1 1e-08))
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y.1)} {0.}
(assert (= (+ (+ (* sc_122 0.) of_122) slbot_122_1) 0.))
; 
; =  {(((sc.itov[9].Y*90.3089986992)+of.itov[9].Y)+sl.max.itov[9].Y.1)} {3300.}
(assert (= (+ (+ (* sc_122 90.3089986992) of_122) sltop_122_1) 3300.))
; 
; >=  {((sc.itov[9].K*3.01029995664)+of.itov[9].K)} {330.}
(assert (<= (+ (* sc_121 3.01029995664) of_121) 330.))
; 
; <=  {((sc.itov[9].K*3.01029995664)+of.itov[9].K)} {1.}
(assert (>= (+ (* sc_121 3.01029995664) of_121) 1.))
(declare-fun slbot_122_1 () Real)
(assert (<= slbot_122_1 1e-08))
(declare-fun sltop_122_1 () Real)
(assert (>= sltop_122_1 1e-08))
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y.1)} {0.}
(assert (= (+ (+ (* sc_122 0.) of_122) slbot_122_1) 0.))
; 
; =  {(((sc.itov[9].Y*90.3089986992)+of.itov[9].Y)+sl.max.itov[9].Y.1)} {3300.}
(assert (= (+ (+ (* sc_122 90.3089986992) of_122) sltop_122_1) 3300.))
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
; no offset
(assert (= of_124 0.))
; no offset
(assert (= of_123 0.))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_125 (* sc_124 sc_123)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_125 0.))
(declare-fun slbot_123_1 () Real)
(assert (<= slbot_123_1 1e-08))
(declare-fun sltop_123_1 () Real)
(assert (>= sltop_123_1 1e-08))
; 
; =  {(((sc.itov[4].X*0.)+of.itov[4].X)+sl.min.itov[4].X.1)} {0.}
(assert (= (+ (+ (* sc_123 0.) of_123) slbot_123_1) 0.))
; 
; =  {(((sc.itov[4].X*30.)+of.itov[4].X)+sl.max.itov[4].X.1)} {10.}
(assert (= (+ (+ (* sc_123 30.) of_123) sltop_123_1) 10.))
(declare-fun slbot_125_1 () Real)
(assert (<= slbot_125_1 1e-08))
(declare-fun sltop_125_1 () Real)
(assert (>= sltop_125_1 1e-08))
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y.1)} {0.}
(assert (= (+ (+ (* sc_125 0.) of_125) slbot_125_1) 0.))
; 
; =  {(((sc.itov[4].Y*90.3089986992)+of.itov[4].Y)+sl.max.itov[4].Y.1)} {3300.}
(assert (= (+ (+ (* sc_125 90.3089986992) of_125) sltop_125_1) 3300.))
; 
; >=  {((sc.itov[4].K*3.01029995664)+of.itov[4].K)} {330.}
(assert (<= (+ (* sc_124 3.01029995664) of_124) 330.))
; 
; <=  {((sc.itov[4].K*3.01029995664)+of.itov[4].K)} {1.}
(assert (>= (+ (* sc_124 3.01029995664) of_124) 1.))
(declare-fun slbot_125_1 () Real)
(assert (<= slbot_125_1 1e-08))
(declare-fun sltop_125_1 () Real)
(assert (>= sltop_125_1 1e-08))
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y.1)} {0.}
(assert (= (+ (+ (* sc_125 0.) of_125) slbot_125_1) 0.))
; 
; =  {(((sc.itov[4].Y*90.3089986992)+of.itov[4].Y)+sl.max.itov[4].Y.1)} {3300.}
(assert (= (+ (+ (* sc_125 90.3089986992) of_125) sltop_125_1) 3300.))
; 
; =  {sc.vdadd[3].OUT} {sc.ihill_rep[1].S}
(assert (= sc_42 sc_14))
; 
; =  {of.vdadd[3].OUT} {of.ihill_rep[1].S}
(assert (= of_42 of_14))
; 
; =  {sc.vdadd[3].OUT} {sc.output.V[1].X}
(assert (= sc_42 sc_82))
; 
; =  {of.vdadd[3].OUT} {of.output.V[1].X}
(assert (= of_42 of_82))
; 
; =  {sc.input.I[6].O} {sc.vdadd[0].D}
(assert (= sc_63 sc_23))
; 
; =  {of.input.I[6].O} {of.vdadd[0].D}
(assert (= of_63 of_23))
; 
; =  {sc.input.V[17].O} {sc.itov[4].K}
(assert (= sc_119 sc_124))
; 
; =  {of.input.V[17].O} {of.itov[4].K}
(assert (= of_119 of_124))
; 
; =  {sc.vdadd[5].OUT} {sc.ihill_rep[7].S}
(assert (= sc_47 sc_4))
; 
; =  {of.vdadd[5].OUT} {of.ihill_rep[7].S}
(assert (= of_47 of_4))
; 
; =  {sc.vdadd[5].OUT} {sc.output.V[5].X}
(assert (= sc_47 sc_80))
; 
; =  {of.vdadd[5].OUT} {of.output.V[5].X}
(assert (= of_47 of_80))
; 
; =  {sc.input.I[0].O} {sc.ihill_rep[1].Km}
(assert (= sc_57 sc_15))
; 
; =  {of.input.I[0].O} {of.ihill_rep[1].Km}
(assert (= of_57 of_15))
; 
; =  {sc.input.V[9].O} {sc.vdadd[6].OUT_0}
(assert (= sc_95 sc_34))
; 
; =  {of.input.V[9].O} {of.vdadd[6].OUT_0}
(assert (= of_95 of_34))
; 
; =  {sc.input.V[15].O} {sc.vgain[2].X}
(assert (= sc_103 sc_0))
; 
; =  {of.input.V[15].O} {of.vgain[2].X}
(assert (= of_103 of_0))
; 
; =  {sc.vdadd[10].OUT} {sc.output.V[4].X}
(assert (= sc_32 sc_78))
; 
; =  {of.vdadd[10].OUT} {of.output.V[4].X}
(assert (= of_32 of_78))
; 
; =  {sc.vdadd[10].OUT} {sc.ihill_rep[11].S}
(assert (= sc_32 sc_9))
; 
; =  {of.vdadd[10].OUT} {of.ihill_rep[11].S}
(assert (= of_32 of_9))
; 
; =  {sc.input.I[9].O} {sc.vdadd[3].D}
(assert (= sc_55 sc_38))
; 
; =  {of.input.I[9].O} {of.vdadd[3].D}
(assert (= of_55 of_38))
; 
; =  {sc.ihill_rep[11].REP} {sc.vdadd[0].B}
(assert (= sc_12 sc_26))
; 
; =  {of.ihill_rep[11].REP} {of.vdadd[0].B}
(assert (= of_12 of_26))
; 
; =  {sc.input.I[3].O} {sc.ihill_rep[1].Vmax}
(assert (= sc_65 sc_16))
; 
; =  {of.input.I[3].O} {of.ihill_rep[1].Vmax}
(assert (= of_65 of_16))
; 
; =  {sc.input.I[4].O} {sc.ihill_rep[11].Vmax}
(assert (= sc_67 sc_11))
; 
; =  {of.input.I[4].O} {of.ihill_rep[11].Vmax}
(assert (= of_67 of_11))
; 
; =  {sc.vdadd[6].OUT} {sc.output.V[0].X}
(assert (= sc_37 sc_74))
; 
; =  {of.vdadd[6].OUT} {of.output.V[0].X}
(assert (= of_37 of_74))
; 
; =  {sc.vdadd[6].OUT} {sc.itov[4].X}
(assert (= sc_37 sc_123))
; 
; =  {of.vdadd[6].OUT} {of.itov[4].X}
(assert (= of_37 of_123))
; 
; =  {sc.input.V[13].O} {sc.vdadd[8].B}
(assert (= sc_91 sc_21))
; 
; =  {of.input.V[13].O} {of.vdadd[8].B}
(assert (= of_91 of_21))
; 
; =  {sc.input.I[5].O} {sc.ihill_rep[7].Vmax}
(assert (= sc_69 sc_6))
; 
; =  {of.input.I[5].O} {of.ihill_rep[7].Vmax}
(assert (= of_69 of_6))
; 
; =  {sc.input.V[14].O} {sc.vdadd[6].B}
(assert (= sc_107 sc_36))
; 
; =  {of.input.V[14].O} {of.vdadd[6].B}
(assert (= of_107 of_36))
; 
; =  {sc.vdadd[0].OUT} {sc.output.V[2].X}
(assert (= sc_27 sc_72))
; 
; =  {of.vdadd[0].OUT} {of.output.V[2].X}
(assert (= of_27 of_72))
; 
; =  {sc.vdadd[0].OUT} {sc.vgain[2].Z}
(assert (= sc_27 sc_1))
; 
; =  {of.vdadd[0].OUT} {of.vgain[2].Z}
(assert (= of_27 of_1))
; 
; =  {sc.input.V[11].O} {sc.vdadd[8].OUT_0}
(assert (= sc_99 sc_19))
; 
; =  {of.input.V[11].O} {of.vdadd[8].OUT_0}
(assert (= of_99 of_19))
; 
; =  {sc.input.V[8].O} {sc.vdadd[5].OUT_0}
(assert (= sc_87 sc_44))
; 
; =  {of.input.V[8].O} {of.vdadd[5].OUT_0}
(assert (= of_87 of_44))
; 
; =  {sc.input.I[2].O} {sc.ihill_rep[7].Km}
(assert (= sc_49 sc_5))
; 
; =  {of.input.I[2].O} {of.ihill_rep[7].Km}
(assert (= of_49 of_5))
; 
; =  {sc.input.V[12].O} {sc.vdadd[0].A}
(assert (= sc_93 sc_25))
; 
; =  {of.input.V[12].O} {of.vdadd[0].A}
(assert (= of_93 of_25))
; 
; =  {sc.input.V[3].O} {sc.vdadd[3].B}
(assert (= sc_111 sc_41))
; 
; =  {of.input.V[3].O} {of.vdadd[3].B}
(assert (= of_111 of_41))
; 
; =  {sc.input.V[2].O} {sc.ihill_rep[7].n}
(assert (= sc_85 sc_3))
; 
; =  {of.input.V[2].O} {of.ihill_rep[7].n}
(assert (= of_85 of_3))
; 
; =  {sc.input.I[1].O} {sc.ihill_rep[11].Km}
(assert (= sc_71 sc_10))
; 
; =  {of.input.I[1].O} {of.ihill_rep[11].Km}
(assert (= of_71 of_10))
; 
; =  {sc.ihill_rep[7].REP} {sc.vdadd[8].A}
(assert (= sc_7 sc_20))
; 
; =  {of.ihill_rep[7].REP} {of.vdadd[8].A}
(assert (= of_7 of_20))
; 
; =  {sc.input.I[10].O} {sc.vdadd[10].D}
(assert (= sc_61 sc_28))
; 
; =  {of.input.I[10].O} {of.vdadd[10].D}
(assert (= of_61 of_28))
; 
; =  {sc.input.I[7].O} {sc.vdadd[8].D}
(assert (= sc_53 sc_18))
; 
; =  {of.input.I[7].O} {of.vdadd[8].D}
(assert (= of_53 of_18))
; 
; =  {sc.input.V[1].O} {sc.ihill_rep[11].n}
(assert (= sc_117 sc_8))
; 
; =  {of.input.V[1].O} {of.ihill_rep[11].n}
(assert (= of_117 of_8))
; 
; =  {sc.input.V[7].O} {sc.vdadd[3].OUT_0}
(assert (= sc_89 sc_39))
; 
; =  {of.input.V[7].O} {of.vdadd[3].OUT_0}
(assert (= of_89 of_39))
; 
; =  {sc.input.I[8].O} {sc.vdadd[6].D}
(assert (= sc_51 sc_33))
; 
; =  {of.input.I[8].O} {of.vdadd[6].D}
(assert (= of_51 of_33))
; 
; =  {sc.ihill_rep[1].REP} {sc.vdadd[6].A}
(assert (= sc_17 sc_35))
; 
; =  {of.ihill_rep[1].REP} {of.vdadd[6].A}
(assert (= of_17 of_35))
; 
; =  {sc.input.V[10].O} {sc.vdadd[10].OUT_0}
(assert (= sc_101 sc_29))
; 
; =  {of.input.V[10].O} {of.vdadd[10].OUT_0}
(assert (= of_101 of_29))
; 
; =  {sc.input.V[0].O} {sc.ihill_rep[1].n}
(assert (= sc_97 sc_13))
; 
; =  {of.input.V[0].O} {of.ihill_rep[1].n}
(assert (= of_97 of_13))
; 
; =  {sc.vdadd[8].OUT} {sc.itov[9].X}
(assert (= sc_22 sc_120))
; 
; =  {of.vdadd[8].OUT} {of.itov[9].X}
(assert (= of_22 of_120))
; 
; =  {sc.vdadd[8].OUT} {sc.output.V[3].X}
(assert (= sc_22 sc_76))
; 
; =  {of.vdadd[8].OUT} {of.output.V[3].X}
(assert (= of_22 of_76))
; 
; =  {sc.input.V[16].O} {sc.itov[9].K}
(assert (= sc_109 sc_121))
; 
; =  {of.input.V[16].O} {of.itov[9].K}
(assert (= of_109 of_121))
; 
; =  {sc.itov[4].Y} {sc.vdadd[5].A}
(assert (= sc_125 sc_45))
; 
; =  {of.itov[4].Y} {of.vdadd[5].A}
(assert (= of_125 of_45))
; 
; =  {sc.itov[9].Y} {sc.vdadd[10].A}
(assert (= sc_122 sc_30))
; 
; =  {of.itov[9].Y} {of.vdadd[10].A}
(assert (= of_122 of_30))
; 
; =  {sc.input.V[5].O} {sc.vdadd[5].B}
(assert (= sc_115 sc_46))
; 
; =  {of.input.V[5].O} {of.vdadd[5].B}
(assert (= of_115 of_46))
; 
; =  {sc.input.V[4].O} {sc.vdadd[10].B}
(assert (= sc_113 sc_31))
; 
; =  {of.input.V[4].O} {of.vdadd[10].B}
(assert (= of_113 of_31))
; 
; =  {sc.input.V[6].O} {sc.vdadd[0].OUT_0}
(assert (= sc_105 sc_24))
; 
; =  {of.input.V[6].O} {of.vdadd[0].OUT_0}
(assert (= of_105 of_24))
; 
; =  {sc.vgain[2].P} {sc.vdadd[3].A}
(assert (= sc_2 sc_40))
; 
; =  {of.vgain[2].P} {of.vdadd[3].A}
(assert (= of_2 of_40))
; 
; =  {sc.input.I[11].O} {sc.vdadd[5].D}
(assert (= sc_59 sc_43))
; 
; =  {of.input.I[11].O} {of.vdadd[5].D}
(assert (= of_59 of_43))
(assert (<= (/ 1 sc_75) 1000.))
(assert (<= (* sc_75 1) 1000.))
(assert (not (= 1. sc_75)))
(assert (<= (/ 1 sc_83) 1000.))
(assert (<= (* sc_83 1) 1000.))
(assert (not (= 1. sc_83)))
(assert (<= (/ 1 sc_73) 1000.))
(assert (<= (* sc_73 1) 1000.))
(assert (not (= 1. sc_73)))
(assert (<= (/ 1 sc_77) 1000.))
(assert (<= (* sc_77 1) 1000.))
(assert (not (= 1. sc_77)))
(assert (<= (/ 1 sc_79) 1000.))
(assert (<= (* sc_79 1) 1000.))
(assert (not (= 1. sc_79)))
(assert (<= (/ 1 sc_81) 1000.))
(assert (<= (* sc_81 1) 1000.))
(assert (not (= 1. sc_81)))
(assert (not (= 1. sc_17)))
(assert (not (= 1. sc_12)))
(assert (not (= 1. sc_7)))
; 
; =  {sc.vdadd[6].OUT} {sc.output.V[0].O} {sc.vdadd[3].OUT} {sc.output.V[1].O} {sc.vdadd[0].OUT} {sc.output.V[2].O} {sc.vdadd[8].OUT} {sc.output.V[3].O} {sc.vdadd[10].OUT} {sc.output.V[4].O} {sc.vdadd[5].OUT} {sc.output.V[5].O}
(assert (and (and (and (and (and (and (and (and (and (and (= sc_37 sc_75) (= sc_37 sc_42)) (= sc_37 sc_83)) (= sc_37 sc_27)) (= sc_37 sc_73)) (= sc_37 sc_22)) (= sc_37 sc_77)) (= sc_37 sc_32)) (= sc_37 sc_79)) (= sc_37 sc_47)) (= sc_37 sc_81)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_1_1 0.) slbot_1_1 (- slbot_1_1)) (ite (>= sltop_75_1 0.) sltop_75_1 (- sltop_75_1))) (ite (>= sltop_123_1 0.) sltop_123_1 (- sltop_123_1))) (ite (>= slbot_122_1 0.) slbot_122_1 (- slbot_122_1))) (ite (>= sltop_125_1 0.) sltop_125_1 (- sltop_125_1))) (ite (>= sltop_17_1 0.) sltop_17_1 (- sltop_17_1))) (ite (>= slbot_27_1 0.) slbot_27_1 (- slbot_27_1))) (ite (>= slbot_7_1 0.) slbot_7_1 (- slbot_7_1))) (ite (>= slbot_37_1 0.) slbot_37_1 (- slbot_37_1))) (ite (>= sltop_37_1 0.) sltop_37_1 (- sltop_37_1))) (ite (>= slbot_22_1 0.) slbot_22_1 (- slbot_22_1))) (ite (>= sltop_45_1 0.) sltop_45_1 (- sltop_45_1))) (ite (>= slbot_35_1 0.) slbot_35_1 (- slbot_35_1))) (ite (>= slbot_76_1 0.) slbot_76_1 (- slbot_76_1))) (ite (>= slbot_78_1 0.) slbot_78_1 (- slbot_78_1))) (ite (>= slbot_2_1 0.) slbot_2_1 (- slbot_2_1))) (ite (>= slbot_4_1 0.) slbot_4_1 (- slbot_4_1))) (ite (>= sltop_122_1 0.) sltop_122_1 (- sltop_122_1))) (ite (>= slbot_14_1 0.) slbot_14_1 (- slbot_14_1))) (ite (>= sltop_40_1 0.) sltop_40_1 (- sltop_40_1))) (ite (>= slbot_77_1 0.) slbot_77_1 (- slbot_77_1))) (ite (>= sltop_74_1 0.) sltop_74_1 (- sltop_74_1))) (ite (>= slbot_9_1 0.) slbot_9_1 (- slbot_9_1))) (ite (>= slbot_74_1 0.) slbot_74_1 (- slbot_74_1))) (ite (>= sltop_80_1 0.) sltop_80_1 (- sltop_80_1))) (ite (>= sltop_79_1 0.) sltop_79_1 (- sltop_79_1))) (ite (>= slbot_120_1 0.) slbot_120_1 (- slbot_120_1))) (ite (>= sltop_7_1 0.) sltop_7_1 (- sltop_7_1))) (ite (>= slbot_47_1 0.) slbot_47_1 (- slbot_47_1))) (ite (>= sltop_9_1 0.) sltop_9_1 (- sltop_9_1))) (ite (>= sltop_26_1 0.) sltop_26_1 (- sltop_26_1))) (ite (>= sltop_35_1 0.) sltop_35_1 (- sltop_35_1))) (ite (>= sltop_83_1 0.) sltop_83_1 (- sltop_83_1))) (ite (>= sltop_32_1 0.) sltop_32_1 (- sltop_32_1))) (ite (>= slbot_72_1 0.) slbot_72_1 (- slbot_72_1))) (ite (>= sltop_81_1 0.) sltop_81_1 (- sltop_81_1))) (ite (>= slbot_125_1 0.) slbot_125_1 (- slbot_125_1))) (ite (>= sltop_47_1 0.) sltop_47_1 (- sltop_47_1))) (ite (>= slbot_73_1 0.) slbot_73_1 (- slbot_73_1))) (ite (>= slbot_20_1 0.) slbot_20_1 (- slbot_20_1))) (ite (>= slbot_75_1 0.) slbot_75_1 (- slbot_75_1))) (ite (>= slbot_40_1 0.) slbot_40_1 (- slbot_40_1))) (ite (>= slbot_17_1 0.) slbot_17_1 (- slbot_17_1))) (ite (>= slbot_45_1 0.) slbot_45_1 (- slbot_45_1))) (ite (>= sltop_77_1 0.) sltop_77_1 (- sltop_77_1))) (ite (>= slbot_123_1 0.) slbot_123_1 (- slbot_123_1))) (ite (>= slbot_32_1 0.) slbot_32_1 (- slbot_32_1))) (ite (>= sltop_120_1 0.) sltop_120_1 (- sltop_120_1))) (ite (>= sltop_78_1 0.) sltop_78_1 (- sltop_78_1))) (ite (>= slbot_80_1 0.) slbot_80_1 (- slbot_80_1))) (ite (>= sltop_12_1 0.) sltop_12_1 (- sltop_12_1))) (ite (>= slbot_42_1 0.) slbot_42_1 (- slbot_42_1))) (ite (>= sltop_30_1 0.) sltop_30_1 (- sltop_30_1))) (ite (>= slbot_79_1 0.) slbot_79_1 (- slbot_79_1))) (ite (>= sltop_2_1 0.) sltop_2_1 (- sltop_2_1))) (ite (>= sltop_22_1 0.) sltop_22_1 (- sltop_22_1))) (ite (>= sltop_4_1 0.) sltop_4_1 (- sltop_4_1))) (ite (>= sltop_14_1 0.) sltop_14_1 (- sltop_14_1))) (ite (>= sltop_76_1 0.) sltop_76_1 (- sltop_76_1))) (ite (>= sltop_27_1 0.) sltop_27_1 (- sltop_27_1))) (ite (>= sltop_20_1 0.) sltop_20_1 (- sltop_20_1))) (ite (>= sltop_1_1 0.) sltop_1_1 (- sltop_1_1))) (ite (>= slbot_12_1 0.) slbot_12_1 (- slbot_12_1))) (ite (>= slbot_26_1 0.) slbot_26_1 (- slbot_26_1))) (ite (>= sltop_72_1 0.) sltop_72_1 (- sltop_72_1))) (ite (>= slbot_30_1 0.) slbot_30_1 (- slbot_30_1))) (ite (>= sltop_42_1 0.) sltop_42_1 (- sltop_42_1))) (ite (>= slbot_83_1 0.) slbot_83_1 (- slbot_83_1))) (ite (>= sltop_82_1 0.) sltop_82_1 (- sltop_82_1))) (ite (>= slbot_82_1 0.) slbot_82_1 (- slbot_82_1))) (ite (>= sltop_73_1 0.) sltop_73_1 (- sltop_73_1))) (ite (>= slbot_81_1 0.) slbot_81_1 (- slbot_81_1)))))
(check-sat)
