## 1B
1. Applicative Order
	evaluate the arguments and then apply
	given f(x)=x+x: 3*f(1)*f(1) ⇒ 3*2*2
2. Normal Order
	fully expand and then reduce
	given f(x)=x+x: 3*f(1)*f(1) ⇒ 3*(1+1)*(1+1) (also used in "lazy evaluation")
3. Special Forms 
	For example:
	Booleans and and or. For example: (and <e1> ... <en>) evaluates Left → Right. If any evaluates to false, the value of the and expression is false, and the rest of the <e>'s are not evaluated.
Conditionals like if and cond
	(if <predicate> <consequent> <alternative>): If the <predicate> evaluates to a true value, the interpreter then evaluates the <consequent> and returns its value. Otherwise it evaluates the <alternative> and returns its value
	(cond (<p1> <e1>) ... (<pn> <en>)): The predicate <p1> is evaluated first. If its value is false, then <pn> is evaluated. If <pn>'s value is also false, then <pn+1> is evaluated. When true predicate, the interpreter returns the value of the corresponding consequent expression <e>.


