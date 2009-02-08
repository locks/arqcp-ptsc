; Enunciado:
;
; F3:	Desenvolva uma rotina que, dado o endereço de início do vector e o tamanho de cada elemento,
;	determine o número de bytes que o vector ocupa em memória:
;	vectorTam(end_v tam_e -- n)
;

.file "ex_f_3_moodle_res.s"

.include "auxil.s"      	; definições auxiliares
.include "mul_div.s"		;bilbioteca de multiplicações e divisões

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

vector:: .long 5,234223,4322,0,256543,456545
vector1:: .long 10,234223,4322,0,256543,456545,234223,4322,0,256543,456545


vectorTam::				;(end_v tam_e -- n)
	xcg					;colocar o endereço no topo
	ld []				;colocar o tamnho do vector (que está em memória) em OStack
	inc #1				;o tamanho do vector conta? se contar adicionar + um elemento
	call mymulu			;efectuar a multiplicação 
	pop
	
	ret

inicio::

	push #vector
	push #4			;colocar o número de bytes que ocupa um long
	Call vectorTam
		
    push #vector1
	push #4			;colocar o número de bytes que ocupa um long
	Call vectorTam

	halt
   	.end
