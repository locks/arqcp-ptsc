; Enunciado:
;
; A8:		Fa�a uma rotina que calcule o resultado da opera��o -3*2
;

.file "ex_a_7.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include  "auxil.s"      		; defini��es auxiliares
.include  "UTIL.s"


inicio::
	push.l #-3
	push.l #2
	call mymuls

	halt
	.end
