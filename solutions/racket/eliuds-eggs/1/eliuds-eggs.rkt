#lang racket

(provide number->eggs)

(define (number->eggs n)
  (if (= n 0)
      0
      (+ (bitwise-and n 1) (number->eggs (quotient n 2)))))

