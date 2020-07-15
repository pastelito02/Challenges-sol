;;savery
(ns kata)
(defn is-divisible [n x y]
  (= (mod n x) (mod n y) 0))
