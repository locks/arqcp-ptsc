; Enunciado:
;
; F4:	Dado um vector de números de 32 bits faça uma rotina que faça a soma de todos os seus elementos, 
;sabendo o tamanho do vector.
;	Soma_V_L(end1 len_v1 -- n)
;

.file "ex_f_4.s"

.org 0x200        			; programa inicia-se no byte 512 = 0x200
        br inicio

.include "auxil.s"      		; definições auxiliares

vector:: .long 12,23,2,0,23,45
lenv1:: .long 6

;.include "biblioteca.s"			; biblioteca de funções

Soma_V_L::      
		ld []
		pop ct
pop lstack

push #0
pop lstack
	
ciclo::
push r1		
ld []
push r0
add
pop r0
push r1
inc #4
pop r1
dbr ciclo	
push lstack
push lstack
pop	
		ret

	
inicio::
		push.l #vector
		push.l #lenv1
		
		call Soma_V_L

        	halt
       		.end
