;Author gerhardt_funk
(define (m num p c1 c2 c3 r1 r2 r3 d1 d2)
  (if (= 1 num)
      (list (append c1 (list p)) c2 c3 (append r1 (list p)) r2 r3 (append d1 (list p)) d2)
      (if (= 2 num)
          (list c1 (append c2 (list p)) c3 (append r1 (list p)) r2 r3 d1 d2)
          (if (= 3 num)
              (list c1 c2 (append c3 (list p)) (append r1 (list p)) r2 r3 d1 (append d2 (list p)))
              (if (= 4 num)
                  (list (append c1 (list p)) c2 c3 r1 (append r2 (list p)) r3 d1 d2)
                  (if (= 5 num)
                      (list c1 (append c2 (list p)) c3 r1 (append r2 (list p)) r3 (append d1 (list p)) (append d2 (list p)))
                      (if (= 6 num)
                          (list c1 c2 (append c3 (list p)) r1 (append r2 (list p)) r3 d1 d2)
                          (if (= 7 num)
                              (list (append c1 (list p)) c2 c3 r1 r2 (append r3 (list p)) d1 (append d2 (list p)))
                              (if (= 8 num)
                                  (list c1 (append c2 (list p)) c3 r1 r2 (append r3 (list p)) d1 d2)
                                  (list c1 c2 (append c3 (list p)) r1 r2 (append r3 (list p)) (append d1 (list p)) d2))))))))))

(define (chk ls)
  (if (not (= 3 (length ls)))
      #f
      (= (list-ref ls 0) (list-ref ls 1) (list-ref ls 2))))

(define (chk1 ls)
  (if (= 0 (length ls))
      #f
      (if (chk (car ls))
          #t
          (chk1 (cdr ls)))))

(define (main ls c1 c2 c3 r1 r2 r3 d1 d2)
  (if (= 0 (length ls))
      0
      (let* ([p (modulo (length ls) 2)] [q (m (car ls) p c1 c2 c3 r1 r2 r3 d1 d2)]
                                        [nc1 (list-ref q 0)]
                                        [nc2 (list-ref q 1)]
                                        [nc3 (list-ref q 2)]
                                        [nr1 (list-ref q 3)]
                                        [nr2 (list-ref q 4)]
                                        [nr3 (list-ref q 5)]
                                        [nd1 (list-ref q 6)]
                                        [nd2 (list-ref q 7)])
        (if (chk1 q)
            (+ (- 9 (length ls)) 1)
            (main (cdr ls) nc1 nc2 nc3 nr1 nr2 nr3 nd1 nd2)))))

(require 2htdp/batch-io)

(define (main1 ls ret)
  (if (= (length ls) 0)
      ret
      (main1 (list-tail ls 9) (append ret (list (main (list 
                                                      (list-ref ls 0)
                                                      (list-ref ls 1)
                                                      (list-ref ls 2)
                                                      (list-ref ls 3)
                                                      (list-ref ls 4)
                                                      (list-ref ls 5)
                                                      (list-ref ls 6)
                                                      (list-ref ls 7)
                                                      (list-ref ls 8)) '() '() '() '() '() '() '() '()))))))

(define (con ls ret)
  (if (= 0 (length ls))
      ret
      (con (cdr ls) (append ret (list (string->number (car ls)))))))

(main1 (con (read-words "p.txt") '()) '())