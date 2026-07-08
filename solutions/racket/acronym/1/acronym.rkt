#lang racket

(provide acronym)

(define (acronym phrase)
  (define filtered 
  (regexp-replace* #px"[^A-Za-z0-9\\s-]" phrase ""))
  (define ss
  (string-split filtered " "))
  (define sh
   (append-map (lambda (x) (string-split x "-") ) ss))
  (define (fst word)
  (char-upcase (string-ref word 0)))
  (apply string (map fst sh))
)
