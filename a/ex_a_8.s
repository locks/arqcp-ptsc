; Enunciado:
;
; A7:	Faça uma rotina que calcule o resultado da operação (3+2)*(5+4)*(4-1)
;

.file "ex_a_8.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include  "auxil.s"      		; definições auxiliares

ex_a_8::				; (3+2)*(5+4)*(4-1)

		ret

inicio::
		call ex_a_8

		halt
		.end
