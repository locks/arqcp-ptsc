; Enunciado:
;
; D2:	Faça uma rotina que copie uma string colocada em memória para outra posição de memória.
;	Parta do princípio que a s2 têm pelo menos o mesmo tamanho que a s1.
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