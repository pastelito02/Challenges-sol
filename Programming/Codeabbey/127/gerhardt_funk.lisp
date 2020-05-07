;Author gerhardt_funk
(define lett (list "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"))

(define (sl str)
  (let ([ret -1])
    (for ([i (in-range 0 26)])
      #:final (equal? str (list-ref lett i))
      (cond [(equal? str (list-ref lett i)) (set! ret i)]))
    ret))

(define (ad str)
  (let ([q (make-vector 26 0)])
    (for ([i (in-range 0 (string-length str))])
      (let ([q1 (sl (substring str i (+ 1 i)))])
        (vector-set! q q1 (+ 1 (vector-ref q q1)))))
    q))

(require 2htdp/batch-io)

(define dict (read-words "words.txt"))

(define (main str)
  (let ([ret -1] [q (ad str)])
    (for ([i dict])
      (cond [(= (string-length str) (string-length i))
             (cond [(equal? q (ad i))
                    (set! ret (+ ret 1))])]))
    ret))

(define (main1 ls ret)
  (if (= 0 (length ls))
      ret
      (main1 (cdr ls) (append ret (list (main (car ls)))))))

(main1 (read-words "p.txt") '())
