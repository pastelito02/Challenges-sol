;Author gerhardt_funk
(define (next cur change)
  (if (list-ref cur 0)
      (if (= (list-ref cur 1) change)
          (list #f (- (list-ref cur 1) 1))
          (list #t (+ (list-ref cur 1) 1)))
      (if (= (list-ref cur 1) 0)
             (list #t 1)
             (list #f (- (list-ref cur 1) 1)))))

(define (main curx chx cury chy ret)
  (if (= 202 (length ret))
      ret
      (let ([qx (next curx chx)] [qy (next cury chy)])
        (main qx chx qy chy (append ret (list (list-ref qx 1) (list-ref qy 1)))))))

(define (main1 w h l)
  (let ([chx (- w l)] [chy (- h 1)])
    (main (list #t 0) chx (list #t 0) chy (list 0 0))))
