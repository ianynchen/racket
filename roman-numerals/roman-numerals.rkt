#lang racket

(provide to-roman)

(define (to-roman-digit number-index-pair)
  (let ([digit (list-ref number-index-pair 0)]
        [index (list-ref number-index-pair 1)]
        [result '()])
    (define roman-five (list #\V #\L #\D))
    (define roman-one (list #\I #\X #\C #\M))
    (cond 
      [(< digit 4) (make-list digit (list-ref roman-one index))]
      [(= digit 4) (append (list (list-ref roman-one index)) (list (list-ref roman-five index)))]
      [(= digit 5) (list (list-ref roman-five index))]
      [(and (> digit 5) (< digit 9)) (append (list (list-ref roman-five index)) (make-list (- digit 5) (list-ref roman-one index)))]
      [(= digit 9) (append (list (list-ref roman-one index)) (list (list-ref roman-one (+ index 1))))]
    )
  )
)

(define (to-roman number)
  (cond
    [(or (> number 3000) (<= number 0)) (raise (exn:fail))]
    [else 
      (let ([index 0] [number-index-pair-list '()] [result '()])
        (do ()
          ((< number 10) number-index-pair-list)
          (set! number-index-pair-list (cons (list (remainder number 10) index) number-index-pair-list))
          (set! index (+ index 1))
          (set! number (quotient number 10))
        )
        (set! number-index-pair-list (cons (list number index) number-index-pair-list))
        (for ([pair (reverse number-index-pair-list)])
          (set! result (append (to-roman-digit pair) result))
        )
        (list->string result)
      )
    ]
  )
)