; Enunciado:
;
; A6:	Repita o exerc�cio A4 utilizando a rotina desenvolvida no exerc�cio anterior.
;

.file "ex_a_6.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include  "auxil.s"      		; defini��es auxiliares

ex_a_6::

	ret

inicio::
	call ex_a_6

	halt
	.end