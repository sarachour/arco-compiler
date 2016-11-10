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
(assert (= of_0 0))
(assert (= of_1 0))
(assert (= 0. 0))
(assert (= of_2 0))
(assert (= 0. 0))
; 
; =  {sc.vgain[1].P} {((sc.vgain[1].X/sc.vgain[1].Y)*sc.vgain[1].Z*1)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1)))
; 
; =  {of.vgain[1].P} {0}
(assert (= of_3 0.))
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
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_5 sc_4))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_5 of_4))
(declare-fun sc_6 () Real)
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(declare-fun of_7 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_7 sc_6))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_7 of_6))
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_9 sc_8))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_9 of_8))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X)} {0.0001}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 0.0001))
; 
; =  {(((sc.output.V[2].X*1.)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_8 1.) of_8) sltop_8) 3300.))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9) 0.0001))
; 
; =  {(((sc.output.V[2].O*1.)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_9 1.) of_9) sltop_9) 3300.))
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_11 sc_10))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_11 of_10))
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_10 1.) of_10) sltop_10) 3300.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_11 1.) of_11) sltop_11) 3300.))
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_13 sc_12))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_13 of_12))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X)} {0.0001}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.0001))
; 
; =  {(((sc.output.V[3].X*1.)+of.output.V[3].X)+sl.max.output.V[3].X)} {3300.}
(assert (= (+ (+ (* sc_12 1.) of_12) sltop_12) 3300.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O)} {0.0001}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 0.0001))
; 
; =  {(((sc.output.V[3].O*1.)+of.output.V[3].O)+sl.max.output.V[3].O)} {3300.}
(assert (= (+ (+ (* sc_13 1.) of_13) sltop_13) 3300.))
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_15 sc_14))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_15 of_14))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14) 0.0001))
; 
; =  {(((sc.output.V[1].X*1.)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_14 1.) of_14) sltop_14) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.0001))
; 
; =  {(((sc.output.V[1].O*1.)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_15 1.) of_15) sltop_15) 3300.))
(declare-fun sc_16 () Real)
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(declare-fun of_22 () Real)
(assert (= 0. 0))
(assert (= of_17 0))
(assert (= 0. 0))
(assert (= of_20 0))
; 
; =  {sc.vadd[2].A} {(1*sc.vadd[2].B)}
(assert (= sc_19 (* 1 sc_20)))
; 
; =  {sc.vadd[2].A} {(1*sc.vadd[2].C)} {(1*sc.vadd[2].D)}
(assert (and (= sc_19 (* 1 sc_18)) (= sc_19 (* 1 sc_17))))
(assert (= (- (+ of_19 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1)}
(assert (= sc_21 (* sc_19 1)))
; 
; =  {of.vadd[2].OUT} {0}
(assert (= of_21 0.))
(assert (= 0. 0))
(assert (= of_17 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_20 0))
; 
; =  {sc.vadd[2].A} {(1*sc.vadd[2].B)}
(assert (= sc_19 (* 1 sc_20)))
; 
; =  {sc.vadd[2].A} {(1*sc.vadd[2].C)} {(1*sc.vadd[2].D*1)}
(assert (and (= sc_19 (* 1 sc_18)) (= sc_19 (* (* 1 sc_17) 1))))
(assert (= (- (+ of_19 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1)}
(assert (= sc_22 (* sc_19 1)))
(assert (= of_22 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1)}
(assert (= sc_16 (* sc_19 1)))
; 
; =  {of.vadd[2].OUT2_0} {0}
(assert (= of_16 0.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.vadd[2].OUT2*1.)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {5.}
(assert (= (+ (+ (* sc_22 1.) of_22) sltop_22) 5.))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.vadd[2].B*0.)+of.vadd[2].B)+sl.min.vadd[2].B)} {0.0001}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.0001))
; 
; =  {(((sc.vadd[2].B*4.)+of.vadd[2].B)+sl.max.vadd[2].B)} {3300.}
(assert (= (+ (+ (* sc_20 4.) of_20) sltop_20) 3300.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.vadd[2].OUT*0.)+of.vadd[2].OUT)+sl.min.vadd[2].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) -824.99995))
; 
; =  {(((sc.vadd[2].OUT*4.)+of.vadd[2].OUT)+sl.max.vadd[2].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_21 4.) of_21) sltop_21) 1649.999975))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.vadd[2].OUT2*1.)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {5.}
(assert (= (+ (+ (* sc_22 1.) of_22) sltop_22) 5.))
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
(declare-fun sc_29 () Real)
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(declare-fun of_30 () Real)
; 
; =  {sc.mm[0].Xtot} {sc.mm[0].XY}
(assert (= sc_27 sc_29))
; 
; =  {sc.mm[0].X} {sc.mm[0].Xtot}
(assert (= sc_28 sc_27))
; 
; =  {of.mm[0].X} {(of.mm[0].Xtot-of.mm[0].XY)}
(assert (= of_28 (- of_27 of_29)))
(assert (= of_23 0))
(assert (= 0. 0))
(assert (= of_26 0))
(assert (= of_28 0))
(assert (= of_30 0))
; 
; =  {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)} {(sc.mm[0].kr*1)}
(assert (= (* (* sc_26 sc_28) sc_30) (* sc_23 1)))
; 
; =  {sc.mm[0].XY} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_29 (* (* sc_26 sc_28) sc_30)))
(assert (= of_29 0))
(assert (= 0. 0))
; 
; =  {sc.mm[0].XY0} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_24 (* (* sc_26 sc_28) sc_30)))
; 
; =  {of.mm[0].XY0} {(0-0)}
(assert (= of_24 0.))
; 
; =  {sc.mm[0].Ytot} {sc.mm[0].XY}
(assert (= sc_25 sc_29))
; 
; =  {sc.mm[0].Y} {sc.mm[0].Ytot}
(assert (= sc_30 sc_25))
; 
; =  {of.mm[0].Y} {(of.mm[0].Ytot-of.mm[0].XY)}
(assert (= of_30 (- of_25 of_29)))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.mm[0].X*0.)+of.mm[0].X)+sl.min.mm[0].X)} {-0.9999}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) -0.9999))
; 
; =  {(((sc.mm[0].X*1.)+of.mm[0].X)+sl.max.mm[0].X)} {3300.}
(assert (= (+ (+ (* sc_28 1.) of_28) sltop_28) 3300.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.mm[0].XY*0.)+of.mm[0].XY)+sl.min.mm[0].XY)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.))
; 
; =  {(((sc.mm[0].XY*1.)+of.mm[0].XY)+sl.max.mm[0].XY)} {1.}
(assert (= (+ (+ (* sc_29 1.) of_29) sltop_29) 1.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.mm[0].Y*0.)+of.mm[0].Y)+sl.min.mm[0].Y)} {-0.9999}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) -0.9999))
; 
; =  {(((sc.mm[0].Y*1.)+of.mm[0].Y)+sl.max.mm[0].Y)} {3300.}
(assert (= (+ (+ (* sc_30 1.) of_30) sltop_30) 3300.))
(declare-fun sc_31 () Real)
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(declare-fun of_32 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_32 of_31))
(declare-fun sc_33 () Real)
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(declare-fun of_34 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_34 of_33))
(declare-fun sc_35 () Real)
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(declare-fun of_36 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_36 of_35))
(declare-fun sc_37 () Real)
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(declare-fun of_38 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_38 of_37))
(declare-fun sc_39 () Real)
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(declare-fun of_40 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_40 of_39))
(declare-fun sc_41 () Real)
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(declare-fun of_42 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_42 of_41))
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_44 of_43))
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(assert (= of_46 0))
(assert (= of_45 0))
; 
; =  {sc.itov[3].Y} {(sc.itov[3].K*sc.itov[3].X)}
(assert (= sc_47 (* sc_46 sc_45)))
; 
; =  {of.itov[3].Y} {0}
(assert (= of_47 0.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.itov[3].X*0.)+of.itov[3].X)+sl.min.itov[3].X)} {0.0001}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) 0.0001))
; 
; =  {(((sc.itov[3].X*1.)+of.itov[3].X)+sl.max.itov[3].X)} {10.}
(assert (= (+ (+ (* sc_45 1.) of_45) sltop_45) 10.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47) 0.0001))
; 
; =  {(((sc.itov[3].Y*4.)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_47 4.) of_47) sltop_47) 3300.))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.itov[3].K*0.)+of.itov[3].K)+sl.min.itov[3].K)} {1.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 1.))
; 
; =  {(((sc.itov[3].K*4.)+of.itov[3].K)+sl.max.itov[3].K)} {330.}
(assert (= (+ (+ (* sc_46 4.) of_46) sltop_46) 330.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47) 0.0001))
; 
; =  {(((sc.itov[3].Y*4.)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_47 4.) of_47) sltop_47) 3300.))
; 
; =  {sc.input.I[0].O} {sc.mm[0].kf}
(assert (= sc_5 sc_26))
; 
; =  {of.input.I[0].O} {of.mm[0].kf}
(assert (= of_5 of_26))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[2].X}
(assert (= sc_22 sc_8))
; 
; =  {of.vadd[2].OUT2} {of.output.V[2].X}
(assert (= of_22 of_8))
; 
; =  {sc.mm[0].X} {sc.output.V[1].X}
(assert (= sc_28 sc_14))
; 
; =  {of.mm[0].X} {of.output.V[1].X}
(assert (= of_28 of_14))
; 
; =  {sc.mm[0].X} {sc.vgain[1].Z}
(assert (= sc_28 sc_2))
; 
; =  {of.mm[0].X} {of.vgain[1].Z}
(assert (= of_28 of_2))
; 
; =  {sc.mm[0].Y} {sc.itov[3].X}
(assert (= sc_30 sc_45))
; 
; =  {of.mm[0].Y} {of.itov[3].X}
(assert (= of_30 of_45))
; 
; =  {sc.mm[0].Y} {sc.output.V[0].X}
(assert (= sc_30 sc_10))
; 
; =  {of.mm[0].Y} {of.output.V[0].X}
(assert (= of_30 of_10))
; 
; =  {sc.input.V[2].O} {sc.vadd[2].A}
(assert (= sc_32 sc_19))
; 
; =  {of.input.V[2].O} {of.vadd[2].A}
(assert (= of_32 of_19))
; 
; =  {sc.input.V[3].O} {sc.vadd[2].OUT2_0}
(assert (= sc_38 sc_16))
; 
; =  {of.input.V[3].O} {of.vadd[2].OUT2_0}
(assert (= of_38 of_16))
; 
; =  {sc.input.I[1].O} {sc.mm[0].kr}
(assert (= sc_7 sc_23))
; 
; =  {of.input.I[1].O} {of.mm[0].kr}
(assert (= of_7 of_23))
; 
; =  {sc.input.V[1].O} {sc.vgain[1].Y}
(assert (= sc_44 sc_1))
; 
; =  {of.input.V[1].O} {of.vgain[1].Y}
(assert (= of_44 of_1))
; 
; =  {sc.mm[0].XY} {sc.output.V[3].X}
(assert (= sc_29 sc_12))
; 
; =  {of.mm[0].XY} {of.output.V[3].X}
(assert (= of_29 of_12))
; 
; =  {sc.vgain[1].P} {sc.itov[3].K}
(assert (= sc_3 sc_46))
; 
; =  {of.vgain[1].P} {of.itov[3].K}
(assert (= of_3 of_46))
; 
; =  {sc.itov[3].Y} {sc.vadd[2].B}
(assert (= sc_47 sc_20))
; 
; =  {of.itov[3].Y} {of.vadd[2].B}
(assert (= of_47 of_20))
; 
; =  {sc.input.V[0].O} {sc.mm[0].Ytot}
(assert (= sc_34 sc_25))
; 
; =  {of.input.V[0].O} {of.mm[0].Ytot}
(assert (= of_34 of_25))
; 
; =  {sc.input.V[5].O} {sc.vadd[2].D}
(assert (= sc_42 sc_17))
; 
; =  {of.input.V[5].O} {of.vadd[2].D}
(assert (= of_42 of_17))
; 
; =  {sc.input.V[4].O} {sc.mm[0].Xtot}
(assert (= sc_40 sc_27))
; 
; =  {of.input.V[4].O} {of.mm[0].Xtot}
(assert (= of_40 of_27))
; 
; =  {sc.input.V[6].O} {sc.vgain[1].X}
(assert (= sc_36 sc_0))
; 
; =  {of.input.V[6].O} {of.vgain[1].X}
(assert (= of_36 of_0))
(assert (<= (* sc_9 0.001) 0.001))
(assert (<= (* sc_13 0.001) 0.001))
; 
; =  {sc.output.V[2].O} {sc.output.V[3].O} {sc.vadd[2].OUT2} {sc.mm[0].XY}
(assert (and (and (= sc_9 sc_13) (= sc_9 sc_22)) (= sc_9 sc_29)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= slbot_14 0) slbot_14 (- slbot_14)) 1.) (* (ite (>= slbot_13 0) slbot_13 (- slbot_13)) 1.)) (* (ite (>= slbot_29 0) slbot_29 (- slbot_29)) 1.)) (* (ite (>= sltop_14 0) sltop_14 (- sltop_14)) 1.)) (* (ite (>= slbot_22 0) slbot_22 (- slbot_22)) 1.)) (* (ite (>= slbot_10 0) slbot_10 (- slbot_10)) 1.)) (* (ite (>= slbot_11 0) slbot_11 (- slbot_11)) 1.)) (* (ite (>= sltop_11 0) sltop_11 (- sltop_11)) 1.)) (* (ite (>= slbot_20 0) slbot_20 (- slbot_20)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= slbot_46 0) slbot_46 (- slbot_46)) 1.)) (* (ite (>= sltop_28 0) sltop_28 (- sltop_28)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= sltop_10 0) sltop_10 (- sltop_10)) 1.)) (* (ite (>= slbot_15 0) slbot_15 (- slbot_15)) 1.)) (* (ite (>= sltop_29 0) sltop_29 (- sltop_29)) 1.)) (* (ite (>= sltop_12 0) sltop_12 (- sltop_12)) 1.)) (* (ite (>= sltop_22 0) sltop_22 (- sltop_22)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_8 0) sltop_8 (- sltop_8)) 1.)) (* (ite (>= sltop_13 0) sltop_13 (- sltop_13)) 1.)) (* (ite (>= sltop_15 0) sltop_15 (- sltop_15)) 1.)) (* (ite (>= sltop_20 0) sltop_20 (- sltop_20)) 1.)) (* (ite (>= slbot_28 0) slbot_28 (- slbot_28)) 1.)) (* (ite (>= slbot_9 0) slbot_9 (- slbot_9)) 1.)) (* (ite (>= sltop_9 0) sltop_9 (- sltop_9)) 1.)) (* (ite (>= slbot_21 0) slbot_21 (- slbot_21)) 1.)) (* (ite (>= slbot_45 0) slbot_45 (- slbot_45)) 1.)) (* (ite (>= slbot_30 0) slbot_30 (- slbot_30)) 1.)) (* (ite (>= sltop_47 0) sltop_47 (- sltop_47)) 1.)) (* (ite (>= sltop_30 0) sltop_30 (- sltop_30)) 1.)) (* (ite (>= sltop_45 0) sltop_45 (- sltop_45)) 1.)) (* (ite (>= sltop_46 0) sltop_46 (- sltop_46)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= slbot_47 0) slbot_47 (- slbot_47)) 1.)) (* (ite (>= slbot_8 0) slbot_8 (- slbot_8)) 1.)) (* (ite (>= slbot_12 0) slbot_12 (- slbot_12)) 1.)) (* (ite (>= sltop_21 0) sltop_21 (- sltop_21)) 1.))))
(check-sat)
