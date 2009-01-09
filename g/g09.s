; Enunciado:
;
; G9:	Fa�a uma fun��o que tendo definidas tr�s matrizes de dados do tipo long (M1, M2 e M3)
;	efectue a adi��o de M1 com M2 e deixe o resultado em M3.
;	A rotina dever� utilizar as rotinas:
;	- matrizes_tamanho_igual
;	- matrizes_numero_linhas
;	- matrizes_numero_colunas
;	- matrizes_endere�o_elemento
;	- matrizes_le_elemento
;	- matrizes_grava_elemento
;	AdicaoMat(end_M1 end_M2 end_M3 -- )
;

.file "ex_g_9.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

matriz1::	.long 3,4,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1
matriz2::	.long 3,4,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
matriz3::	.long 3,4
		.space.l 12

AdicaoMat::
ret

inicio::
	push #matriz1
	push #matriz2
	push #matriz3
	call AdicaoMat

	halt
.end
