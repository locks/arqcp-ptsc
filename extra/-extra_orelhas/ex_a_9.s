; Enunciado:
;
; A9:	Faça uma rotina que calcule o resultado da operação 3/2
;

.file "ex_a_9.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
	br inicio
.include  "auxil.s"      		; definições auxiliares

ex_a_9::				; 3/2 -> 3 2 /
	push g0
	pop lstack
	pop g0
	push.n #0
	divu
	push lstack
	pop g0

	ret

inicio::
	push.n #6
	push.n #3	
	call ex_a_9

	halt
	.end