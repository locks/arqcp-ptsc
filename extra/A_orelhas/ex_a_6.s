; Enunciado:
;
; A6:	Repita o exerc�cio A4 utilizando a rotina desenvolvida no exerc�cio anterior.
;

.file "ex_a_6.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include  "auxil.s"      		; defini��es auxiliares
.include  "UTIL.s"

ex_a_6::
	
	ret

inicio::
	push.l #-3
	push.l #-2
	call mymuls
	

	halt
	.end