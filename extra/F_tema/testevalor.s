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

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "auxil.s"      		; definições auxiliares
.include "biblioteca4.s"
.include "biblioteca1.s"

vector:: .long 3,23,2,0,23,45
len:	.long	6

mostrar::
		push ct 
		pop lstack
		pop ct
		pop lstack
	loop1::
		push r0
		ld []
		call io_printLong
		push.b #','
		emit
		push r0
		inc #4
		pop r0
		dbr loop1
		push lstack
		pop
		push lstack
		pop ct
		ret	

inicio::

		push #vector
		push #len
		ld []
		call mostrar
        halt
       	.end
