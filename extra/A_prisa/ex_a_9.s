; Enunciado:
;
; A9:	Faça uma rotina que calcule o resultado da operação 3/2
;

.file "ex_a_9.s"
.include  "auxil.s"  
.org 0x1000      
  			
	br inicio


ex_a_9::				; 3/2 -> 3 2 /

	pop g0
	push.n #1
	divu

	ret


inicio::

	push.n #4
	push.n #2

	call ex_a_9

	halt
	.end