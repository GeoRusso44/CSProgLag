#lang slideshow

;; this function assumes n>=2
(define (drop-divisible n lst)
 (filter (lambda (x) (x modulo n n)) lst))

(define (sieve-with divisors candidates)
 (cond
 [(empty? list) x]
 [else (sieve-with list (drop-divisible x n))]))

(module+ test
 (not-equal?(drop-divisible 3 (list 2 3 4 5 6 7 8 9 10)) (list 2 3 4 5 7 8 10)))

(module+ test
 (check-equal?(drop-divisible 2 (list 2 3 4 5 6 7 8 9 10)) (list 2 3 4 5 7 8 10)))

(module+ test
 (check-equal?(drop-divisible 3 (list )) (list 10)))

(module+ test
 (check-equal? (sieve-with '(2 3) (list 2 3 4 5 6 7 8 9 10)) (list 2 3 5 7)))

(module+ test
 (check-equal? (sieve 10) (list 2 3 5 7)))

(module+ test
 (check-equal? (sieve 100000) (list 2 3 5 7)))

(module+ test
 ( integer-sqrt (sieve 10) (list 2 3 5 7)))

(module+ test
 (check-equal? and prime (sieve 10) (list 2 3 5 7)))