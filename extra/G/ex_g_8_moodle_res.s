; Enunciado:
;
; G8:	Faça uma rotina que determine se duas matrizes têm tamanho igual.
;	matrizes_tamanho_igual (end_m1 end_m2 -- 0|1)
;

.file "ex_g_8.s"

.include "auxil.s"      		; definições auxiliares
;include "mul_div.s"      		; definições auxiliares

.org 0x1000        				; programa inicia-se no byte 4096 = 0x1000

        br inicio

matriz1::	.long 3,4,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1
matriz2::	.long 3,4,4,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
matriz3::	.long 4,3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1
matriz4::	.long 3,4,4,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16


getNumLinhas::					;(end_mat -- numLinhas)
	ld[]
	ret

getNumColunas::					;(end_mat -- numColunas)
	inc #4
	ld[]
	ret

matrizes_tamanho_igual::			;(end_m1 end_m2 -- 0|1); 1 = TRUE; 0 = FALSE

	pop lstack						;coloca end_m2 em LStack
	pop lstack						;coloca end_m1 em LStack

	push r0
	call getNumLinhas

	push r1	
	call getNumLinhas

	xor
	eqz
	bz diferentes
	
	push r0
	call getNumColunas

	push r1
	call getNumColunas

	xor
	eqz
	bz diferentes
	push #1
	br limpeza
	
diferentes::
	push #0
	
limpeza::
	push lstack
	push lstack
	pop
	pop
	
	ret
	
inicio::
	push #matriz1
	push #matriz2
	call matrizes_tamanho_igual

	push #matriz3
	push #matriz4
	call matrizes_tamanho_igual

	halt
	.end
