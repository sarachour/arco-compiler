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
(declare-fun slbot_1_1 () Real)
(assert (<= slbot_1_1 1e-08))
(declare-fun sltop_1_1 () Real)
(assert (>= sltop_1_1 1e-08))
; 
; =  {(((sc.switch[9].SUB*0.)+of.switch[9].SUB)+sl.min.switch[9].SUB.1)} {0.}
(assert (= (+ (+ (* sc_1 0.) of_1) slbot_1_1) 0.))
; 
; =  {(((sc.switch[9].SUB*15.6)+of.switch[9].SUB)+sl.max.switch[9].SUB.1)} {10.}
(assert (= (+ (+ (* sc_1 15.6) of_1) sltop_1_1) 10.))
; 
; >=  {((sc.switch[9].n*500.)+of.switch[9].n)} {3300.}
(assert (<= (+ (* sc_0 500.) of_0) 3300.))
; 
; <=  {((sc.switch[9].n*500.)+of.switch[9].n)} {500.}
(assert (>= (+ (* sc_0 500.) of_0) 500.))
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
; =  {(((sc.switch[9].PROD*0.802409638554)+of.switch[9].PROD)+sl.min.switch[9].PROD.1)} {0.}
(assert (= (+ (+ (* sc_4 0.802409638554) of_4) slbot_4_1) 0.))
; 
; =  {(((sc.switch[9].PROD*13.32)+of.switch[9].PROD)+sl.max.switch[9].PROD.1)} {10.}
(assert (= (+ (+ (* sc_4 13.32) of_4) sltop_4_1) 10.))
; 
; >=  {((sc.switch[9].Vmax*13.32)+of.switch[9].Vmax)} {10.}
(assert (<= (+ (* sc_3 13.32) of_3) 10.))
; 
; <=  {((sc.switch[9].Vmax*13.32)+of.switch[9].Vmax)} {0.}
(assert (>= (+ (* sc_3 13.32) of_3) 0.))
(declare-fun slbot_4_1 () Real)
(assert (<= slbot_4_1 1e-08))
(declare-fun sltop_4_1 () Real)
(assert (>= sltop_4_1 1e-08))
; 
; =  {(((sc.switch[9].PROD*0.802409638554)+of.switch[9].PROD)+sl.min.switch[9].PROD.1)} {0.}
(assert (= (+ (+ (* sc_4 0.802409638554) of_4) slbot_4_1) 0.))
; 
; =  {(((sc.switch[9].PROD*13.32)+of.switch[9].PROD)+sl.max.switch[9].PROD.1)} {10.}
(assert (= (+ (+ (* sc_4 13.32) of_4) sltop_4_1) 10.))
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
(assert (= of_5 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_6 0.))
; no offset
(assert (= of_7 0.))
; 
; =  {(sc.switch[3].SUB/sc.switch[3].Kmod)} {1.}
(assert (= (/ sc_6 sc_7) 1.))
; no scale
(assert (= (/ sc_6 sc_7) 1.))
; no scale
(assert (= (/ sc_5 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_8 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[3].PROD} {(sc.switch[3].Vmax/1.)}
(assert (= sc_9 (/ sc_8 1.)))
; 
; =  {of.switch[3].PROD} {0.}
(assert (= of_9 0.))
; 
; >=  {((sc.switch[3].n*500.)+of.switch[3].n)} {3300.}
(assert (<= (+ (* sc_5 500.) of_5) 3300.))
; 
; <=  {((sc.switch[3].n*500.)+of.switch[3].n)} {500.}
(assert (>= (+ (* sc_5 500.) of_5) 500.))
(declare-fun slbot_6_1 () Real)
(assert (<= slbot_6_1 1e-08))
(declare-fun sltop_6_1 () Real)
(assert (>= sltop_6_1 1e-08))
; 
; =  {(((sc.switch[3].SUB*0.)+of.switch[3].SUB)+sl.min.switch[3].SUB.1)} {0.}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6_1) 0.))
; 
; =  {(((sc.switch[3].SUB*13.32)+of.switch[3].SUB)+sl.max.switch[3].SUB.1)} {10.}
(assert (= (+ (+ (* sc_6 13.32) of_6) sltop_6_1) 10.))
; 
; >=  {((sc.switch[3].Kmod*1.)+of.switch[3].Kmod)} {10.}
(assert (<= (+ (* sc_7 1.) of_7) 10.))
; 
; <=  {((sc.switch[3].Kmod*1.)+of.switch[3].Kmod)} {0.0001}
(assert (>= (+ (* sc_7 1.) of_7) 0.0001))
(declare-fun slbot_9_1 () Real)
(assert (<= slbot_9_1 1e-08))
(declare-fun sltop_9_1 () Real)
(assert (>= sltop_9_1 1e-08))
; 
; =  {(((sc.switch[3].PROD*1.08938547486)+of.switch[3].PROD)+sl.min.switch[3].PROD.1)} {0.}
(assert (= (+ (+ (* sc_9 1.08938547486) of_9) slbot_9_1) 0.))
; 
; =  {(((sc.switch[3].PROD*15.6)+of.switch[3].PROD)+sl.max.switch[3].PROD.1)} {10.}
(assert (= (+ (+ (* sc_9 15.6) of_9) sltop_9_1) 10.))
; 
; >=  {((sc.switch[3].Vmax*15.6)+of.switch[3].Vmax)} {10.}
(assert (<= (+ (* sc_8 15.6) of_8) 10.))
; 
; <=  {((sc.switch[3].Vmax*15.6)+of.switch[3].Vmax)} {0.}
(assert (>= (+ (* sc_8 15.6) of_8) 0.))
(declare-fun slbot_9_1 () Real)
(assert (<= slbot_9_1 1e-08))
(declare-fun sltop_9_1 () Real)
(assert (>= sltop_9_1 1e-08))
; 
; =  {(((sc.switch[3].PROD*1.08938547486)+of.switch[3].PROD)+sl.min.switch[3].PROD.1)} {0.}
(assert (= (+ (+ (* sc_9 1.08938547486) of_9) slbot_9_1) 0.))
; 
; =  {(((sc.switch[3].PROD*15.6)+of.switch[3].PROD)+sl.max.switch[3].PROD.1)} {10.}
(assert (= (+ (+ (* sc_9 15.6) of_9) sltop_9_1) 10.))
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
; =  {sc.vdadd[0].A} {(1.*sc.vdadd[0].B)}
(assert (= sc_12 (* 1. sc_13)))
; 
; =  {sc.vdadd[0].A} {(1.*sc.vdadd[0].D*sc.vdadd[0].OUT)}
(assert (= sc_12 (* (* 1. sc_10) sc_14)))
; 
; =  {sc.vdadd[0].OUT} {sc.vdadd[0].A}
(assert (= sc_14 sc_12))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= (- (+ of_12 0.) 0.) 0.))
; 
; =  {sc.vdadd[0].OUT_0} {sc.vdadd[0].A}
(assert (= sc_11 sc_12))
; 
; =  {of.vdadd[0].OUT_0} {((of.vdadd[0].A+0.)-0.)}
(assert (= of_11 (- (+ of_12 0.) 0.)))
; 
; >=  {((sc.vdadd[0].D*1.)+of.vdadd[0].D)} {10.}
(assert (<= (+ (* sc_10 1.) of_10) 10.))
; 
; <=  {((sc.vdadd[0].D*1.)+of.vdadd[0].D)} {0.}
(assert (>= (+ (* sc_10 1.) of_10) 0.))
(declare-fun slbot_14_1 () Real)
(assert (<= slbot_14_1 1e-08))
(declare-fun sltop_14_1 () Real)
(assert (>= sltop_14_1 1e-08))
; 
; =  {(((sc.vdadd[0].OUT*0.)+of.vdadd[0].OUT)+sl.min.vdadd[0].OUT.1)} {0.}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14_1) 0.))
; 
; =  {(((sc.vdadd[0].OUT*13.32)+of.vdadd[0].OUT)+sl.max.vdadd[0].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_14 13.32) of_14) sltop_14_1) 12000.))
; 
; >=  {((sc.vdadd[0].OUT_0*0.)+of.vdadd[0].OUT_0)} {3300.}
(assert (<= (+ (* sc_11 0.) of_11) 3300.))
; 
; <=  {((sc.vdadd[0].OUT_0*0.)+of.vdadd[0].OUT_0)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
(declare-fun slbot_12_1 () Real)
(assert (<= slbot_12_1 1e-08))
(declare-fun sltop_12_1 () Real)
(assert (>= sltop_12_1 1e-08))
; 
; =  {(((sc.vdadd[0].A*0.802409638554)+of.vdadd[0].A)+sl.min.vdadd[0].A.1)} {0.}
(assert (= (+ (+ (* sc_12 0.802409638554) of_12) slbot_12_1) 0.))
; 
; =  {(((sc.vdadd[0].A*13.32)+of.vdadd[0].A)+sl.max.vdadd[0].A.1)} {3300.}
(assert (= (+ (+ (* sc_12 13.32) of_12) sltop_12_1) 3300.))
; 
; >=  {((sc.vdadd[0].B*0.)+of.vdadd[0].B)} {3300.}
(assert (<= (+ (* sc_13 0.) of_13) 3300.))
; 
; <=  {((sc.vdadd[0].B*0.)+of.vdadd[0].B)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
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
; =  {sc.vdadd[1].A} {(1.*sc.vdadd[1].B)}
(assert (= sc_17 (* 1. sc_18)))
; 
; =  {sc.vdadd[1].A} {(1.*sc.vdadd[1].D*sc.vdadd[1].OUT)}
(assert (= sc_17 (* (* 1. sc_15) sc_19)))
; 
; =  {sc.vdadd[1].OUT} {sc.vdadd[1].A}
(assert (= sc_19 sc_17))
; no offset
(assert (= of_19 0.))
; no offset
(assert (= (- (+ of_17 0.) 0.) 0.))
; 
; =  {sc.vdadd[1].OUT_0} {sc.vdadd[1].A}
(assert (= sc_16 sc_17))
; 
; =  {of.vdadd[1].OUT_0} {((of.vdadd[1].A+0.)-0.)}
(assert (= of_16 (- (+ of_17 0.) 0.)))
; 
; >=  {((sc.vdadd[1].D*1.)+of.vdadd[1].D)} {10.}
(assert (<= (+ (* sc_15 1.) of_15) 10.))
; 
; <=  {((sc.vdadd[1].D*1.)+of.vdadd[1].D)} {0.}
(assert (>= (+ (* sc_15 1.) of_15) 0.))
(declare-fun slbot_19_1 () Real)
(assert (<= slbot_19_1 1e-08))
(declare-fun sltop_19_1 () Real)
(assert (>= sltop_19_1 1e-08))
; 
; =  {(((sc.vdadd[1].OUT*0.)+of.vdadd[1].OUT)+sl.min.vdadd[1].OUT.1)} {0.}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19_1) 0.))
; 
; =  {(((sc.vdadd[1].OUT*15.6)+of.vdadd[1].OUT)+sl.max.vdadd[1].OUT.1)} {12000.}
(assert (= (+ (+ (* sc_19 15.6) of_19) sltop_19_1) 12000.))
; 
; >=  {((sc.vdadd[1].OUT_0*0.)+of.vdadd[1].OUT_0)} {3300.}
(assert (<= (+ (* sc_16 0.) of_16) 3300.))
; 
; <=  {((sc.vdadd[1].OUT_0*0.)+of.vdadd[1].OUT_0)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
; 
; >=  {((sc.vdadd[1].A*0.)+of.vdadd[1].A)} {3300.}
(assert (<= (+ (* sc_17 0.) of_17) 3300.))
; 
; <=  {((sc.vdadd[1].A*0.)+of.vdadd[1].A)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
(declare-fun slbot_18_1 () Real)
(assert (<= slbot_18_1 1e-08))
(declare-fun sltop_18_1 () Real)
(assert (>= sltop_18_1 1e-08))
; 
; =  {(((sc.vdadd[1].B*1.08938547486)+of.vdadd[1].B)+sl.min.vdadd[1].B.1)} {0.}
(assert (= (+ (+ (* sc_18 1.08938547486) of_18) slbot_18_1) 0.))
; 
; =  {(((sc.vdadd[1].B*15.6)+of.vdadd[1].B)+sl.max.vdadd[1].B.1)} {3300.}
(assert (= (+ (+ (* sc_18 15.6) of_18) sltop_18_1) 3300.))
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
; no offset
(assert (= of_21 0.))
; no offset
(assert (= of_20 0.))
; 
; =  {(sc.ihill_rep2[7].S^1)} {1.}
(assert (= (^ sc_21 1) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill_rep2[7].REP2} {(sc.ihill_rep2[7].Vmax*(1./(sc.ihill_rep2[7].S^1)))}
(assert (= sc_23 (* sc_22 (/ 1. (^ sc_21 1)))))
; 
; =  {of.ihill_rep2[7].REP2} {0.}
(assert (= of_23 0.))
; 
; >=  {((sc.ihill_rep2[7].n*1.)+of.ihill_rep2[7].n)} {5.}
(assert (<= (+ (* sc_20 1.) of_20) 5.))
; 
; <=  {((sc.ihill_rep2[7].n*1.)+of.ihill_rep2[7].n)} {1.}
(assert (>= (+ (* sc_20 1.) of_20) 1.))
(declare-fun slbot_21_1 () Real)
(assert (<= slbot_21_1 1e-08))
(declare-fun sltop_21_1 () Real)
(assert (>= sltop_21_1 1e-08))
; 
; =  {(((sc.ihill_rep2[7].S*0.)+of.ihill_rep2[7].S)+sl.min.ihill_rep2[7].S.1)} {0.}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21_1) 0.))
; 
; =  {(((sc.ihill_rep2[7].S*2.02579512459)+of.ihill_rep2[7].S)+sl.max.ihill_rep2[7].S.1)} {10.}
(assert (= (+ (+ (* sc_21 2.02579512459) of_21) sltop_21_1) 10.))
(declare-fun slbot_23_1 () Real)
(assert (<= slbot_23_1 1e-08))
(declare-fun sltop_23_1 () Real)
(assert (>= sltop_23_1 1e-08))
; 
; =  {(((sc.ihill_rep2[7].REP2*0.)+of.ihill_rep2[7].REP2)+sl.min.ihill_rep2[7].REP2.1)} {0.}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23_1) 0.))
; 
; =  {(((sc.ihill_rep2[7].REP2*15.6)+of.ihill_rep2[7].REP2)+sl.max.ihill_rep2[7].REP2.1)} {10.}
(assert (= (+ (+ (* sc_23 15.6) of_23) sltop_23_1) 10.))
(declare-fun slbot_22_1 () Real)
(assert (<= slbot_22_1 1e-08))
(declare-fun sltop_22_1 () Real)
(assert (>= sltop_22_1 1e-08))
; 
; =  {(((sc.ihill_rep2[7].Vmax*0.)+of.ihill_rep2[7].Vmax)+sl.min.ihill_rep2[7].Vmax.1)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22_1) 0.))
; 
; =  {(((sc.ihill_rep2[7].Vmax*15.6)+of.ihill_rep2[7].Vmax)+sl.max.ihill_rep2[7].Vmax.1)} {10.}
(assert (= (+ (+ (* sc_22 15.6) of_22) sltop_22_1) 10.))
(declare-fun slbot_23_1 () Real)
(assert (<= slbot_23_1 1e-08))
(declare-fun sltop_23_1 () Real)
(assert (>= sltop_23_1 1e-08))
; 
; =  {(((sc.ihill_rep2[7].REP2*0.)+of.ihill_rep2[7].REP2)+sl.min.ihill_rep2[7].REP2.1)} {0.}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23_1) 0.))
; 
; =  {(((sc.ihill_rep2[7].REP2*15.6)+of.ihill_rep2[7].REP2)+sl.max.ihill_rep2[7].REP2.1)} {10.}
(assert (= (+ (+ (* sc_23 15.6) of_23) sltop_23_1) 10.))
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_25 sc_24))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_25 of_24))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_24 0.) of_24) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_25 0.) of_25) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_27 sc_26))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_27 of_26))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_26 0.) of_26) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_29 sc_28))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_29 of_28))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_29 0.) of_29) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_31 sc_30))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_31 of_30))
; 
; >=  {((sc.input.I[13].X*1.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_30 1.) of_30) 10.))
; 
; <=  {((sc.input.I[13].X*1.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_30 1.) of_30) 0.))
; 
; >=  {((sc.input.I[13].O*1.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_31 1.) of_31) 10.))
; 
; <=  {((sc.input.I[13].O*1.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_31 1.) of_31) 0.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_33 sc_32))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_33 of_32))
; 
; >=  {((sc.input.I[12].X*1.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_32 1.) of_32) 10.))
; 
; <=  {((sc.input.I[12].X*1.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_32 1.) of_32) 0.))
; 
; >=  {((sc.input.I[12].O*1.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_33 1.) of_33) 10.))
; 
; <=  {((sc.input.I[12].O*1.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_33 1.) of_33) 0.))
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
; >=  {((sc.input.I[0].X*1.)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_36 1.) of_36) 10.))
; 
; <=  {((sc.input.I[0].X*1.)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_36 1.) of_36) 0.))
; 
; >=  {((sc.input.I[0].O*1.)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_37 1.) of_37) 10.))
; 
; <=  {((sc.input.I[0].O*1.)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_37 1.) of_37) 0.))
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
; >=  {((sc.input.I[11].X*1.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_38 1.) of_38) 10.))
; 
; <=  {((sc.input.I[11].X*1.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_38 1.) of_38) 0.))
; 
; >=  {((sc.input.I[11].O*1.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_39 1.) of_39) 10.))
; 
; <=  {((sc.input.I[11].O*1.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_39 1.) of_39) 0.))
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
; >=  {((sc.input.I[10].X*1.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_40 1.) of_40) 10.))
; 
; <=  {((sc.input.I[10].X*1.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_40 1.) of_40) 0.))
; 
; >=  {((sc.input.I[10].O*1.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_41 1.) of_41) 10.))
; 
; <=  {((sc.input.I[10].O*1.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_41 1.) of_41) 0.))
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
; >=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_42 1.) of_42) 10.))
; 
; <=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_42 1.) of_42) 0.))
; 
; >=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_43 1.) of_43) 10.))
; 
; <=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_43 1.) of_43) 0.))
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
; >=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_46 1.) of_46) 10.))
; 
; <=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_46 1.) of_46) 0.))
; 
; >=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_47 1.) of_47) 10.))
; 
; <=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_47 1.) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_48 0.) of_48) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_49 0.) of_49) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_50 0.) of_50) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_51 0.) of_51) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_52 0.) of_52) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_53 0.) of_53) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.I[1].X*1.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_54 1.) of_54) 10.))
; 
; <=  {((sc.input.I[1].X*1.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_54 1.) of_54) 0.))
; 
; >=  {((sc.input.I[1].O*1.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_55 1.) of_55) 10.))
; 
; <=  {((sc.input.I[1].O*1.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_55 1.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_57 sc_56))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_57 of_56))
(declare-fun slbot_56_1 () Real)
(assert (<= slbot_56_1 1e-08))
(declare-fun sltop_56_1 () Real)
(assert (>= sltop_56_1 1e-08))
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X.1)} {0.}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56_1) 0.))
; 
; =  {(((sc.output.V[0].X*13.32)+of.output.V[0].X)+sl.max.output.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_56 13.32) of_56) sltop_56_1) 3300.))
(declare-fun slbot_57_1 () Real)
(assert (<= slbot_57_1 1e-08))
(declare-fun sltop_57_1 () Real)
(assert (>= sltop_57_1 1e-08))
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O.1)} {0.}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57_1) 0.))
; 
; =  {(((sc.output.V[0].O*13.32)+of.output.V[0].O)+sl.max.output.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_57 13.32) of_57) sltop_57_1) 3300.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_59 sc_58))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_59 of_58))
(declare-fun slbot_58_1 () Real)
(assert (<= slbot_58_1 1e-08))
(declare-fun sltop_58_1 () Real)
(assert (>= sltop_58_1 1e-08))
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X.1)} {0.}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58_1) 0.))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X.1)} {3300.}
(assert (= (+ (+ (* sc_58 15.6) of_58) sltop_58_1) 3300.))
(declare-fun slbot_59_1 () Real)
(assert (<= slbot_59_1 1e-08))
(declare-fun sltop_59_1 () Real)
(assert (>= sltop_59_1 1e-08))
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O.1)} {0.}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59_1) 0.))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O.1)} {3300.}
(assert (= (+ (+ (* sc_59 15.6) of_59) sltop_59_1) 3300.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_61 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_60 0.))
; 
; =  {sc.vtoi[2].Y} {((1./sc.vtoi[2].K)*sc.vtoi[2].X)}
(assert (= sc_62 (* (/ 1. sc_61) sc_60)))
; 
; =  {of.vtoi[2].Y} {0.}
(assert (= of_62 0.))
; 
; >=  {((sc.vtoi[2].X*1.)+of.vtoi[2].X)} {3300.}
(assert (<= (+ (* sc_60 1.) of_60) 3300.))
; 
; <=  {((sc.vtoi[2].X*1.)+of.vtoi[2].X)} {0.}
(assert (>= (+ (* sc_60 1.) of_60) 0.))
; 
; >=  {((sc.vtoi[2].Y*15.6)+of.vtoi[2].Y)} {10.}
(assert (<= (+ (* sc_62 15.6) of_62) 10.))
; 
; <=  {((sc.vtoi[2].Y*15.6)+of.vtoi[2].Y)} {0.}
(assert (>= (+ (* sc_62 15.6) of_62) 0.))
; 
; >=  {((sc.vtoi[2].K*0.0641025641026)+of.vtoi[2].K)} {3300.}
(assert (<= (+ (* sc_61 0.0641025641026) of_61) 3300.))
; 
; <=  {((sc.vtoi[2].K*0.0641025641026)+of.vtoi[2].K)} {330.}
(assert (>= (+ (* sc_61 0.0641025641026) of_61) 330.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_64 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_63 0.))
; 
; =  {sc.vtoi[13].Y} {((1./sc.vtoi[13].K)*sc.vtoi[13].X)}
(assert (= sc_65 (* (/ 1. sc_64) sc_63)))
; 
; =  {of.vtoi[13].Y} {0.}
(assert (= of_65 0.))
(declare-fun slbot_63_1 () Real)
(assert (<= slbot_63_1 1e-08))
(declare-fun sltop_63_1 () Real)
(assert (>= sltop_63_1 1e-08))
; 
; =  {(((sc.vtoi[13].X*0.)+of.vtoi[13].X)+sl.min.vtoi[13].X.1)} {0.}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63_1) 0.))
; 
; =  {(((sc.vtoi[13].X*15.6)+of.vtoi[13].X)+sl.max.vtoi[13].X.1)} {3300.}
(assert (= (+ (+ (* sc_63 15.6) of_63) sltop_63_1) 3300.))
; 
; >=  {((sc.vtoi[13].K*1.)+of.vtoi[13].K)} {3300.}
(assert (<= (+ (* sc_64 1.) of_64) 3300.))
; 
; <=  {((sc.vtoi[13].K*1.)+of.vtoi[13].K)} {330.}
(assert (>= (+ (* sc_64 1.) of_64) 330.))
(declare-fun slbot_65_1 () Real)
(assert (<= slbot_65_1 1e-08))
(declare-fun sltop_65_1 () Real)
(assert (>= sltop_65_1 1e-08))
; 
; =  {(((sc.vtoi[13].Y*0.)+of.vtoi[13].Y)+sl.min.vtoi[13].Y.1)} {0.}
(assert (= (+ (+ (* sc_65 0.) of_65) slbot_65_1) 0.))
; 
; =  {(((sc.vtoi[13].Y*15.6)+of.vtoi[13].Y)+sl.max.vtoi[13].Y.1)} {10.}
(assert (= (+ (+ (* sc_65 15.6) of_65) sltop_65_1) 10.))
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
(assert (= 0. 0.))
; no offset
(assert (= of_67 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_66 0.))
; 
; =  {sc.vtoi[12].Y} {((1./sc.vtoi[12].K)*sc.vtoi[12].X)}
(assert (= sc_68 (* (/ 1. sc_67) sc_66)))
; 
; =  {of.vtoi[12].Y} {0.}
(assert (= of_68 0.))
(declare-fun slbot_66_1 () Real)
(assert (<= slbot_66_1 1e-08))
(declare-fun sltop_66_1 () Real)
(assert (>= sltop_66_1 1e-08))
; 
; =  {(((sc.vtoi[12].X*0.)+of.vtoi[12].X)+sl.min.vtoi[12].X.1)} {0.}
(assert (= (+ (+ (* sc_66 0.) of_66) slbot_66_1) 0.))
; 
; =  {(((sc.vtoi[12].X*13.32)+of.vtoi[12].X)+sl.max.vtoi[12].X.1)} {3300.}
(assert (= (+ (+ (* sc_66 13.32) of_66) sltop_66_1) 3300.))
; 
; >=  {((sc.vtoi[12].K*1.)+of.vtoi[12].K)} {3300.}
(assert (<= (+ (* sc_67 1.) of_67) 3300.))
; 
; <=  {((sc.vtoi[12].K*1.)+of.vtoi[12].K)} {330.}
(assert (>= (+ (* sc_67 1.) of_67) 330.))
(declare-fun slbot_68_1 () Real)
(assert (<= slbot_68_1 1e-08))
(declare-fun sltop_68_1 () Real)
(assert (>= sltop_68_1 1e-08))
; 
; =  {(((sc.vtoi[12].Y*0.)+of.vtoi[12].Y)+sl.min.vtoi[12].Y.1)} {0.}
(assert (= (+ (+ (* sc_68 0.) of_68) slbot_68_1) 0.))
; 
; =  {(((sc.vtoi[12].Y*13.32)+of.vtoi[12].Y)+sl.max.vtoi[12].Y.1)} {10.}
(assert (= (+ (+ (* sc_68 13.32) of_68) sltop_68_1) 10.))
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_70 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; 
; =  {sc.vtoi[11].Y} {((1./sc.vtoi[11].K)*sc.vtoi[11].X)}
(assert (= sc_71 (* (/ 1. sc_70) sc_69)))
; 
; =  {of.vtoi[11].Y} {0.}
(assert (= of_71 0.))
; 
; >=  {((sc.vtoi[11].X*1.)+of.vtoi[11].X)} {3300.}
(assert (<= (+ (* sc_69 1.) of_69) 3300.))
; 
; <=  {((sc.vtoi[11].X*1.)+of.vtoi[11].X)} {0.}
(assert (>= (+ (* sc_69 1.) of_69) 0.))
; 
; >=  {((sc.vtoi[11].Y*13.32)+of.vtoi[11].Y)} {10.}
(assert (<= (+ (* sc_71 13.32) of_71) 10.))
; 
; <=  {((sc.vtoi[11].Y*13.32)+of.vtoi[11].Y)} {0.}
(assert (>= (+ (* sc_71 13.32) of_71) 0.))
; 
; >=  {((sc.vtoi[11].K*0.0750750750751)+of.vtoi[11].K)} {3300.}
(assert (<= (+ (* sc_70 0.0750750750751) of_70) 3300.))
; 
; <=  {((sc.vtoi[11].K*0.0750750750751)+of.vtoi[11].K)} {330.}
(assert (>= (+ (* sc_70 0.0750750750751) of_70) 330.))
; 
; >=  {((sc.vtoi[11].Y*13.32)+of.vtoi[11].Y)} {10.}
(assert (<= (+ (* sc_71 13.32) of_71) 10.))
; 
; <=  {((sc.vtoi[11].Y*13.32)+of.vtoi[11].Y)} {0.}
(assert (>= (+ (* sc_71 13.32) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_73 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_72 0.))
; 
; =  {sc.vtoi[6].Y} {((1./sc.vtoi[6].K)*sc.vtoi[6].X)}
(assert (= sc_74 (* (/ 1. sc_73) sc_72)))
; 
; =  {of.vtoi[6].Y} {0.}
(assert (= of_74 0.))
(declare-fun slbot_72_1 () Real)
(assert (<= slbot_72_1 1e-08))
(declare-fun sltop_72_1 () Real)
(assert (>= sltop_72_1 1e-08))
; 
; =  {(((sc.vtoi[6].X*0.)+of.vtoi[6].X)+sl.min.vtoi[6].X.1)} {0.}
(assert (= (+ (+ (* sc_72 0.) of_72) slbot_72_1) 0.))
; 
; =  {(((sc.vtoi[6].X*0.6)+of.vtoi[6].X)+sl.max.vtoi[6].X.1)} {3300.}
(assert (= (+ (+ (* sc_72 0.6) of_72) sltop_72_1) 3300.))
(declare-fun slbot_74_1 () Real)
(assert (<= slbot_74_1 1e-08))
(declare-fun sltop_74_1 () Real)
(assert (>= sltop_74_1 1e-08))
; 
; =  {(((sc.vtoi[6].Y*0.)+of.vtoi[6].Y)+sl.min.vtoi[6].Y.1)} {0.}
(assert (= (+ (+ (* sc_74 0.) of_74) slbot_74_1) 0.))
; 
; =  {(((sc.vtoi[6].Y*2.02579512459)+of.vtoi[6].Y)+sl.max.vtoi[6].Y.1)} {10.}
(assert (= (+ (+ (* sc_74 2.02579512459) of_74) sltop_74_1) 10.))
; 
; >=  {((sc.vtoi[6].K*0.29618)+of.vtoi[6].K)} {3300.}
(assert (<= (+ (* sc_73 0.29618) of_73) 3300.))
; 
; <=  {((sc.vtoi[6].K*0.29618)+of.vtoi[6].K)} {330.}
(assert (>= (+ (* sc_73 0.29618) of_73) 330.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.V[2].X*1.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_75 1.) of_75) 3300.))
; 
; <=  {((sc.input.V[2].X*1.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_75 1.) of_75) 0.))
; 
; >=  {((sc.input.V[2].O*1.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_76 1.) of_76) 3300.))
; 
; <=  {((sc.input.V[2].O*1.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_76 1.) of_76) 0.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_77 0.) of_77) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_78 0.) of_78) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_80 sc_79))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_80 of_79))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_80 0.) of_80) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_80 0.) of_80) 0.))
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_82 sc_81))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_82 of_81))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_81 1.) of_81) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_81 1.) of_81) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_82 1.) of_82) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_82 1.) of_82) 0.))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_84 sc_83))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_84 of_83))
; 
; >=  {((sc.input.V[12].X*0.0641025641026)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_83 0.0641025641026) of_83) 3300.))
; 
; <=  {((sc.input.V[12].X*0.0641025641026)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_83 0.0641025641026) of_83) 0.))
; 
; >=  {((sc.input.V[12].O*0.0641025641026)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_84 0.0641025641026) of_84) 3300.))
; 
; <=  {((sc.input.V[12].O*0.0641025641026)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_84 0.0641025641026) of_84) 0.))
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_86 sc_85))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_86 of_85))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_85 0.) of_85) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_85 0.) of_85) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_86 0.) of_86) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_86 0.) of_86) 0.))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_88 sc_87))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_88 of_87))
(declare-fun slbot_87_1 () Real)
(assert (<= slbot_87_1 1e-08))
(declare-fun sltop_87_1 () Real)
(assert (>= sltop_87_1 1e-08))
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X.1)} {0.}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87_1) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X.1)} {3300.}
(assert (= (+ (+ (* sc_87 0.6) of_87) sltop_87_1) 3300.))
(declare-fun slbot_88_1 () Real)
(assert (<= slbot_88_1 1e-08))
(declare-fun sltop_88_1 () Real)
(assert (>= sltop_88_1 1e-08))
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O.1)} {0.}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88_1) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O.1)} {3300.}
(assert (= (+ (+ (* sc_88 0.6) of_88) sltop_88_1) 3300.))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_90 sc_89))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_90 of_89))
; 
; >=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_89 1.) of_89) 3300.))
; 
; <=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_89 1.) of_89) 0.))
; 
; >=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_90 1.) of_90) 3300.))
; 
; <=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_90 1.) of_90) 0.))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_92 sc_91))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_92 of_91))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_91 0.) of_91) 3300.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_92 0.) of_92) 3300.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_92 0.) of_92) 0.))
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_94 sc_93))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_94 of_93))
; 
; >=  {((sc.input.V[6].X*500.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_93 500.) of_93) 3300.))
; 
; <=  {((sc.input.V[6].X*500.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_93 500.) of_93) 0.))
; 
; >=  {((sc.input.V[6].O*500.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_94 500.) of_94) 3300.))
; 
; <=  {((sc.input.V[6].O*500.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_94 500.) of_94) 0.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_96 sc_95))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_96 of_95))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_95 1.) of_95) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_95 1.) of_95) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_96 1.) of_96) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_96 1.) of_96) 0.))
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_98 sc_97))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_98 of_97))
; 
; >=  {((sc.input.V[3].X*1.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_97 1.) of_97) 3300.))
; 
; <=  {((sc.input.V[3].X*1.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_97 1.) of_97) 0.))
; 
; >=  {((sc.input.V[3].O*1.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_98 1.) of_98) 3300.))
; 
; <=  {((sc.input.V[3].O*1.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_98 1.) of_98) 0.))
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_100 sc_99))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_100 of_99))
; 
; >=  {((sc.input.V[4].X*0.0750750750751)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_99 0.0750750750751) of_99) 3300.))
; 
; <=  {((sc.input.V[4].X*0.0750750750751)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_99 0.0750750750751) of_99) 0.))
; 
; >=  {((sc.input.V[4].O*0.0750750750751)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_100 0.0750750750751) of_100) 3300.))
; 
; <=  {((sc.input.V[4].O*0.0750750750751)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_100 0.0750750750751) of_100) 0.))
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_102 sc_101))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_102 of_101))
; 
; >=  {((sc.input.V[5].X*500.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_101 500.) of_101) 3300.))
; 
; <=  {((sc.input.V[5].X*500.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_101 500.) of_101) 0.))
; 
; >=  {((sc.input.V[5].O*500.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_102 500.) of_102) 3300.))
; 
; <=  {((sc.input.V[5].O*500.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_102 500.) of_102) 0.))
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_104 sc_103))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_104 of_103))
; 
; >=  {((sc.input.V[1].X*0.29618)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_103 0.29618) of_103) 3300.))
; 
; <=  {((sc.input.V[1].X*0.29618)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_103 0.29618) of_103) 0.))
; 
; >=  {((sc.input.V[1].O*0.29618)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_104 0.29618) of_104) 3300.))
; 
; <=  {((sc.input.V[1].O*0.29618)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_104 0.29618) of_104) 0.))
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
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
; 
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_107 sc_108))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_107 sc_106) (= sc_107 sc_105)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_109 sc_107))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_109 (- (+ of_107 of_108) (+ of_106 of_105))))
; 
; >=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {5.}
(assert (<= (+ (* sc_105 0.) of_105) 5.))
; 
; <=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {0.}
(assert (>= (+ (* sc_105 0.) of_105) 0.))
(declare-fun slbot_106_1 () Real)
(assert (<= slbot_106_1 1e-08))
(declare-fun sltop_106_1 () Real)
(assert (>= sltop_106_1 1e-08))
; 
; =  {(((sc.iadd[8].C*0.)+of.iadd[8].C)+sl.min.iadd[8].C.1)} {0.}
(assert (= (+ (+ (* sc_106 0.) of_106) slbot_106_1) 0.))
; 
; =  {(((sc.iadd[8].C*15.6)+of.iadd[8].C)+sl.max.iadd[8].C.1)} {5.}
(assert (= (+ (+ (* sc_106 15.6) of_106) sltop_106_1) 5.))
(declare-fun slbot_109_1 () Real)
(assert (<= slbot_109_1 1e-08))
(declare-fun sltop_109_1 () Real)
(assert (>= sltop_109_1 1e-08))
; 
; =  {(((sc.iadd[8].OUT*-15.6)+of.iadd[8].OUT)+sl.min.iadd[8].OUT.1)} {-10.}
(assert (= (+ (+ (* sc_109 -15.6) of_109) slbot_109_1) -10.))
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.max.iadd[8].OUT.1)} {10.}
(assert (= (+ (+ (* sc_109 0.) of_109) sltop_109_1) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_107 0.) of_107) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_107 0.) of_107) 0.))
; 
; >=  {((sc.iadd[8].B*0.)+of.iadd[8].B)} {5.}
(assert (<= (+ (* sc_108 0.) of_108) 5.))
; 
; <=  {((sc.iadd[8].B*0.)+of.iadd[8].B)} {0.}
(assert (>= (+ (* sc_108 0.) of_108) 0.))
(declare-fun slbot_109_1 () Real)
(assert (<= slbot_109_1 1e-08))
(declare-fun sltop_109_1 () Real)
(assert (>= sltop_109_1 1e-08))
; 
; =  {(((sc.iadd[8].OUT*-15.6)+of.iadd[8].OUT)+sl.min.iadd[8].OUT.1)} {-10.}
(assert (= (+ (+ (* sc_109 -15.6) of_109) slbot_109_1) -10.))
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.max.iadd[8].OUT.1)} {10.}
(assert (= (+ (+ (* sc_109 0.) of_109) sltop_109_1) 10.))
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
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
; 
; =  {sc.iadd[10].A} {sc.iadd[10].B}
(assert (= sc_112 sc_113))
; 
; =  {sc.iadd[10].A} {sc.iadd[10].C} {sc.iadd[10].D}
(assert (and (= sc_112 sc_111) (= sc_112 sc_110)))
; 
; =  {sc.iadd[10].OUT} {sc.iadd[10].A}
(assert (= sc_114 sc_112))
; 
; =  {of.iadd[10].OUT} {((of.iadd[10].A+of.iadd[10].B)-of.iadd[10].C-of.iadd[10].D)}
(assert (= of_114 (- (+ of_112 of_113) (+ of_111 of_110))))
(declare-fun slbot_110_1 () Real)
(assert (<= slbot_110_1 1e-08))
(declare-fun sltop_110_1 () Real)
(assert (>= sltop_110_1 1e-08))
; 
; =  {(((sc.iadd[10].D*-15.6)+of.iadd[10].D)+sl.min.iadd[10].D.1)} {0.}
(assert (= (+ (+ (* sc_110 -15.6) of_110) slbot_110_1) 0.))
; 
; =  {(((sc.iadd[10].D*0.)+of.iadd[10].D)+sl.max.iadd[10].D.1)} {5.}
(assert (= (+ (+ (* sc_110 0.) of_110) sltop_110_1) 5.))
; 
; >=  {((sc.iadd[10].C*1.)+of.iadd[10].C)} {5.}
(assert (<= (+ (* sc_111 1.) of_111) 5.))
; 
; <=  {((sc.iadd[10].C*1.)+of.iadd[10].C)} {0.}
(assert (>= (+ (* sc_111 1.) of_111) 0.))
(declare-fun slbot_114_1 () Real)
(assert (<= slbot_114_1 1e-08))
(declare-fun sltop_114_1 () Real)
(assert (>= sltop_114_1 1e-08))
; 
; =  {(((sc.iadd[10].OUT*0.)+of.iadd[10].OUT)+sl.min.iadd[10].OUT.1)} {-10.}
(assert (= (+ (+ (* sc_114 0.) of_114) slbot_114_1) -10.))
; 
; =  {(((sc.iadd[10].OUT*15.6)+of.iadd[10].OUT)+sl.max.iadd[10].OUT.1)} {10.}
(assert (= (+ (+ (* sc_114 15.6) of_114) sltop_114_1) 10.))
; 
; >=  {((sc.iadd[10].A*0.)+of.iadd[10].A)} {5.}
(assert (<= (+ (* sc_112 0.) of_112) 5.))
; 
; <=  {((sc.iadd[10].A*0.)+of.iadd[10].A)} {0.}
(assert (>= (+ (* sc_112 0.) of_112) 0.))
; 
; >=  {((sc.iadd[10].B*1.)+of.iadd[10].B)} {5.}
(assert (<= (+ (* sc_113 1.) of_113) 5.))
; 
; <=  {((sc.iadd[10].B*1.)+of.iadd[10].B)} {0.}
(assert (>= (+ (* sc_113 1.) of_113) 0.))
(declare-fun slbot_114_1 () Real)
(assert (<= slbot_114_1 1e-08))
(declare-fun sltop_114_1 () Real)
(assert (>= sltop_114_1 1e-08))
; 
; =  {(((sc.iadd[10].OUT*0.)+of.iadd[10].OUT)+sl.min.iadd[10].OUT.1)} {-10.}
(assert (= (+ (+ (* sc_114 0.) of_114) slbot_114_1) -10.))
; 
; =  {(((sc.iadd[10].OUT*15.6)+of.iadd[10].OUT)+sl.max.iadd[10].OUT.1)} {10.}
(assert (= (+ (+ (* sc_114 15.6) of_114) sltop_114_1) 10.))
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
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
; 
; =  {sc.iadd[4].A} {sc.iadd[4].B}
(assert (= sc_117 sc_118))
; 
; =  {sc.iadd[4].A} {sc.iadd[4].C} {sc.iadd[4].D}
(assert (and (= sc_117 sc_116) (= sc_117 sc_115)))
; 
; =  {sc.iadd[4].OUT} {sc.iadd[4].A}
(assert (= sc_119 sc_117))
; 
; =  {of.iadd[4].OUT} {((of.iadd[4].A+of.iadd[4].B)-of.iadd[4].C-of.iadd[4].D)}
(assert (= of_119 (- (+ of_117 of_118) (+ of_116 of_115))))
(declare-fun slbot_115_1 () Real)
(assert (<= slbot_115_1 1e-08))
(declare-fun sltop_115_1 () Real)
(assert (>= sltop_115_1 1e-08))
; 
; =  {(((sc.iadd[4].D*-13.32)+of.iadd[4].D)+sl.min.iadd[4].D.1)} {0.}
(assert (= (+ (+ (* sc_115 -13.32) of_115) slbot_115_1) 0.))
; 
; =  {(((sc.iadd[4].D*0.)+of.iadd[4].D)+sl.max.iadd[4].D.1)} {5.}
(assert (= (+ (+ (* sc_115 0.) of_115) sltop_115_1) 5.))
; 
; >=  {((sc.iadd[4].C*1.)+of.iadd[4].C)} {5.}
(assert (<= (+ (* sc_116 1.) of_116) 5.))
; 
; <=  {((sc.iadd[4].C*1.)+of.iadd[4].C)} {0.}
(assert (>= (+ (* sc_116 1.) of_116) 0.))
(declare-fun slbot_119_1 () Real)
(assert (<= slbot_119_1 1e-08))
(declare-fun sltop_119_1 () Real)
(assert (>= sltop_119_1 1e-08))
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT.1)} {-10.}
(assert (= (+ (+ (* sc_119 0.) of_119) slbot_119_1) -10.))
; 
; =  {(((sc.iadd[4].OUT*13.32)+of.iadd[4].OUT)+sl.max.iadd[4].OUT.1)} {10.}
(assert (= (+ (+ (* sc_119 13.32) of_119) sltop_119_1) 10.))
; 
; >=  {((sc.iadd[4].A*0.)+of.iadd[4].A)} {5.}
(assert (<= (+ (* sc_117 0.) of_117) 5.))
; 
; <=  {((sc.iadd[4].A*0.)+of.iadd[4].A)} {0.}
(assert (>= (+ (* sc_117 0.) of_117) 0.))
; 
; >=  {((sc.iadd[4].B*1.)+of.iadd[4].B)} {5.}
(assert (<= (+ (* sc_118 1.) of_118) 5.))
; 
; <=  {((sc.iadd[4].B*1.)+of.iadd[4].B)} {0.}
(assert (>= (+ (* sc_118 1.) of_118) 0.))
(declare-fun slbot_119_1 () Real)
(assert (<= slbot_119_1 1e-08))
(declare-fun sltop_119_1 () Real)
(assert (>= sltop_119_1 1e-08))
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT.1)} {-10.}
(assert (= (+ (+ (* sc_119 0.) of_119) slbot_119_1) -10.))
; 
; =  {(((sc.iadd[4].OUT*13.32)+of.iadd[4].OUT)+sl.max.iadd[4].OUT.1)} {10.}
(assert (= (+ (+ (* sc_119 13.32) of_119) sltop_119_1) 10.))
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
; 
; =  {sc.iadd[5].A} {sc.iadd[5].B}
(assert (= sc_122 sc_123))
; 
; =  {sc.iadd[5].A} {sc.iadd[5].C} {sc.iadd[5].D}
(assert (and (= sc_122 sc_121) (= sc_122 sc_120)))
; 
; =  {sc.iadd[5].OUT} {sc.iadd[5].A}
(assert (= sc_124 sc_122))
; 
; =  {of.iadd[5].OUT} {((of.iadd[5].A+of.iadd[5].B)-of.iadd[5].C-of.iadd[5].D)}
(assert (= of_124 (- (+ of_122 of_123) (+ of_121 of_120))))
(declare-fun slbot_120_1 () Real)
(assert (<= slbot_120_1 1e-08))
(declare-fun sltop_120_1 () Real)
(assert (>= sltop_120_1 1e-08))
; 
; =  {(((sc.iadd[5].D*0.)+of.iadd[5].D)+sl.min.iadd[5].D.1)} {0.}
(assert (= (+ (+ (* sc_120 0.) of_120) slbot_120_1) 0.))
; 
; =  {(((sc.iadd[5].D*13.32)+of.iadd[5].D)+sl.max.iadd[5].D.1)} {5.}
(assert (= (+ (+ (* sc_120 13.32) of_120) sltop_120_1) 5.))
; 
; >=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {5.}
(assert (<= (+ (* sc_121 0.) of_121) 5.))
; 
; <=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {0.}
(assert (>= (+ (* sc_121 0.) of_121) 0.))
(declare-fun slbot_124_1 () Real)
(assert (<= slbot_124_1 1e-08))
(declare-fun sltop_124_1 () Real)
(assert (>= sltop_124_1 1e-08))
; 
; =  {(((sc.iadd[5].OUT*-13.32)+of.iadd[5].OUT)+sl.min.iadd[5].OUT.1)} {-10.}
(assert (= (+ (+ (* sc_124 -13.32) of_124) slbot_124_1) -10.))
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.max.iadd[5].OUT.1)} {10.}
(assert (= (+ (+ (* sc_124 0.) of_124) sltop_124_1) 10.))
; 
; >=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {5.}
(assert (<= (+ (* sc_122 0.) of_122) 5.))
; 
; <=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {0.}
(assert (>= (+ (* sc_122 0.) of_122) 0.))
; 
; >=  {((sc.iadd[5].B*0.)+of.iadd[5].B)} {5.}
(assert (<= (+ (* sc_123 0.) of_123) 5.))
; 
; <=  {((sc.iadd[5].B*0.)+of.iadd[5].B)} {0.}
(assert (>= (+ (* sc_123 0.) of_123) 0.))
(declare-fun slbot_124_1 () Real)
(assert (<= slbot_124_1 1e-08))
(declare-fun sltop_124_1 () Real)
(assert (>= sltop_124_1 1e-08))
; 
; =  {(((sc.iadd[5].OUT*-13.32)+of.iadd[5].OUT)+sl.min.iadd[5].OUT.1)} {-10.}
(assert (= (+ (+ (* sc_124 -13.32) of_124) slbot_124_1) -10.))
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.max.iadd[5].OUT.1)} {10.}
(assert (= (+ (+ (* sc_124 0.) of_124) sltop_124_1) 10.))
; 
; =  {sc.input.I[6].O} {sc.iadd[8].A}
(assert (= sc_45 sc_107))
; 
; =  {of.input.I[6].O} {of.iadd[8].A}
(assert (= of_45 of_107))
; 
; =  {sc.vtoi[12].Y} {sc.iadd[5].D}
(assert (= sc_68 sc_120))
; 
; =  {of.vtoi[12].Y} {of.iadd[5].D}
(assert (= of_68 of_120))
; 
; =  {sc.input.I[0].O} {sc.iadd[4].B}
(assert (= sc_37 sc_118))
; 
; =  {of.input.I[0].O} {of.iadd[4].B}
(assert (= of_37 of_118))
; 
; =  {sc.vtoi[13].Y} {sc.ihill_rep2[7].Vmax}
(assert (= sc_65 sc_22))
; 
; =  {of.vtoi[13].Y} {of.ihill_rep2[7].Vmax}
(assert (= of_65 of_22))
; 
; =  {sc.input.V[9].O} {sc.vdadd[1].OUT_0}
(assert (= sc_86 sc_16))
; 
; =  {of.input.V[9].O} {of.vdadd[1].OUT_0}
(assert (= of_86 of_16))
; 
; =  {sc.ihill_rep2[7].REP2} {sc.iadd[8].C}
(assert (= sc_23 sc_106))
; 
; =  {of.ihill_rep2[7].REP2} {of.iadd[8].C}
(assert (= of_23 of_106))
; 
; =  {sc.input.I[9].O} {sc.iadd[8].B}
(assert (= sc_35 sc_108))
; 
; =  {of.input.I[9].O} {of.iadd[8].B}
(assert (= of_35 of_108))
; 
; =  {sc.iadd[4].OUT} {sc.switch[3].SUB}
(assert (= sc_119 sc_6))
; 
; =  {of.iadd[4].OUT} {of.switch[3].SUB}
(assert (= of_119 of_6))
; 
; =  {sc.input.V[13].O} {sc.vtoi[13].K}
(assert (= sc_82 sc_64))
; 
; =  {of.input.V[13].O} {of.vtoi[13].K}
(assert (= of_82 of_64))
; 
; =  {sc.input.I[3].O} {sc.iadd[5].A}
(assert (= sc_49 sc_122))
; 
; =  {of.input.I[3].O} {of.iadd[5].A}
(assert (= of_49 of_122))
; 
; =  {sc.input.I[4].O} {sc.iadd[5].B}
(assert (= sc_51 sc_123))
; 
; =  {of.input.I[4].O} {of.iadd[5].B}
(assert (= of_51 of_123))
; 
; =  {sc.input.I[5].O} {sc.iadd[5].C}
(assert (= sc_53 sc_121))
; 
; =  {of.input.I[5].O} {of.iadd[5].C}
(assert (= of_53 of_121))
; 
; =  {sc.vtoi[6].Y} {sc.ihill_rep2[7].S}
(assert (= sc_74 sc_21))
; 
; =  {of.vtoi[6].Y} {of.ihill_rep2[7].S}
(assert (= of_74 of_21))
; 
; =  {sc.input.V[14].O} {sc.vtoi[12].K}
(assert (= sc_96 sc_67))
; 
; =  {of.input.V[14].O} {of.vtoi[12].K}
(assert (= of_96 of_67))
; 
; =  {sc.vdadd[0].OUT} {sc.output.V[0].X}
(assert (= sc_14 sc_56))
; 
; =  {of.vdadd[0].OUT} {of.output.V[0].X}
(assert (= of_14 of_56))
; 
; =  {sc.vdadd[0].OUT} {sc.vtoi[12].X}
(assert (= sc_14 sc_66))
; 
; =  {of.vdadd[0].OUT} {of.vtoi[12].X}
(assert (= of_14 of_66))
; 
; =  {sc.input.I[14].O} {sc.iadd[10].C}
(assert (= sc_47 sc_111))
; 
; =  {of.input.I[14].O} {of.iadd[10].C}
(assert (= of_47 of_111))
; 
; =  {sc.input.V[11].O} {sc.ihill_rep2[7].n}
(assert (= sc_90 sc_20))
; 
; =  {of.input.V[11].O} {of.ihill_rep2[7].n}
(assert (= of_90 of_20))
; 
; =  {sc.input.I[2].O} {sc.iadd[4].A}
(assert (= sc_25 sc_117))
; 
; =  {of.input.I[2].O} {of.iadd[4].A}
(assert (= of_25 of_117))
; 
; =  {sc.input.V[8].O} {sc.vdadd[1].A}
(assert (= sc_78 sc_17))
; 
; =  {of.input.V[8].O} {of.vdadd[1].A}
(assert (= of_78 of_17))
; 
; =  {sc.switch[3].PROD} {sc.vdadd[1].B}
(assert (= sc_9 sc_18))
; 
; =  {of.switch[3].PROD} {of.vdadd[1].B}
(assert (= of_9 of_18))
; 
; =  {sc.input.V[12].O} {sc.vtoi[2].K}
(assert (= sc_84 sc_61))
; 
; =  {of.input.V[12].O} {of.vtoi[2].K}
(assert (= of_84 of_61))
; 
; =  {sc.input.V[3].O} {sc.vtoi[11].X}
(assert (= sc_98 sc_69))
; 
; =  {of.input.V[3].O} {of.vtoi[11].X}
(assert (= of_98 of_69))
; 
; =  {sc.input.V[2].O} {sc.vtoi[2].X}
(assert (= sc_76 sc_60))
; 
; =  {of.input.V[2].O} {of.vtoi[2].X}
(assert (= of_76 of_60))
; 
; =  {sc.vtoi[2].Y} {sc.switch[3].Vmax}
(assert (= sc_62 sc_8))
; 
; =  {of.vtoi[2].Y} {of.switch[3].Vmax}
(assert (= of_62 of_8))
; 
; =  {sc.iadd[5].OUT} {sc.iadd[4].D}
(assert (= sc_124 sc_115))
; 
; =  {of.iadd[5].OUT} {of.iadd[4].D}
(assert (= of_124 of_115))
; 
; =  {sc.input.I[15].O} {sc.switch[9].Kmod}
(assert (= sc_43 sc_2))
; 
; =  {of.input.I[15].O} {of.switch[9].Kmod}
(assert (= of_43 of_2))
; 
; =  {sc.input.I[10].O} {sc.vdadd[0].D}
(assert (= sc_41 sc_10))
; 
; =  {of.input.I[10].O} {of.vdadd[0].D}
(assert (= of_41 of_10))
; 
; =  {sc.input.I[1].O} {sc.iadd[10].B}
(assert (= sc_55 sc_113))
; 
; =  {of.input.I[1].O} {of.iadd[10].B}
(assert (= of_55 of_113))
; 
; =  {sc.input.I[12].O} {sc.switch[3].Kmod}
(assert (= sc_33 sc_7))
; 
; =  {of.input.I[12].O} {of.switch[3].Kmod}
(assert (= of_33 of_7))
; 
; =  {sc.iadd[10].OUT} {sc.switch[9].SUB}
(assert (= sc_114 sc_1))
; 
; =  {of.iadd[10].OUT} {of.switch[9].SUB}
(assert (= of_114 of_1))
; 
; =  {sc.input.I[7].O} {sc.iadd[8].D}
(assert (= sc_29 sc_105))
; 
; =  {of.input.I[7].O} {of.iadd[8].D}
(assert (= of_29 of_105))
; 
; =  {sc.input.V[1].O} {sc.vtoi[6].K}
(assert (= sc_104 sc_73))
; 
; =  {of.input.V[1].O} {of.vtoi[6].K}
(assert (= of_104 of_73))
; 
; =  {sc.input.I[13].O} {sc.iadd[4].C}
(assert (= sc_31 sc_116))
; 
; =  {of.input.I[13].O} {of.iadd[4].C}
(assert (= of_31 of_116))
; 
; =  {sc.input.V[7].O} {sc.vdadd[0].B}
(assert (= sc_80 sc_13))
; 
; =  {of.input.V[7].O} {of.vdadd[0].B}
(assert (= of_80 of_13))
; 
; =  {sc.input.I[8].O} {sc.iadd[10].A}
(assert (= sc_27 sc_112))
; 
; =  {of.input.I[8].O} {of.iadd[10].A}
(assert (= of_27 of_112))
; 
; =  {sc.vdadd[1].OUT} {sc.vtoi[13].X}
(assert (= sc_19 sc_63))
; 
; =  {of.vdadd[1].OUT} {of.vtoi[13].X}
(assert (= of_19 of_63))
; 
; =  {sc.vdadd[1].OUT} {sc.output.V[1].X}
(assert (= sc_19 sc_58))
; 
; =  {of.vdadd[1].OUT} {of.output.V[1].X}
(assert (= of_19 of_58))
; 
; =  {sc.vtoi[11].Y} {sc.switch[9].Vmax}
(assert (= sc_71 sc_3))
; 
; =  {of.vtoi[11].Y} {of.switch[9].Vmax}
(assert (= of_71 of_3))
; 
; =  {sc.switch[9].PROD} {sc.vdadd[0].A}
(assert (= sc_4 sc_12))
; 
; =  {of.switch[9].PROD} {of.vdadd[0].A}
(assert (= of_4 of_12))
; 
; =  {sc.input.V[0].O} {sc.vtoi[6].X}
(assert (= sc_88 sc_72))
; 
; =  {of.input.V[0].O} {of.vtoi[6].X}
(assert (= of_88 of_72))
; 
; =  {sc.input.V[10].O} {sc.vdadd[0].OUT_0}
(assert (= sc_92 sc_11))
; 
; =  {of.input.V[10].O} {of.vdadd[0].OUT_0}
(assert (= of_92 of_11))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[10].D}
(assert (= sc_109 sc_110))
; 
; =  {of.iadd[8].OUT} {of.iadd[10].D}
(assert (= of_109 of_110))
; 
; =  {sc.input.V[4].O} {sc.vtoi[11].K}
(assert (= sc_100 sc_70))
; 
; =  {of.input.V[4].O} {of.vtoi[11].K}
(assert (= of_100 of_70))
; 
; =  {sc.input.V[5].O} {sc.switch[9].n}
(assert (= sc_102 sc_0))
; 
; =  {of.input.V[5].O} {of.switch[9].n}
(assert (= of_102 of_0))
; 
; =  {sc.input.V[6].O} {sc.switch[3].n}
(assert (= sc_94 sc_5))
; 
; =  {of.input.V[6].O} {of.switch[3].n}
(assert (= of_94 of_5))
; 
; =  {sc.input.I[11].O} {sc.vdadd[1].D}
(assert (= sc_39 sc_15))
; 
; =  {of.input.I[11].O} {of.vdadd[1].D}
(assert (= of_39 of_15))
(assert (<= (* (/ 1. sc_57) 1) 1000.))
(assert (<= (* (/ 1. sc_57) 1) 1000.))
(assert (not (= 1. sc_57)))
(assert (<= (* (/ 1. sc_59) 1) 1000.))
(assert (<= (* (/ 1. sc_59) 1) 1000.))
(assert (not (= 1. sc_59)))
(assert (not (= 1. sc_23)))
(assert (not (= 1. sc_9)))
(assert (not (= 1. sc_4)))
; 
; =  {sc.vdadd[0].OUT} {sc.output.V[0].O} {sc.vdadd[1].OUT} {sc.output.V[1].O}
(assert (and (and (= sc_14 sc_57) (= sc_14 sc_19)) (= sc_14 sc_59)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_1_1 0.) slbot_1_1 (- slbot_1_1)) (ite (>= sltop_63_1 0.) sltop_63_1 (- sltop_63_1))) (ite (>= slbot_68_1 0.) slbot_68_1 (- slbot_68_1))) (ite (>= slbot_72_1 0.) slbot_72_1 (- slbot_72_1))) (ite (>= slbot_65_1 0.) slbot_65_1 (- slbot_65_1))) (ite (>= sltop_115_1 0.) sltop_115_1 (- sltop_115_1))) (ite (>= slbot_109_1 0.) slbot_109_1 (- slbot_109_1))) (ite (>= slbot_19_1 0.) slbot_19_1 (- slbot_19_1))) (ite (>= slbot_66_1 0.) slbot_66_1 (- slbot_66_1))) (ite (>= sltop_56_1 0.) sltop_56_1 (- sltop_56_1))) (ite (>= slbot_57_1 0.) slbot_57_1 (- slbot_57_1))) (ite (>= sltop_88_1 0.) sltop_88_1 (- sltop_88_1))) (ite (>= slbot_6_1 0.) slbot_6_1 (- slbot_6_1))) (ite (>= slbot_22_1 0.) slbot_22_1 (- slbot_22_1))) (ite (>= sltop_57_1 0.) sltop_57_1 (- sltop_57_1))) (ite (>= sltop_18_1 0.) sltop_18_1 (- sltop_18_1))) (ite (>= slbot_110_1 0.) slbot_110_1 (- slbot_110_1))) (ite (>= sltop_65_1 0.) sltop_65_1 (- sltop_65_1))) (ite (>= slbot_87_1 0.) slbot_87_1 (- slbot_87_1))) (ite (>= sltop_87_1 0.) sltop_87_1 (- sltop_87_1))) (ite (>= slbot_88_1 0.) slbot_88_1 (- slbot_88_1))) (ite (>= sltop_110_1 0.) sltop_110_1 (- sltop_110_1))) (ite (>= slbot_124_1 0.) slbot_124_1 (- slbot_124_1))) (ite (>= slbot_4_1 0.) slbot_4_1 (- slbot_4_1))) (ite (>= slbot_18_1 0.) slbot_18_1 (- slbot_18_1))) (ite (>= slbot_106_1 0.) slbot_106_1 (- slbot_106_1))) (ite (>= sltop_6_1 0.) sltop_6_1 (- sltop_6_1))) (ite (>= sltop_120_1 0.) sltop_120_1 (- sltop_120_1))) (ite (>= sltop_21_1 0.) sltop_21_1 (- sltop_21_1))) (ite (>= slbot_58_1 0.) slbot_58_1 (- slbot_58_1))) (ite (>= sltop_68_1 0.) sltop_68_1 (- sltop_68_1))) (ite (>= sltop_109_1 0.) sltop_109_1 (- sltop_109_1))) (ite (>= sltop_114_1 0.) sltop_114_1 (- sltop_114_1))) (ite (>= sltop_12_1 0.) sltop_12_1 (- sltop_12_1))) (ite (>= slbot_21_1 0.) slbot_21_1 (- slbot_21_1))) (ite (>= slbot_14_1 0.) slbot_14_1 (- slbot_14_1))) (ite (>= slbot_59_1 0.) slbot_59_1 (- slbot_59_1))) (ite (>= sltop_19_1 0.) sltop_19_1 (- sltop_19_1))) (ite (>= sltop_22_1 0.) sltop_22_1 (- sltop_22_1))) (ite (>= sltop_4_1 0.) sltop_4_1 (- sltop_4_1))) (ite (>= sltop_14_1 0.) sltop_14_1 (- sltop_14_1))) (ite (>= sltop_66_1 0.) sltop_66_1 (- sltop_66_1))) (ite (>= sltop_74_1 0.) sltop_74_1 (- sltop_74_1))) (ite (>= sltop_119_1 0.) sltop_119_1 (- sltop_119_1))) (ite (>= sltop_23_1 0.) sltop_23_1 (- sltop_23_1))) (ite (>= sltop_106_1 0.) sltop_106_1 (- sltop_106_1))) (ite (>= slbot_115_1 0.) slbot_115_1 (- slbot_115_1))) (ite (>= slbot_9_1 0.) slbot_9_1 (- slbot_9_1))) (ite (>= slbot_74_1 0.) slbot_74_1 (- slbot_74_1))) (ite (>= slbot_120_1 0.) slbot_120_1 (- slbot_120_1))) (ite (>= sltop_1_1 0.) sltop_1_1 (- sltop_1_1))) (ite (>= slbot_12_1 0.) slbot_12_1 (- slbot_12_1))) (ite (>= sltop_59_1 0.) sltop_59_1 (- sltop_59_1))) (ite (>= sltop_72_1 0.) sltop_72_1 (- sltop_72_1))) (ite (>= sltop_9_1 0.) sltop_9_1 (- sltop_9_1))) (ite (>= slbot_23_1 0.) slbot_23_1 (- slbot_23_1))) (ite (>= sltop_58_1 0.) sltop_58_1 (- sltop_58_1))) (ite (>= slbot_63_1 0.) slbot_63_1 (- slbot_63_1))) (ite (>= sltop_124_1 0.) sltop_124_1 (- sltop_124_1))) (ite (>= slbot_56_1 0.) slbot_56_1 (- slbot_56_1))) (ite (>= slbot_114_1 0.) slbot_114_1 (- slbot_114_1))) (ite (>= slbot_119_1 0.) slbot_119_1 (- slbot_119_1)))))
(check-sat)
