#lang racket

(provide nanp-clean)

(define (check-first-digit digits)
)

(define (check digits)
  (and (check-first-digit (take digits 3)) (check-first-digit (take (list-tail digits 3) 3)))
)

(define (nanp-clean s)
  (let ([digits (filter char-numeric? (string->list s))])
    (cond
      [(= 10 (length digits)) (and (char=? (list-ref digits) #\1) (check (cdr digits)))]
      [(= 9 (length digits)) (check (cdr digits))]
      [else #f]
    )
  )
)
