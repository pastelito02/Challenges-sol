(ns century.core)

(defn century [year]
  (+ 1 (quot (- year 1) 100)))
