; Enunciado:
;
; D6:	Faça uma rotina que detecte se uma string colocada em memória está contida numa outra string também em memória.
;	Caso não esteja deverá deixar -1 no topo da stack; caso esteja deverá deixar a posição de memória onde se inicia.
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