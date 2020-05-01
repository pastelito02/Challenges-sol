;Author gerhardt_funk
(define (primesto n)
  (let ([vec (make-vector n #t)] [ret '()])
        (for ([i (in-range 2 n)])
          (cond [(vector-ref vec i)
                 (set! ret (cons i ret))
                 (for ([j (in-range (* i i) n i)])
                   (vector-set! vec j #f))]))
        (reverse ret)))

(define primes (primesto 1000000))

(define (factor n ret cur)
  (if (= n 1)
      ret
      (let* ([q (list-ref primes cur)] [q1 (/ n q)])
        (if (integer? q1)
            (factor q1 (append ret (list q)) cur)
            (factor n ret (+ 1 cur))))))

(define (con ls ret)
  (if (= 1 (length ls))
      (string-append ret (number->string (list-ref ls 0)))
      (con (cdr ls) (string-append ret (number->string (list-ref ls 0)) "*"))))

(define (main ls ret)
  (if (= 0 (length ls))
      ret
      (main (cdr ls) (string-append ret (con (factor (car ls) '() 0) "") " "))))
