#lang racket

(provide etl)

(define (etl hash)
  (let ([cursor (dict-iterate-first hash)] [result (make-hash)] [key null] [values (list)])
    (do ()
      ((equal? cursor #f) result)
        (set! key (dict-iterate-key hash cursor))
        (set! values (dict-ref hash key))
        (set! cursor (dict-iterate-next hash cursor))
        (when (< key 0) (raise (exn:fail:contract)))
        (for ([item values])
          (when (not (string? item)) (raise (exn:fail:contract)))
          (hash-set! result (string-downcase item) key)
        )
    )
  )
)
