; Enunciado:
;
; G11:	Faça uma função que a partir de uma matriz calcule a soma dos elementos da sua diagonal principal.
;	Nota: se a matriz for rectangular, processe apenas a “maior matriz quadrada” existente dentro da matriz original.
;	SOMA_DIAG_PR_MATRIZ ( addr -- soma )
;

.file "ex_g_11.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

SOMA_DIAG_PR_MATRIZ::
ret

inicio::
	call SOMA_DIAG_PR_MATRIZ

	halt
.end