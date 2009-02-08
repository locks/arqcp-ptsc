; Enunciado:
; Enunciado:
;
; G9:	Faça uma função que tendo definidas três matrizes de dados do tipo long (M1, M2 e M3)
;	efectue a adição de M1 com M2 e deixe o resultado em M3.
;	A rotina deverá utilizar as rotinas:
;	- matrizes_tamanho_igual
;	- matrizes_numero_linhas
;	- matrizes_numero_colunas
;	- matrizes_endereço_elemento
;	- matrizes_le_elemento
;	- matrizes_grava_elemento
;	AdicaoMat(end_M1 end_M2 end_M3 -- )
;

.file "ex_g_9.s"

.include "auxil.s"      		; definições auxiliares
.include "mul_div.s"      		; definições auxiliares

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

matriz1::	.long 3,4,4,16,15,14,13,12,11,10,9,8,7,6,5

matriz2::	.long 3,4,4,5,6,7,8,9,10,11,12,13,14,15,16

matriz3:	.long 3,4 
			.space.l 12

matrizes_numero_linhas::					;(end_mat -- numLinhas)
	ld[]
	ret

matrizes_numero_colunas::					;(end_mat -- numColunas)
	inc #4
	ld[]
	ret

getTamElementos::				;(end_mat -- numColunas)
	inc #8
	ld[]
	ret
	
getNumElementos::				;(end_mat -- numElementos)
	push
	call matrizes_numero_linhas
	xcg
	call matrizes_numero_colunas
	call mymulu
	pop
	ret
	
copiaCabecalho::				;(end_mat_origem end_mat_destino -- numElementos)
	pop lstack					;coloca em LStack a mat_destino
	push
	call matrizes_numero_linhas
	push r0						;guarda em memória o número de linhas
	st[]
		pop

	push
	call matrizes_numero_colunas
	push r0						;guarda em memória o número de colunas
	inc #4
	st []
	pop
	
	
	call getTamElementos
	push r0						;guarda em memória o tamanho dos elementos 
	inc #8
	st[]
	pop
	
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
	push #12						;colocar o tamanho do cabeçalho
	add								
	
	push r0
	call matrizes_numero_colunas	;obter o número de colunas
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

matrizes_tamanho_igual::			;(end_m1 end_m2 -- 0|1); 1 = TRUE; 0 = FALSE

	pop lstack						;coloca end_m2 em LStack
	pop lstack						;coloca end_m1 em LStack

	push r0
	call matrizes_numero_linhas
	push r1	
	call matrizes_numero_linhas
	xor
	eqz
	bz diferentes
	
	push r0
	call matrizes_numero_colunas
	push r1
	call matrizes_numero_colunas
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
	

AdicaoMat::					;(end_M1 end_M2 end_M3 -- )
	
	push ct					;HK
	pop lstack				;HK
	
	pop lstack
	pop	lstack
	pop lstack	
							;r2=end_m3 r1=end_m2 r0=end_m1
	push r0
	push r1
	call matrizes_tamanho_igual
	bz matrizes_tamanho_diferente

	push r0
	push r2
	call copiaCabecalho
	
	push r0				
	call matrizes_numero_linhas
	pop ct						;coloca o número de elementos em ct
	
	ciclo_percorre_linhas::

		push ct					;fazer o house keeping pela segunda vez do ct
		pop lstack
								;(L:r3=end_m3 r2=end_m2 r1=end_m1 r0=ct)
		
		push r1
		call matrizes_numero_colunas
		pop ct							;coloca em CT o número de colunas a percorrer
	
		ciclo_percorre_colunas::
			push r1
			push r1
			call matrizes_numero_colunas
			push ct						;obter o CT das colunas 
			sub							;obtém o índice actual para colunas => numero_total_colunas - ct = index_coluna
			push r1
			call matrizes_numero_linhas
			push r0						;obtém o CT para a linha
			sub							;obtém o índice actual para linhas=> numero_total_linhas - r0 = index_linha
			call matrizes_le_elemento

			push r2
			push r2
			call matrizes_numero_colunas
			push ct						;obter o CT das colunas 
			sub							;obtém o índice actual para colunas => numero_total_colunas - ct = index_coluna
			push r2
			call matrizes_numero_linhas
			push r0						;obtém o CT para a linha
			sub							;obtém o índice actual para linhas=> numero_total_linhas - r0 = index_linha
			call matrizes_le_elemento
			
			add							;adiciona os dois elementos

			push r3						;colocar o endereço da matriz de destino
			xcg
			
			push r3						
			call matrizes_numero_colunas
			push ct						;obter o CT das colunas 
			sub							;obtém o índice actual para colunas => numero_total_colunas - ct = index_coluna
			xcg
			
			push r3
			call matrizes_numero_linhas
			push r0						;obtém o CT para a linha
			sub							;obtém o índice actual para linhas=> numero_total_linhas - r0 = index_linha
			xcg
			call matrizes_grava_elemento

		dbr ciclo_percorre_colunas

		push lstack					;repôr o ct de linhas
		pop ct
	dbr ciclo_percorre_linhas

matrizes_tamanho_diferente::

limpeza_adicao::
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	push lstack		;HK
	pop ct			;HK
	ret
	
inicio::
	push #matriz1
	push #matriz2
	push #matriz3

	call AdicaoMat

	halt
	.end
