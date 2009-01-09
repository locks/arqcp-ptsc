; Enunciado:
;
; F8:	Desenvolva uma rotina  que "acentua" as diferenças entre os elementos de um vector de longs,
;	sendo a "acentuação" dada pelo valor definido em valor, e sabendo o numero de elementos de vector (len).
; 	acentua(addr len valor -- )
;
;	Exemplo: 	Vector original: 2,5,4,7
;				Valor: 2
;				Resultado: 2,5+2,4-2,7+2
;

.file "ex_f_8.s"
.include "../lib/auxil.s"

.org 0x1000
	br inicio

vector:: .long 12,23,2,0,23,45

acentua::
ret


inicio::
	call acentua

	halt
.end