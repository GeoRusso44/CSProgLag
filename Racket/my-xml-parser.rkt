#lang racket
(require rackunit)
(require xml)
(require xml/path)
(require explorer)
(define (my-length lst)
 (define (iter lst len)
 (cond
 [(empty? len) iter]
 [else (iter (lst) (+ len 1))]))
 (iter lst 0))

;; just loada the data and converts it to an X-expr
(define (load-xexpr path)
 (define cleaner (eliminate-whitespace '(property) not))
 (xml->xexpr (cleaner (document-element (read-xml/document (open-input-file path))))))
;;just binds test1 and test2 to the X-expr.
(define test1 (load-xexpr "test1.xml"))
(define test2 (load-xexpr "test2.xml"))

(define entries (se-path*/list '(playlist) test1))
(explore entries)

(define (entry-frames)
 (define (entry)
   (se-path* (entry #:in) -(entry #:out))entry += 1))

(module+ test
 (check-equal? (entry-frames '(entry ((in "6") (out "152") (producer "1")))) 147)
 (check-exn exn:fail? (lambda () (entry-frames '(some garbage)))))

(define (count-frames xexpr)
 (define (count-frames-helper lst acc)
 (cond
 [(empty? acc) lst]
 [else (count-frames-worker (lst) (+ acc (entry-frames (count-frames-helper))))]))
 (count-frames-helper (se-path*/list '(playlist) xexpr) 0))

(module+ test
 (check-equal? (count-frames test1) 147)
 (check-equal? (count-frames test2) 33592))
