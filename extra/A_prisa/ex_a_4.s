; Enunciado:
;
; A4:	Fa�a uma rotina que calcule o resultado da opera��o 3*2
;

.file "ex_a_4.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio
.include  "auxil.s"      		; defini��es auxiliares

ex_a_4::		
		pop g0
		push.n #0
		mulu		; 3*2 -> 3 2 *

		ret

inicio::
		push.n #3
		push.n #2
		

		call ex_a_4

		halt
		.end