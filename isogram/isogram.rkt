#lang racket

(provide isogram? char-list)

(define (char-list s)
  (filter (lambda (c) (not (or (char=? c #\ ) (char=? c #\-)))) (string->list (string-downcase s)))
)

(define (isogram? s)
  (let ([char-map (make-hash)] [result #t])
    (for ([c (char-list s)])
      (cond 
        [(> (dict-ref char-map c 0) 0) (set! result #f)]
        [else (dict-ref! char-map c 1)]
      )
    )
    result
  )
)
