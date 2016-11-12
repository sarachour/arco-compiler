(declare-const sc_A Real)
(declare-const of_A Real)
(declare-const slack_min_A Real)
(declare-const slack_max_A Real)

(declare-const sc_B Real)
(declare-const of_B Real)
(declare-const slack_min_B Real)
(declare-const slack_max_B Real)

(declare-const sc_C Real)
(declare-const of_C Real)
(declare-const slack_min_C Real)
(declare-const slack_max_C Real)


(assert (= (+ (+ (* 1.0 sc_A) of_A) slack_max_A) 0.01))
(assert (= (+ (+ (* 0.0 sc_A) of_A) slack_min_A) 0.0001))

(assert (= (+ (+ (* 1.0 sc_B) of_B) slack_max_B) 0.02))
(assert (= (+ (+ (* 0.0 sc_B) of_B) slack_min_B) 0.0001))

(assert (= (+ (+ (* 1.0 sc_C) of_C) slack_max_C) 0.0002))
(assert (= (+ (+ (* 0.0 sc_C) of_C) slack_min_C) 0.00000001))

(assert (= (* sc_A sc_B) sc_C))

(assert (< (+ sc_A sc_B) 2))
(assert (= 0 of_C))

(assert (= 0 of_A))
(assert (= 0 of_B))


(minimize 
(+
  (+
    (+ slack_max_A slack_min_A) 
    (* (+ slack_min_C slack_max_C) 4)
  )
  (+ slack_max_B slack_min_B)
)
)
(check-sat)
(get-model)
