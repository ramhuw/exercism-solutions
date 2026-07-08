#lang racket

(provide armstrong-number?)

(define (armstrong-number? n)
  (define (l x) (if (< x 10) 1 (+ 1 (l (quotient x 10)))))
  (define (s x) (if (= x 0) 0 (+ (s (quotient x 10)) (expt (remainder x 10) (l n)))))
  (= n (s n))
  )
