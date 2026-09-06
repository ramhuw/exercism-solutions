#lang racket

(provide score)

(define (score x y)
  (define r (+ (* x x) (* y y)))
  (cond
    [(> r 100) 0]
    [(> r 25) 1]
    [(> r 1) 5]
    [else 10]))
