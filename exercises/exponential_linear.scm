(define (expo b n)
  (expo-iter b n 1))

(define (expo-iter b counter product)
  (if (= counter 0)
      product
      (expo-iter b
		 (- counter 1)
		 (* b product))))

(display (expo 3 4))
