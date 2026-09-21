#lang racket

(provide my-reverse)

(define (my-reverse s)
  (if (string=? s "")
      ""
      (string-append (my-reverse (substring s 1)) (string (string-ref s 0)))))
