; Enunciado:
;
; G1:	Faça uma função que tendo definidas duas matrizes de dados do tipo long (M1 e M2)
;	e os armazena a partir das respectivas posições de memória, efectue a adição das duas matrizes.
;	A matriz resultado deverá ser guardada a partir do endereço de memória da matriz M3.
;	AdiçãoMat(end_M1 end_M2 end_M3 -- )
;


.file "ex_g_1.s"

.org 0x1000        			; programa inicia-se no byte 0x1000
        br inicio
.include "auxil.s"      		; definições auxiliares

end_M1:: 	.long 4,3,3,1,2,4,2,3,2,5,6,6,7,8 ;Os dois primeiros é linhas e colunas

end_M2:: 	.long 4,3,1,2,3,4,5,6,3,1,3,0,2,1

end_M3:: 	.long 0
		.long 0 
		.space.l 12

AdicaoMat::	
		push ct
		pop lstack
		pop lstack
		pop lstack
		pop lstack
linha::		push r0
		ld []
		push
		push r2
		st []
		push r2
		inc #4
		pop r2
		push r1
		ld []
		sub
		bz coluna
fim::		pop
		push lstack
		pop
		push lstack
		pop
		push lstack
		pop
		push lstack
		pop ct
		ret

coluna::	push r0
		inc #4
		pop r0
		push r1
		inc #4
		pop r1
		push r0
		ld []
		push
		push r2
		st []
		push r2
		inc #4
		pop r2
		push r1
		ld []
		sub
		bz paragem
		br fim

paragem::
		call mymulu
		pop
		pop ct

inc::		push r0
		inc #4
		pop r0
		push r1
		inc #4
		pop r1
adicao::	push r0
		ld []
		push r1
		ld []
		add
		push r2
		st []
		pop
		push r2
		inc #4
		pop r2
		dbr inc
		push lstack
		pop
		push lstack
		pop
		push lstack
		pop
		push lstack
		pop ct
		ret		
	
inicio::
		push #end_M1
		push #end_M2
		push #end_M3

		call AdicaoMat

        	halt
       		.end