;;;; rep-theatre.asd

(asdf:defsystem #:rep-theatre
  :description "Uncategorised tools from the bottom shelf."
  :author "Matt Curtis"
  :licence "BSD-new"
  :name "rep-theatre"
  :version "0.1"
  :serial t
  :depends-on (#:stefil)
  :components ((:file "package")
               (:file "rep-theatre")
               (:file "t-package")
               (:file "t-rep-theatre")))

