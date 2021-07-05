#lang racket

(provide anagrams-for)

(define (anagrams-for word lst)
  (let 
    (
      [result '()] 
      [key (sort (string->list (string-downcase word)) char<?)]
    )
    (for ([candidate lst])
      (cond 
        [(and (equal? key (sort (string->list (string-downcase candidate)) char<?))
          (not (equal? candidate word))
        ) 
          (set! result (append result (list candidate)))]
      )
    )
    result
  )
)
