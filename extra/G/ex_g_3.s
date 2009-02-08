; Enunciado:
;
; G3:	Faça uma rotina que determine o número de colunas duma matriz.
;	matrizes_numero_colunas(end_M1 -- numero_colunas)
;

;.file "ex_g_3.s"

;.org 0x1000        			; programa inicia-se no byte 0x1000
;        br inicio
;.include "auxil.s"      		; definições auxiliares
;.include "biblioteca1.s"			; biblioteca de funções


;matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1


matrizes_numero_colunas::		; (end_m -- numero_colunas )

		inc #4
		ld[]

		ret
	
;inicio::
;		push #matriz1

;		call matrizes_numero_colunas

 ;       	halt
  ;     		.end
