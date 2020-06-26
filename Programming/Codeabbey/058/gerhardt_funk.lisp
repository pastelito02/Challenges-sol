;Author gerhardt_funk
(define suits (list "Clubs" "Spades" "Diamonds" "Hearts"))

(define ranks (list "2" "3" "4" "5" "6" "7" "8" "9" "10" "Jack" "Queen" "King" "Ace"))

(define (con num)
  (let ([sv (floor (/ num 13))] [rv (modulo num 13)])
    (string-append (list-ref ranks rv)  "-of-" (list-ref suits sv) )))

(define (main ls ret)
  (if (= 0 (length ls))
      ret
      (main (cdr ls) (string-append ret (con (car ls)) " "))))