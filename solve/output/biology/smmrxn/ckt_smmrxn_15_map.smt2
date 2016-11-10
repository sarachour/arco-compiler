(set-logic QF_NRA)
(declare-fun __minima__ () Real)
(declare-fun sc_0 () Real)
(declare-fun of_0 () Real)
(declare-fun sc_1 () Real)
(declare-fun of_1 () Real)
(declare-fun sc_2 () Real)
(declare-fun of_2 () Real)
(declare-fun sc_3 () Real)
(declare-fun of_3 () Real)
(assert (= sc_3 1))
(assert (= of_3 0))
; 
; =  {sc.vgain[1].P} {((sc.vgain[1].X/sc.vgain[1].Y)*sc.vgain[1].Z*1)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1)))
; 
; =  {of.vgain[1].P} {0}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[1].X*1.)+of.vgain[1].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[1].X*1.)+of.vgain[1].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[1].Y*0.125)+of.vgain[1].Y)} {3300.}
(assert (<= (+ (* sc_1 0.125) of_1) 3300.))
; 
; <=  {((sc.vgain[1].Y*0.125)+of.vgain[1].Y)} {1.}
(assert (>= (+ (* sc_1 0.125) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[1].P*0.)+of.vgain[1].P)+sl.min.vgain[1].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[1].P*4.)+of.vgain[1].P)+sl.max.vgain[1].P)} {5445000.}
(assert (= (+ (+ (* sc_3 4.) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[1].Z*0.)+of.vgain[1].Z)+sl.min.vgain[1].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[1].Z*1.)+of.vgain[1].Z)+sl.max.vgain[1].Z)} {3300.}
(assert (= (+ (+ (* sc_2 1.) of_2) sltop_2) 3300.))
(declare-fun sc_4 () Real)
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(declare-fun of_5 () Real)
(assert (= sc_5 1))
(assert (= of_5 0))
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_5 sc_4))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_5 of_4))
; 
; >=  {((sc.input.I[2].X*0.15)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_4 0.15) of_4) 10.))
; 
; <=  {((sc.input.I[2].X*0.15)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_4 0.15) of_4) 0.))
; 
; >=  {((sc.input.I[2].O*0.15)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_5 0.15) of_5) 10.))
; 
; <=  {((sc.input.I[2].O*0.15)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_5 0.15) of_5) 0.))
(declare-fun sc_6 () Real)
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(declare-fun of_7 () Real)
(assert (= sc_7 1))
(assert (= of_7 0))
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_7 sc_6))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_7 of_6))
; 
; >=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_6 0.) of_6) 10.))
; 
; <=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_6 0.) of_6) 0.))
; 
; >=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_7 0.) of_7) 10.))
; 
; <=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_7 0.) of_7) 0.))
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
(assert (= sc_9 1))
(assert (= of_9 0))
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_9 sc_8))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_9 of_8))
; 
; >=  {((sc.input.I[3].X*1.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_8 1.) of_8) 10.))
; 
; <=  {((sc.input.I[3].X*1.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_8 1.) of_8) 0.))
; 
; >=  {((sc.input.I[3].O*1.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_9 1.) of_9) 10.))
; 
; <=  {((sc.input.I[3].O*1.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_9 1.) of_9) 0.))
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
(assert (= sc_11 1))
(assert (= of_11 0))
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_11 sc_10))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_11 of_10))
; 
; >=  {((sc.input.I[4].X*1.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_10 1.) of_10) 10.))
; 
; <=  {((sc.input.I[4].X*1.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_10 1.) of_10) 0.))
; 
; >=  {((sc.input.I[4].O*1.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_11 1.) of_11) 10.))
; 
; <=  {((sc.input.I[4].O*1.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_11 1.) of_11) 0.))
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
(assert (= sc_13 1))
(assert (= of_13 0))
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_13 sc_12))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_13 of_12))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_12 0.) of_12) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_13 0.) of_13) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
(assert (= sc_15 1))
(assert (= of_15 0))
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_15 sc_14))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_15 of_14))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X)} {0.0001}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14) 0.0001))
; 
; =  {(((sc.output.V[2].X*1.)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_14 1.) of_14) sltop_14) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.0001))
; 
; =  {(((sc.output.V[2].O*1.)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_15 1.) of_15) sltop_15) 3300.))
(declare-fun sc_16 () Real)
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(declare-fun of_17 () Real)
(assert (= sc_17 1))
(assert (= of_17 0))
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_17 sc_16))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_17 of_16))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_16 1.) of_16) sltop_16) 3300.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_17 1.) of_17) sltop_17) 3300.))
(declare-fun sc_18 () Real)
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(declare-fun of_19 () Real)
(assert (= sc_19 1))
(assert (= of_19 0))
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_19 sc_18))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_19 of_18))
(declare-fun slbot_18 () Real)
(declare-fun sltop_18 () Real)
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X)} {0.0001}
(assert (= (+ (+ (* sc_18 0.) of_18) slbot_18) 0.0001))
; 
; =  {(((sc.output.V[3].X*1.)+of.output.V[3].X)+sl.max.output.V[3].X)} {3300.}
(assert (= (+ (+ (* sc_18 1.) of_18) sltop_18) 3300.))
(declare-fun slbot_19 () Real)
(declare-fun sltop_19 () Real)
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O)} {0.0001}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19) 0.0001))
; 
; =  {(((sc.output.V[3].O*1.)+of.output.V[3].O)+sl.max.output.V[3].O)} {3300.}
(assert (= (+ (+ (* sc_19 1.) of_19) sltop_19) 3300.))
(declare-fun sc_20 () Real)
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(declare-fun of_21 () Real)
(assert (= sc_21 1))
(assert (= of_21 0))
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_21 sc_20))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_21 of_20))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.0001))
; 
; =  {(((sc.output.V[1].X*1.)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_20 1.) of_20) sltop_20) 3300.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) 0.0001))
; 
; =  {(((sc.output.V[1].O*1.)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_21 1.) of_21) sltop_21) 3300.))
(declare-fun sc_22 () Real)
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(declare-fun of_28 () Real)
(assert (= sc_27 1))
(assert (= of_27 0))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1)}
(assert (= sc_27 (* sc_25 1)))
; 
; =  {of.vadd[2].OUT} {0}
(assert (= of_27 0.))
(assert (= sc_28 1))
(assert (= of_28 0))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1)}
(assert (= sc_28 (* sc_25 1)))
(assert (= of_28 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1)}
(assert (= sc_22 (* sc_25 1)))
; 
; =  {of.vadd[2].OUT2_0} {0}
(assert (= of_22 0.))
; 
; >=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {3300.}
(assert (<= (+ (* sc_22 0.) of_22) 3300.))
; 
; <=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {3300.}
(assert (<= (+ (* sc_23 4.) of_23) 3300.))
; 
; <=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {0.0001}
(assert (>= (+ (* sc_23 4.) of_23) 0.0001))
; 
; >=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {3300.}
(assert (<= (+ (* sc_24 0.) of_24) 3300.))
; 
; <=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {0.0001}
(assert (>= (+ (* sc_24 0.) of_24) 0.0001))
; 
; >=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {3300.}
(assert (<= (+ (* sc_25 0.) of_25) 3300.))
; 
; <=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {0.0001}
(assert (>= (+ (* sc_25 0.) of_25) 0.0001))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.))
; 
; =  {(((sc.vadd[2].OUT2*1.)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {5.}
(assert (= (+ (+ (* sc_28 1.) of_28) sltop_28) 5.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.vadd[2].B*0.)+of.vadd[2].B)+sl.min.vadd[2].B)} {0.0001}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.0001))
; 
; =  {(((sc.vadd[2].B*4.)+of.vadd[2].B)+sl.max.vadd[2].B)} {3300.}
(assert (= (+ (+ (* sc_26 4.) of_26) sltop_26) 3300.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vadd[2].OUT*0.)+of.vadd[2].OUT)+sl.min.vadd[2].OUT)} {-1649.99995}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) -1649.99995))
; 
; =  {(((sc.vadd[2].OUT*4.)+of.vadd[2].OUT)+sl.max.vadd[2].OUT)} {1649.99995}
(assert (= (+ (+ (* sc_27 4.) of_27) sltop_27) 1649.99995))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.))
; 
; =  {(((sc.vadd[2].OUT2*1.)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {5.}
(assert (= (+ (+ (* sc_28 1.) of_28) sltop_28) 5.))
(declare-fun sc_29 () Real)
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(declare-fun of_31 () Real)
(assert (= sc_31 1))
(assert (= of_31 0))
; 
; =  {sc.vtoi[0].Y} {((1/sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_31 (* (/ 1 sc_30) sc_29)))
; 
; =  {of.vtoi[0].Y} {0}
(assert (= of_31 0.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 1.))
; 
; =  {(((sc.vtoi[0].X*1.)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_29 1.) of_29) sltop_29) 3300.))
; 
; >=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_30 1.) of_30) 3300.))
; 
; <=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_30 1.) of_30) 1.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*1.)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_31 1.) of_31) sltop_31) 3300.))
(declare-fun sc_32 () Real)
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(declare-fun of_39 () Real)
(assert (= sc_37 1))
(assert (= of_37 0))
; 
; =  {sc.mm[0].X} {sc.mm[0].Xtot}
(assert (= sc_37 sc_36))
; 
; =  {of.mm[0].X} {(of.mm[0].Xtot-of.mm[0].XY)}
(assert (= of_37 (- of_36 of_38)))
(assert (= sc_38 1))
(assert (= of_38 0))
; 
; =  {sc.mm[0].XY} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_38 (* (* sc_35 sc_37) sc_39)))
(assert (= of_38 0))
(assert (= 0. 0))
; 
; =  {sc.mm[0].XY0} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_33 (* (* sc_35 sc_37) sc_39)))
; 
; =  {of.mm[0].XY0} {(0-0)}
(assert (= of_33 0.))
(assert (= sc_39 1))
(assert (= of_39 0))
; 
; =  {sc.mm[0].Y} {sc.mm[0].Ytot}
(assert (= sc_39 sc_34))
; 
; =  {of.mm[0].Y} {(of.mm[0].Ytot-of.mm[0].XY)}
(assert (= of_39 (- of_34 of_38)))
; 
; >=  {((sc.mm[0].kr*1.)+of.mm[0].kr)} {10.}
(assert (<= (+ (* sc_32 1.) of_32) 10.))
; 
; <=  {((sc.mm[0].kr*1.)+of.mm[0].kr)} {0.0001}
(assert (>= (+ (* sc_32 1.) of_32) 0.0001))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.mm[0].X*0.)+of.mm[0].X)+sl.min.mm[0].X)} {-0.9999}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) -0.9999))
; 
; =  {(((sc.mm[0].X*1.)+of.mm[0].X)+sl.max.mm[0].X)} {3300.}
(assert (= (+ (+ (* sc_37 1.) of_37) sltop_37) 3300.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.mm[0].XY*0.)+of.mm[0].XY)+sl.min.mm[0].XY)} {0.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 0.))
; 
; =  {(((sc.mm[0].XY*1.)+of.mm[0].XY)+sl.max.mm[0].XY)} {1.}
(assert (= (+ (+ (* sc_38 1.) of_38) sltop_38) 1.))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.mm[0].Y*0.)+of.mm[0].Y)+sl.min.mm[0].Y)} {-0.9999}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) -0.9999))
; 
; =  {(((sc.mm[0].Y*1.)+of.mm[0].Y)+sl.max.mm[0].Y)} {3300.}
(assert (= (+ (+ (* sc_39 1.) of_39) sltop_39) 3300.))
; 
; >=  {((sc.mm[0].Ytot*0.15)+of.mm[0].Ytot)} {3300.}
(assert (<= (+ (* sc_34 0.15) of_34) 3300.))
; 
; <=  {((sc.mm[0].Ytot*0.15)+of.mm[0].Ytot)} {0.0001}
(assert (>= (+ (* sc_34 0.15) of_34) 0.0001))
; 
; >=  {((sc.mm[0].kf*1.)+of.mm[0].kf)} {10.}
(assert (<= (+ (* sc_35 1.) of_35) 10.))
; 
; <=  {((sc.mm[0].kf*1.)+of.mm[0].kf)} {0.0001}
(assert (>= (+ (* sc_35 1.) of_35) 0.0001))
; 
; >=  {((sc.mm[0].Xtot*0.11)+of.mm[0].Xtot)} {3300.}
(assert (<= (+ (* sc_36 0.11) of_36) 3300.))
; 
; <=  {((sc.mm[0].Xtot*0.11)+of.mm[0].Xtot)} {0.0001}
(assert (>= (+ (* sc_36 0.11) of_36) 0.0001))
(declare-fun sc_40 () Real)
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(declare-fun of_41 () Real)
(assert (= sc_41 1))
(assert (= of_41 0))
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_40 0.) of_40) 5.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_41 0.) of_41) 5.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun sc_42 () Real)
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(assert (= sc_43 1))
(assert (= of_43 0))
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.V[7].X*1.)+of.input.V[7].X)} {5.}
(assert (<= (+ (* sc_42 1.) of_42) 5.))
; 
; <=  {((sc.input.V[7].X*1.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_42 1.) of_42) 0.))
; 
; >=  {((sc.input.V[7].O*1.)+of.input.V[7].O)} {5.}
(assert (<= (+ (* sc_43 1.) of_43) 5.))
; 
; <=  {((sc.input.V[7].O*1.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_43 1.) of_43) 0.))
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(assert (= sc_45 1))
(assert (= of_45 0))
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.V[9].X*1.)+of.input.V[9].X)} {5.}
(assert (<= (+ (* sc_44 1.) of_44) 5.))
; 
; <=  {((sc.input.V[9].X*1.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_44 1.) of_44) 0.))
; 
; >=  {((sc.input.V[9].O*1.)+of.input.V[9].O)} {5.}
(assert (<= (+ (* sc_45 1.) of_45) 5.))
; 
; <=  {((sc.input.V[9].O*1.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_45 1.) of_45) 0.))
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(assert (= sc_47 1))
(assert (= of_47 0))
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_46 0.11) of_46) 5.))
; 
; <=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_46 0.11) of_46) 0.))
; 
; >=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_47 0.11) of_47) 5.))
; 
; <=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_47 0.11) of_47) 0.))
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
(assert (= sc_49 1))
(assert (= of_49 0))
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.V[6].X*4.)+of.input.V[6].X)} {5.}
(assert (<= (+ (* sc_48 4.) of_48) 5.))
; 
; <=  {((sc.input.V[6].X*4.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_48 4.) of_48) 0.))
; 
; >=  {((sc.input.V[6].O*4.)+of.input.V[6].O)} {5.}
(assert (<= (+ (* sc_49 4.) of_49) 5.))
; 
; <=  {((sc.input.V[6].O*4.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_49 4.) of_49) 0.))
(declare-fun sc_50 () Real)
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(declare-fun of_51 () Real)
(assert (= sc_51 1))
(assert (= of_51 0))
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {5.}
(assert (<= (+ (* sc_50 0.) of_50) 5.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {5.}
(assert (<= (+ (* sc_51 0.) of_51) 5.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
(assert (= sc_53 1))
(assert (= of_53 0))
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {5.}
(assert (<= (+ (* sc_52 0.) of_52) 5.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {5.}
(assert (<= (+ (* sc_53 0.) of_53) 5.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
(assert (= sc_55 1))
(assert (= of_55 0))
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.V[5].X*0.15)+of.input.V[5].X)} {5.}
(assert (<= (+ (* sc_54 0.15) of_54) 5.))
; 
; <=  {((sc.input.V[5].X*0.15)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_54 0.15) of_54) 0.))
; 
; >=  {((sc.input.V[5].O*0.15)+of.input.V[5].O)} {5.}
(assert (<= (+ (* sc_55 0.15) of_55) 5.))
; 
; <=  {((sc.input.V[5].O*0.15)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_55 0.15) of_55) 0.))
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
(assert (= sc_57 1))
(assert (= of_57 0))
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_56 0.125) of_56) 5.))
; 
; <=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_56 0.125) of_56) 0.))
; 
; >=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_57 0.125) of_57) 5.))
; 
; <=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_57 0.125) of_57) 0.))
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
(assert (= sc_60 1))
(assert (= of_60 0))
; 
; =  {sc.itov[3].Y} {(sc.itov[3].K*sc.itov[3].X)}
(assert (= sc_60 (* sc_59 sc_58)))
; 
; =  {of.itov[3].Y} {0}
(assert (= of_60 0.))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.itov[3].X*0.)+of.itov[3].X)+sl.min.itov[3].X)} {0.0001}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) 0.0001))
; 
; =  {(((sc.itov[3].X*1.)+of.itov[3].X)+sl.max.itov[3].X)} {10.}
(assert (= (+ (+ (* sc_58 1.) of_58) sltop_58) 10.))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_60 0.) of_60) slbot_60) 0.0001))
; 
; =  {(((sc.itov[3].Y*4.)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_60 4.) of_60) sltop_60) 3300.))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.itov[3].K*0.)+of.itov[3].K)+sl.min.itov[3].K)} {1.}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59) 1.))
; 
; =  {(((sc.itov[3].K*4.)+of.itov[3].K)+sl.max.itov[3].K)} {330.}
(assert (= (+ (+ (* sc_59 4.) of_59) sltop_59) 330.))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_60 0.) of_60) slbot_60) 0.0001))
; 
; =  {(((sc.itov[3].Y*4.)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_60 4.) of_60) sltop_60) 3300.))
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(declare-fun of_65 () Real)
(assert (= sc_65 1))
(assert (= of_65 0))
; 
; =  {sc.iadd[4].OUT} {sc.iadd[4].A}
(assert (= sc_65 sc_63))
; 
; =  {of.iadd[4].OUT} {((of.iadd[4].A+of.iadd[4].B)-of.iadd[4].C-of.iadd[4].D)}
(assert (= of_65 (- (+ of_63 of_64) (+ of_62 of_61))))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.iadd[4].D*0.)+of.iadd[4].D)+sl.min.iadd[4].D)} {0.}
(assert (= (+ (+ (* sc_61 0.) of_61) slbot_61) 0.))
; 
; =  {(((sc.iadd[4].D*1.)+of.iadd[4].D)+sl.max.iadd[4].D)} {5.}
(assert (= (+ (+ (* sc_61 1.) of_61) sltop_61) 5.))
; 
; >=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {5.}
(assert (<= (+ (* sc_62 0.) of_62) 5.))
; 
; <=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
(declare-fun slbot_65 () Real)
(declare-fun sltop_65 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_65 0.) of_65) slbot_65) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_65 1.) of_65) sltop_65) 10.))
; 
; >=  {((sc.iadd[4].A*0.)+of.iadd[4].A)} {5.}
(assert (<= (+ (* sc_63 0.) of_63) 5.))
; 
; <=  {((sc.iadd[4].A*0.)+of.iadd[4].A)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
; 
; >=  {((sc.iadd[4].B*0.15)+of.iadd[4].B)} {5.}
(assert (<= (+ (* sc_64 0.15) of_64) 5.))
; 
; <=  {((sc.iadd[4].B*0.15)+of.iadd[4].B)} {0.}
(assert (>= (+ (* sc_64 0.15) of_64) 0.))
(declare-fun slbot_65 () Real)
(declare-fun sltop_65 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_65 0.) of_65) slbot_65) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_65 1.) of_65) sltop_65) 10.))
(declare-fun sc_66 () Real)
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(declare-fun of_67 () Real)
(assert (= sc_67 1))
(assert (= of_67 0))
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_67 sc_66))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_67 of_66))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_66 0.) of_66) slbot_66) 0.))
; 
; =  {(((sc.output.I[0].X*1.)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_66 1.) of_66) sltop_66) 10.))
(declare-fun slbot_67 () Real)
(declare-fun sltop_67 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_67 0.) of_67) slbot_67) 0.))
; 
; =  {(((sc.output.I[0].O*1.)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_67 1.) of_67) sltop_67) 10.))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[2].X}
(assert (= sc_28 sc_14))
; 
; =  {of.vadd[2].OUT2} {of.output.V[2].X}
(assert (= of_28 of_14))
; 
; =  {sc.vadd[2].OUT2} {sc.vtoi[0].X}
(assert (= sc_28 sc_29))
; 
; =  {of.vadd[2].OUT2} {of.vtoi[0].X}
(assert (= of_28 of_29))
; 
; =  {sc.input.I[0].O} {sc.iadd[4].C}
(assert (= sc_7 sc_62))
; 
; =  {of.input.I[0].O} {of.iadd[4].C}
(assert (= of_7 of_62))
; 
; =  {sc.input.V[9].O} {sc.vtoi[0].K}
(assert (= sc_45 sc_30))
; 
; =  {of.input.V[9].O} {of.vtoi[0].K}
(assert (= of_45 of_30))
; 
; =  {sc.iadd[4].OUT} {sc.output.I[0].X}
(assert (= sc_65 sc_66))
; 
; =  {of.iadd[4].OUT} {of.output.I[0].X}
(assert (= of_65 of_66))
; 
; =  {sc.input.I[3].O} {sc.mm[0].kf}
(assert (= sc_9 sc_35))
; 
; =  {of.input.I[3].O} {of.mm[0].kf}
(assert (= of_9 of_35))
; 
; =  {sc.input.I[4].O} {sc.mm[0].kr}
(assert (= sc_11 sc_32))
; 
; =  {of.input.I[4].O} {of.mm[0].kr}
(assert (= of_11 of_32))
; 
; =  {sc.vtoi[0].Y} {sc.iadd[4].D}
(assert (= sc_31 sc_61))
; 
; =  {of.vtoi[0].Y} {of.iadd[4].D}
(assert (= of_31 of_61))
; 
; =  {sc.mm[0].X} {sc.itov[3].X}
(assert (= sc_37 sc_58))
; 
; =  {of.mm[0].X} {of.itov[3].X}
(assert (= of_37 of_58))
; 
; =  {sc.mm[0].X} {sc.output.V[0].X}
(assert (= sc_37 sc_16))
; 
; =  {of.mm[0].X} {of.output.V[0].X}
(assert (= of_37 of_16))
; 
; =  {sc.mm[0].Y} {sc.output.V[1].X}
(assert (= sc_39 sc_20))
; 
; =  {of.mm[0].Y} {of.output.V[1].X}
(assert (= of_39 of_20))
; 
; =  {sc.mm[0].Y} {sc.vgain[1].Z}
(assert (= sc_39 sc_2))
; 
; =  {of.mm[0].Y} {of.vgain[1].Z}
(assert (= of_39 of_2))
; 
; =  {sc.input.I[2].O} {sc.iadd[4].B}
(assert (= sc_5 sc_64))
; 
; =  {of.input.I[2].O} {of.iadd[4].B}
(assert (= of_5 of_64))
; 
; =  {sc.input.V[3].O} {sc.vadd[2].C}
(assert (= sc_51 sc_24))
; 
; =  {of.input.V[3].O} {of.vadd[2].C}
(assert (= of_51 of_24))
; 
; =  {sc.input.V[2].O} {sc.vadd[2].OUT2_0}
(assert (= sc_41 sc_22))
; 
; =  {of.input.V[2].O} {of.vadd[2].OUT2_0}
(assert (= of_41 of_22))
; 
; =  {sc.input.I[1].O} {sc.iadd[4].A}
(assert (= sc_13 sc_63))
; 
; =  {of.input.I[1].O} {of.iadd[4].A}
(assert (= of_13 of_63))
; 
; =  {sc.input.V[1].O} {sc.vgain[1].Y}
(assert (= sc_57 sc_1))
; 
; =  {of.input.V[1].O} {of.vgain[1].Y}
(assert (= of_57 of_1))
; 
; =  {sc.input.V[7].O} {sc.vgain[1].X}
(assert (= sc_43 sc_0))
; 
; =  {of.input.V[7].O} {of.vgain[1].X}
(assert (= of_43 of_0))
; 
; =  {sc.mm[0].XY} {sc.output.V[3].X}
(assert (= sc_38 sc_18))
; 
; =  {of.mm[0].XY} {of.output.V[3].X}
(assert (= of_38 of_18))
; 
; =  {sc.vgain[1].P} {sc.itov[3].K}
(assert (= sc_3 sc_59))
; 
; =  {of.vgain[1].P} {of.itov[3].K}
(assert (= of_3 of_59))
; 
; =  {sc.itov[3].Y} {sc.vadd[2].B}
(assert (= sc_60 sc_26))
; 
; =  {of.itov[3].Y} {of.vadd[2].B}
(assert (= of_60 of_26))
; 
; =  {sc.input.V[0].O} {sc.mm[0].Xtot}
(assert (= sc_47 sc_36))
; 
; =  {of.input.V[0].O} {of.mm[0].Xtot}
(assert (= of_47 of_36))
; 
; =  {sc.input.V[4].O} {sc.vadd[2].A}
(assert (= sc_53 sc_25))
; 
; =  {of.input.V[4].O} {of.vadd[2].A}
(assert (= of_53 of_25))
; 
; =  {sc.input.V[5].O} {sc.mm[0].Ytot}
(assert (= sc_55 sc_34))
; 
; =  {of.input.V[5].O} {of.mm[0].Ytot}
(assert (= of_55 of_34))
; 
; =  {sc.input.V[6].O} {sc.vadd[2].D}
(assert (= sc_49 sc_23))
; 
; =  {of.input.V[6].O} {of.vadd[2].D}
(assert (= of_49 of_23))
(assert (<= (* sc_15 0.001) 0.001))
(assert (<= (* sc_19 0.001) 0.001))
; 
; =  {sc.output.V[2].O} {sc.output.V[3].O} {sc.vadd[2].OUT2} {sc.mm[0].XY}
(assert (and (and (= sc_15 sc_19) (= sc_15 sc_28)) (= sc_15 sc_38)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= slbot_66 0) slbot_66 (- slbot_66)) 1.) (* (ite (>= slbot_14 0) slbot_14 (- slbot_14)) 1.)) (* (ite (>= slbot_29 0) slbot_29 (- slbot_29)) 1.)) (* (ite (>= sltop_14 0) sltop_14 (- sltop_14)) 1.)) (* (ite (>= sltop_18 0) sltop_18 (- sltop_18)) 1.)) (* (ite (>= slbot_16 0) slbot_16 (- slbot_16)) 1.)) (* (ite (>= slbot_20 0) slbot_20 (- slbot_20)) 1.)) (* (ite (>= sltop_27 0) sltop_27 (- sltop_27)) 1.)) (* (ite (>= slbot_60 0) slbot_60 (- slbot_60)) 1.)) (* (ite (>= sltop_65 0) sltop_65 (- sltop_65)) 1.)) (* (ite (>= sltop_66 0) sltop_66 (- sltop_66)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= slbot_19 0) slbot_19 (- slbot_19)) 1.)) (* (ite (>= sltop_28 0) sltop_28 (- sltop_28)) 1.)) (* (ite (>= slbot_26 0) slbot_26 (- slbot_26)) 1.)) (* (ite (>= slbot_59 0) slbot_59 (- slbot_59)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= slbot_37 0) slbot_37 (- slbot_37)) 1.)) (* (ite (>= slbot_61 0) slbot_61 (- slbot_61)) 1.)) (* (ite (>= sltop_38 0) sltop_38 (- sltop_38)) 1.)) (* (ite (>= sltop_67 0) sltop_67 (- sltop_67)) 1.)) (* (ite (>= slbot_15 0) slbot_15 (- slbot_15)) 1.)) (* (ite (>= slbot_17 0) slbot_17 (- slbot_17)) 1.)) (* (ite (>= sltop_29 0) sltop_29 (- sltop_29)) 1.)) (* (ite (>= sltop_39 0) sltop_39 (- sltop_39)) 1.)) (* (ite (>= sltop_58 0) sltop_58 (- sltop_58)) 1.)) (* (ite (>= slbot_31 0) slbot_31 (- slbot_31)) 1.)) (* (ite (>= slbot_18 0) slbot_18 (- slbot_18)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_15 0) sltop_15 (- sltop_15)) 1.)) (* (ite (>= sltop_20 0) sltop_20 (- sltop_20)) 1.)) (* (ite (>= sltop_31 0) sltop_31 (- sltop_31)) 1.)) (* (ite (>= slbot_28 0) slbot_28 (- slbot_28)) 1.)) (* (ite (>= slbot_67 0) slbot_67 (- slbot_67)) 1.)) (* (ite (>= slbot_65 0) slbot_65 (- slbot_65)) 1.)) (* (ite (>= sltop_16 0) sltop_16 (- sltop_16)) 1.)) (* (ite (>= slbot_21 0) slbot_21 (- slbot_21)) 1.)) (* (ite (>= sltop_60 0) sltop_60 (- sltop_60)) 1.)) (* (ite (>= sltop_19 0) sltop_19 (- sltop_19)) 1.)) (* (ite (>= slbot_38 0) slbot_38 (- slbot_38)) 1.)) (* (ite (>= sltop_37 0) sltop_37 (- sltop_37)) 1.)) (* (ite (>= sltop_61 0) sltop_61 (- sltop_61)) 1.)) (* (ite (>= sltop_17 0) sltop_17 (- sltop_17)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= sltop_26 0) sltop_26 (- sltop_26)) 1.)) (* (ite (>= slbot_39 0) slbot_39 (- slbot_39)) 1.)) (* (ite (>= slbot_58 0) slbot_58 (- slbot_58)) 1.)) (* (ite (>= slbot_27 0) slbot_27 (- slbot_27)) 1.)) (* (ite (>= sltop_21 0) sltop_21 (- sltop_21)) 1.)) (* (ite (>= sltop_59 0) sltop_59 (- sltop_59)) 1.))))
(check-sat)
