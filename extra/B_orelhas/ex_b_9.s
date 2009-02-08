; Enunciado:
;
; B9:	Fa�a uma rotina que guarde no byte com endere�o n3, o resultado da seguinte express�o:
;[n3] = [n1]%[n2] (conte�do do endere�o n3 = conte�do do endere�o n1 % conte�do do endere�o n2).
;

.file "ex_b_9.s"


.org 0x1000        				; programa inicia-se no byte 0x1000
       	br inicio
.include "auxil.s"      			; defini��es auxiliares
.include "UTIL.s"				; biblioteca de fun��es de escrita de byte e word em mem�ria

n1::	.long	0xA3CF992B
n2:	.byte	231
n3:	.byte	0



F9::					; F9(n1 n2 n3 -- ): [n3]=[n1]%[n2]
	rev
	rev
	push.l #0
	xcg
	call mydivu
	rev
	call escrb
	pop

	ret

	
inicio::
	push.l #n1
	ld []
	push.l #n2
	ld.b []
	push.l #n3
	call F9

        halt
       	.end
