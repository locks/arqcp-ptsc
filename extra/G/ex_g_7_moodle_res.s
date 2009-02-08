; Enunciado:
;
; G7:	Fa�a uma rotina que grave o valor dum elemento duma matriz.
;	matrizes_grava_elemento (end_m coluna linha elemento -- )
;

.file "ex_g_7.s"

.include "auxil.s"      		; defini��es auxiliares
.include "mul_div.s"      		; defini��es auxiliares

.org 0x1000        				; programa inicia-se no byte 4096 = 0x1000

        br inicio

matriz1::	.long 3,4,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1

getNumLinhas::					;(end_mat -- numLinhas)
	ld[]
	ret

getNumColunas::					;(end_mat -- numColunas)
	inc #4
	ld[]
	ret

getTamElementos::				;(end_mat -- numColunas)
	inc #8
	ld[]
	ret

matrizes_endereco_elemento::		; (end_m coluna linha -- endereco_elemento )
									;end_matriz + tamanho_cabe�alho + (colunas * i + j) * tamanho_elementos
									;Mat+tc+(c*i+j)*te
									;i = linhas
									;j = colunas
	pop lstack
	pop lstack
	pop lstack
									;r2=linha r1=coluna r0=end_m
	push r0							;obter o endere�o
	push #12						;colocar o tamanho do cabe�alho
	add								
	
	push r0
	call getNumColunas				;obter o n�mero de colunas
	push r2							;obter o n�mero da linha
	call mymulu
	pop
	
	push r1							;obter o n�mero da coluna
	add 
	push r0
	call getTamElementos
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

matrizes_grava_elemento::			; (end_m coluna linha elemento -- )

	pop lstack
	call matrizes_endereco_elemento
	push lstack
	xcg
	st[]
	pop

	ret

matrizes_le_elemento::			; (end_m coluna linha -- elemento )
call matrizes_endereco_elemento
ld[]
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
