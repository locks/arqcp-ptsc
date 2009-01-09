; Enunciado:
;
; G12:	Desenvolva uma função que permita ler uma matriz do teclado.
;	O seu armazenamento deve ser feito em memória, fazendo com que de seguida se guarde em memória também as dimensões da matriz. 
;	inMatriz( endM -- )
;

.file "ex_g_12.s"
.include "../lib/auxil.s"

.org 0x1000
        br inicio

inMatriz::
ret

inicio::
	call inMatriz

	halt
.end	
