; Enunciado:
;
; F7:	Dado um vector de bytes, e sabendo o seu tamanho, fa�a uma rotina que determine a m�dia dos elementos desse vector.
; 	Media_V ( ender len_v -- media )
;

.file "ex_f_7_moodle_res.s"

.include "auxil.s"      		; defini��es auxiliares
.include "mul_div.s"      		; defini��es auxiliares

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

vector_media:: .long 12,23,2,0,23,45
vector_media0:: .space.l 0
vector_media1:: .long 12
vector_media2:: .long 0,0

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
ret

Media_V::					; (ender len_v -- media )
	push 
	bz no_elements		;verifica se o tamanho do vector n�o � 0
	push				;duplica o valor dos elementos (ender len_v len_v)
	rev					;(len_v len_v ender)
	rev					;(len_v ender len_v)

	call Soma_V_L		;(len_v soma)
	xcg					;(soma len_v)
	call mydivu			;(dividendo divisor -- quociente resto)
ret

no_elements::
	pop						;remove o tamanho do vector
	pop						;remove o endere�o do vector
	push #-1				;coloca -1 como m�dia
ret

inicio::
	push #vector_media
	push #6
	call Media_V

	push #vector_media1
	push #1
	call Media_V

	push #vector_media0
	push #0
	call Media_V

	push #vector_media2
	push #2
	call Media_V

	halt
	.end
