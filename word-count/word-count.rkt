#lang racket

(provide word-count)

(define (word-count sentence)
  (let* ([words (string-split sentence #px"\\s|," #:trim? #t)] 
         [result (make-hash)])
    (for ([word words])
      (when (non-empty-string? (string-trim (string-downcase word) #px"\\W" #:repeat? #t)) 
        (hash-set! result (string-trim (string-downcase word) #px"\\W" #:repeat? #t) (+ (hash-ref result (string-trim (string-downcase word) #px"\\W" #:repeat? #t) 0) 1))
      )
    )
    result
  )
)
