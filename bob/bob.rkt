#lang racket

(provide response-for)

(define (response-for sentence)
  (let (
      [is-question (and (non-empty-string? sentence) (char=? 
        (string-ref sentence 
          (- (string-length sentence) 1)
        )
      #\?))]
      [no-lower-case (empty? (filter char-lower-case? (string->list sentence)))]
      [has-upper-case (not (empty? (filter char-upper-case? (string->list sentence))))]
      [empty-sentence (not (non-empty-string? (string-trim sentence)))]
    )
    (cond
      [empty-sentence "Fine. Be that way!"]
      [(and is-question (not (and has-upper-case no-lower-case))) "Sure."]
      [(and (not is-question) (and has-upper-case no-lower-case)) "Whoa, chill out!"]
      [(and is-question has-upper-case no-lower-case) "Calm down, I know what I'm doing!"]
      [else "Whatever."]
    )
  )
)