; Enunciado:
;
; G11:	Faça uma função que a partir de uma matriz calcule a soma dos elementos da sua diagonal principal.
;	Nota: se a matriz for rectangular, processe apenas a “maior matriz quadrada” existente dentro da matriz original.
;	SOMA_DIAG_PR_MATRIZ ( addr -- soma )
;

.file "ex_g_11.s"
.include "auxil.s"
.include "biblioteca.s"

.org 0x1000
	br inicio

matriz:: .long 4,3,2,1,4,3,2,1,4,3,2,1

SOMA_DIAG_PR_MATRIZ::
	push ct
	pop lstack
	pop lstack
	
	ld []
	push r0
	inc #4
	ld []
	mxm
	pop
	pop ct
	push #0
	ciclo::
		push r0
		push ct
		dec #1
		push
		call matrizes_le_elemento
		add
		dbr ciclo
		push lstack
		pop
		push lstack 
		pop ct
ret

inicio::
	push #matriz
	call SOMA_DIAG_PR_MATRIZ

	halt
.end