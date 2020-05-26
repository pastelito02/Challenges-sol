;Author gerhardt_funk
(define alpha
       (list "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"))

(define (aser str val)
  (for ([i (in-range 0 (length alpha))])
    (cond [(equal? str (list-ref alpha i))
           (set! val i)]))
  val)

(define (con str ret)
  (if (= 0 (string-length str))
      ret
      (con (substring str 1 (string-length str)) (append ret (list (aser (substring str 0 1) 0))))))

(define (conb ls ret)
  (if (= 0 (length ls))
      ret
      (conb (cdr ls) (string-append ret (list-ref alpha (car ls))))))

(define (slice ls f cur ret)
  (if (or (> cur f) (= cur f) (> cur (length ls)))
          ret
          (slice ls f (+ cur 1) (append ret (list (list-ref ls cur))))))

(define (sublist ls s f)
  (if (< s 0)
      (slice ls f 0 '())
      (slice ls f s '())))

(define (chngdicm ad val dic)
  (if (= 0 (length ad))
       val
      (append (sublist dic 0 (car ad)) (list (chngdicm (cdr ad) val (list-ref dic (car ad)))) (sublist dic (+ (car ad) 1) (length dic)))))

(define (chngdic ad val dic)
  (if (= 0 (length ad))
      val
      (chngdicm ad val dic)))

(define (bser ls q val)
  (if (= 1 (length ls))
      q
      (let* ([l (length ls)] [q1 (quotient l 2)] [lett (list-ref ls q1)] [val2 (list-ref (list-ref lett 0) 0)])
        (if (not (< val val2))
            (bser (sublist ls q1 (length ls)) (+ q q1) val)
            (bser (sublist ls 0 q1) q val)))))

(define (se ad cad dic cur)
  (if (= 0 (length ad))
      (chngdic (append cad (list 0 1)) (+ (list-ref (list-ref cur 0) 1) 1) dic)
      (if (= (length cur) 1)
          (se (cdr ad) (append cad (list 1)) (chngdic cad (append cur (list (list (list (car ad) 0)))) dic) (list (list (car ad) 0)))
          (if (< (car ad) (list-ref (list-ref (list-ref cur 1) 0) 0))
              (se (cdr ad) (append cad (list 1)) (chngdic cad (append (list (list-ref cur 0)) (list (list (list (car ad) 0))) (sublist cur 1 (length cur))) dic) (list (list (car ad) 0)))
              (let* ( [cur1 (sublist cur 1 (length cur))] [q (bser cur1 0 (car ad))] )
                (if (= (list-ref (list-ref (list-ref cur1 q) 0) 0) (car ad))
                    (se (cdr ad) (append cad (list (+ 1 q))) dic (list-ref cur1 q))
                    (let ([cur2 (append (list (list-ref cur 0)) (sublist cur1 0 (+ q 1)) (list (list (list (car ad) 0))) (sublist cur1 (+ q 1) (length cur1)))])
                      (se (cdr ad) (append cad (list (+ q 2))) (chngdic cad cur2 dic) (list (list (car ad) 0))))))))))

(define Z (list (list "" -1)))

(define (add ad)
  (set! Z (se ad '() Z Z)))

(define A '())

(define (gath cur dic)
  (cond [ (> (list-ref (list-ref dic 0) 1) 1)
          (set! A (append A (list (append (sublist cur 1 (length cur)) (list (list-ref (list-ref dic 0) 0) )))))])
  (for ([i (in-range 1 (length dic))])
    (gath (append cur (list (list-ref (list-ref dic 0) 0))) (list-ref dic i))))

(define (ent ls)
  (cond [(> (length ls) 0)
         (add (con (car ls) '()))
         (ent (cdr ls))]))

(define (main1 ls ret)
  (if (= 0 (length ls))
      ret
      (main1 (cdr ls) (string-append ret (conb (car ls) "") " "))))

(require 2htdp/batch-io)

(ent (read-words "p.txt"))

(gath '() Z)

(main1 A "")

  
  