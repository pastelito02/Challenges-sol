;Author codeartisan
#lang racket

(define (fibmod m)
  (define (loop a b i)
    (if (= 0 a)
        i
        (loop (remainder (+ a b) m) a (add1 i))))
  (loop 1 0 1))

(for ([i (in-range (read))])
  (printf "~A " (fibmod (read))))
