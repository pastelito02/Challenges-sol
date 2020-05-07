;Author gerhardt_funk
(define (sublist ls s f)
  (list-tail (take ls f) s))

(define (ord ls)
  (let ([ret ls])
  (for ([i (in-range 1 (length ls))])
    #:final (< (list-ref ls i) (list-ref ls (- i 1)))
    (cond [(< (list-ref ls i) (list-ref ls (- i 1)))
       (set! ret (append (sublist ls 0 (- i 1)) (list (list-ref ls i) (list-ref ls (- i 1))) (sublist ls (+ 1 i) (length ls))))]))
  ret))

(define (ordm ls)
  (let ([q (ord ls)])
  (if (equal? q ls)
    q
    (ordm q))))

(define (c ls ret)
  (if (= 0 (length ls))
    (ordm ret)
    (let ([val (car ls)] [cur 0] [nls '()])
    (for ([i (in-range 0 (length ls))])
      (if (= val (list-ref ls i))
        (set! cur (+ cur 1))
        (set! nls (append nls (list (list-ref ls i))))))
    (c nls (append ret (list cur))))))

(define (s ls val)
  (let ([ret #f])
  (for ([i (in-range 0 (length ls))])
    (cond [(= (list-ref ls i) val)
       (set! ret #t)]))
  ret))

(define (tp ls)
  (let ([cur 0])
  (for ([i (in-range 0 (length ls))])
    (cond [(= 2 (list-ref ls i))
      (set! cur (+ cur 1))]))
  (= cur 2)))

(define (main ls)
  (let ([q (ordm ls)])
  (if (equal? q '(2 3 4 5 6))
    "big-straight"
    (if (equal? q '(1 2 3 4 5))
      "small-straight"
      (let ([q1 (c q '())])
        (if (and (s q1 3) (s q1 2))
          "full-house"
          (if (tp q1)
            "two-pairs"
            (if (s q1 5)
              "yacht"
              (if (s q1 4)
                "four"
                (if (s q1 3)
                  "three"
                  (if (s q1 2)
                    "pair"
                    "none")))))))))))
(define (main1 ls ret)
  (if (= (length ls) 0)
    ret
    (main1 (list-tail ls 5) (string-append ret (main (list (string->number (list-ref ls 0))
                              (string->number (list-ref ls 1))
                              (string->number (list-ref ls 2))
                              (string->number (list-ref ls 3))
                              (string->number (list-ref ls 4)))) " "))))


(require 2htdp/batch-io)

(main1 (read-words "p.txt") "")
