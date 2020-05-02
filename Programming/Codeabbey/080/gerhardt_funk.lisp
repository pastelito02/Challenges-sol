;Author gerhardt_funk
(define (mround num)
  (inexact->exact (round (+ num .0001))))

(define (prob A B)
  (let ([pa (/ A 100)] [pb (/ B 100)])
    (mround (* 100 (/ pa (- 1 (* (- 1 pa) (- 1 pb))))))))

(define (main ls ret)
  (if (= 0 (length ls))
      ret
      (main (list-tail ls 2) (append ret (list (prob (list-ref ls 0) (list-ref ls 1)))))))
