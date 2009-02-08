; Enunciado:
;
; G1:	Faça uma função que tendo definidas duas matrizes de dados do tipo long (M1 e M2)
;	e os armazena a partir das respectivas posições de memória, efectue a adição das duas matrizes.
;	A matriz resultado deverá ser guardada a partir do endereço de memória da matriz M3.
;	AdiçãoMat(end_M1 end_M2 end_M3 -- )
;

.file "ex_g_1.s"
.include "auxil.s"      		; definições auxiliares
.include "mul_div.s"      		; definições auxiliares

.org 0x1000
	br inicio
		
end_M1: .long 3,4,4,1,2,3,4,5,6,7,8,9,10,11,12
end_M2: .long 3,4,4,12,11,10,9,8,7,6,5,4,3,2,1
end_M4: .long 3,4,4,1,2,3,4,5,6,7,8,9,10,11,12
end_M5: .long 3,4,4,1,1,1,1,1,1,1,1,1,1,1,1
end_M3: .space.l 80
end_M6: .space.l 80

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
	
getNumElementos::				;(end_mat -- numElementos)
	push
	call getNumLinhas
	xcg
	call getNumColunas
	call mymulu
	pop
	ret
	
copiaCabecalho::				;(end_mat_origem end_mat_destino -- numElementos)
	pop lstack					;coloca em LStack a mat_destino
	push
	call getNumLinhas
	push r0						;guarda em memória o número de linhas
	st[]
		pop

	push
	call getNumColunas
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

AdicaoMat::						;(end1 end2 end3 --)
	push ct						;HK
	pop lstack					;HK	
	push x						;HK
	pop lstack					;HK

	pop lstack
	pop lstack
	pop lstack
								;(L: r2=end3 r1=end2 r0=end1)
						
	push r0
	push r2
	call copiaCabecalho
	
	push r0				
	call getNumElementos
	pop ct						;coloca o número de elementos em ct
	
	push #12					;a primeira posição a ler é a seguinte ao cabeçalho que ocupa 12 bytes
	pop x						;colocar a posição a incrementar em x
	ciclo_soma::
	
		push x					;obtém o valor a adicionar
		push r0					;obtém o endereço do vector um
		add						;adiciona o endereço ao incremento que está na stack
		ld[]					;carrega o valor de memória
		
		push x					;obtém o valor a adicionar
		push r1					;obtém o endereço do vector2
		add						;adiciona
		ld[]					;carrega o valor
		
		add						;adicionar o valor de mat1[x] a mat2[x]	
		
		push x					;obtém o valor a adicionar
		push r2					;obtém o endereço do vector3
		add						;adiciona
		st[]					;carrega o valor
		POP
								;incrementar a posição
		
		push r0					;coloca o endereço base no topo da stack
		call getTamElementos	;obtém o tamanho dos elementos
		push x
		add
		pop x
		
	dbr ciclo_soma
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop
	push lstack
	pop ct
	push lstack					;HK
	pop x						;HK
ret
	
	
inicio::
	push #end_M1
	push #end_M2
	push #end_M3

	call AdicaoMat

	push #end_M4
	push #end_M5
	push #end_M6

	call AdicaoMat

	halt
	.end