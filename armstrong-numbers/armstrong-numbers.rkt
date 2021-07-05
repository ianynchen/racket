#lang racket

(provide armstrong-number?)

(define (create-list n digits)
  (do ()
    ((< n 10) (cons n digits))
      (set! digits (cons (remainder n 10) digits))
      (set! n (quotient n 10))
  )
)

(define (armstrong-number? n)
  (let*
    (
      [l (create-list n '())]
      [power (length l)]
      [result (apply + (map (lambda (number) (expt number power)) l))]
    )
    (cond
      [(= n result) true]
      [else false]
    )
  )
)
