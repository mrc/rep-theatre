;;;; package.lisp

(defpackage #:t-rep-theatre
  (:use #:cl #:stefil #:rep-theatre)
  (:export #:test-all))

(in-package #:t-rep-theatre)
(in-root-suite)
(defsuite test-all)
