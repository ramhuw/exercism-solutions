#lang racket

(provide leap-year?)

(define (leap-year? year)
  (or (= 0 (remainder year 400)) (and (not (= 0 (remainder year 100))) (= 0 (remainder year 4)))))
