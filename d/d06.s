; Enunciado:
;
; D6:	Fa�a uma rotina que detecte se uma string colocada em mem�ria est� contida numa outra string tamb�m em mem�ria.
;	Caso n�o esteja dever� deixar -1 no topo da stack; caso esteja dever� deixar a posi��o de mem�ria onde se inicia.
;	Procura(end_s1 end_s2 -- nIndex)
;

.file "ex_d_6.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

Procura::
ret

inicio::
	call Procura

	halt
.end