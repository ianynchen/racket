#lang racket

(provide two-fer)

(define (two-fer [name null])
  (cond
    [(null? name) "One for you, one for me."]
    [else (string-append "One for " name ", one for me.")]
  )
)