; Enunciado:
;
; G1:	Fa�a uma fun��o que tendo definidas duas matrizes de dados do tipo long (M1 e M2)
;	e os armazena a partir das respectivas posi��es de mem�ria, efectue a adi��o das duas matrizes.
;	A matriz resultado dever� ser guardada a partir do endere�o de mem�ria da matriz M3.
;	Adi��oMat(end_M1 end_M2 end_M3 -- )
;

.file "ex_g_1.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

end_M1: .long space.l 80

Adi��oMat::
ret

inicio::
	push #end_M1
	push #end_M2
	push #end_M3
	call Adi��oMat

	halt
.end