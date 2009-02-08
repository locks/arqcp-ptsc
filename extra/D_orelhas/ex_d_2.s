; Enunciado:
;
; D2:	Faça uma rotina que copie uma string colocada em memória para outra posição de memória.
;	Parta do princípio que a s2 têm pelo menos o mesmo tamanho que a s1.
;	Copia(end_s1 end_s2 -- )
;

.file "ex_d_2.s"

.include "auxil.s"      		; definições auxiliares

.org 0x200        			; programa inicia-se no byte 512 = 0x200

        br inicio

.include "biblioteca1.s"			; biblioteca de funções

string1:: .byte "ARQCPPL",0
string2:: .space.b 8

Copia::
	
	pop lstack
	pop lstack
	push.l #0
	SC_LOOP::
		push r0
		ld.b []
		push
		bz SC_FIM
		push r1
		call escrb
		inc #1
		push lstack
		inc #1
		push lstack
		inc #1
		pop lstack
		pop lstack
		br SC_LOOP
	SC_FIM::
		push.l #0
		push r1
		call escrb
		
		
		
	ret

	
inicio::

	push.l #string1
	push.l #string2
	call Copia

        halt
       	.end