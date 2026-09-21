#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum-of-squares number)
  (if (= number 0) 0 (+ (* number number) (sum-of-squares (- number 1)))))

(define (sum number)
  (if (= number 0) 
      0 
      (+ number (sum (- number 1)))
  )
)

(define (square-of-sum number)
  (let ([s (sum number)])
    (* s s)))

(define (difference number)
  (- (square-of-sum number) (sum-of-squares number))
  )
