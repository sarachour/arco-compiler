(declare-const sc_A Real)
(declare-const of_A Real)
(declare-const slack_min_A Real)
(declare-const slack_max_A Real)

(assert (= (+ (+ (* 1.0 sc_A) of_A) slack_max_A) 0.01))
(assert (= (+ (+ (* 0.0 sc_A) of_A) slack_max_A) 0.0001))
(minimize (+ slack_max_A slack_min_A))

(check-sat)
(get-model)