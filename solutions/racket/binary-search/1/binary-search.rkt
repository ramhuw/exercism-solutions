#lang racket

(provide binary-search)

(define (search array left right value)
  (define middle (quotient (+ left right) 2))
  (if (>= left right)
    #f
    (if (= (+ left 1) right)
      (if (= (vector-ref array left) value)
        left
        #f)
      (if (<= (vector-ref array middle) value)
        (search array middle right value)
        (search array left middle value)
      ))
    )
  )

(define (binary-search array value)
  (define left 0)
  (define right (vector-length array))
  (search array left right value)
  )
