; Enunciado:
;
; D2:	Fa�a uma rotina que copie uma string colocada em mem�ria para outra posi��o de mem�ria.
;	Parta do princ�pio que a s2 t�m pelo menos o mesmo tamanho que a s1.
;	Copia(end_s1 end_s2 -- )
;

.file "ex_d_2.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

Copia::
	ret

inicio::
	call Copia

	halt
.end