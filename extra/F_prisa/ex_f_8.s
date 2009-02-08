; Enunciado:
;
; F8:	Desenvolva uma rotina  que "acentua" as diferenças entre os elementos de um vector de longs,
;	sendo a "acentuação" dada pelo valor definido em valor, e sabendo o numero de elementos de vector (len).
; 	acentua(addr len valor -- )
;
;	Exemplo: 	Vector original: 2,5,4,7
;				Valor: 2
;				Resultado: 2,5+2,4-2,7+2
;

.file "ex_f_8.s"
.include "auxil.s"      		; definições auxiliares
.include "Biblioteca1.s"			; biblioteca de funções

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

vector:: .long 12,23,2,0,23,45
lvec:: .long 6


acentua::
		pop lstack
		dec #1
		pop ct
		pop lstack
		
		
		loop_soma::
			push lstack
			inc #4
			pop lstack
			push r0
			ld[]
			push r1
			add
			push r0
			st[]
			pop
			dbr loop_subtrai
			br fim
		loop_subtrai::
			push lstack
			inc #4
			pop lstack
			push r0
			ld[]
			push r1
			sub
			push r0
			st[]
			pop
			dbr loop_soma
			
		fim::
			push lstack
			push lstack
			pop
			pop
	ret

	
inicio::

		push.l #vector
		push.l #lvec
		ld[]
		push.l #5
		call acentua

        	halt
       		.end
