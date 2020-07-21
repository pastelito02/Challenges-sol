;hitori
(ns expression.matter)

(defn expression-matter [a b c]
  (max
   (+ a b c)
   (* a b c)
   (+ a (* b c))
   (* a (+ b c))
   (+ (* a b) c)
   (* (+ a b) c)))
