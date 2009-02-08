; Enunciado:
;
; A2:	Faça uma rotina que calcule o resultado da operação 1-(2+5)
;

.file "ex_a_2.s"
.include  "auxil.s"
.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio


ex_a_2::				; 1-(2+5) -> 1 2 5 + -

		add
		sub
		
		ret

inicio::
		push.n #1
		push.n #2
		push.n #5

		call ex_a_2

		halt
		.end