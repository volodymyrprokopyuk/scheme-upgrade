(define-module (srfi srfi-133)
  #:export (vector-unfold vector-unfold-right vector-append vector-concatenate
                          vector-empty? vector= vector-fold vector-fold-right
                          vector-map vector-for-each vector-count
                          vector-index vector-index-right vector-skip vector-skip-right
                          vector-any vector-every vector-partition vector-swap!
                          vector-fill! vector-reverse!))

(load-from-path "srfi/vectors-impl.scm")
