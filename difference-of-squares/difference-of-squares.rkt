#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum-of-squares number)
  (foldl + 0 (for/list ([i (in-range (+ number 1))]) (* i i)))
)

(define (square-of-sum number)
  (let 
    ([x (foldl + 0 (for/list ([i (in-range (+ number 1))]) i))])
    (* x x)
  )
)

(define (difference number)
  (- (square-of-sum number) (sum-of-squares number))
)
