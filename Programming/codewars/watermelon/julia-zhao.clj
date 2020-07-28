;julia-zhao
(ns kata)
(defn divide [n]
  (if (and (> n 2) (even? n))
    true
    false))
