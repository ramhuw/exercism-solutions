#lang racket

(provide collatz)

(define (collatz num)
  (cond
    [(or (not (integer? num)) (not (> num 0))) (error "input error")]
    [(= num 1) 0]
    [else (if (= (modulo num 2) 0) (+ 1 (collatz (/ num 2))) (+ 1 (collatz (+ 1 (* 3 num)))))]
    )
  )
