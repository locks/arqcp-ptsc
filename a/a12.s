a12_ex::
	sub
	pop lstack
	add
	pop lstack
	add
	
	push.l #0
	push lstack
	call mydivu
	pop
	
	push.l #0
	push lstack
	call mydivu
	pop
ret