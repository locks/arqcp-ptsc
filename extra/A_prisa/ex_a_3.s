; Enunciado:
;
; A3:	Faça uma rotina que calcule o resultado da operação (3+2)-(3-5)
;

.file "ex_a_3.s"
.include  "auxil.s"  
.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio


ex_a_3::			; (3+2)-(3-5) -> 3 2 + 3 5 - -
		sub
		pop g0
		add
		push g0
		sub

		ret

inicio::
		push.n #3
		push.n #2
		push.n #3
		push.n #5


		
		call ex_a_3

		halt
		.end