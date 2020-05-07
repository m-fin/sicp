;;; Project 1, 6.001, Spring 2005

;;; idea is to simulate a baseball robot

;; imagine hitting a ball with an initial velocity of v 
;; at an angle alpha from the horizontal, at a height h
;; we would like to know how far the ball travels.

;; as a first step, we can just model this with simple physics
;; so the equations of motion for the ball have a vertical and a 
;; horizontal component

;; the vertical component is governed by
;; y(t) = v sin alpha t + h - 1/2 g t^2 
;; where g is the gravitational constant of 9.8 m/s^2

;; the horizontal component is governed by
;; x(t) = v cos alpha t
;; assuming it starts at the origin

;; First, we want to know when the ball hits the ground
;; this is governed by the quadratic equation, so we just need to know when 
;; y(t)=0 (i.e. for what t_impact is y(t_impact)= 0).
;; note that there are two solutions, only one makes sense physically

(define square
  (lambda (x) (* x x)))

;; these are constants that will be useful to us
(define gravity 9.8)  ;; in m/s
(define pi 3.14159)

;; Problem 1

(define position
  (lambda (a v u t)
    ;; p(t) = (1/2)*a*t^2 + v*t + u
    (+ (* 0.5 a (square t)) (* v t) u)))

;; you need to complete this procedure, then show some test cases



(display (square 2))

(position 0 0 0 0)

(position 0 0 20 0)

(position 0 5 10 10)

(position 2 2 2 2)

(position 5 5 5 5)

;; Problem 2

;; quadratic formula
;; (-b+-√b^2-4ac) / 2a

(define root1
  (lambda (a b c)
    (cond ((> 0 (- (square b) (* 4 a c))) #f)
          (else (/ (+ (- b) (sqrt (- (square b) (* 4 a c)))) (* 2 a))))
    ))

(define root2
  (lambda (a b c)
    (cond ((> 0 (- (square b) (* 4 a c))) #f)
          (else (/ (- (- b) (sqrt (- (square b) (* 4 a c)))) (* 2 a))))
    ))

;; complete these procedures and show some test cases

(root1 3 5 1)

(root2 3 5 1)

(root1 5 3 6)

;; Problem 3

;; we have t, a, delta x, 

;; sqrt(2(v*t - <x) / a)

(define time-to-impact
  (lambda (vertical-velocity elevation)
    (root2 (* -0.5 gravity) vertical-velocity elevation)
    ;; (/ (- vertical-velocity (root1 vertical-velocity gravity elevation) gravity))
    ))

;; Note that if we want to know when the ball drops to a particular height r 
;; (for receiver), we have

(define time-to-height
  (lambda (vertical-velocity elevation target-elevation)
    (time-to-impact vertical-velocity (- elevation target-elevation))
    ))

(time-to-impact 10 5)

(time-to-height 10 5 0)

(time-to-height 10 5 1)

;; Problem 4

;; once we can solve for t_impact, we can use it to figure out how far the ball went

;; conversion procedure
(define degree2radian
  (lambda (deg)
    (/ (*  deg pi) 180.)))

(define travel-distance-simple
  (lambda (elevation velocity angle)
    YOUR-CODE-HERE))

;; let's try this out for some example values.  Note that we are going to 
;; do everything in metric units, but for quaint reasons it is easier to think
;; about things in English units, so we will need some conversions.

(define meters-to-feet
  (lambda (m)
    (/ (* m 39.6) 12)))

(define feet-to-meters
  (lambda (f)
    (/ (* f 12) 39.6)))

(define hours-to-seconds
  (lambda (h)
    (* h 3600)))

(define seconds-to-hours
  (lambda (s)
    (/ s 3600)))

;; what is time to impact for a ball hit at a height of 1 meter
;; with a velocity of 45 m/s (which is about 100 miles/hour)
;; at an angle of 0 (straight horizontal)
;; at an angle of (/ pi 2) radians or 90 degrees (straight vertical)
;; at an angle of (/ pi 4) radians or 45 degrees

;; what is the distance traveled in each case?
;; record both in meters and in feet

