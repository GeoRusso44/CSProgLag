#lang slideshow

(define (square n)
  ; A semi-colon starts a line comment.
  ; The expression below is the function body.
  (filled-rectangle n n))

(define series
  (lambda (mk)
    (hc-append 4 (mk 5) (mk 10) (mk 20))))

(define (rgb-series mk)
  (vc-append
   (series (lambda (sz) (colorize (mk sz) "red")))
   (series (lambda (sz) (colorize (mk sz) "green")))
   (series (lambda (sz) (colorize (mk sz) "blue")))))
 

> (rgb-series circle)


> (rgb-series square)


> (list "red" "green" "blue")
'("red" "green" "blue")

> (list (circle 10) (square 10))
'(image image)