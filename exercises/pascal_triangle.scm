(define (pascal_triangle_elem row col)
  (cond ((= col 0) 1)
	((= col row) 1)
	(else (+ (pascal_triangle_elem (- row 1) (- col 1))
		 (pascal_triangle_elem (- row 1) col)))))

(display (pascal_triangle_elem 6 3))
