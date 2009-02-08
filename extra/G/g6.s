; Enunciado:
;
; G6:	Faça uma rotina que retorna o valor dum elemento duma matriz.
;	matrizes_le_elemento (end_m coluna linha -- elemento )
;

.file "ex_g_6.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares
.include "biblioteca1.s"			; biblioteca de funções


matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1
linha:	.long	1
coluna:	.long 2

matrizes_le_elemento::			; (end_m coluna linha -- elemento )
		inc #1
		pop lstack
		inc #1
		pop lstack
		pop lstack
		push r0
		inc #4
		pop r0
		push r0
		ld []
		push r2
		
		call mymulu
		pop
		push #4
		call mymulu
		pop
		push r0
		add
		
		
		push r0
		ld []
		push #4
		call mymulu
		pop
		sub
		push r1
		
		push #4
		call mymulu
		pop
		add
		push lstack 
		pop
		push lstack 
		pop
		push lstack 
		pop
		
		ld []

		ret

inicio::
		push #matriz1
		push.l #coluna
		ld []
		push.l #linha
		ld []
		call matrizes_le_elemento

        	halt
       		.end
