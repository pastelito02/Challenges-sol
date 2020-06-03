;Author CoderMonk
(define map-three 
  (lambda (proc ls) 
    (cond
      ((null? ls) '())
      (else (cons (proc (car ls) (cadr ls) (caddr ls)) (map-three proc (cdddr ls)))))))

(define two-printers
  (lambda (x y n)
    (letrec ((loop
              (lambda (p1 p2 pages time)
                (cond
                  ((>= pages n) time)
                  (else (begin
                          (if (= p1 x) 
                              (begin 
                                (set! p1 1)
                                (set! pages (+ pages 1)))
                              (set! p1 (+ p1 1)))
                          (if (= p2 y)
                              (begin 
                                (set! p2 1)
                                (set! pages (+ pages 1)))
                              (set! p2 (+ p2 1)))
                          (loop p1 p2 pages (+ time 1))))))))
      (loop 1 1 0 0))))

(map-three two-printers '(3 1 296967241
32407535 20516973 27
9328 19365 50563
1 1 521470415
22 14 45004997
16296457 85569400 9
83503393 45472137 9
1 1 917886437
11577551 3984692 83
98298629 57886110 9
140280 87549 3565
35 38 17583407
549 1286 568503
1089255 761157 460
2977966 1287038 255
2858982 4587237 84
3561 3593 201093
34796342 54084394 7))