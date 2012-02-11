;;;; package.lisp

(defpackage #:t-rep-theatre
  (:use #:cl #:stefil #:mrc-stefil-extras #:rep-theatre)
  (:export #:test-all))

(in-package #:t-rep-theatre)
(in-root-suite)
(defsuite test-all)
