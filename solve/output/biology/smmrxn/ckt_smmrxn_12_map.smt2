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
; =  {sc.vgain[0].P} {((sc.vgain[0].X/sc.vgain[0].Y)*sc.vgain[0].Z*1)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1)))
; 
; =  {of.vgain[0].P} {0}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[0].X*1.)+of.vgain[0].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[0].X*1.)+of.vgain[0].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[0].Y*0.125)+of.vgain[0].Y)} {3300.}
(assert (<= (+ (* sc_1 0.125) of_1) 3300.))
; 
; <=  {((sc.vgain[0].Y*0.125)+of.vgain[0].Y)} {1.}
(assert (>= (+ (* sc_1 0.125) of_1) 1.))
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
(declare-fun sc_6 () Real)
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(declare-fun of_7 () Real)
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(assert (= sc_8 1))
(assert (= of_8 0))
; 
; =  {sc.switch[2].PROD} {(sc.switch[2].Vmax/1)}
(assert (= sc_8 (/ sc_7 1)))
; 
; =  {of.switch[2].PROD} {0}
(assert (= of_8 0.))
; 
; >=  {((sc.switch[2].n*0.)+of.switch[2].n)} {5.}
(assert (<= (+ (* sc_5 0.) of_5) 5.))
; 
; <=  {((sc.switch[2].n*0.)+of.switch[2].n)} {0.5}
(assert (>= (+ (* sc_5 0.) of_5) 0.5))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.switch[2].Vmax*0.)+of.switch[2].Vmax)+sl.min.switch[2].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 0.0001))
; 
; =  {(((sc.switch[2].Vmax*1.)+of.switch[2].Vmax)+sl.max.switch[2].Vmax)} {10.}
(assert (= (+ (+ (* sc_7 1.) of_7) sltop_7) 10.))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[2].PROD*0.)+of.switch[2].PROD)+sl.min.switch[2].PROD)} {6.20921323059e-10}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 6.20921323059e-10))
; 
; =  {(((sc.switch[2].PROD*1.)+of.switch[2].PROD)+sl.max.switch[2].PROD)} {9.99995000037}
(assert (= (+ (+ (* sc_8 1.) of_8) sltop_8) 9.99995000037))
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(assert (= sc_10 1))
(assert (= of_10 0))
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_10 sc_9))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_10 of_9))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_9 0.) of_9) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_9 0.) of_9) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_10 0.) of_10) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_10 0.) of_10) 0.))
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(assert (= sc_12 1))
(assert (= of_12 0))
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_12 sc_11))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_12 of_11))
; 
; >=  {((sc.input.I[0].X*0.11)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_11 0.11) of_11) 10.))
; 
; <=  {((sc.input.I[0].X*0.11)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_11 0.11) of_11) 0.))
; 
; >=  {((sc.input.I[0].O*0.11)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_12 0.11) of_12) 10.))
; 
; <=  {((sc.input.I[0].O*0.11)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_12 0.11) of_12) 0.))
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(assert (= sc_14 1))
(assert (= of_14 0))
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_14 sc_13))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_14 of_13))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_13 0.) of_13) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(declare-fun of_16 () Real)
(assert (= sc_16 1))
(assert (= of_16 0))
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_16 0.) of_16) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
(declare-fun sc_17 () Real)
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(declare-fun of_18 () Real)
(assert (= sc_18 1))
(assert (= of_18 0))
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[5].X*0.15)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_17 0.15) of_17) 10.))
; 
; <=  {((sc.input.I[5].X*0.15)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_17 0.15) of_17) 0.))
; 
; >=  {((sc.input.I[5].O*0.15)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_18 0.15) of_18) 10.))
; 
; <=  {((sc.input.I[5].O*0.15)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_18 0.15) of_18) 0.))
(declare-fun sc_19 () Real)
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(declare-fun of_20 () Real)
(assert (= sc_20 1))
(assert (= of_20 0))
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
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(declare-fun of_22 () Real)
(assert (= sc_22 1))
(assert (= of_22 0))
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_22 sc_21))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_22 of_21))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_21 1.) of_21) sltop_21) 3300.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_22 1.) of_22) sltop_22) 3300.))
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
(assert (= sc_28 1))
(assert (= of_28 0))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1)}
(assert (= sc_28 (* sc_26 1)))
; 
; =  {of.vadd[1].OUT} {0}
(assert (= of_28 0.))
(assert (= sc_29 1))
(assert (= of_29 0))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1)}
(assert (= sc_29 (* sc_26 1)))
(assert (= of_29 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1)}
(assert (= sc_23 (* sc_26 1)))
; 
; =  {of.vadd[1].OUT2_0} {0}
(assert (= of_23 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_23 0.) of_23) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
; 
; >=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_24 4.) of_24) 3300.))
; 
; <=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {0.0001}
(assert (>= (+ (* sc_24 4.) of_24) 0.0001))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_25 0.) of_25) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.0001}
(assert (>= (+ (* sc_25 0.) of_25) 0.0001))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_26 0.) of_26) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.0001}
(assert (>= (+ (* sc_26 0.) of_26) 0.0001))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_29 1.) of_29) sltop_29) 5.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.0001}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 0.0001))
; 
; =  {(((sc.vadd[1].B*4.)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_27 4.) of_27) sltop_27) 3300.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1649.99995}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) -1649.99995))
; 
; =  {(((sc.vadd[1].OUT*4.)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1649.99995}
(assert (= (+ (+ (* sc_28 4.) of_28) sltop_28) 1649.99995))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_29 1.) of_29) sltop_29) 5.))
(declare-fun sc_30 () Real)
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(declare-fun of_32 () Real)
(assert (= sc_32 1))
(assert (= of_32 0))
; 
; =  {sc.vtoi[0].Y} {((1/sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_32 (* (/ 1 sc_31) sc_30)))
; 
; =  {of.vtoi[0].Y} {0}
(assert (= of_32 0.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 1.))
; 
; =  {(((sc.vtoi[0].X*1.)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_30 1.) of_30) sltop_30) 3300.))
; 
; >=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_31 1.) of_31) 3300.))
; 
; <=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_31 1.) of_31) 1.))
(declare-fun slbot_32 () Real)
(declare-fun sltop_32 () Real)
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*1.)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_32 1.) of_32) sltop_32) 3300.))
(declare-fun sc_33 () Real)
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(declare-fun of_34 () Real)
(assert (= sc_34 1))
(assert (= of_34 0))
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_33 0.) of_33) 5.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_34 0.) of_34) 5.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
(declare-fun sc_35 () Real)
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(declare-fun of_36 () Real)
(assert (= sc_36 1))
(assert (= of_36 0))
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {5.}
(assert (<= (+ (* sc_35 0.) of_35) 5.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {5.}
(assert (<= (+ (* sc_36 0.) of_36) 5.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
(declare-fun sc_37 () Real)
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(declare-fun of_38 () Real)
(assert (= sc_38 1))
(assert (= of_38 0))
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.V[9].X*1.)+of.input.V[9].X)} {5.}
(assert (<= (+ (* sc_37 1.) of_37) 5.))
; 
; <=  {((sc.input.V[9].X*1.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_37 1.) of_37) 0.))
; 
; >=  {((sc.input.V[9].O*1.)+of.input.V[9].O)} {5.}
(assert (<= (+ (* sc_38 1.) of_38) 5.))
; 
; <=  {((sc.input.V[9].O*1.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_38 1.) of_38) 0.))
(declare-fun sc_39 () Real)
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(declare-fun of_40 () Real)
(assert (= sc_40 1))
(assert (= of_40 0))
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_40 of_39))
; 
; >=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_39 0.125) of_39) 5.))
; 
; <=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_39 0.125) of_39) 0.))
; 
; >=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_40 0.125) of_40) 5.))
; 
; <=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_40 0.125) of_40) 0.))
(declare-fun sc_41 () Real)
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(declare-fun of_42 () Real)
(assert (= sc_42 1))
(assert (= of_42 0))
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_42 of_41))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {5.}
(assert (<= (+ (* sc_41 0.) of_41) 5.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {5.}
(assert (<= (+ (* sc_42 0.) of_42) 5.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
(assert (= sc_44 1))
(assert (= of_44 0))
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_44 of_43))
; 
; >=  {((sc.input.V[4].X*4.)+of.input.V[4].X)} {5.}
(assert (<= (+ (* sc_43 4.) of_43) 5.))
; 
; <=  {((sc.input.V[4].X*4.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_43 4.) of_43) 0.))
; 
; >=  {((sc.input.V[4].O*4.)+of.input.V[4].O)} {5.}
(assert (<= (+ (* sc_44 4.) of_44) 5.))
; 
; <=  {((sc.input.V[4].O*4.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_44 4.) of_44) 0.))
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
(assert (= sc_46 1))
(assert (= of_46 0))
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_46 of_45))
; 
; >=  {((sc.input.V[5].X*1.)+of.input.V[5].X)} {5.}
(assert (<= (+ (* sc_45 1.) of_45) 5.))
; 
; <=  {((sc.input.V[5].X*1.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_45 1.) of_45) 0.))
; 
; >=  {((sc.input.V[5].O*1.)+of.input.V[5].O)} {5.}
(assert (<= (+ (* sc_46 1.) of_46) 5.))
; 
; <=  {((sc.input.V[5].O*1.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_46 1.) of_46) 0.))
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
(assert (= sc_48 1))
(assert (= of_48 0))
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_48 of_47))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_47 0.) of_47) 5.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_48 0.) of_48) 5.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(declare-fun of_51 () Real)
(assert (= sc_51 1))
(assert (= of_51 0))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_51 (* sc_50 sc_49)))
; 
; =  {of.itov[2].Y} {0}
(assert (= of_51 0.))
(declare-fun slbot_49 () Real)
(declare-fun sltop_49 () Real)
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X)} {0.0001}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49) 0.0001))
; 
; =  {(((sc.itov[2].X*1.)+of.itov[2].X)+sl.max.itov[2].X)} {10.}
(assert (= (+ (+ (* sc_49 1.) of_49) sltop_49) 10.))
(declare-fun slbot_51 () Real)
(declare-fun sltop_51 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_51 0.) of_51) slbot_51) 0.0001))
; 
; =  {(((sc.itov[2].Y*4.)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_51 4.) of_51) sltop_51) 3300.))
(declare-fun slbot_50 () Real)
(declare-fun sltop_50 () Real)
; 
; =  {(((sc.itov[2].K*0.)+of.itov[2].K)+sl.min.itov[2].K)} {1.}
(assert (= (+ (+ (* sc_50 0.) of_50) slbot_50) 1.))
; 
; =  {(((sc.itov[2].K*4.)+of.itov[2].K)+sl.max.itov[2].K)} {330.}
(assert (= (+ (+ (* sc_50 4.) of_50) sltop_50) 330.))
(declare-fun slbot_51 () Real)
(declare-fun sltop_51 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_51 0.) of_51) slbot_51) 0.0001))
; 
; =  {(((sc.itov[2].Y*4.)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_51 4.) of_51) sltop_51) 3300.))
(declare-fun sc_52 () Real)
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
(assert (= sc_56 1))
(assert (= of_56 0))
; 
; =  {sc.iadd[3].OUT} {sc.iadd[3].A}
(assert (= sc_56 sc_54))
; 
; =  {of.iadd[3].OUT} {((of.iadd[3].A+of.iadd[3].B)-of.iadd[3].C-of.iadd[3].D)}
(assert (= of_56 (- (+ of_54 of_55) (+ of_53 of_52))))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.iadd[3].D*0.)+of.iadd[3].D)+sl.min.iadd[3].D)} {0.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) 0.))
; 
; =  {(((sc.iadd[3].D*1.)+of.iadd[3].D)+sl.max.iadd[3].D)} {5.}
(assert (= (+ (+ (* sc_52 1.) of_52) sltop_52) 5.))
; 
; >=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {5.}
(assert (<= (+ (* sc_53 0.) of_53) 5.))
; 
; <=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) -10.))
; 
; =  {(((sc.iadd[3].OUT*1.)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_56 1.) of_56) sltop_56) 10.))
; 
; >=  {((sc.iadd[3].A*0.11)+of.iadd[3].A)} {5.}
(assert (<= (+ (* sc_54 0.11) of_54) 5.))
; 
; <=  {((sc.iadd[3].A*0.11)+of.iadd[3].A)} {0.}
(assert (>= (+ (* sc_54 0.11) of_54) 0.))
; 
; >=  {((sc.iadd[3].B*0.)+of.iadd[3].B)} {5.}
(assert (<= (+ (* sc_55 0.) of_55) 5.))
; 
; <=  {((sc.iadd[3].B*0.)+of.iadd[3].B)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) -10.))
; 
; =  {(((sc.iadd[3].OUT*1.)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_56 1.) of_56) sltop_56) 10.))
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
(assert (= sc_61 1))
(assert (= of_61 0))
; 
; =  {sc.iadd[4].OUT} {sc.iadd[4].A}
(assert (= sc_61 sc_59))
; 
; =  {of.iadd[4].OUT} {((of.iadd[4].A+of.iadd[4].B)-of.iadd[4].C-of.iadd[4].D)}
(assert (= of_61 (- (+ of_59 of_60) (+ of_58 of_57))))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.iadd[4].D*0.)+of.iadd[4].D)+sl.min.iadd[4].D)} {0.}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) 0.))
; 
; =  {(((sc.iadd[4].D*1.)+of.iadd[4].D)+sl.max.iadd[4].D)} {5.}
(assert (= (+ (+ (* sc_57 1.) of_57) sltop_57) 5.))
; 
; >=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {5.}
(assert (<= (+ (* sc_58 0.) of_58) 5.))
; 
; <=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_61 0.) of_61) slbot_61) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_61 1.) of_61) sltop_61) 10.))
; 
; >=  {((sc.iadd[4].A*0.)+of.iadd[4].A)} {5.}
(assert (<= (+ (* sc_59 0.) of_59) 5.))
; 
; <=  {((sc.iadd[4].A*0.)+of.iadd[4].A)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
; 
; >=  {((sc.iadd[4].B*0.15)+of.iadd[4].B)} {5.}
(assert (<= (+ (* sc_60 0.15) of_60) 5.))
; 
; <=  {((sc.iadd[4].B*0.15)+of.iadd[4].B)} {0.}
(assert (>= (+ (* sc_60 0.15) of_60) 0.))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_61 0.) of_61) slbot_61) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_61 1.) of_61) sltop_61) 10.))
(declare-fun sc_62 () Real)
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(declare-fun of_63 () Real)
(assert (= sc_63 1))
(assert (= of_63 0))
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_63 sc_62))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_63 of_62))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_62 0.) of_62) slbot_62) 0.))
; 
; =  {(((sc.output.I[0].X*1.)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_62 1.) of_62) sltop_62) 10.))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63) 0.))
; 
; =  {(((sc.output.I[0].O*1.)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_63 1.) of_63) sltop_63) 10.))
(declare-fun sc_64 () Real)
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(declare-fun of_65 () Real)
(assert (= sc_65 1))
(assert (= of_65 0))
; 
; =  {sc.output.I[1].O} {sc.output.I[1].X}
(assert (= sc_65 sc_64))
; 
; =  {of.output.I[1].O} {of.output.I[1].X}
(assert (= of_65 of_64))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.output.I[1].X*0.)+of.output.I[1].X)+sl.min.output.I[1].X)} {0.}
(assert (= (+ (+ (* sc_64 0.) of_64) slbot_64) 0.))
; 
; =  {(((sc.output.I[1].X*1.)+of.output.I[1].X)+sl.max.output.I[1].X)} {10.}
(assert (= (+ (+ (* sc_64 1.) of_64) sltop_64) 10.))
(declare-fun slbot_65 () Real)
(declare-fun sltop_65 () Real)
; 
; =  {(((sc.output.I[1].O*0.)+of.output.I[1].O)+sl.min.output.I[1].O)} {0.}
(assert (= (+ (+ (* sc_65 0.) of_65) slbot_65) 0.))
; 
; =  {(((sc.output.I[1].O*1.)+of.output.I[1].O)+sl.max.output.I[1].O)} {10.}
(assert (= (+ (+ (* sc_65 1.) of_65) sltop_65) 10.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].B}
(assert (= sc_51 sc_27))
; 
; =  {of.itov[2].Y} {of.vadd[1].B}
(assert (= of_51 of_27))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].X}
(assert (= sc_29 sc_21))
; 
; =  {of.vadd[1].OUT2} {of.output.V[0].X}
(assert (= of_29 of_21))
; 
; =  {sc.vadd[1].OUT2} {sc.vtoi[0].X}
(assert (= sc_29 sc_30))
; 
; =  {of.vadd[1].OUT2} {of.vtoi[0].X}
(assert (= of_29 of_30))
; 
; =  {sc.vadd[1].OUT2} {sc.switch[2].Vmax}
(assert (= sc_29 sc_7))
; 
; =  {of.vadd[1].OUT2} {of.switch[2].Vmax}
(assert (= of_29 of_7))
; 
; =  {sc.input.I[0].O} {sc.iadd[3].A}
(assert (= sc_12 sc_54))
; 
; =  {of.input.I[0].O} {of.iadd[3].A}
(assert (= of_12 of_54))
; 
; =  {sc.input.V[9].O} {sc.vtoi[0].K}
(assert (= sc_38 sc_31))
; 
; =  {of.input.V[9].O} {of.vtoi[0].K}
(assert (= of_38 of_31))
; 
; =  {sc.iadd[4].OUT} {sc.output.I[1].X}
(assert (= sc_61 sc_64))
; 
; =  {of.iadd[4].OUT} {of.output.I[1].X}
(assert (= of_61 of_64))
; 
; =  {sc.iadd[4].OUT} {sc.vgain[0].Z}
(assert (= sc_61 sc_2))
; 
; =  {of.iadd[4].OUT} {of.vgain[0].Z}
(assert (= of_61 of_2))
; 
; =  {sc.input.I[4].O} {sc.iadd[4].A}
(assert (= sc_16 sc_59))
; 
; =  {of.input.I[4].O} {of.iadd[4].A}
(assert (= of_16 of_59))
; 
; =  {sc.input.I[3].O} {sc.iadd[4].C}
(assert (= sc_14 sc_58))
; 
; =  {of.input.I[3].O} {of.iadd[4].C}
(assert (= of_14 of_58))
; 
; =  {sc.input.I[5].O} {sc.iadd[4].B}
(assert (= sc_18 sc_60))
; 
; =  {of.input.I[5].O} {of.iadd[4].B}
(assert (= of_18 of_60))
; 
; =  {sc.vtoi[0].Y} {sc.iadd[3].D}
(assert (= sc_32 sc_52))
; 
; =  {of.vtoi[0].Y} {of.iadd[3].D}
(assert (= of_32 of_52))
; 
; =  {sc.input.V[8].O} {sc.switch[2].n}
(assert (= sc_36 sc_5))
; 
; =  {of.input.V[8].O} {of.switch[2].n}
(assert (= of_36 of_5))
; 
; =  {sc.input.I[2].O} {sc.iadd[3].C}
(assert (= sc_10 sc_53))
; 
; =  {of.input.I[2].O} {of.iadd[3].C}
(assert (= of_10 of_53))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_42 sc_26))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_42 of_26))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].C}
(assert (= sc_34 sc_25))
; 
; =  {of.input.V[2].O} {of.vadd[1].C}
(assert (= of_34 of_25))
; 
; =  {sc.input.I[1].O} {sc.iadd[3].B}
(assert (= sc_20 sc_55))
; 
; =  {of.input.I[1].O} {of.iadd[3].B}
(assert (= of_20 of_55))
; 
; =  {sc.input.V[1].O} {sc.vadd[1].OUT2_0}
(assert (= sc_48 sc_23))
; 
; =  {of.input.V[1].O} {of.vadd[1].OUT2_0}
(assert (= of_48 of_23))
; 
; =  {sc.iadd[3].OUT} {sc.itov[2].X}
(assert (= sc_56 sc_49))
; 
; =  {of.iadd[3].OUT} {of.itov[2].X}
(assert (= of_56 of_49))
; 
; =  {sc.iadd[3].OUT} {sc.output.I[0].X}
(assert (= sc_56 sc_62))
; 
; =  {of.iadd[3].OUT} {of.output.I[0].X}
(assert (= of_56 of_62))
; 
; =  {sc.vgain[0].P} {sc.itov[2].K}
(assert (= sc_3 sc_50))
; 
; =  {of.vgain[0].P} {of.itov[2].K}
(assert (= of_3 of_50))
; 
; =  {sc.input.V[0].O} {sc.vgain[0].Y}
(assert (= sc_40 sc_1))
; 
; =  {of.input.V[0].O} {of.vgain[0].Y}
(assert (= of_40 of_1))
; 
; =  {sc.switch[2].PROD} {sc.iadd[4].D}
(assert (= sc_8 sc_57))
; 
; =  {of.switch[2].PROD} {of.iadd[4].D}
(assert (= of_8 of_57))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].D}
(assert (= sc_44 sc_24))
; 
; =  {of.input.V[4].O} {of.vadd[1].D}
(assert (= of_44 of_24))
; 
; =  {sc.input.V[5].O} {sc.vgain[0].X}
(assert (= sc_46 sc_0))
; 
; =  {of.input.V[5].O} {of.vgain[0].X}
(assert (= of_46 of_0))
(assert (<= (* sc_22 0.001) 0.001))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].O}
(assert (= sc_29 sc_22))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= slbot_29 0) slbot_29 (- slbot_29)) 1.) (* (ite (>= slbot_22 0) slbot_22 (- slbot_22)) 1.)) (* (ite (>= slbot_32 0) slbot_32 (- slbot_32)) 1.)) (* (ite (>= sltop_52 0) sltop_52 (- sltop_52)) 1.)) (* (ite (>= sltop_32 0) sltop_32 (- sltop_32)) 1.)) (* (ite (>= slbot_49 0) slbot_49 (- slbot_49)) 1.)) (* (ite (>= sltop_27 0) sltop_27 (- sltop_27)) 1.)) (* (ite (>= sltop_65 0) sltop_65 (- sltop_65)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= slbot_63 0) slbot_63 (- slbot_63)) 1.)) (* (ite (>= sltop_28 0) sltop_28 (- sltop_28)) 1.)) (* (ite (>= slbot_64 0) slbot_64 (- slbot_64)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= slbot_61 0) slbot_61 (- slbot_61)) 1.)) (* (ite (>= sltop_7 0) sltop_7 (- sltop_7)) 1.)) (* (ite (>= sltop_29 0) sltop_29 (- sltop_29)) 1.)) (* (ite (>= sltop_49 0) sltop_49 (- sltop_49)) 1.)) (* (ite (>= sltop_22 0) sltop_22 (- sltop_22)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_8 0) sltop_8 (- sltop_8)) 1.)) (* (ite (>= slbot_28 0) slbot_28 (- slbot_28)) 1.)) (* (ite (>= sltop_57 0) sltop_57 (- sltop_57)) 1.)) (* (ite (>= sltop_62 0) sltop_62 (- sltop_62)) 1.)) (* (ite (>= slbot_57 0) slbot_57 (- slbot_57)) 1.)) (* (ite (>= slbot_62 0) slbot_62 (- slbot_62)) 1.)) (* (ite (>= slbot_65 0) slbot_65 (- slbot_65)) 1.)) (* (ite (>= slbot_52 0) slbot_52 (- slbot_52)) 1.)) (* (ite (>= slbot_56 0) slbot_56 (- slbot_56)) 1.)) (* (ite (>= sltop_56 0) sltop_56 (- sltop_56)) 1.)) (* (ite (>= slbot_21 0) slbot_21 (- slbot_21)) 1.)) (* (ite (>= slbot_51 0) slbot_51 (- slbot_51)) 1.)) (* (ite (>= sltop_51 0) sltop_51 (- sltop_51)) 1.)) (* (ite (>= slbot_30 0) slbot_30 (- slbot_30)) 1.)) (* (ite (>= slbot_50 0) slbot_50 (- slbot_50)) 1.)) (* (ite (>= sltop_30 0) sltop_30 (- sltop_30)) 1.)) (* (ite (>= sltop_64 0) sltop_64 (- sltop_64)) 1.)) (* (ite (>= sltop_50 0) sltop_50 (- sltop_50)) 1.)) (* (ite (>= sltop_61 0) sltop_61 (- sltop_61)) 1.)) (* (ite (>= sltop_63 0) sltop_63 (- sltop_63)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= slbot_27 0) slbot_27 (- slbot_27)) 1.)) (* (ite (>= slbot_7 0) slbot_7 (- slbot_7)) 1.)) (* (ite (>= slbot_8 0) slbot_8 (- slbot_8)) 1.)) (* (ite (>= sltop_21 0) sltop_21 (- sltop_21)) 1.))))
(check-sat)
