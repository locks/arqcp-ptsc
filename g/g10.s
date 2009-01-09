; Enunciado:
;
; G10:	Faça uma função que tendo definidas duas matrizes de dados do tipo long (M1 e M2)
;	e os armazena a partir das respectivas posições de memória, efectue a multiplicação das duas matrizes.
;	A matriz resultado deverá ser guardada a partir do endereço de memória da matriz M3.
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