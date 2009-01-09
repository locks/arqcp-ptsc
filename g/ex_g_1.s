; Enunciado:
;
; G1:	Faça uma função que tendo definidas duas matrizes de dados do tipo long (M1 e M2)
;	e os armazena a partir das respectivas posições de memória, efectue a adição das duas matrizes.
;	A matriz resultado deverá ser guardada a partir do endereço de memória da matriz M3.
;	AdiçãoMat(end_M1 end_M2 end_M3 -- )
;

.file "ex_g_1.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

end_M1: .long space.l 80

AdiçãoMat::
ret

inicio::
	push #end_M1
	push #end_M2
	push #end_M3
	call AdiçãoMat

	halt
.end