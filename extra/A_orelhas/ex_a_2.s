; Enunciado:
;
; A2:	Faça uma rotina que calcule o resultado da operação 1-(2+5)
;

.file "ex_a_2.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
       	br inicio
.include  "auxil.s"      		; definições auxiliares

ex_a_2::

				; 1-(2+5) -> 1 2 5 + -
add
sub

		ret

inicio::

push.l #1
push.l #2
push.l #5
		call ex_a_2
		pop

		halt
		.end