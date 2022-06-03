#lang slideshow
;;performs multiplication with addition only
(define (my-* a b)
 (if (zero? a)
 0
 (my-+ (my-* (sub1 a) b) b)))
