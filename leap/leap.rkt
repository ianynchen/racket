#lang racket

(provide leap-year?)

(define (leap-year? year)
  (let (
      [divideBy400 (= 0 (remainder year 400))]
      [divideBy100 (= 0 (remainder year 100))]
      [divideBy4 (= 0 (remainder year 4))]
    )
    (or (and divideBy100 divideBy400) (and divideBy4 (not divideBy100)))
  )
)
