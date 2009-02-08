; Enunciado:
;
; G5:	Faça uma rotina que determina o endereço dum elemento duma matriz de longs.
;	matrizes_endereco_elemento (end_m coluna linha -- endereco_elemento )
;

.file "ex_g_5.s"
.include "auxil.s"
.include "mul_div.s"

.org 0x1000
	br inicio

matriz1::	.long 3,4,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1

; 16,15,14,13,
; 12,11,10, 9,
;  8, 7, 6, 5,
;  4, 3, 2, 1,

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
									;end_matriz + tamanho_cabeçalho + (colunas * i + j) * tamanho_elementos
									;Mat+tc+(c*i+j)*te
									;i = linhas
									;j = colunas
	pop lstack
	pop lstack
	pop lstack
									;r2=linha r1=coluna r0=end_m
	push r0							;obter o endereço
	inc #12						;colocar o tamanho do cabeçalho
	
	push r0
	call getNumColunas				;obter o número de colunas
	push r2							;obter o número da linha
	call mymulu
	pop
	
	push r1							;obter o número da coluna
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
	
inicio::
	push #matriz1
	push #1
	push #2
	call matrizes_endereco_elemento
	ld[]

	halt
.end

	