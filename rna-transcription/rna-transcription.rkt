#lang racket

(provide to-rna)

(define (to-rna dna)
  (let ([pairs '((#\C . #\G) (#\G . #\C) (#\T . #\A) (#\A . #\U))] [result ""])
    (for ([c (string->list dna)])
      (set! result (string-append result (string (dict-ref pairs c))))
    )
    result
  )
)