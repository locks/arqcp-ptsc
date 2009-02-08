; Enunciado:
;
; F7:	Dado um vector de bytes, e sabendo o seu tamanho, faça uma rotina que determine a média dos elementos desse vector.
; 	Media_V ( ender len_v -- media )
;

.file "ex_f_7.s"

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "auxil.s"      		; definições auxiliares

vector:: .long 12,23,2,0,23,45
media:	.long	0

.include "biblioteca1.s"			; biblioteca de funções


Media_V::
		push ct
		pop lstack
		push
		pop ct
		pop lstack
		pop lstack
		push #0
	loop::
		push r0
		ld[]
		add
		push r0
		inc #4
		pop r0
		dbr loop
		push lstack
		pop
		push #0
		push lstack
		call mydivu
		pop
		push lstack 
		pop
		push lstack
		pop ct
ret

inicio::
	push #vector
	push #6			;tamanho do vector
	call Media_V
	push #media
	st []

	halt
.end
