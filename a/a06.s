; Enunciado:
;
; A6:	Repita o exercício A4 utilizando a rotina desenvolvida no exercício anterior.
;

.file "ex_a_6.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include  "auxil.s"      		; definições auxiliares

ex_a_6::

	ret

inicio::
	call ex_a_6

	halt
	.end