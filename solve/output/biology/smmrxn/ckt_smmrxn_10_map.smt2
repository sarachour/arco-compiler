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
; =  {sc.vgain[0].P} {((sc.vgain[0].X/sc.vgain[0].Y)*sc.vgain[0].Z*1)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1)))
; 
; =  {of.vgain[0].P} {0}
(assert (= of_3 0.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[0].P*0.)+of.vgain[0].P)+sl.min.vgain[0].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[0].P*4.)+of.vgain[0].P)+sl.max.vgain[0].P)} {5445000.}
(assert (= (+ (+ (* sc_3 4.) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[0].Z*0.)+of.vgain[0].Z)+sl.min.vgain[0].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[0].Z*1.)+of.vgain[0].Z)+sl.max.vgain[0].Z)} {3300.}
(assert (= (+ (+ (* sc_2 1.) of_2) sltop_2) 3300.))
(declare-fun sc_4 () Real)
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(declare-fun of_5 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_5 sc_4))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_5 of_4))
(declare-fun sc_6 () Real)
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(declare-fun of_7 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_7 sc_6))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_7 of_6))
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_9 sc_8))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_9 of_8))
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_11 sc_10))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_11 of_10))
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_13 sc_12))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_13 of_12))
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
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
(assert (= 0. 0))
(assert (= of_23 0))
(assert (= 0. 0))
(assert (= of_26 0))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].B)}
(assert (= sc_25 (* 1 sc_26)))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].C)} {(1*sc.vadd[1].D)}
(assert (and (= sc_25 (* 1 sc_24)) (= sc_25 (* 1 sc_23))))
(assert (= (- (+ of_25 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1)}
(assert (= sc_27 (* sc_25 1)))
; 
; =  {of.vadd[1].OUT} {0}
(assert (= of_27 0.))
(assert (= 0. 0))
(assert (= of_23 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_26 0))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].B)}
(assert (= sc_25 (* 1 sc_26)))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].C)} {(1*sc.vadd[1].D*1)}
(assert (and (= sc_25 (* 1 sc_24)) (= sc_25 (* (* 1 sc_23) 1))))
(assert (= (- (+ of_25 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1)}
(assert (= sc_28 (* sc_25 1)))
(assert (= of_28 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1)}
(assert (= sc_22 (* sc_25 1)))
; 
; =  {of.vadd[1].OUT2_0} {0}
(assert (= of_22 0.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_28 1.) of_28) sltop_28) 5.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.0001}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.0001))
; 
; =  {(((sc.vadd[1].B*4.)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_26 4.) of_26) sltop_26) 3300.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) -824.99995))
; 
; =  {(((sc.vadd[1].OUT*4.)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_27 4.) of_27) sltop_27) 1649.999975))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_28 1.) of_28) sltop_28) 5.))
(declare-fun sc_29 () Real)
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(declare-fun of_31 () Real)
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
; 
; =  {sc.mm[3].Xtot} {sc.mm[3].XY}
(assert (= sc_33 sc_35))
; 
; =  {sc.mm[3].X} {sc.mm[3].Xtot}
(assert (= sc_34 sc_33))
; 
; =  {of.mm[3].X} {(of.mm[3].Xtot-of.mm[3].XY)}
(assert (= of_34 (- of_33 of_35)))
(assert (= of_29 0))
(assert (= 0. 0))
(assert (= of_32 0))
(assert (= of_34 0))
(assert (= of_36 0))
; 
; =  {(sc.mm[3].kf*sc.mm[3].X*sc.mm[3].Y)} {(sc.mm[3].kr*1)}
(assert (= (* (* sc_32 sc_34) sc_36) (* sc_29 1)))
; 
; =  {sc.mm[3].XY} {(sc.mm[3].kf*sc.mm[3].X*sc.mm[3].Y)}
(assert (= sc_35 (* (* sc_32 sc_34) sc_36)))
(assert (= of_35 0))
(assert (= 0. 0))
; 
; =  {sc.mm[3].XY0} {(sc.mm[3].kf*sc.mm[3].X*sc.mm[3].Y)}
(assert (= sc_30 (* (* sc_32 sc_34) sc_36)))
; 
; =  {of.mm[3].XY0} {(0-0)}
(assert (= of_30 0.))
; 
; =  {sc.mm[3].Ytot} {sc.mm[3].XY}
(assert (= sc_31 sc_35))
; 
; =  {sc.mm[3].Y} {sc.mm[3].Ytot}
(assert (= sc_36 sc_31))
; 
; =  {of.mm[3].Y} {(of.mm[3].Ytot-of.mm[3].XY)}
(assert (= of_36 (- of_31 of_35)))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.mm[3].X*0.)+of.mm[3].X)+sl.min.mm[3].X)} {-0.9999}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) -0.9999))
; 
; =  {(((sc.mm[3].X*1.)+of.mm[3].X)+sl.max.mm[3].X)} {3300.}
(assert (= (+ (+ (* sc_34 1.) of_34) sltop_34) 3300.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.mm[3].XY*0.)+of.mm[3].XY)+sl.min.mm[3].XY)} {0.}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35) 0.))
; 
; =  {(((sc.mm[3].XY*1.)+of.mm[3].XY)+sl.max.mm[3].XY)} {1.}
(assert (= (+ (+ (* sc_35 1.) of_35) sltop_35) 1.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.mm[3].Y*0.)+of.mm[3].Y)+sl.min.mm[3].Y)} {-0.9999}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) -0.9999))
; 
; =  {(((sc.mm[3].Y*1.)+of.mm[3].Y)+sl.max.mm[3].Y)} {3300.}
(assert (= (+ (+ (* sc_36 1.) of_36) sltop_36) 3300.))
(declare-fun sc_37 () Real)
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(declare-fun of_38 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_38 of_37))
(declare-fun sc_39 () Real)
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(declare-fun of_40 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_40 of_39))
(declare-fun sc_41 () Real)
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(declare-fun of_42 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_42 of_41))
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_44 of_43))
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_46 of_45))
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_48 of_47))
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(declare-fun of_50 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_50 sc_49))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_50 of_49))
(declare-fun sc_51 () Real)
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(declare-fun of_52 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_52 sc_51))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_52 of_51))
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
(assert (= of_54 0))
(assert (= of_53 0))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_55 (* sc_54 sc_53)))
; 
; =  {of.itov[2].Y} {0}
(assert (= of_55 0.))
(declare-fun slbot_53 () Real)
(declare-fun sltop_53 () Real)
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X)} {0.0001}
(assert (= (+ (+ (* sc_53 0.) of_53) slbot_53) 0.0001))
; 
; =  {(((sc.itov[2].X*1.)+of.itov[2].X)+sl.max.itov[2].X)} {10.}
(assert (= (+ (+ (* sc_53 1.) of_53) sltop_53) 10.))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55) 0.0001))
; 
; =  {(((sc.itov[2].Y*4.)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_55 4.) of_55) sltop_55) 3300.))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.itov[2].K*0.)+of.itov[2].K)+sl.min.itov[2].K)} {1.}
(assert (= (+ (+ (* sc_54 0.) of_54) slbot_54) 1.))
; 
; =  {(((sc.itov[2].K*4.)+of.itov[2].K)+sl.max.itov[2].K)} {330.}
(assert (= (+ (+ (* sc_54 4.) of_54) sltop_54) 330.))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55) 0.0001))
; 
; =  {(((sc.itov[2].Y*4.)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_55 4.) of_55) sltop_55) 3300.))
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
; 
; =  {sc.iadd[4].A} {sc.iadd[4].B}
(assert (= sc_58 sc_59))
; 
; =  {sc.iadd[4].A} {sc.iadd[4].C} {sc.iadd[4].D}
(assert (and (= sc_58 sc_57) (= sc_58 sc_56)))
; 
; =  {sc.iadd[4].OUT} {sc.iadd[4].A}
(assert (= sc_60 sc_58))
; 
; =  {of.iadd[4].OUT} {((of.iadd[4].A+of.iadd[4].B)-of.iadd[4].C-of.iadd[4].D)}
(assert (= of_60 (- (+ of_58 of_59) (+ of_57 of_56))))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.iadd[4].D*0.)+of.iadd[4].D)+sl.min.iadd[4].D)} {0.}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) 0.))
; 
; =  {(((sc.iadd[4].D*1.)+of.iadd[4].D)+sl.max.iadd[4].D)} {5.}
(assert (= (+ (+ (* sc_56 1.) of_56) sltop_56) 5.))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_60 0.) of_60) slbot_60) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_60 1.) of_60) sltop_60) 10.))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_60 0.) of_60) slbot_60) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_60 1.) of_60) sltop_60) 10.))
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(declare-fun of_62 () Real)
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_62 sc_61))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_62 of_61))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_61 0.) of_61) slbot_61) 0.))
; 
; =  {(((sc.output.I[0].X*1.)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_61 1.) of_61) sltop_61) 10.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_62 0.) of_62) slbot_62) 0.))
; 
; =  {(((sc.output.I[0].O*1.)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_62 1.) of_62) sltop_62) 10.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].B}
(assert (= sc_55 sc_26))
; 
; =  {of.itov[2].Y} {of.vadd[1].B}
(assert (= of_55 of_26))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[3].X}
(assert (= sc_28 sc_18))
; 
; =  {of.vadd[1].OUT2} {of.output.V[3].X}
(assert (= of_28 of_18))
; 
; =  {sc.input.I[0].O} {sc.iadd[4].C}
(assert (= sc_7 sc_57))
; 
; =  {of.input.I[0].O} {of.iadd[4].C}
(assert (= of_7 of_57))
; 
; =  {sc.iadd[4].OUT} {sc.output.I[0].X}
(assert (= sc_60 sc_61))
; 
; =  {of.iadd[4].OUT} {of.output.I[0].X}
(assert (= of_60 of_61))
; 
; =  {sc.input.I[4].O} {sc.mm[3].kf}
(assert (= sc_11 sc_32))
; 
; =  {of.input.I[4].O} {of.mm[3].kf}
(assert (= of_11 of_32))
; 
; =  {sc.input.I[3].O} {sc.mm[3].kr}
(assert (= sc_9 sc_29))
; 
; =  {of.input.I[3].O} {of.mm[3].kr}
(assert (= of_9 of_29))
; 
; =  {sc.mm[3].X} {sc.output.V[1].X}
(assert (= sc_34 sc_20))
; 
; =  {of.mm[3].X} {of.output.V[1].X}
(assert (= of_34 of_20))
; 
; =  {sc.mm[3].X} {sc.vgain[0].Z}
(assert (= sc_34 sc_2))
; 
; =  {of.mm[3].X} {of.vgain[0].Z}
(assert (= of_34 of_2))
; 
; =  {sc.input.I[2].O} {sc.iadd[4].B}
(assert (= sc_5 sc_59))
; 
; =  {of.input.I[2].O} {of.iadd[4].B}
(assert (= of_5 of_59))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].OUT2_0}
(assert (= sc_38 sc_22))
; 
; =  {of.input.V[2].O} {of.vadd[1].OUT2_0}
(assert (= of_38 of_22))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_46 sc_25))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_46 of_25))
; 
; =  {sc.mm[3].Y} {sc.itov[2].X}
(assert (= sc_36 sc_53))
; 
; =  {of.mm[3].Y} {of.itov[2].X}
(assert (= of_36 of_53))
; 
; =  {sc.mm[3].Y} {sc.output.V[0].X}
(assert (= sc_36 sc_16))
; 
; =  {of.mm[3].Y} {of.output.V[0].X}
(assert (= of_36 of_16))
; 
; =  {sc.input.I[1].O} {sc.iadd[4].A}
(assert (= sc_13 sc_58))
; 
; =  {of.input.I[1].O} {of.iadd[4].A}
(assert (= of_13 of_58))
; 
; =  {sc.input.V[1].O} {sc.vgain[0].Y}
(assert (= sc_52 sc_1))
; 
; =  {of.input.V[1].O} {of.vgain[0].Y}
(assert (= of_52 of_1))
; 
; =  {sc.mm[3].XY} {sc.iadd[4].D}
(assert (= sc_35 sc_56))
; 
; =  {of.mm[3].XY} {of.iadd[4].D}
(assert (= of_35 of_56))
; 
; =  {sc.mm[3].XY} {sc.output.V[2].X}
(assert (= sc_35 sc_14))
; 
; =  {of.mm[3].XY} {of.output.V[2].X}
(assert (= of_35 of_14))
; 
; =  {sc.vgain[0].P} {sc.itov[2].K}
(assert (= sc_3 sc_54))
; 
; =  {of.vgain[0].P} {of.itov[2].K}
(assert (= of_3 of_54))
; 
; =  {sc.input.V[7].O} {sc.vgain[0].X}
(assert (= sc_40 sc_0))
; 
; =  {of.input.V[7].O} {of.vgain[0].X}
(assert (= of_40 of_0))
; 
; =  {sc.input.V[0].O} {sc.mm[3].Ytot}
(assert (= sc_42 sc_31))
; 
; =  {of.input.V[0].O} {of.mm[3].Ytot}
(assert (= of_42 of_31))
; 
; =  {sc.input.V[4].O} {sc.mm[3].XY0}
(assert (= sc_48 sc_30))
; 
; =  {of.input.V[4].O} {of.mm[3].XY0}
(assert (= of_48 of_30))
; 
; =  {sc.input.V[5].O} {sc.mm[3].Xtot}
(assert (= sc_50 sc_33))
; 
; =  {of.input.V[5].O} {of.mm[3].Xtot}
(assert (= of_50 of_33))
; 
; =  {sc.input.V[6].O} {sc.vadd[1].D}
(assert (= sc_44 sc_23))
; 
; =  {of.input.V[6].O} {of.vadd[1].D}
(assert (= of_44 of_23))
(assert (<= (* sc_15 0.001) 0.001))
(assert (<= (* sc_19 0.001) 0.001))
; 
; =  {sc.output.V[2].O} {sc.output.V[3].O} {sc.mm[3].XY} {sc.vadd[1].OUT2}
(assert (and (and (= sc_15 sc_19) (= sc_15 sc_35)) (= sc_15 sc_28)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= sltop_36 0) sltop_36 (- sltop_36)) 1.) (* (ite (>= slbot_14 0) slbot_14 (- slbot_14)) 1.)) (* (ite (>= sltop_14 0) sltop_14 (- sltop_14)) 1.)) (* (ite (>= sltop_18 0) sltop_18 (- sltop_18)) 1.)) (* (ite (>= slbot_16 0) slbot_16 (- slbot_16)) 1.)) (* (ite (>= sltop_55 0) sltop_55 (- sltop_55)) 1.)) (* (ite (>= slbot_35 0) slbot_35 (- slbot_35)) 1.)) (* (ite (>= slbot_20 0) slbot_20 (- slbot_20)) 1.)) (* (ite (>= sltop_27 0) sltop_27 (- sltop_27)) 1.)) (* (ite (>= slbot_60 0) slbot_60 (- slbot_60)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= slbot_19 0) slbot_19 (- slbot_19)) 1.)) (* (ite (>= slbot_53 0) slbot_53 (- slbot_53)) 1.)) (* (ite (>= sltop_28 0) sltop_28 (- sltop_28)) 1.)) (* (ite (>= slbot_26 0) slbot_26 (- slbot_26)) 1.)) (* (ite (>= sltop_54 0) sltop_54 (- sltop_54)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= slbot_61 0) slbot_61 (- slbot_61)) 1.)) (* (ite (>= slbot_15 0) slbot_15 (- slbot_15)) 1.)) (* (ite (>= slbot_17 0) slbot_17 (- slbot_17)) 1.)) (* (ite (>= slbot_36 0) slbot_36 (- slbot_36)) 1.)) (* (ite (>= slbot_18 0) slbot_18 (- slbot_18)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_15 0) sltop_15 (- sltop_15)) 1.)) (* (ite (>= sltop_20 0) sltop_20 (- sltop_20)) 1.)) (* (ite (>= slbot_28 0) slbot_28 (- slbot_28)) 1.)) (* (ite (>= sltop_62 0) sltop_62 (- sltop_62)) 1.)) (* (ite (>= slbot_55 0) slbot_55 (- slbot_55)) 1.)) (* (ite (>= slbot_62 0) slbot_62 (- slbot_62)) 1.)) (* (ite (>= sltop_16 0) sltop_16 (- sltop_16)) 1.)) (* (ite (>= slbot_54 0) slbot_54 (- slbot_54)) 1.)) (* (ite (>= slbot_56 0) slbot_56 (- slbot_56)) 1.)) (* (ite (>= sltop_56 0) sltop_56 (- sltop_56)) 1.)) (* (ite (>= slbot_21 0) slbot_21 (- slbot_21)) 1.)) (* (ite (>= sltop_34 0) sltop_34 (- sltop_34)) 1.)) (* (ite (>= sltop_60 0) sltop_60 (- sltop_60)) 1.)) (* (ite (>= sltop_19 0) sltop_19 (- sltop_19)) 1.)) (* (ite (>= sltop_53 0) sltop_53 (- sltop_53)) 1.)) (* (ite (>= sltop_61 0) sltop_61 (- sltop_61)) 1.)) (* (ite (>= sltop_17 0) sltop_17 (- sltop_17)) 1.)) (* (ite (>= slbot_34 0) slbot_34 (- slbot_34)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= sltop_26 0) sltop_26 (- sltop_26)) 1.)) (* (ite (>= sltop_35 0) sltop_35 (- sltop_35)) 1.)) (* (ite (>= slbot_27 0) slbot_27 (- slbot_27)) 1.)) (* (ite (>= sltop_21 0) sltop_21 (- sltop_21)) 1.))))
(check-sat)
