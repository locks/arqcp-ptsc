; Enunciado:
;
; B10:	Fa�a uma rotina que guarde no byte com endere�o n3, o resultado da seguinte express�o:
;[n3] = [n1]%[n2] (conte�do do endere�o n3 = conte�do do endere�o n1 % conte�do do endere�o n2).
;

.file "ex_b_10.s"


.org 0x1000        				; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s"      		; defini��es auxiliares
.include "UTIL.s"		; biblioteca de fun��es de escrita de byte e word em mem�ria

n1::	.long	0xA3CF992B
n2:	.word	231
n3:	.word	0



F10::					; F10(n1 n2 n3 -- ): [n3]=[n1]%[n2]

	rev
	rev
	push.l #0
	xcg
	call mydivu
	rev
	call escrw
	pop
	ret

	
inicio::

	push.l #n1
	ld []
	push.l #n2
	ld.w []
	push.l #n3

	call F10
        halt
       	.end
