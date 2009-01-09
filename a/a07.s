; Enunciado:
;
; A8:		Faça uma rotina que calcule o resultado da operação -3*2
;

.file "ex_a_7.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include  "auxil.s"      		; definições auxiliares

ex_a_7::				; -3*2

		ret

inicio::
		call ex_a_7

		halt
		.end
