; Enunciado:
;
; G8:	Faça uma rotina que determine se duas matrizes têm tamanho igual.
;	matrizes_tamanho_igual (end_m1 end_m2 -- 0|1)
;

.file "ex_g_8.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares
.include "biblioteca1.s"			; biblioteca de funções

.include "biblioteca6.s"
.include "biblioteca4.s"

matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1

matriz2::	.long 3,4,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16

matrizes_tamanho_igual::			; 1 = TRUE; 0 = FALSE
	pop lstack
	pop lstack
	push r0
	call getNlinhas
	push r0
	call getNcolunas
	call mymulu
	pop

	push r1
	call getNlinhas
	push r1
	call getNcolunas
	call mymulu
	pop
	
	sub
	eqz
	
	push lstack
	pop
	push lstack
	pop
ret

inicio::
		push #matriz1
		push #matriz2
		
		call matrizes_tamanho_igual

		; testa se gravou
		;push #matriz1
		;push.l #2
		;push.l #1
		;call matrizes_le_elemento

        	halt
       		.end
