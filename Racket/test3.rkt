#lang slideshow
;;performs addition with increment and decrement by 1 only
(define (my-+ a b)
 (if (zero? a)
 b
 (my-+ (sub1 a) (add1 b))))
