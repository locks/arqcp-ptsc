; Enunciado:
;
; F7:	Dado um vector de bytes, e sabendo o seu tamanho, faça uma rotina que determine a média dos elementos desse vector.
; 	Media_V ( ender len_v -- media )
;

.file "ex_f_7_moodle_res.s"

.include "auxil.s"      		; definições auxiliares
.include "mul_div.s"      		; definições auxiliares

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
	
	pop ct					;colocar o número de elementos em CT
	
	push #0					;inicia o somatório a 0
	xcg						;trocar o somatório com o endereço
	
	ciclo_soma::
		push				;duplica o endereço a utilizar
		ld[]				;carrega o valor a partir da memória - ficamos com (total endereço valor)
		rev					;para ficar (endereço valor total)
		add					;adicionar ao somatório (endereço total)
		xcg
		inc #4				;incrementa ao endereço 4 posições
	dbr ciclo_soma
	
	pop						;remover o endereço de OStack
	
	push lstack				;HK - colocar o valor anterior de CT em OStack
	pop ct					;HK - colocar o valor anterir de CT em CT
ret

vector_sem_elementos::
	pop						;remove o tamanho do vector
	pop						;remove o endereço do vector
	push #0					;coloca zero como resultado
ret

Media_V::					; (ender len_v -- media )
	push 
	bz no_elements		;verifica se o tamanho do vector não é 0
	push				;duplica o valor dos elementos (ender len_v len_v)
	rev					;(len_v len_v ender)
	rev					;(len_v ender len_v)

	call Soma_V_L		;(len_v soma)
	xcg					;(soma len_v)
	call mydivu			;(dividendo divisor -- quociente resto)
ret

no_elements::
	pop						;remove o tamanho do vector
	pop						;remove o endereço do vector
	push #-1				;coloca -1 como média
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
