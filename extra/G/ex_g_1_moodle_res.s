; Enunciado:
;
; G1:	Fa�a uma fun��o que tendo definidas duas matrizes de dados do tipo long (M1 e M2)
;	e os armazena a partir das respectivas posi��es de mem�ria, efectue a adi��o das duas matrizes.
;	A matriz resultado dever� ser guardada a partir do endere�o de mem�ria da matriz M3.
;	Adi��oMat(end_M1 end_M2 end_M3 -- )
;

.file "ex_g_1.s"
.include "auxil.s"      		; defini��es auxiliares
.include "mul_div.s"      		; defini��es auxiliares

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
	push r0						;guarda em mem�ria o n�mero de linhas
	st[]
		pop

	push
	call getNumColunas
	push r0						;guarda em mem�ria o n�mero de colunas
	inc #4
	st []
	pop
	
	
	call getTamElementos
	push r0						;guarda em mem�ria o tamanho dos elementos 
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
	pop ct						;coloca o n�mero de elementos em ct
	
	push #12					;a primeira posi��o a ler � a seguinte ao cabe�alho que ocupa 12 bytes
	pop x						;colocar a posi��o a incrementar em x
	ciclo_soma::
	
		push x					;obt�m o valor a adicionar
		push r0					;obt�m o endere�o do vector um
		add						;adiciona o endere�o ao incremento que est� na stack
		ld[]					;carrega o valor de mem�ria
		
		push x					;obt�m o valor a adicionar
		push r1					;obt�m o endere�o do vector2
		add						;adiciona
		ld[]					;carrega o valor
		
		add						;adicionar o valor de mat1[x] a mat2[x]	
		
		push x					;obt�m o valor a adicionar
		push r2					;obt�m o endere�o do vector3
		add						;adiciona
		st[]					;carrega o valor
		POP
								;incrementar a posi��o
		
		push r0					;coloca o endere�o base no topo da stack
		call getTamElementos	;obt�m o tamanho dos elementos
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