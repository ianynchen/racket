#lang racket

(provide score)

(define (contains l element)
  (cond 
    [(null? l) #f]
    [(eqv? (car l) element) #t]
    [else (contains (cdr l) element)]
  )
)

(define (value c)
  (let (
    [ones (list #\A #\E #\I #\O #\U #\L #\N #\R #\S #\T)]
    [twos (list #\D #\G)]
    [threes (list #\B #\C #\M #\P)]
    [fours (list #\F #\H #\V #\W #\Y)]
    [fives (list #\K)]
    [eights (list #\J #\X)]
    [tens (list #\Q #\Z)])

    (cond
      [(contains ones c) 1]
      [(contains twos c) 2]
      [(contains threes c) 3]
      [(contains fours c) 4]
      [(contains fives c) 5]
      [(contains eights c) 8]
      [(contains tens c) 10]
      [else 0]
    )
  )
)

(define (score word)
  (let (
    [score 0])
    
    (for ([c (string->list (string-upcase word))])
      (set! score (+ score (value c)))
    )
    score
  )
)