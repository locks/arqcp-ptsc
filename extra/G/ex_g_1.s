; Enunciado:
;
; G1:	Faça uma função que tendo definidas duas matrizes de dados do tipo long (M1 e M2)
;	e os armazena a partir das respectivas posições de memória, efectue a adição das duas matrizes.
;	A matriz resultado deverá ser guardada a partir do endereço de memória da matriz M3.
;	AdiçãoMat(end_M1 end_M2 end_M3 -- )
;

.file "ex_g_1.s"
.include "auxil.s"      		; definições auxiliares
.include "biblioteca1.s"			; biblioteca de funções


.org 0x1000
	br inicio

end_M1:: .long 3,2,1,2,3,4,5,6
end_M2: .long 3,2,4,5,6,1,2,3
end_M3: .space.l 8

AdiMat::
		push ct
		pop lstack
		pop lstack
		pop lstack
		pop lstack
		push r1
		ld[]
		pop g0
		push g0
		push r0
		ld[]
		sub
		bz continua
		br fim
continua::
		
		push r1
		inc #4
		ld[]
		pop g1
		push g1
		push r0
		inc #4
		ld []
		sub
		bz continua1
		br fim

continua1::
		push r2
		push g0
		st[]
		pop
		push r2
		inc #4
		push g1
		st[]
		pop
		push r0
		ld[]
		push r0
		inc #4
		ld[]
		call mymulu
		pop
		pop ct
		push r0
		inc #8
		push r1
		inc #8
		push r2
		inc #8
		pop r2
		pop r1
		pop r0
ciclo::		
		push r0
		ld[]
		push r1
		ld[]
		add
		push r2
		st[]
		pop
		push r0
		inc #4
		pop r0
		push r1
		inc #4
		pop r1
		push r2
		inc #4
		pop r2
		dbr ciclo
		
				


fim::
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
	call AdiMat

	halt
.end