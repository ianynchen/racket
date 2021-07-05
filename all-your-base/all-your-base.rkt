#lang racket

(provide rebase)

(define (format-base number base digits) 
  (do ()
    ((< number base) (cons number digits))
      (set! digits (cons (remainder number base) digits))
      (set! number (quotient number base))
  )
)

(define (rebase list-digits in-base out-base)
  (cond
    [(and (> in-base 1)
          (> out-base 1)
          (for/and ([digit list-digits]) (and (>= digit 0) (< digit in-base))))
          
          (format-base (foldl 
            (lambda (digit subtotal) 
              (+ (* in-base subtotal) digit)
            ) 0 list-digits
          ) out-base '())]
    [else false]
  )
)
