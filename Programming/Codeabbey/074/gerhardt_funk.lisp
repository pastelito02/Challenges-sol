;Author gerhardt_funk
(define (hxy num)
  (if (not (< num 12))
    (let ([q (- (/ pi 2) (* (/ (- num 12) 12) 2 pi))])
    (list (+ (* 6 (cos q)) 10) (+ (* 6 (sin q)) 10)))
    (let ([q (- (/ pi 2) (* (/ num 12) 2 pi))])
    (list (+ (* 6 (cos q)) 10) (+ (* 6 (sin q)) 10)))))

(define (mxy num)
  (let ([q (- (/ pi 2) (* (/ num 60) 2 pi))])
    (list (+ (* 9 (cos q)) 10) (+ (* 9 (sin q)) 10))))

(define (con str cur cur1 ret)
  (if (= (string-length str) cur)
    (append ret (list (string->number cur1)))
    (if (or (equal? (substring str cur (+ cur 1)) ":") (equal? (substring str cur (+ cur 1)) " "))
      (con str (+ cur 1) "" (append ret (list (string->number cur1))))
      (con str (+ cur 1) (string-append cur1 (substring str cur (+ cur 1))) ret))))

(define (main ls ret)
  (if (equal? (length ls) 0)
    ret
    (main (list-tail ls 2) (append ret (hxy (+ (list-ref ls 0) (/ (list-ref ls 1) 60))) (mxy (list-ref ls 1))))))
