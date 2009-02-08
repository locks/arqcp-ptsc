; Enunciado:
;
; A6:	Repita o exercício A4 utilizando a rotina desenvolvida no exercício anterior.
;

.file "ex_a_6.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include  "auxil.s"      		; definições auxiliares
.include  "UTIL.s"

ex_a_6::
	
	ret

inicio::
	push.l #-3
	push.l #-2
	call mymuls
	

	halt
	.end