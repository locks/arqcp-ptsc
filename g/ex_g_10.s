; Enunciado:
;
; G10:	Fa�a uma fun��o que tendo definidas duas matrizes de dados do tipo long (M1 e M2)
;	e os armazena a partir das respectivas posi��es de mem�ria, efectue a multiplica��o das duas matrizes.
;	A matriz resultado dever� ser guardada a partir do endere�o de mem�ria da matriz M3.
;	MultiplicacaoMat(end_M1 end_M2 end_M3 -- )
;

.file "ex_g_10.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

MultiplicacaoMat::
ret

inicio::
	call MultiplicacaoMat

	halt
.end