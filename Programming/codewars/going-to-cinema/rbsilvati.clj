;; rbsilvati
(ns movie.core)

(defn movie [card ticket perc]
  (let [a1 (* ticket perc)]
    (reduce (fn [a v] (if (>= (Math/ceil (+ card a)) (* ticket (- v 1)))
                        (+ a (* ticket (Math/pow perc v)))
                        (reduced (- v 1)))) a1 (iterate inc 2))))
