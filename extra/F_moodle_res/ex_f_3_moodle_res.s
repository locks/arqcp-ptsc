; Enunciado:
;
; F3:	Desenvolva uma rotina que, dado o endere�o de in�cio do vector e o tamanho de cada elemento,
;	determine o n�mero de bytes que o vector ocupa em mem�ria:
;	vectorTam(end_v tam_e -- n)
;

.file "ex_f_3_moodle_res.s"

.include "auxil.s"      	; defini��es auxiliares
.include "mul_div.s"		;bilbioteca de multiplica��es e divis�es

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

vector:: .long 5,234223,4322,0,256543,456545
vector1:: .long 10,234223,4322,0,256543,456545,234223,4322,0,256543,456545


vectorTam::				;(end_v tam_e -- n)
	xcg					;colocar o endere�o no topo
	ld []				;colocar o tamnho do vector (que est� em mem�ria) em OStack
	inc #1				;o tamanho do vector conta? se contar adicionar + um elemento
	call mymulu			;efectuar a multiplica��o 
	pop
	
	ret

inicio::

	push #vector
	push #4			;colocar o n�mero de bytes que ocupa um long
	Call vectorTam
		
    push #vector1
	push #4			;colocar o n�mero de bytes que ocupa um long
	Call vectorTam

	halt
   	.end
