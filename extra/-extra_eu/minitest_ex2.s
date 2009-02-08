distancia::
	push ct
	pop lstack
	pop lstack
	pop lstack
	push.n #0
	pop lstack
	push r1
	call getvector_no_elem
	dec #1
	pop ct
	push.n #0
ciclo::
	push r2
	push r0
	push r1
	call getenderlemvector
	ld.b []
	push r0
	inc #1
	call getendelem becotr
	ld.b []
	call getenderelemmat
	ld []
	add
	dbr ciclo
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop ct
	ret



a sivia eh dahhhhhhhhhhhh * 10^200
 /agree <- kmkz