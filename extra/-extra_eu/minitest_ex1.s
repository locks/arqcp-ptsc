APVM::
	pop lstack
	pop lstack
	pop lstack

	push.n #0
	push
	pop lstack
	pop lstack
	push r2
	call getnelemvector
	push r4
	st []
	pop
	push r3
	call getnumelemvector
	push	r4
	inc #4
	st []
	pop
ciclo::
	push r0
	push r3
	call getenderelemvector
	ld []
	push
	push r1
	push r2
	call getemderelemvector
	ld []
	xcg 
	push s1
	bz faz_mul
	add
	br frente
faz_mul:: 
	call mymulu
	pop
frente::
	push r4
	push r1
	push r0
	call getenderelemmatriz
	st []
	pop

	push r0
	inc #1
	push
	push r3
	call getnumelemvector
	sub
	bz muda_linha
	pop r0
	br ciclo
muda_linha::
	pop
	push.n #0
	pop r0
	push r1
	inc #1
	push
	push r2
	call getnumelemvector
	sub
	bz fim_matriz
	pop r1
	br ciclo

fim_matriz:: 
	push Lstack
	pop
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	ret