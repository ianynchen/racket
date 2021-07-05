#lang racket

(provide hamming-distance)

(define (difference strand-a strand-b)
  (let ([x 0])
    (for ([a strand-a] [b strand-b])
      (cond
        [(not (eqv? a b)) (set! x (+ x 1))]
      )
    )
    x
  )
)

(define (hamming-distance strand-a strand-b)
  (cond
    [(not (= (string-length strand-a) (string-length strand-b))) (raise (exn:fail))]
    [(and (not (non-empty-string? strand-a)) (not (non-empty-string? strand-b))) 0]
    [else (difference strand-a strand-b)]
  )
)
