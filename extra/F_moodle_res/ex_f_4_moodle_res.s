; Enunciado:
;
; F4:	Dado um vector de n�meros de 32 bits fa�a uma rotina que fa�a a soma de todos os seus elementos, sabendo o tamanho do vector.
;	Soma_V_L(end1 len_v1 -- n)
;

.file "ex_f_4_moodle_res.s"
.include "auxil.s"

.org 0x1000
	br inicio

vector:: .long 12,23,2,0,23,45
vector1:: .long 12
vector2:: .space.l 1 


Soma_V_L::					;(end1 len_v1 -- n)
	push
	bz vector_sem_elementos ;
	
	push ct					;HK - colocar o valor de CT em OStack
	pop lstack				;HK - colocar o valor de CT na LStack
	
	pop ct					;colocar o n�mero de elementos em CT
	
	push #0					;inicia o somat�rio a 0
	xcg						;trocar o somat�rio com o endere�o
	
	ciclo_soma::
		push				;duplica o endere�o a utilizar
		ld[]				;carrega o valor a partir da mem�ria - ficamos com (total endere�o valor)
		rev					;para ficar (endere�o valor total)
		add					;adicionar ao somat�rio (endere�o total)
		xcg
		inc #4				;incrementa ao endere�o 4 posi��es
	dbr ciclo_soma
	
	pop						;remover o endere�o de OStack
	
	push lstack				;HK - colocar o valor anterior de CT em OStack
	pop ct					;HK - colocar o valor anterir de CT em CT
	
	ret

vector_sem_elementos::
	pop						;remove o tamanho do vector
	pop						;remove o endere�o do vector
	push #0					;coloca zero como resultado
	ret;
	
inicio::
	push #vector
	push #6
	call Soma_V_L
	
	push #vector1
	push #1
	call Soma_V_L

	push #vector2
	push #0
	call Soma_V_L

	halt
	.end
