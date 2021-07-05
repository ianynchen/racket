#lang racket

(provide meetup-day)
(require racket/date)
(require racket/stream)

#| find index of element in list
|#
(define (index-of ele lst)
  (let loop ((lst lst)
             (idx 0))
    (cond ((empty? lst) #f)
          ((equal? (first lst) ele) idx)
          (else (loop (rest lst) (add1 idx))))))

#|
checks if an element is in list l
|#
(define (in element l)
  (cond
    [(null? l) #f]
    [(equal? (car l) element) #t]
    [else (in element (cdr l))]
  )
)

(define (leap-year? year)
  (or (= 0 (modulo year 400))
      (and (= 0 (modulo year 4))
           (not (= 0 (modulo year 100))))))

(define (days-in-month year month)
  (cond
    [(and (= month 2) (leap-year? year)) 29]
    [(= month 2) 28]
    [(<= month 7) (+ 30 (modulo month 2))]
    [else (+ 30 (- 1 (modulo month 2)))]))

(define (find-range year month order)
  (let (
      [number-of-days-in-month (days-in-month year month)]
    )
    (cond 
      [(= order 5) (stream->list (in-range 13 20))]
      [else (stream->list (in-range 1 (+ number-of-days-in-month 1)))]
    )
  )
)

(define (find-date day-range year month day order)
  (let* 
    (
      [result (make-date 1971 1 1)]
      [index 0]
    )
    (for ([date day-range])
      (cond
        [(= (date-week-day (make-date year month date)) day)
          (cond
            [(= index order) 
              (set! result (make-date year month date))
              (set! index (+ index 1))
            ]
            [else (set! index (+ index 1))]
          )
        ]
      )
    )
    result
  )
)

(define (make-date year month day)
    (seconds->date (find-seconds 0 0 0 day month year #f) #f))

(define (meetup-day year month day order)
  (let* 
    (
      [days (list 'Sunday 'Monday 'Tuesday 'Wednesday 'Thursday 'Friday 'Saturday)]
      [day-order (list 'first 'second 'third 'fourth 'last 'teenth)]
      [find-order (list 0 1 2 3 0 0)]
      [day-range (find-range year month (index-of order day-order))]
      [find-day-order (list-ref find-order (index-of order day-order))]
    )
    (cond
      [(equal? order 'last) (set! day-range (reverse day-range))]
    )
    (find-date day-range year month (index-of day days) find-day-order)
  )
)