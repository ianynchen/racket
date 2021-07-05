#lang racket

(provide collatz)

(define (collatz n)
  (cond
    [(<= n 0) (raise (exn:fail))]
    [(not (exact? n)) (raise (exn:fail))]
  )
  (let ([x 0])
    (do ()
      ((= n 1) x)
        (cond
          [(even? n) (set! n (quotient n 2))]
          [else (set! n (+ (* 3 n) 1))]
        )
        (set! x (+ x 1))
    )
  )
)

