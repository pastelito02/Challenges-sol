;Author gerhardt_funk
(define lett (list "A" "B" "C" "D" "E" "F"))

(define (ang str)
  (let ([ret 0])
    (for ([i (in-range 0 6)])
      (cond [ (equal? (list-ref lett i) str)
               (set! ret (* i (/ pi 3)))]))
    ret))

(define (main str x y)
  (if (= (string-length str) 0)
      (sqrt (+ (* x x) (* y y)))
      (let ([q (ang (substring str 0 1))])
        (main (substring str 1 (string-length str)) (+ x (cos q)) (+ y (sin q))))))

(define (main1 ls ret)
  (if (= 0 (length ls))
      ret
      (main1 (cdr ls) (append ret (list (main (car ls) 0 0))))))

(require 2htdp/batch-io)

(main1 (read-words "p.txt") '())
