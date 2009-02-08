; Enunciado:
;
; G7:	Faça uma rotina que grave o valor dum elemento duma matriz.
;	matrizes_grava_elemento (end_m coluna linha elemento -- )
;

.file "ex_g_7.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares
.include "biblioteca1.s"			; biblioteca de funções
.include "biblioteca4.s"


matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1

matrizes_grava_elemento::			; (end_m coluna linha elemento -- )
		
		pop lstack
		pop lstack
		pop lstack
		pop lstack
		push r0
		inc #4
		pop r0
		push r0
		ld []
		push r2
		ld []
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
		ld []
		push #4
		call mymulu
		pop
		add
		push r3
		xcg
		st []
		push lstack 
		pop
		push lstack 
		pop
		push lstack 
		pop
		push lstack 
		pop
		
		ret
	
matrizes_le_elemento::
		pop lstack
		pop lstack
		pop lstack
		
		push r0
		inc #4
		pop r0
		push r0
		ld []
		push r2
		ld []
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
		ld []
		push #4
		call mymulu
		pop
		add
	    ld []
		push lstack 
		pop
		push lstack 
		pop
		push lstack 
		pop
		push lstack 
		pop
ret
inicio::
		push #matriz1
		push.l #2
		push.l #1
		push.l #45
		call matrizes_grava_elemento

		; testa se gravou
		push #matriz1
		push.l #2
		push.l #1
		call matrizes_le_elemento

        	halt
       		.end