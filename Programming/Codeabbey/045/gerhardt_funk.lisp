;Author gerhardt_funk
(define (slice ls f cur ret)
  (if (or (= cur f) (> cur f) (= cur (length ls)) (> cur (length ls)))
      ret
      (slice ls f (+ 1 cur) (append ret (list (list-ref ls cur))))))

(define (sublist ls s f)
  (if (< s 0)
      (slice ls f 0 '())
      (slice ls f s '())))

(define (swap ls i k)
  (if (= i k)
      ls
      (if (> i k)
          (swapm ls k i)
          (swapm ls i k))))

(define (swapm ls i k)
  (append (sublist ls 0 i) (sublist ls k (+ k 1)) (sublist ls (+ i 1) k) (sublist ls i (+ i 1)) (sublist ls (+ k 1) (length ls))))

(define (main ls cur cur1)
  (if (= 0 (length ls))
      cur
      (main (cdr ls) (swap cur cur1 (modulo (car ls) 52)) (+ cur1 1))))

(define cards
  (list "CA" "C2" "C3" "C4" "C5" "C6" "C7" "C8" "C9" "CT" "CJ" "CQ" "CK"
        "DA" "D2" "D3" "D4" "D5" "D6" "D7" "D8" "D9" "DT" "DJ" "DQ" "DK"
        "HA" "H2" "H3" "H4" "H5" "H6" "H7" "H8" "H9" "HT" "HJ" "HQ" "HK"
        "SA" "S2" "S3" "S4" "S5" "S6" "S7" "S8" "S9" "ST" "SJ" "SQ" "SK"))

(define (con ls ret)
  (if (= 0 (length ls))
      ret
      (con (cdr ls) (string-append ret (car ls) " "))))