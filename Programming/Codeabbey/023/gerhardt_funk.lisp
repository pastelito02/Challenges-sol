;Author gerhardt_funk
(define (chksm ls ret)
  (if (= 0 (length ls))
      ret
      (chksm (cdr ls) (modulo (* (+ ret (car ls)) 113) 10000007))))

(define (slice ls s f currnum currsl)
  (if (or (= currnum f) (= 0 (length ls))) currsl
      (if (< currnum s) (slice (cdr ls) s f (+ 1 currnum) currsl)
          (slice (cdr ls) s f (+ 1 currnum) (append currsl (list(car ls)))))))

(define (sublist ls s f)
  (slice ls s f 0 '()))

(define (main ls place ret)
  (if (= place (length ls))
      (list ret ls)
      (if (> (list-ref ls (- place 1)) (list-ref ls place))
          (main (append (sublist ls 0 (- place 1)) (list (list-ref ls place) (list-ref ls (- place 1))) (sublist ls (+ place 1) (length ls))) (+ 1 place) (+ 1 ret))
          (main ls (+ 1 place) ret))))

(define (main1 ls)
  (let ([q (main ls 1 0)])
    (list (list-ref q 0) (chksm (list-ref q 1) 0))))
