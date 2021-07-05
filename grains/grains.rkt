#lang racket

(provide square total)

(define (square index) (arithmetic-shift 1 (- index 1)))

(define (total) (
  foldl + 0 (
    for/list ([i (in-range 0 65)]) (square i)
  )
))