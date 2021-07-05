#lang racket

(provide add-gigasecond)

(require racket/date)

(define (add-gigasecond in-date)
  (seconds->date (+ (date*->seconds in-date #f) 1000000000))
)
