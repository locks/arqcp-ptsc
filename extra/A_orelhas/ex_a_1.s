; Enunciado:
;
; A1:		Fa�a uma rotina que calcule o resultado da opera��o 5+4-6
;

.file "ex_a_1.s"
.org 0x1000        			; programa inicia-se no byte 0x1000
        	br inicio
.include  "auxil.s"      		; defini��es auxiliares


ex_a_1::
			; 5+4-6 -> 4 5 + 6 -
pop r0
add
push r0
sub


ret

inicio::

push.l #5
push.l #4
push.l #6

		call ex_a_1

		halt
		.end
