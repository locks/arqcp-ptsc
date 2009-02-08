; Enunciado:
;
; F5:	Dado um vector de números de 32 bits, e sabendo o seu tamanho, faça uma rotina que determine o maior dos seus elementos.
; 	Maior_V ( ender len_v -- maior )
;

.file "ex_f_5_moodle_res.s"

.include "auxil.s"      		; definições auxiliares

.org 0x1000        			; programa inicia-se no byte 4096 = 0x1000

        br inicio

vector:: .long 12,23,2,0,23,45
vector1:: .long 45,23,2,0,23,9
vector2:: .long 23,2,45,0,23,9
vector3:: .long 0,0,0,0,0,0
vector4:: .long 45
vector5:: .space.l 0
		
Maior_V::					;( ender len_v -- maior )
	push					;duplica o tamanho para verificar se não é zero		
	bz no_elements			;verificar se o vector tem pelo menos um elemento - testar a condição do vector não ter nenhum elemento
	
	push ct					;HK - colocar o valor de CT em OStack
	pop lstack				;HK - colocar o valor de CT na LStack
	pop ct					;colocar em ct o número de elementos do vector

	push					;duplicar o valor do endereço
	ld []  					;carregar o primeiro elemento que será o maior
	pop lstack				;colocar o primeiro elemento como sendo o maior em LStack
		
	dec ct, #1				;decrementar um ao CT - pois já se contou com a primeira posição
	inc #4					;incrementar o endereço em 4bytes !!!!!! - é um LONG

	push ct					;obter quantos elementos faltam analisar
	bz no_more_elements		;verificar se o vector tem pelo menos ainda um elemento - testar a condição do vector só ter um elemento

	cicloMaior_V::
		push					;duplicar o endereço actual
		ld []					;carregar o valor da posição actual
		push lstack				;obter o valor maior até ao momento para comparar
		mxm						;coloca no topo da stack o maior número
		pop lstack				;coloca na lstack o maior número de novo
		pop						;exclui da stack o menor número
		inc #4					;incrementa o endereço
	dbr cicloMaior_V		; decrementa CT e recomeça

	pop						;remove o endereço que estava na ostack
	push lstack				;colocar no topo o maior número

	push lstack				;HK - colocar o valor anterior de CT em OStack
	pop ct					;HK - colocar o valor anterir de CT em CT
ret

no_elements::
	pop						;remove o contador
	pop						;remove o endereço que estava na ostack
	push #-1				;coloca -1
ret

no_more_elements::
	pop						;remove o endereço que estava na ostack
	push lstack				;colocar no topo o maior número
	
	push lstack				;HK - colocar o valor anterior de CT em OStack
	pop ct					;HK - colocar o valor anterir de CT em CT
ret

fim::


inicio::	
	push #vector
	push #6
	call Maior_V

	push #vector1
	push #6
	call Maior_V

	push #vector2
	push #6
	call Maior_V

	push #vector3
	push #6
	call Maior_V

	push #vector4
	push #1
	call Maior_V

	push #vector5
	push #0
	call Maior_V

	halt
.end
