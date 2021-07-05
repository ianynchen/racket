#lang racket

(provide classify)

(define (classify number)
  (let
    ([result
      (foldl + 0
        (filter 
          (lambda (x) (= 0 (remainder number x)))
          (for/list ([i (in-range 1 (+ (quotient number 2) 1))]) i)
        )
      )
    ])
    (cond
      [(= result number) 'perfect]
      [(> result number) 'abundant]
      [(< result number) 'deficient]
    )
  )
)

