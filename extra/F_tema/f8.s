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

vector:: .long 3,23,2,26,25,15
len:	.long	6



acentua::	
		
		push ct
		pop lstack
		xcg
		push 
		pop lstack
		dec #1
		pop ct
		pop lstack 
		push
      	pop lstack
		pop lstack
		push r0
		ld []
		push r1
		inc #4
		pop r1
	loop::
		push r0
		ld []
		push r1
		ld []
		mxm
		push r1
		ld []
		sub
		bz maior
		pop
		push r1
		ld []
		push r2
		sub 
retorno::
		push r0
		inc #4
		pop r0
		push r1
		inc #4
		pop r1
		dbr loop
		push r3
		pop ct
		
gravar::
		push r0
		st []
		pop
		push r0
		dec #4
		pop r0
		dbr gravar
		pop
		push lstack
		pop
		push lstack
		pop
		push lstack
		pop
		push lstack
		pop
		push lstack
		pop ct
		ret
maior::	
		pop
		push r2
		push r1
		ld []
		add
		br retorno
		
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
		push #12

		call acentua

		push #vector
		push #6
		
		call mostrar
        halt
       	.end
