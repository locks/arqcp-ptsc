; Enunciado:
;
; G5:	Faça uma rotina que determina o endereço dum elemento duma matriz de longs.
;	matrizes_endereco_elemento (end_m coluna linha -- endereco_elemento )
;

;.file "ex_g_5.s"

;.org 0x1000        			; programa inicia-se no byte 0x1000
;        br inicio
;.include "auxil.s"      		; definições auxiliares
;.include "biblioteca1.s"
;.include "ex_g_3.s"			; biblioteca de funções

;matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1


matrizes_endereco_elemento::		; (end_m coluna linha -- endereco_elemento )
		pop lstack
		pop lstack
		pop lstack

		push r0
		inc #8
		
		push r0
		call matrizes_numero_colunas
		push r2
		call mymulu
		pop

		push r1
		add
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
ret

;inicio::
;		push #matriz1
;		push #1
;		push #2
;		call matrizes_endereco_elemento

;        	halt
 ;      		.end
