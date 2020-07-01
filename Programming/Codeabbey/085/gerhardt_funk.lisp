;Author gerhardt_funk
(define (nr num)
  (if (integer? (* 2 num))
      (inexact->exact (round (+ num .00001)))
      (inexact->exact (round num))))

(define (rotate ang x y)
  (let* ([t (* 2 pi (/ ang 360))] [nx (- (* x (cos t)) (* y (sin t)))] [ny (+ (* y (cos t)) (* x (sin t)))])
    (list (round nx) (round ny))))

(define (sublist ls s f)
 (let ([nf (length ls)])
   (cond [(< f nf)
          (set! nf f)])
   (list-tail (take ls nf) s)))

(define (se ls st)
  (let ([y (list-ref st 2)] [val (length ls)])
    (for ([i (in-range 0 (length ls))])
      #:final (< y (list-ref (list-ref ls i) 2))
      (cond [(< y (list-ref (list-ref ls i) 2))
             (set! val i)
             (for ([j (in-range (- i 1) 0 -1)])
               #:break (not (= y (list-ref (list-ref ls j) 2)))
               (cond [(< (list-ref st 1) (list-ref (list-ref ls j) 1))
                      (set! val j)]))]))
    (append (sublist ls 0 val) (list st) (sublist ls val (length ls)))))

(define (sem ls st)
  (if (= 0 (length ls))
      (list st)
      (if (and (= (list-ref (list-ref ls 0) 2) (list-ref st 2)) (> (list-ref (list-ref ls 0) 1) (list-ref st 1)))
          (append (list st) ls)
          (se ls st))))

(define (main ls ang name x y)
  (let ([q (rotate ang x y)])
    (sem ls (list name (list-ref q 0) (list-ref q 1)))))

(define (main1 ang ls retls)
  (if (= 0 (length ls))
      (let ([ret ""])
        (for ([i (in-range 0 (length retls))])
          (set! ret (string-append ret (list-ref (list-ref retls i) 0) " ")))
        ret)
      (main1 ang (list-tail ls 3) (main retls ang (list-ref ls 0) (string->number (list-ref ls 1)) (string->number (list-ref ls 2))))))

(require 2htdp/batch-io)

(define list1 (read-words "p.txt"))

(main1 (string->number (list-ref list1 1)) (list-tail list1 2) '())
        
  