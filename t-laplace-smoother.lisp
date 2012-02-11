(in-package #:t-rep-theatre)

(in-suite test-all)
(defsuite* laplace-smoother-tests)

(defparameter *colors* '(red yellow green blue))
(defparameter *color-samples* '(red green red yellow green red red green))

(defclass sample-set ()
  ((classes :initarg :classes :accessor classes :documentation "The set of all possible classes"
            :initform (error "Must supply a set of classes."))
   (samples :initarg :samples :accessor samples :documentation "A corpus of samples"
            :initform (error "Must supply samples."))))

(defgeneric n-classes (sample-set)
  (:documentation "Return the number of discrete classes."))

(defgeneric n-samples (sample-set)
  (:documentation "Return the number of samples in the set."))

(defgeneric count-instances (sample-set class)
  (:documentation "Return the number of matching instances in the sample set."))

(defmethod n-classes ((sample-set sample-set))
  (length (classes sample-set)))

(defmethod n-samples ((sample-set sample-set))
  (length (samples sample-set)))

(defmethod count-instances ((sample-set sample-set) class)
  (count class (samples sample-set)))

(deftest smoother-with-k-0 ()
  (let ((samples (make-instance 'sample-set :classes *colors* :samples *color-samples*)))
    (let ((smoother (make-laplace-smoother (n-samples samples) (n-classes samples) 0)))
      (are (= 4/8 (funcall smoother (count-instances samples 'red)))
           (= 1/8 (funcall smoother (count-instances samples 'yellow)))
           (= 3/8 (funcall smoother (count-instances samples 'green)))
           (= 0/8 (funcall smoother (count-instances samples 'blue)))))))

(deftest smoother-with-k-1 ()
  (let ((samples (make-instance 'sample-set :classes *colors* :samples *color-samples*)))
    (let ((smoother (make-laplace-smoother (n-samples samples) (n-classes samples) 1)))
      (are (= 5/12 (funcall smoother (count-instances samples 'red)))
           (= 2/12 (funcall smoother (count-instances samples 'yellow)))
           (= 4/12 (funcall smoother (count-instances samples 'green)))
           (= 1/12 (funcall smoother (count-instances samples 'blue)))))))
