#lang racket

(provide square total)

(define (square a-square)
  (if (= 1 a-square)
      1
      (* 2 (square (- a-square 1)))))

(define (total)
  18446744073709551615)
