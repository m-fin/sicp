(define (expo b n)
  (if (= n 0)
      1
      (* b (expo b (- n 1)))))

(display (expo 3 4))
