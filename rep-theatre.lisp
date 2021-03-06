;;;; rep-theatre.lisp

(in-package #:rep-theatre)

;; Adapted from Raffael Cavallaro's find-maximizing-item
;; http://groups.google.com/group/comp.lang.lisp/msg/dd7435a500d3d434?dmode=source
;; <200603221730078930-raffaelcavallaro@pasdespamsilvousplaitmaccom>
(defun most (sequence &key (key #'identity) (test #'>))
  "Return item,value,position of the item of the list with the maximum
`key' value, ordered by `test'. In the case of multiple items having
the same value, the largest index is returned. one towards the end of
the list is returned."
  (loop for item in sequence
     for value = (funcall key item)
     for position from 0
     for current-triplet = (list item value position)
     as max-triplet = current-triplet
     then (if (funcall test (second current-triplet) (second max-triplet))
              current-triplet
              max-triplet)
     finally (return (values-list max-triplet))))

(defun make-laplace-smoother (trials classes k)
  "Return a function which applies add-k smoothing to its input."
  (lambda (x)
    (/ (+ x k) (+ trials (* k classes)))))
