;;;; rep-theatre-tests.asd

(asdf:defsystem #:rep-theatre-tests
  :description "Tests for rep-theatre."
  :author "Matt Curtis"
  :licence "BSD-new"
  :name "rep-theatre-tests"
  :version "0.1"
  :serial t
  :depends-on (#:rep-theatre #:stefil)
  :components ((:file "t-package")
               (:file "t-rep-theatre")
               (:file "t-laplace-smoother")))

